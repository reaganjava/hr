package com.dotoyo.buildjob.common.logon.action;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.HtmlEmail;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.ICasLoginService;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.common.util.Md5;
import com.dotoyo.buildjob.common.util.PropertiesValue;
import com.dotoyo.buildjob.systemManage.dto.SysLogDto;
import com.dotoyo.buildjob.systemManage.service.ISysLogService;
import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.image.ImageCaptchaService;
import com.octo.captcha.service.multitype.GenericManageableCaptchaService;

/**
 * 
 * @author tyler.qu
 * @dateCreated 2010-11-30
 * @description
 */
public class LogonAction extends BuildJobAction implements SessionAware {

	/**
	 *
	 */
	private static final long serialVersionUID = 5820478864768117117L;
	private static Logger logger = Logger.getLogger(LogonAction.class);
	private GenericManageableCaptchaService captchaService;
	private IUserService userService;
	private LoginUserInfoDto userInfo;
	private BlogUserInfoDto blogUserInfoDto;
	private Map<String, Object> session = null;
	private ISysLogService sysLogService;
	private String errorMessage = "";
	private String actionMessage;
	//cas登录
	private ICasLoginService casLoginService;

	/**
	 * 验证码验证passed/unapprove
	 * 
	 * @return
	 */
	public Boolean validateCaptcha() {
		HttpServletRequest req = ServletActionContext.getRequest();
		String captchaId = ServletActionContext.getRequest().getSession()
				.getId();
		String userCaptchaResponse = req
				.getParameter(ApplicationConstant.REQUEST_PARAMETER_CAPTCHA);
		ImageCaptchaService imageCaptchaService = (ImageCaptchaService) captchaService;
		boolean passValidate;
		try {
			passValidate = imageCaptchaService.validateResponseForID(captchaId,
					userCaptchaResponse);
		} catch (CaptchaServiceException e) {
			passValidate = false;
		}
		return passValidate;
	}
	
