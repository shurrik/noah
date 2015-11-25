package com.eden.install.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import org.springframework.web.servlet.DispatcherServlet;

import com.eden.install.util.InstallSetting;

public class YunDispatcherServlet extends DispatcherServlet{

	
/*	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		System.out.println(request.getRequestURI());
		if(!InstallConfig.INSTALL_LOCK)
		{
			if(request.getRequestURI().indexOf("install")!=-1)
			{
			}
			else
			{
				String method = request.getMethod();
				if (method.equalsIgnoreCase(RequestMethod.PATCH.name())) {
					processRequest(request, response);
				}
				else {
					super.service(request, response);
				}
			}
		}
	
	}*/	
	
	@Override
    public void init(ServletConfig config) throws ServletException {
		if(!InstallSetting.INSTALL_LOCK)
		{
			if(config.getServletName().equals("installServlet"))
			{
				super.init(config);
			}
		}
		else
		{
			super.init(config);			
		}

    }
	
/*	private transient ServletConfig config;
	
	@Override
    public void init(ServletConfig config) throws ServletException {
		if(1==1)
		{
			if(config.getServletName().equals("installServlet"))
			{
				this.config = config;
				this.init();				
			}
		}
		else
		{
			this.config = config;
			this.init();			
		}

    }
	
	public final void init() throws ServletException {
		if (logger.isDebugEnabled()) {
			logger.debug("Initializing servlet '" + getServletName() + "'");
		}

		// Set bean properties from init parameters.
		try {
			PropertyValues pvs = new ServletConfigPropertyValues(getServletConfig(), this.requiredProperties);
			BeanWrapper bw = PropertyAccessorFactory.forBeanPropertyAccess(this);
			ResourceLoader resourceLoader = new ServletContextResourceLoader(getServletContext());
			bw.registerCustomEditor(Resource.class, new ResourceEditor(resourceLoader, getEnvironment()));
			initBeanWrapper(bw);
			bw.setPropertyValues(pvs, true);
		}
		catch (BeansException ex) {
			logger.error("Failed to set bean properties on servlet '" + getServletName() + "'", ex);
			throw ex;
		}

		// Let subclasses do whatever initialization they like.
		initServletBean();

		if (logger.isDebugEnabled()) {
			logger.debug("Servlet '" + getServletName() + "' configured successfully");
		}
	}

	public ServletConfig getConfig() {
		return config;
	}

	public void setConfig(ServletConfig config) {
		this.config = config;
	}*/
	@Override
	public void destroy() {

	}
	
}
