
package com.eden.noah.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eden.common.service.impl.AbstractPageService;
import com.eden.noah.dao.IStepDAO;
import com.eden.noah.model.Step;
import com.eden.noah.service.IStepService;

@SuppressWarnings("unchecked")
@Service("StepServiceImpl")

public class StepServiceImpl extends AbstractPageService<IStepDAO,Step> implements IStepService {

	@Autowired
	private IStepDAO stepDAO;
	@Override
	public boolean getEnableDataPerm() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public IStepDAO getDao() {
		return stepDAO;
	}
}