	public String logon() throws Exception{
		request = ServletActionContext.getRequest();
		String userName = userInfo.getUserName().toLowerCase();
		//String password = Md5.encoderByMd5(userInfo.getPassword());
		String password = userInfo.getPassword();
		String proxyValidate = PropertiesValue.getPropertyValue("cas.proxyValidate");
		String service = PropertiesValue.getPropertyValue("cas.service");
		String server = PropertiesValue.getPropertyValue("cas.server");
		if (validateCaptcha()) {
			/*userInfo = userService.getUserByUserNameAndPassword(userName,
					password);*/
			//登录CAS
			String serviceTicket = casLoginService.getTicket(server, userName, password, service);
			String rt = casLoginService.ticketValidate(proxyValidate, serviceTicket, service);
			if(!rt.equals("200")){
				request.setAttribute("errorMessage", "用户名或密码错误！");
				return "loginFail";
			}else{
				userInfo = userService.getUserByUserName(userName);
				if (userInfo == null) {
					userInfo = new LoginUserInfoDto();
					userInfo.setUserName(userName);
					this.logout();
					request.setAttribute("errorMessage", "用户名或密码错误！");
					return "loginFail";
				} else {
					// 判断用户是否已停用
					String status = userInfo.getStatus();
					if ("0".equalsIgnoreCase(status)) {
						request.setAttribute("errorMessage", "用户已停用，请联系管理员！");
						userInfo = new LoginUserInfoDto();
						userInfo.setUserName(userName);
						return "loginFail";
					}
					// 获取用户的详细信息 Bill xu 2011-02-09
					this.blogUserInfoDto = userService.getUserInfoDetailByUserName(userName);
					writeSysLog(userInfo.getId(), "登陆");
					if (this.blogUserInfoDto != null) {
						userInfo.setUserType(this.blogUserInfoDto.getUserType());
						userInfo.setCompanyName(blogUserInfoDto.getCompanyName());
						userInfo.setAge(blogUserInfoDto.getAge());
						userInfo.setWorkingLife(blogUserInfoDto.getWorkingLife());
						String userType = userInfo.getUserType();
						if (userType == null || userType == "") {
							session.put(
									ApplicationConstant.SESSION_PARAMETER_USER_INFO,
									userInfo);
							actionMessage = ApplicationConstant.FUNCTION_LIMITED;
							return "backToHome";
						}
					} else {// 博站用户信息为空，同步错误
						// 跳到提示页（？？）
						session.put(
								ApplicationConstant.SESSION_PARAMETER_USER_INFO,
								userInfo);
						try {
							sendUserTypeErrorEmail();
						} catch (Exception e) {
							logger.error(e);
							e.printStackTrace();
						}
						return "judgeUserTypeError";
					}
					session.put(ApplicationConstant.SESSION_PARAMETER_USER_INFO,
							userInfo);
					userService.updateUser(userInfo.getId(), "lastLoginDate",
							new Date());
					// 控制页面跳转
					if (ApplicationConstant.USER_TYPE_PERSONAL
							.equalsIgnoreCase(userInfo.getUserType())) {
						return "persionalCenter";
					} else {
						return "enterpriseCenter";
					}
				}
			
			}

			
		} else {// 验证码错误
			userInfo = new LoginUserInfoDto();
			userInfo.setUserName(userName);
			setErrorMessage("验证码错误");
			request.setAttribute("errorMessage", "验证码错误！");
			return "captchaError";
		}
	}
/*
	public String logon() {
		request = ServletActionContext.getRequest();
		String userName = userInfo.getUserName().toLowerCase();
		String password = Md5.encoderByMd5(userInfo.getPassword());
		if (validateCaptcha()) {
			userInfo = userService.getUserByUserNameAndPassword(userName,
					password);
			if (userInfo == null) {
				userInfo = new LoginUserInfoDto();
				userInfo.setUserName(userName);
				this.logout();
				request.setAttribute("errorMessage", "用户名或密码错误！");
				return "loginFail";
			} else {
				// 判断用户是否已停用
				String status = userInfo.getStatus();
				if ("0".equalsIgnoreCase(status)) {
					request.setAttribute("errorMessage", "用户已停用，请联系管理员！");
					userInfo = new LoginUserInfoDto();
					userInfo.setUserName(userName);
					return "loginFail";
				}
				// 获取用户的详细信息 Bill xu 2011-02-09
				this.blogUserInfoDto = userService.getUserInfoDetailByUserName(userName);
				writeSysLog(userInfo.getId(), "登陆");
				if (this.blogUserInfoDto != null) {
					userInfo.setUserType(this.blogUserInfoDto.getUserType());
					userInfo.setCompanyName(blogUserInfoDto.getCompanyName());
					userInfo.setAge(blogUserInfoDto.getAge());
					userInfo.setWorkingLife(blogUserInfoDto.getWorkingLife());
					String userType = userInfo.getUserType();
					if (userType == null || userType == "") {
						session.put(
								ApplicationConstant.SESSION_PARAMETER_USER_INFO,
								userInfo);
						actionMessage = ApplicationConstant.FUNCTION_LIMITED;
						return "backToHome";
					}
				} else {// 博站用户信息为空，同步错误
					// 跳到提示页（？？）
					session.put(
							ApplicationConstant.SESSION_PARAMETER_USER_INFO,
							userInfo);
					try {
						sendUserTypeErrorEmail();
					} catch (Exception e) {
						logger.error(e);
						e.printStackTrace();
					}
					return "judgeUserTypeError";
				}
				session.put(ApplicationConstant.SESSION_PARAMETER_USER_INFO,
						userInfo);
				userService.updateUser(userInfo.getId(), "lastLoginDate",
						new Date());
				// 控制页面跳转
				if (ApplicationConstant.USER_TYPE_PERSONAL
						.equalsIgnoreCase(userInfo.getUserType())) {
					return "persionalCenter";
				} else {
					return "enterpriseCenter";
				}
			}
		} else {// 验证码错误
			userInfo = new LoginUserInfoDto();
			userInfo.setUserName(userName);
			setErrorMessage("验证码错误");
			request.setAttribute("errorMessage", "验证码错误！");
			return "captchaError";
		}
	}*/

