package com.eden.install.listener;

import javax.servlet.ServletContext;

import com.eden.install.util.InstallSetting;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.util.ObjectUtils;
import org.springframework.web.context.ConfigurableWebApplicationContext;
import org.springframework.web.context.ConfigurableWebEnvironment;
import org.springframework.web.context.ContextLoaderListener;

public class InstallContextLoaderListener extends ContextLoaderListener{

/*	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println(event.getServletContext());
		
		if(1==1)
		{
			initWebApplicationContext(event.getServletContext());			
		}
		else
		{
			initWebApplicationContext(event.getServletContext());
		}
	}*/
	
	@Override
	protected void configureAndRefreshWebApplicationContext(ConfigurableWebApplicationContext wac, ServletContext sc) {
		if (ObjectUtils.identityToString(wac).equals(wac.getId())) {
			// The application context id is still set to its original default value
			// -> assign a more useful id based on available information
			String idParam = sc.getInitParameter(CONTEXT_ID_PARAM);
			if (idParam != null) {
				wac.setId(idParam);
			}
			else {
				// Generate default id...
				wac.setId(ConfigurableWebApplicationContext.APPLICATION_CONTEXT_ID_PREFIX +
						ObjectUtils.getDisplayString(sc.getContextPath()));
			}
		}

		wac.setServletContext(sc);
//		String configLocationParam = sc.getInitParameter(CONFIG_LOCATION_PARAM);
		String configLocationParam ="";
		if(!InstallSetting.INSTALL_LOCK)
		{
			configLocationParam = "/WEB-INF/spring/applicationContext-security.xml";
		}
		else
		{
			configLocationParam = sc.getInitParameter(CONFIG_LOCATION_PARAM);
		}
				
		if (configLocationParam != null) {
			wac.setConfigLocation(configLocationParam);
		}

		// The wac environment's #initPropertySources will be called in any case when the context
		// is refreshed; do it eagerly here to ensure servlet property sources are in place for
		// use in any post-processing or initialization that occurs below prior to #refresh
		ConfigurableEnvironment env = wac.getEnvironment();
		if (env instanceof ConfigurableWebEnvironment) {
			((ConfigurableWebEnvironment) env).initPropertySources(sc, null);
		}

		customizeContext(sc, wac);
		wac.refresh();
	}	
	
}
