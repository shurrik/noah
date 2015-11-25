
package com.eden.noah.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eden.common.service.impl.AbstractPageService;
import com.eden.noah.dao.ITemplateStepDAO;
import com.eden.noah.model.TemplateStep;
import com.eden.noah.service.ITemplateStepService;

@SuppressWarnings("unchecked")
@Service("TemplateStepServiceImpl")

public class TemplateStepServiceImpl extends AbstractPageService<ITemplateStepDAO,TemplateStep> implements ITemplateStepService {

	@Autowired
	private ITemplateStepDAO templateStepDAO;
	@Override
	public boolean getEnableDataPerm() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public ITemplateStepDAO getDao() {
		return templateStepDAO;
	}
}
