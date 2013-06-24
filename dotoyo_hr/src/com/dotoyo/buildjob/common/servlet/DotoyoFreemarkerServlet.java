package com.dotoyo.buildjob.common.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.html.HtmlGeneration;

import freemarker.ext.servlet.FreemarkerServlet;
/**
 * Free marker servlet
 * @author wisdy.xiao
 *
 */
public class DotoyoFreemarkerServlet extends FreemarkerServlet{
	private static Logger logger = Logger.getLogger(DotoyoFreemarkerServlet.class);
	/**
	 *
	 */
	private static final long serialVersionUID = 7657730421764452105L;
	public DotoyoFreemarkerServlet(){
		super();
	}
	public void init(){
		try{
			super.init();
		}catch(Exception e){
			logger.error("error. " + e);
		}
	}
	public void init(ServletConfig config){
		try{
			super.init(config);
			//生成HTML

			HtmlGeneration.getInstance().createAll();
		}catch(Exception e){
			logger.error("error. " + e);
		}
	}
	public void initializeServletContext(HttpServletRequest request,HttpServletResponse response){
		try{
			super.initializeServletContext(request, response);
		}catch(Exception e){
			logger.error("error. " + e);
		}
	}
	public void initializeSession(HttpServletRequest request,HttpServletResponse response){
		try{
			super.initializeSession(request, response);
		}catch(Exception e){
			logger.error("error. " + e);
		}
	}

}
