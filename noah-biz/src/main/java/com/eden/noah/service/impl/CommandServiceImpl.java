
package com.eden.noah.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eden.common.service.impl.AbstractPageService;
import com.eden.noah.dao.ICommandDAO;
import com.eden.noah.model.Command;
import com.eden.noah.service.ICommandService;

@SuppressWarnings("unchecked")
@Service("CommandServiceImpl")

public class CommandServiceImpl extends AbstractPageService<ICommandDAO,Command> implements ICommandService {

	@Autowired
	private ICommandDAO commandDAO;
	@Override
	public boolean getEnableDataPerm() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public ICommandDAO getDao() {
		return commandDAO;
	}
}
