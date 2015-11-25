
package com.eden.noah.rest.api;

import com.eden.common.domain.view.BizData4Page;
import com.eden.noah.model.Artifact;
import com.eden.noah.service.IArtifactService;
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
@Path("/artifact")
public class ArtifactRestAPI extends BaseRestAPI<IArtifactService>{

    @Autowired
    private IArtifactService artifactService;

    @POST
    @Path("/list")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public BizData4Page<Artifact> list(Map<String,Object> map){

        Map<String, Object> conditions = getQueryMap(map);
        PageParam pageParam = getPageParam(map);
        BizData4Page<Artifact> pageCtx = doPage(conditions, pageParam);
        return  pageCtx;
    }

    @POST
    @Path("/edit")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Artifact save(Map<String,Object> map){

        String editId = (String) map.get("editId");
        Artifact artifact = artifactService.fetch(editId);
        return artifact;
    }

    @POST
    @Path("/save")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Artifact save(Artifact artifact){

        if(StringUtils.isBlank(artifact.getId()))
        {
            artifactService.add(artifact);
        }
        else
        {
            artifactService.update(artifact);
        }
        return artifact;
    }

    @POST
    @Path("/delete")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public void delete(Map<String,Object> map){

        String editId = (String) map.get("editId");
        artifactService.deleteById(editId);
    }

    protected Map getQueryMap(Map<String,Object> map) {
        Map<String, Object> conditions = new HashMap();
		conditions.put("actType", (String)map.get("actType"));	
		conditions.put("name", (String)map.get("name"));	
		conditions.put("path", (String)map.get("path"));	
		conditions.put("size", (String)map.get("size"));	
		conditions.put("createrId", (String)map.get("createrId"));	
		conditions.put("createrName", (String)map.get("createrName"));	
		conditions.put("updaterId", (String)map.get("updaterId"));	
		conditions.put("updaterName", (String)map.get("updaterName"));	
		conditions.put("createDate", (String)map.get("createDate"));	
		conditions.put("updateDate", (String)map.get("updateDate"));	
        
        return conditions;
    }

    @Override
    protected IArtifactService getMainService() {
        return artifactService;
    }
}
