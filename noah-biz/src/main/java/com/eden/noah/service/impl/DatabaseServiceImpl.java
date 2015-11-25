
package com.eden.noah.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eden.common.service.impl.AbstractPageService;
import com.eden.noah.dao.IDatabaseDAO;
import com.eden.noah.model.Database;
import com.eden.noah.service.IDatabaseService;

@SuppressWarnings("unchecked")
@Service("DatabaseServiceImpl")

public class DatabaseServiceImpl extends AbstractPageService<IDatabaseDAO,Database> implements IDatabaseService {

	@Autowired
	private IDatabaseDAO databaseDAO;
	@Override
	public boolean getEnableDataPerm() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public IDatabaseDAO getDao() {
		return databaseDAO;
	}
}
