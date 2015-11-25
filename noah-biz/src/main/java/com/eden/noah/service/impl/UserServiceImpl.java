
package com.eden.noah.service.impl;
import com.eden.common.utils.IdGenerator;
import com.eden.noah.service.IUserService;
import com.eden.noah.dao.IUserDAO;
import com.eden.noah.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;

import com.eden.common.service.impl.AbstractPageService;


@SuppressWarnings("unchecked")
@Service("UserServiceImpl")

public class UserServiceImpl extends AbstractPageService<IUserDAO,User> implements IUserService {

	@Autowired
	private IUserDAO userDAO;

	@Override
	public boolean getEnableDataPerm() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public IUserDAO getDao() {
		return userDAO;
	}
	@Override
	public void incMsgUnread(User user) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void decMsgUnread(User user) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public User createNew(User user) {
		// TODO Auto-generated method stub
		Md5PasswordEncoder md5 = new Md5PasswordEncoder(); 
		user.setId(IdGenerator.createNewId());
		user.setPassword(md5.encodePassword(user.getPassword(), user.getUserName()));
		userDAO.insert(user);
		return user;
	}
}
