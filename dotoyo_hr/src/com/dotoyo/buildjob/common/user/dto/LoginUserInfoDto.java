package com.dotoyo.buildjob.common.user.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-15
 * @description 建筑猎头 登录用户信息实体类
 */
public class LoginUserInfoDto extends BlogUserInfoDto implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	protected String userName;// email
	protected String password;
	protected Long point;
	protected String status;
	protected Date registerDate;
	protected Date lastLoginDate;

	protected String expectedPosition;// 期望职位
	protected String userType; // 用户类型，表示是企业用户还是个人用户

	public LoginUserInfoDto() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName != null ? userName.trim() : "";
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Long getPoint() {
		return point;
	}

	public void setPoint(Long point) {
		this.point = point;
	}

	public String getStatus() {
		return status == null ? "" : status.trim();
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public String getUserType() {
		return userType == null ? "" : userType.trim();
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		try {
			return BeanUtils.describe(this).toString();
		} catch (Exception e) {
			Logger.getLogger(this.getClass()).error(
					ApplicationConstant.ERROR_CONVERTING_OBJECT_TO_STRING, e);
		}

		return super.toString();
	}

	public void setExpectedPosition(String expectedPosition) {
		this.expectedPosition = expectedPosition;
	}

	public String getExpectedPosition() {
		return expectedPosition == null ? "" : expectedPosition.trim();
	}

}
