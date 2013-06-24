package com.dotoyo.buildjob.certificateCenter.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 *
 * @author arthas.zou
 * @dateCreated 2011-1-25
 * @description
 */
public class CertAccessHistoryDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -4132938516284380852L;
	private Long id;
	private Long personalCertId;// 个人证书ID
	private Long companyId;// 浏览公司ID
	private String companyName;// 浏览公司名称
	private Date accessDate;// 浏览日期
	private String companyUserStatus;// 公司用户状态
	private Date companyUserLastLoginDate;// 公司用户最后登陆日期

	public CertAccessHistoryDto() {

	}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the personalCertId
	 */
	public Long getPersonalCertId() {
		return personalCertId;
	}

	/**
	 * @param personalCertId
	 *            the personalCertId to set
	 */
	public void setPersonalCertId(Long personalCertId) {
		this.personalCertId = personalCertId;
	}

	/**
	 * @return the companyId
	 */
	public Long getCompanyId() {
		return companyId;
	}

	/**
	 * @param companyId
	 *            the companyId to set
	 */
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName == null ? "" : companyName.trim();
	}

	/**
	 * @param companyName
	 *            the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	/**
	 * @return the accessDate
	 */
	public Date getAccessDate() {
		return accessDate;
	}

	/**
	 * @param accessDate
	 *            the accessDate to set
	 */
	public void setAccessDate(Date accessDate) {
		this.accessDate = accessDate;
	}

	/**
	 * @return the companyUserStatus
	 */
	public String getCompanyUserStatus() {
		return companyUserStatus == null ? "" : companyUserStatus.trim();
	}

	/**
	 * @param companyUserStatus
	 *            the companyUserStatus to set
	 */
	public void setCompanyUserStatus(String companyUserStatus) {
		this.companyUserStatus = companyUserStatus;
	}

	/**
	 * @return the companyUserLastLoginDate
	 */
	public Date getCompanyUserLastLoginDate() {
		return companyUserLastLoginDate;
	}

	/**
	 * @param companyUserLastLoginDate
	 *            the companyUserLastLoginDate to set
	 */
	public void setCompanyUserLastLoginDate(Date companyUserLastLoginDate) {
		this.companyUserLastLoginDate = companyUserLastLoginDate;
	}

	@Override
	public String toString() {
		try {
			BeanUtils.describe(this).toString();
		} catch (Exception e) {
			Logger.getLogger(this.getClass()).error(
					ApplicationConstant.ERROR_CONVERTING_OBJECT_TO_STRING, e);
		}
		return super.toString();
	}
}
