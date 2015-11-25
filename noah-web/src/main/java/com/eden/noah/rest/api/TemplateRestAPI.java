
package com.eden.noah.rest.api;

import com.eden.common.domain.view.BizData4Page;
import com.eden.noah.model.Template;
import com.eden.noah.service.ITemplateService;
import com.eden.noah.util.PageParam;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by shurrik on 2015/11/24.
 */
@Path("/template")
public class TemplateRestAPI extends BaseRestAPI<ITemplateService>{

    @Autowired
    private ITemplateService templateService;

    @POST
    @Path("/list")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public BizData4Page<Template> list(Map<String,Object> map){

        Map<String, Object> conditions = getQueryMap(map);
        PageParam pageParam = getPageParam(map);
        BizData4Page<Template> pageCtx = doPage(conditions, pageParam);
        return  pageCtx;
    }

    @POST
    @Path("/edit")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Template save(Map<String,Object> map){

        String editId = (String) map.get("editId");
        Template template = templateService.fetch(editId);
        return template;
    }

    @POST
    @Path("/save")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Template save(Template template){

        if(StringUtils.isBlank(template.getId()))
        {
            templateService.add(template);
        }
        else
        {
            templateService.update(template);
        }
        return template;
    }

    @POST
    @Path("/delete")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public void delete(Map<String,Object> map){

        String editId = (String) map.get("editId");
        templateService.deleteById(editId);
    }

    protected Map getQueryMap(Map<String,Object> map) {
        Map<String, Object> conditions = new HashMap();
		conditions.put("name", (String)map.get("name"));	
		conditions.put("clazz", (String)map.get("clazz"));	
		conditions.put("actType", (String)map.get("actType"));	
		conditions.put("remark", (String)map.get("remark"));	
		conditions.put("createrId", (String)map.get("createrId"));	
		conditions.put("createrName", (String)map.get("createrName"));	
		conditions.put("updaterId", (String)map.get("updaterId"));	
		conditions.put("updaterName", (String)map.get("updaterName"));	
		conditions.put("createDate", (String)map.get("createDate"));	
		conditions.put("updateDate", (String)map.get("updateDate"));	
        
        return conditions;
    }

    @Override
    protected ITemplateService getMainService() {
        return templateService;
    }
}
