package com.eden.noah.action;

import com.eden.noah.model.User;
import com.eden.noah.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.context.support.WebApplicationObjectSupport;

import javax.servlet.http.HttpServletRequest;


public class BaseAction extends WebApplicationObjectSupport{
    @Autowired
    private IUserService userService;
    
    public User getCurrentUser(HttpServletRequest request)
    {

		Object userDetails = SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		String userName="";
		if( userDetails instanceof String){
			userName = (String)userDetails;
		}else if(userDetails instanceof UserDetails){
			userName = ((UserDetails)userDetails).getUsername();
		}
		User user = userService.findOne("userName", userName);

    	return user;
    }
    
/*    public SSOToken getCurrentUser(HttpServletRequest request)
    {
    	
    	SSOToken st = (SSOToken) SSOHelper.getToken(request);
    	return st;
    }*/
    
//    public User getCurrentUser(HttpServletRequest request)
//    {
//
//    	User user = new User();
//    	SSOToken st = (SSOToken) SSOHelper.getToken(request);
////
//    	user.setId(st.getUserId());
//    	user.setUserName(st.getUserName());
//    	user.setRealName(st.getRealName());
//    	return user;
//    }
}
