package com.eden.noah.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.web.FilterInvocation;

public class XaFilterSecurityInterceptor extends AbstractSecurityInterceptor
		implements Filter {

	private SecurityMetadataSource securityMetadataSource;

	@Override
	public Class<?> getSecureObjectClass() {

		return FilterInvocation.class;
	}

	@Override
	public SecurityMetadataSource obtainSecurityMetadataSource() {

		return securityMetadataSource;
	}

	public SecurityMetadataSource getSecurityMetadataSource() {
		return securityMetadataSource;
	}

	public void setSecurityMetadataSource(
			SecurityMetadataSource securityMetadataSource) {
		this.securityMetadataSource = securityMetadataSource;
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
			FilterInvocation fi = new FilterInvocation(request, response, chain);
			invoke(fi);
	}

	public void invoke(FilterInvocation fi) throws IOException,
			ServletException {
		InterceptorStatusToken token = super.beforeInvocation(fi);
		try {
			fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
		} finally {
			super.afterInvocation(token, null);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
/*
 * public class XaFilterSecurityInterceptor extends AbstractSecurityInterceptor
 * implements Filter{ private SecurityMetadataSource securityMetadataSource;
 * 
 * 
 * public SecurityMetadataSource getSecurityMetadataSource() { return
 * securityMetadataSource; }
 * 
 * public void setSecurityMetadataSource( SecurityMetadataSource
 * securityMetadataSource) { this.securityMetadataSource =
 * securityMetadataSource; }
 * 
 * @Override public void init(FilterConfig filterConfig) throws ServletException
 * { // TODO Auto-generated method stub
 * 
 * }
 * 
 * @Override public void doFilter(ServletRequest request, ServletResponse
 * response, FilterChain chain) throws IOException, ServletException { // TODO
 * Auto-generated method stub
 * 
 * }
 * 
 * @Override public void destroy() { // TODO Auto-generated method stub
 * 
 * }
 * 
 * @Override public Class<?> getSecureObjectClass() {
 * 
 * return FilterInvocation.class; }
 * 
 * @Override public SecurityMetadataSource obtainSecurityMetadataSource() { //
 * TODO Auto-generated method stub return null; }
 * 
 * }
 */
