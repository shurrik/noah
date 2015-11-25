
package com.eden.noah.service;
import com.eden.common.service.IBaseService;
import com.eden.common.service.IPageService;
import com.eden.noah.dao.IUserDAO;
import com.eden.noah.model.User;

public interface IUserService extends IBaseService<IUserDAO,User>,IPageService<IUserDAO,User>{

	
	public User createNew(User user);
	public void incMsgUnread(User user);//增加用户未读消息数
	public void decMsgUnread(User user);//减少用户未读消息数
}