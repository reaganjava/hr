package com.dotoyo.buildjob.common.interceptor;


import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.ParseAuthNameUtil;
import com.dotoyo.buildjob.sys.service.ISysFunctionRoleService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 *验证方法的访问权限
 *2011-02-12
 * @author Bill Xu 
 * 
 */
public class AuthFunctionInterceptor extends MethodFilterInterceptor{
	private static final long serialVersionUID = 1L;
	public LoginUserInfoDto loginUserInfoDto;
	public ISysFunctionRoleService sysFunctionRoleService;
	
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		this.loginUserInfoDto = (LoginUserInfoDto) ctx.getSession().get(
				ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		
       String  methodName = invocation.getProxy().getMethod();
       Object actionName = invocation.getProxy().getAction();   
       String functionCode =  ParseAuthNameUtil.parseAuthentication(actionName.getClass(), methodName);
       Long userId = this.loginUserInfoDto.getId();
       //根据Code和用户名去权限表查找(调用service)，是否存在访问这个方法的权限
       if(sysFunctionRoleService.existFunctionRight(userId, functionCode)){//有权限
    	   return invocation.invoke();  
       }else{//无权限
    	   return "noRightPage";
       }
}

	public ISysFunctionRoleService getSysFunctionRoleService() {
		return sysFunctionRoleService;
	}

	public void setSysFunctionRoleService(
			ISysFunctionRoleService sysFunctionRoleService) {
		this.sysFunctionRoleService = sysFunctionRoleService;
	} 

}