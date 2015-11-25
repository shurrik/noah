
package com.eden.noah.rest.api;

import com.eden.common.domain.view.BizData4Page;
import com.eden.noah.model.StepCommand;
import com.eden.noah.service.IStepCommandService;
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
@Path("/stepcommand")
public class StepCommandRestAPI extends BaseRestAPI<IStepCommandService>{

    @Autowired
    private IStepCommandService stepCommandService;

    @POST
    @Path("/list")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public BizData4Page<StepCommand> list(Map<String,Object> map){

        Map<String, Object> conditions = getQueryMap(map);
        PageParam pageParam = getPageParam(map);
        BizData4Page<StepCommand> pageCtx = doPage(conditions, pageParam);
        return  pageCtx;
    }

    @POST
    @Path("/edit")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public StepCommand save(Map<String,Object> map){

        String editId = (String) map.get("editId");
        StepCommand stepCommand = stepCommandService.fetch(editId);
        return stepCommand;
    }

    @POST
    @Path("/save")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public StepCommand save(StepCommand stepCommand){

        if(StringUtils.isBlank(stepCommand.getId()))
        {
            stepCommandService.add(stepCommand);
        }
        else
        {
            stepCommandService.update(stepCommand);
        }
        return stepCommand;
    }

    @POST
    @Path("/delete")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public void delete(Map<String,Object> map){

        String editId = (String) map.get("editId");
        stepCommandService.deleteById(editId);
    }

    protected Map getQueryMap(Map<String,Object> map) {
        Map<String, Object> conditions = new HashMap();
		conditions.put("stepId", (String)map.get("stepId"));	
		conditions.put("cmdId", (String)map.get("cmdId"));	
		conditions.put("createrId", (String)map.get("createrId"));	
		conditions.put("createrName", (String)map.get("createrName"));	
		conditions.put("createDate", (String)map.get("createDate"));	
        
        return conditions;
    }

    @Override
    protected IStepCommandService getMainService() {
        return stepCommandService;
    }
}