	private void writeSysLog(Long userId, String message) {
		SysLogDto logDto = new SysLogDto();
		logDto.setOperator(userId);
		logDto.setAction(message);
		logDto.setOperate_time(new Date());

		String ip = ServletActionContext.getRequest().getRemoteAddr();
		logDto.setIp(ip);
		sysLogService.addSysLog(logDto);
	}

	private void sendUserTypeErrorEmail() throws Exception {
		// ** Get mail configurations **//
		String host = PropertiesValue.getPropertyValue("system.jmail.host");
		String username = PropertiesValue
				.getPropertyValue("system.jmail.username");
		String password = PropertiesValue
				.getPropertyValue("system.jmail.password");
		String mail_to = PropertiesValue
				.getPropertyValue("system.jamil.admin.account");
		String mail_from = PropertiesValue
				.getPropertyValue("system.jmail.from");

		// /** set mail **/
		HtmlEmail email = new HtmlEmail();
		// SimpleEmail email = new SimpleEmail();
		email.setHostName(host);
		email.setAuthentication(username, password);
		email.addTo(mail_to);
		email.setFrom(mail_from, "Service");
		email.setCharset("utf-8");
		email.setSubject(PropertiesValue.getPropertyValue("system.jmail.title"));
		// email.buildMimeMessage();
		// ** set mail content **//
		email.setHtmlMsg(getEmailContent(""));
		// send email
		email.send();
	}

	private String getEmailContent(String password) throws Exception {
		StringBuffer sb = new StringBuffer("");
		sb.append("<html>");
		sb.append("<head>");
		sb.append("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
		sb.append("</head>");
		sb.append("<body>");
		sb.append("<div>");
		sb.append("<p>找不到用户类型。</p>");
		sb.append("<p>用户ID:" + getLoginUserInfo().getId() + "</p>");
		sb.append("<p>用户帐号：" + getLoginUserInfo().getUserName() + "</p>");
		sb.append("<p>【注意】本邮件为系统自动发送的邮件，请不要回复本邮件。</p>");
		sb.append("</div>");
		sb.append("</body>");
		sb.append("<html>");
		return sb.toString();

	}

	public String logout() throws Exception {
		String server = PropertiesValue.getPropertyValue("cas.logouturl");
		if (session.get(ApplicationConstant.SESSION_PARAMETER_USER_INFO) != null) {
			userService.updateUser(this.getLoginUserInfo().getId(),
					"lastLoginDate", new Date());
			this.writeSysLog(this.getLoginUserInfo().getId(), "退出");
			session.remove(ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		}
		casLoginService.casLogout(server);

		return "logout";
	}

	public void setCaptchaService(GenericManageableCaptchaService captchaService) {
		this.captchaService = captchaService;
	}

	public GenericManageableCaptchaService getCaptchaService() {
		return captchaService;
	}

	/**
	 * @return the userInfo
	 */
	public LoginUserInfoDto getUserInfo() {
		return userInfo;
	}

	/**
	 * @param userInfo
	 *            the userInfo to set
	 */
	public void setUserInfo(LoginUserInfoDto userInfo) {
		this.userInfo = userInfo;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public IUserService getUserService() {
		return userService;
	}

	public BlogUserInfoDto getBlogUserInfoDto() {
		return blogUserInfoDto;
	}

	public void setBlogUserInfoDto(BlogUserInfoDto blogUserInfoDto) {
		this.blogUserInfoDto = blogUserInfoDto;
	}

	/**
	 * @return the session
	 */
	public Map<String, Object> getSession() {
		return session;
	}

	/**
	 * @param session
	 *            the session to set
	 */
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public ISysLogService getSysLogService() {
		return sysLogService;
	}

	public void setSysLogService(ISysLogService sysLogService) {
		this.sysLogService = sysLogService;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

	/**
	 * @return the casLoginService
	 */
	public ICasLoginService getCasLoginService() {
		return casLoginService;
	}

	/**
	 * @param casLoginService the casLoginService to set
	 */
	public void setCasLoginService(ICasLoginService casLoginService) {
		this.casLoginService = casLoginService;
	}



}
