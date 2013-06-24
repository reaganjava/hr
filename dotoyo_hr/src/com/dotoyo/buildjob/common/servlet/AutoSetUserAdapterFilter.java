/**
 * 
 */
package com.dotoyo.buildjob.common.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.AssertionImpl;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.user.dao.IUserDao;
import com.dotoyo.buildjob.common.user.dao.impl.UserDaoImpl;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.common.user.service.impl.UserServiceImpl;
import com.dotoyo.buildjob.common.util.UserUtil;


/**
 * @author hdc
 *
 */
public class AutoSetUserAdapterFilter implements Filter {
	
	private FilterConfig filterConfig;
	private IUserService userService;
	
	/**
     * Default constructor.
     */
    public AutoSetUserAdapterFilter() {

    }

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub

	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		String userAccount="";
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		WebApplicationContext wac = WebApplicationContextUtils
		.getRequiredWebApplicationContext(filterConfig
				.getServletContext());

        Object object = httpRequest.getSession().getAttribute("_const_cas_assertion_");

        if (object != null) {		
                 AttributePrincipal principal=((AssertionImpl) object).getPrincipal();

                 Map<String, Object> attributes = principal.getAttributes();
     			if (attributes.size() > 0) {
     				userAccount = (String) attributes.get("userAccount");
     				LoginUserInfoDto loginUserInfoDto = userService.getUserByUserName(userAccount);
     				if (loginUserInfoDto == null) {
     					loginUserInfoDto = new LoginUserInfoDto();
     					loginUserInfoDto.setUserName(userAccount);
     				}else {
     					// 获取用户的详细信息 Bill xu 2011-02-09
     					BlogUserInfoDto blogUserInfoDto = userService.getUserInfoDetailByUserName(userAccount);

     					if (blogUserInfoDto != null) {
     						loginUserInfoDto.setUserType(blogUserInfoDto.getUserType());
     						loginUserInfoDto.setCompanyName(blogUserInfoDto.getCompanyName());
     						loginUserInfoDto.setAge(blogUserInfoDto.getAge());
     						loginUserInfoDto.setWorkingLife(blogUserInfoDto.getWorkingLife());     					
     					}
     					UserUtil.saveUserToSession(httpRequest,loginUserInfoDto);
     				}
     			}
     		
        }
        chain.doFilter(request, response);
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	/**
	 * @return the userService
	 */
	public IUserService getUserService() {
		return userService;
	}

	/**
	 * @param userService the userService to set
	 */
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}


}
