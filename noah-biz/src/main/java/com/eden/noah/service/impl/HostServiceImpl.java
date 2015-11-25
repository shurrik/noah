
package com.eden.noah.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eden.common.service.impl.AbstractPageService;
import com.eden.noah.dao.IHostDAO;
import com.eden.noah.model.Host;
import com.eden.noah.service.IHostService;

@SuppressWarnings("unchecked")
@Service("HostServiceImpl")

public class HostServiceImpl extends AbstractPageService<IHostDAO,Host> implements IHostService {

	@Autowired
	private IHostDAO hostDAO;
	@Override
	public boolean getEnableDataPerm() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public IHostDAO getDao() {
		return hostDAO;
	}
}
