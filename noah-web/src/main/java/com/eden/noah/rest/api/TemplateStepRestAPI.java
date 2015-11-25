
package com.eden.noah.rest.api;

import com.eden.common.domain.view.BizData4Page;
import com.eden.noah.model.TemplateStep;
import com.eden.noah.service.ITemplateStepService;
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
@Path("/templatestep")
public class TemplateStepRestAPI extends BaseRestAPI<ITemplateStepService>{

    @Autowired
    private ITemplateStepService templateStepService;

    @POST
    @Path("/list")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public BizData4Page<TemplateStep> list(Map<String,Object> map){

        Map<String, Object> conditions = getQueryMap(map);
        PageParam pageParam = getPageParam(map);
        BizData4Page<TemplateStep> pageCtx = doPage(conditions, pageParam);
        return  pageCtx;
    }

    @POST
    @Path("/edit")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public TemplateStep save(Map<String,Object> map){

        String editId = (String) map.get("editId");
        TemplateStep templateStep = templateStepService.fetch(editId);
        return templateStep;
    }

    @POST
    @Path("/save")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public TemplateStep save(TemplateStep templateStep){

        if(StringUtils.isBlank(templateStep.getId()))
        {
            templateStepService.add(templateStep);
        }
        else
        {
            templateStepService.update(templateStep);
        }
        return templateStep;
    }

    @POST
    @Path("/delete")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public void delete(Map<String,Object> map){

        String editId = (String) map.get("editId");
        templateStepService.deleteById(editId);
    }

    protected Map getQueryMap(Map<String,Object> map) {
        Map<String, Object> conditions = new HashMap();
		conditions.put("tplId", (String)map.get("tplId"));	
		conditions.put("stepId", (String)map.get("stepId"));	
		conditions.put("createrId", (String)map.get("createrId"));	
		conditions.put("createrName", (String)map.get("createrName"));	
		conditions.put("createDate", (String)map.get("createDate"));	
        
        return conditions;
    }

    @Override
    protected ITemplateStepService getMainService() {
        return templateStepService;
    }
}
