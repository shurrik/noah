
package com.eden.noah.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eden.common.service.impl.AbstractPageService;
import com.eden.noah.dao.ITemplateDAO;
import com.eden.noah.model.Template;
import com.eden.noah.service.ITemplateService;

@SuppressWarnings("unchecked")
@Service("TemplateServiceImpl")

public class TemplateServiceImpl extends AbstractPageService<ITemplateDAO,Template> implements ITemplateService {

	@Autowired
	private ITemplateDAO templateDAO;
	@Override
	public boolean getEnableDataPerm() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public ITemplateDAO getDao() {
		return templateDAO;
	}
}
