
package com.eden.noah.service;
import com.eden.common.service.IBaseService;
import com.eden.common.service.IPageService;
import com.eden.noah.dao.IArtifactDAO;
import com.eden.noah.model.Artifact;
public interface IArtifactService extends IBaseService<IArtifactDAO,Artifact>,IPageService<IArtifactDAO,Artifact>{

}