package com.eden.noah.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eden.noah.util.Constants;
import com.eden.noah.util.PageParam;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eden.common.domain.view.BizData4Page;
import com.eden.common.service.IPageService;

@Controller
@RequestMapping(value="/admin")
public abstract class AbstractAdminController<T extends IPageService> extends BaseAction{
    /** 当前页面的主service  */
    protected T mainService;
/*    @Autowired
    protected ResourceGridService resourceGridService;*/
    /** 当前页面的主业务模型  */
    protected String mainObjName;
    /** 当前页面的标题  */
    protected String viewTitle;
    
/*    @Autowired
    private UserDAO userdao;*/

    /**
     * 供子类注入主service
     * @return
     */
    protected abstract T getMainService();
    protected abstract String getMainObjName();
    protected abstract String getViewTitle();

    protected ModelAndView doRenderMainView(HttpServletRequest request,HttpServletResponse response){
        //request.getRequestURI()
        ModelAndView mav=new ModelAndView("module/"+getMainObjName());

        ///这里顺便回顾下HashMap的使用方法
        	/*      创建：Map<String,String> map = new HashMap<String,String>();
        	        插入元素：map.put("1","a");
        	        移除元素: map.remove("1");
        	        清空: map.clear();*/

/*        List<Resource> resourceList = userdao.getResByPerm(0);
        mav.addObject("resources", resourceList);

//        List<ResourceGrid> resourceGridList = resourceGridService.findAll();
        List<ResourceGrid> resourceGridList = resourceGridService.findList("moduleName",getMainObjName());
        mav.addObject("cols", resourceGridList);*/

        mav.addObject("mainObj", getMainObjName());
        mav.addObject("title", getViewTitle());

        return mav;
    }
    
    protected BizData4Page doPage(ModelMap model,Map<String, Object> conditions,PageParam pageParam){

        if(pageParam.getPageCurrent() == null) {
            pageParam.setPageCurrent(1);
        }
        Integer page = pageParam.getPageCurrent();
        
        if(pageParam.getPageSize() == null) {
        	pageParam.setPageSize(Constants.MAX_PAGE_SIZE);
        }
        Integer rows = pageParam.getPageSize();

        String sidx = pageParam.getOrderField();
        String sord = pageParam.getOrderDirection();
        if(StringUtils.isNotBlank(sidx)&&StringUtils.isNotBlank(sord))
        {
        	conditions.put("sort", sidx + " " + sord);
        }
        else
        {
        	conditions.put("sort", "createDate desc");
        }
        
        BizData4Page pageCtx = getMainService().queryPage(conditions, page, (page-1)*rows, rows);
    	model.addAttribute("pageCtx", pageCtx);
    	model.addAttribute("pageParam", pageParam);
        return pageCtx;
    }
    
}
