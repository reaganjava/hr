package com.dotoyo.buildjob.common.user.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.common.util.Md5;
import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.image.ImageCaptchaService;
import com.octo.captcha.service.multitype.GenericManageableCaptchaService;

/**
 * 
 * @author tyler.qu
 * @dateCreated 2010-11-26
 * @description 建筑猎头 用户信息处理入口
 */
public class UserAction extends BuildJobAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private GenericManageableCaptchaService captchaService;
	private IUserService userService;
	private LoginUserInfoDto userInfo;// 用户值对象，前后台数据接收对象
	public HttpServletRequest request = null;
	private String oldPassword;
	private String newPassword;
	private String message;// 页面消息
	private String actionMessage;

	// 验证码验证passed/unapprove
	public boolean validateCaptcha() {
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

	public String register() {
		request = ServletActionContext.getRequest();

		// 判断验证码是否正确
		if (validateCaptcha()) {

			// 判断用户名是否重复
			String userName = userInfo.getUserName().toLowerCase();
			if (userService.getUserByUserName(userName) != null) {
				message = "用户名已存在";
				return "captchaError";
			}

			// 保存用户信息到数据库中
			userInfo.setPassword(Md5.encoderByMd5(userInfo.getPassword()));
			Date currentDate = new Date();
			userInfo.setRegisterDate(currentDate);
			userInfo.setLastLoginDate(currentDate);
			userInfo.setPoint(new Long(0));
			userInfo.setUserName(userName);
			userService.addUser(userInfo);
			userService.synUserInfoToBlog(userInfo);

			// 保存用户信息到session中，实现注册完成后自动登陆功能
			userInfo = userService.getUserByUserName(userName);
			request.getSession().setAttribute(
					ApplicationConstant.SESSION_PARAMETER_USER_INFO, userInfo);

			return SUCCESS;// 到博站那边去(接口间的协议待确认<redirect带参数过去？>)。20101130
		} else {
			message = "验证码错误";
			return "captchaError";
		}
	}

	/**
	 * 用户后台进入密码修改页面
	 * 
	 * @return
	 */
	public String toEditPassword() {
		userInfo = getLoginUserInfo();
		return "toEditPassword";
	}

	public String saveEditPassword() {
		userInfo = getLoginUserInfo();

		// 判断密码是否正确
		String password = getLoginUserInfo().getPassword();
		oldPassword = Md5.encoderByMd5(oldPassword);
		if (!password.equals(oldPassword)) {
			message = "原密码错误";
			return toEditPassword();
		}

		userService.updateUser(userInfo.getId(), "password",
				Md5.encoderByMd5(newPassword));
		getLoginUserInfo().setPassword(Md5.encoderByMd5(newPassword));
		message = "修改成功，请重新登陆！";

		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute(ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		return "saveEditPassword";
	}

	/**
	 * 判断用户名是否重复
	 * 
	 * @return
	 */
	public String isDuplicated() throws Exception {
		String userName = userInfo.getUserName();
		LoginUserInfoDto userInfo = userService.getUserByUserName(userName);
		String text = "false";
		if (userInfo == null) {
			text = "true";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().write(text);
		return null;
	}

	/**
	 * 判断原密码是否正确
	 * 
	 * @return
	 */
	public String isOldPasswordCorrect() throws Exception {
		String password = getLoginUserInfo().getPassword();
		oldPassword = Md5.encoderByMd5(oldPassword);
		String text = "false";
		if (oldPassword.equals(password)) {
			text = "true";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().write(text);
		return null;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserInfo(LoginUserInfoDto userInfo) {
		this.userInfo = userInfo;
	}

	public LoginUserInfoDto getUserInfo() {
		return userInfo;
	}

	public void setCaptchaService(GenericManageableCaptchaService captchaService) {
		this.captchaService = captchaService;
	}

	public GenericManageableCaptchaService getCaptchaService() {
		return captchaService;
	}

	/*
	 * public void setUnapprove(String unapprove) { this.unapprove = unapprove;
	 * } public String getUnapprove() { return unapprove; }
	 */

	/**
	 * @return the oldPassword
	 */
	public String getOldPassword() {
		return oldPassword;
	}

	/**
	 * @param oldPassword
	 *            the oldPassword to set
	 */
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	/**
	 * @return the newPassword
	 */
	public String getNewPassword() {
		return newPassword;
	}

	/**
	 * @param newPassword
	 *            the newPassword to set
	 */
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

}
