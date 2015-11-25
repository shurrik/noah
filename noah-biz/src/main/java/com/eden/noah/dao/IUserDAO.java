package com.eden.noah.dao;

import java.util.List;

import com.eden.common.dao.IBaseDAO;
import com.eden.noah.model.User;


public interface IUserDAO extends IBaseDAO<User>{

	public	List<User> findRoleUser();

}
