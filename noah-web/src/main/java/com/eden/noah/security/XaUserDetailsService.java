package com.eden.noah.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eden.noah.model.User;
import com.eden.noah.service.IUserService;

@Service("XaUserDetailsService")
@Transactional(readOnly = true)
public class XaUserDetailsService implements UserDetailsService{

/*	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}*/
	
	@Autowired
	private IUserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		XaUserDetails xaUserDetails = new XaUserDetails();

		try {
/*			XaCmsUser user = xaCmsUserRepository.findByUserName(username,
					XaConstant.UserStatus.status_normal);*/
			
			User user = userService.findOne("userName", username);
			
			if(null==user)
			{
				return null;
			}
/*			List<String> rList = xaCmsResourceRepository
					.findRoleNameByUserName(username);*/
			List<String> rList = new ArrayList();
			rList.add("ROLE_ADMIN");
			
			xaUserDetails.setUsername(user.getUserName());
			xaUserDetails.setPassword(user.getPassword());
			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
			for (String roleName : rList) {
				GrantedAuthority authority = new SimpleGrantedAuthority(
						roleName);
				authorities.add(authority);
			}
			xaUserDetails.setAuthorities(authorities);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return xaUserDetails;
	}	

}
