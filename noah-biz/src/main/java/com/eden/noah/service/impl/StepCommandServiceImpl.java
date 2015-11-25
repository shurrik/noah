
package com.eden.noah.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eden.common.service.impl.AbstractPageService;
import com.eden.noah.dao.IStepCommandDAO;
import com.eden.noah.model.StepCommand;
import com.eden.noah.service.IStepCommandService;

@SuppressWarnings("unchecked")
@Service("StepCommandServiceImpl")

public class StepCommandServiceImpl extends AbstractPageService<IStepCommandDAO,StepCommand> implements IStepCommandService {

	@Autowired
	private IStepCommandDAO stepCommandDAO;
	@Override
	public boolean getEnableDataPerm() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public IStepCommandDAO getDao() {
		return stepCommandDAO;
	}
}
