
package com.eden.noah.rest.api;

import com.eden.common.domain.view.BizData4Page;
import com.eden.noah.model.Step;
import com.eden.noah.service.IStepService;
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
@Path("/step")
public class StepRestAPI extends BaseRestAPI<IStepService>{

    @Autowired
    private IStepService stepService;

    @POST
    @Path("/list")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public BizData4Page<Step> list(Map<String,Object> map){

        Map<String, Object> conditions = getQueryMap(map);
        PageParam pageParam = getPageParam(map);
        BizData4Page<Step> pageCtx = doPage(conditions, pageParam);
        return  pageCtx;
    }

    @POST
    @Path("/edit")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Step save(Map<String,Object> map){

        String editId = (String) map.get("editId");
        Step step = stepService.fetch(editId);
        return step;
    }

    @POST
    @Path("/save")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Step save(Step step){

        if(StringUtils.isBlank(step.getId()))
        {
            stepService.add(step);
        }
        else
        {
            stepService.update(step);
        }
        return step;
    }

    @POST
    @Path("/delete")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public void delete(Map<String,Object> map){

        String editId = (String) map.get("editId");
        stepService.deleteById(editId);
    }

    protected Map getQueryMap(Map<String,Object> map) {
        Map<String, Object> conditions = new HashMap();
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
    protected IStepService getMainService() {
        return stepService;
    }
}
