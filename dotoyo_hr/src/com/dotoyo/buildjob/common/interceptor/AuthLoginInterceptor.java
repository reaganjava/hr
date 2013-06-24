package com.dotoyo.buildjob.common.interceptor;

import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 *验证是否登陆 
 *2011-02-11
 * @author Bill Xu 
 * 
 */
public class AuthLoginInterceptor extends MethodFilterInterceptor{
	private static Logger logger = Logger.getLogger(AuthLoginInterceptor.class);
	private static final long serialVersionUID = 1L;
	public LoginUserInfoDto loginUserInfoDto;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = ServletActionContext.getContext();
		
		logger.info("---------ActionContext===------------"+ctx+"-------------------------");
		this.loginUserInfoDto=(LoginUserInfoDto) ctx.getSession().get(ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		logger.info("---------this.loginUserInfoDto===------------"+this.loginUserInfoDto+"-------------------------");
		if (this.loginUserInfoDto != null) {
			return invocation.invoke();
		} else {
			return "logonPage";
		}
	}
	
}