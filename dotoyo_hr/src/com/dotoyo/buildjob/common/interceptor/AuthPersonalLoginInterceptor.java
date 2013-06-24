package com.dotoyo.buildjob.common.interceptor;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-3-04
 * @description 验证是否个人用户登陆
 */
public class AuthPersonalLoginInterceptor extends MethodFilterInterceptor {

	private static final long serialVersionUID = -1972145351134031460L;
	public LoginUserInfoDto loginUserInfoDto;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		this.loginUserInfoDto = (LoginUserInfoDto) ctx.getSession().get(
				ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		if (loginUserInfoDto == null) {
			return "logonPage";
		} else {
			String userType = loginUserInfoDto.getUserType();
			if (ApplicationConstant.USER_TYPE_PERSONAL
					.equalsIgnoreCase(userType)) {
				return invocation.invoke();
			} else {
				return "userTypeAuthorizeFailed";
			}
		}
	}

}
