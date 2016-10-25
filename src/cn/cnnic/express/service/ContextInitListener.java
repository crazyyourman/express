package cn.cnnic.express.service;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;



public class ContextInitListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		 
	}  

	@Override
	public void contextInitialized(ServletContextEvent event) {
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		DicHelper.setAc(ac);
		DicHelper.init();
	}

}
