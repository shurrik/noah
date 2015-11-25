
package com.eden.noah.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eden.common.service.impl.AbstractPageService;
import com.eden.noah.dao.IArtifactDAO;
import com.eden.noah.model.Artifact;
import com.eden.noah.service.IArtifactService;

@SuppressWarnings("unchecked")
@Service("ArtifactServiceImpl")

public class ArtifactServiceImpl extends AbstractPageService<IArtifactDAO,Artifact> implements IArtifactService {

	@Autowired
	private IArtifactDAO artifactDAO;
	@Override
	public boolean getEnableDataPerm() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public IArtifactDAO getDao() {
		return artifactDAO;
	}
}
