package com.dotoyo.buildjob.common.servlet;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.struts2.views.JspSupportServlet;

import freemarker.ext.jsp.TaglibFactory;
import freemarker.ext.servlet.HttpRequestHashModel;
import freemarker.ext.servlet.HttpSessionHashModel;
import freemarker.ext.servlet.ServletContextHashModel;
import freemarker.template.Configuration;
import freemarker.template.TemplateModel;

public class DotoyoJspSupportServlet extends JspSupportServlet{
	public void init(ServletConfig servletConfig){
		try{
			super.init(servletConfig);
		}catch(Exception e){

		}

	}
	/**
	 *
	 */
	private static final long serialVersionUID = -8758251742626194448L;

}
