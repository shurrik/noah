
package com.eden.noah.rest.api;

import com.eden.common.domain.view.BizData4Page;
import com.eden.noah.model.Host;
import com.eden.noah.service.IHostService;
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
@Path("/host")
public class HostRestAPI extends BaseRestAPI<IHostService>{

    @Autowired
    private IHostService hostService;

    @POST
    @Path("/list")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public BizData4Page<Host> list(Map<String,Object> map){

        Map<String, Object> conditions = getQueryMap(map);
        PageParam pageParam = getPageParam(map);
        BizData4Page<Host> pageCtx = doPage(conditions, pageParam);
        return  pageCtx;
    }

    @POST
    @Path("/edit")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Host save(Map<String,Object> map){

        String editId = (String) map.get("editId");
        Host host = hostService.fetch(editId);
        return host;
    }

    @POST
    @Path("/save")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Host save(Host host){

        if(StringUtils.isBlank(host.getId()))
        {
            hostService.add(host);
        }
        else
        {
            hostService.update(host);
        }
        return host;
    }

    @POST
    @Path("/delete")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public void delete(Map<String,Object> map){

        String editId = (String) map.get("editId");
        hostService.deleteById(editId);
    }

    protected Map getQueryMap(Map<String,Object> map) {
        Map<String, Object> conditions = new HashMap();
		conditions.put("iP", (String)map.get("iP"));	
		conditions.put("name", (String)map.get("name"));	
		conditions.put("user", (String)map.get("user"));	
		conditions.put("password", (String)map.get("password"));	
		conditions.put("remark", (String)map.get("remark"));	
		conditions.put("taskerFlag", (String)map.get("taskerFlag"));	
		conditions.put("createrId", (String)map.get("createrId"));	
		conditions.put("createrName", (String)map.get("createrName"));	
		conditions.put("updaterId", (String)map.get("updaterId"));	
		conditions.put("updaterName", (String)map.get("updaterName"));	
		conditions.put("createDate", (String)map.get("createDate"));	
		conditions.put("updateDate", (String)map.get("updateDate"));	
        
        return conditions;
    }

    @Override
    protected IHostService getMainService() {
        return hostService;
    }
}
