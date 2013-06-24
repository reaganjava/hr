package com.dotoyo.buildjob.certificateCenter.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 *
 * @author arthas.zou
 * @dateCreated 2010-11-30
 * @description
 */
public class PersonalCertDto implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = -3407043114292788190L;
	private Long id;// 个人证书ID
	private String certTypeCode;// 证书类型编码
	private String certTypeName;// 证书类型名称
	private String certCode;// 证书编码
	private String certName;// 证书名称
	private Long userId;// 用户ID
	private String userName;// 用户帐号
	private String userRealName;// 用户名称
	private String registerStatusCode;// 证书注册状况（初始注册\未注册等）
	private String registerStatusName;
	private String specialFieldCode;// 专业
	private String specialFieldName;
	private String provinceCode;// 省份
	private String provinceName;
	private String cityCode;// 城市
	private String cityName;
	private String areaCode;// 区域
	private String areaName;
	private String descp;// 补充说明
	private String certStatus;// 个人证书状态（已挂靠、未挂靠）
	private Date submitDate;// 发布日期
	private Date lastEditDate;// 最后修改日期
	private String contact;// 联系人
	private String telephone;// 联系电话
	private String cellPhone;// 手机号码
	private String email;// 电子邮件
	private String fax;// 传真

	public PersonalCertDto() {
		// TODO Auto-generated constructor stub
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
	 * @return the certTypeCode
	 */
	public String getCertTypeCode() {
		return certTypeCode == null ? "" : certTypeCode.trim();
	}

	/**
	 * @param certTypeCode
	 *            the certTypeCode to set
	 */
	public void setCertTypeCode(String certTypeCode) {
		this.certTypeCode = certTypeCode;
	}

	/**
	 * @return the certCode
	 */
	public String getCertCode() {
		return certCode == null ? "" : certCode.trim();
	}

	/**
	 * @param certCode
	 *            the certCode to set
	 */
	public void setCertCode(String certCode) {
		this.certCode = certCode;
	}

	/**
	 * @return the userId
	 */
	public Long getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}

	/**
	 * @return the registerStatusCode
	 */
	public String getRegisterStatusCode() {
		return registerStatusCode == null ? "" : registerStatusCode.trim();
	}

	/**
	 * @param registerStatusCode
	 *            the registerStatusCode to set
	 */
	public void setRegisterStatusCode(String registerStatusCode) {
		this.registerStatusCode = registerStatusCode;
	}

	/**
	 * @return the specialFieldCode
	 */
	public String getSpecialFieldCode() {
		return specialFieldCode == null ? "" : specialFieldCode.trim();
	}

	/**
	 * @param specialFieldCode
	 *            the specialFieldCode to set
	 */
	public void setSpecialFieldCode(String specialFieldCode) {
		this.specialFieldCode = specialFieldCode;
	}

	/**
	 * @return the provinceCode
	 */
	public String getProvinceCode() {
		return provinceCode == null ? "" : provinceCode.trim();
	}

	/**
	 * @param provinceCode
	 *            the provinceCode to set
	 */
	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	/**
	 * @return the cityCode
	 */
	public String getCityCode() {
		return cityCode == null ? "" : cityCode.trim();
	}

	/**
	 * @param cityCode
	 *            the cityCode to set
	 */
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	/**
	 * @return the areaCode
	 */
	public String getAreaCode() {
		return areaCode == null ? "" : areaCode.trim();
	}

	/**
	 * @param areaCode
	 *            the areaCode to set
	 */
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	/**
	 * @return the descp
	 */
	public String getDescp() {
		return descp == null ? "" : descp.trim();
	}

	/**
	 * @param descp
	 *            the descp to set
	 */
	public void setDescp(String descp) {
		this.descp = descp;
	}

	/**
	 * @return the certStatus
	 */
	public String getCertStatus() {
		return certStatus == null ? "" : certStatus.trim();
	}

	/**
	 * @param certStatus
	 *            the certStatus to set
	 */
	public void setCertStatus(String certStatus) {
		this.certStatus = certStatus;
	}

	/**
	 * @return the submitDate
	 */
	public Date getSubmitDate() {
		return submitDate;
	}

	/**
	 * @param submitDate
	 *            the submitDate to set
	 */
	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}

	/**
	 * @return the lastEditDate
	 */
	public Date getLastEditDate() {
		return lastEditDate;
	}

	/**
	 * @param lastEditDate
	 *            the lastEditDate to set
	 */
	public void setLastEditDate(Date lastEditDate) {
		this.lastEditDate = lastEditDate;
	}

	/**
	 * @return the contact
	 */
	public String getContact() {
		return contact == null ? "" : contact.trim();
	}

	/**
	 * @param contact
	 *            the contact to set
	 */
	public void setContact(String contact) {
		this.contact = contact;
	}

	/**
	 * @return the telephone
	 */
	public String getTelephone() {
		return telephone == null ? "" : telephone.trim();
	}

	/**
	 * @param telephone
	 *            the telephone to set
	 */
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	/**
	 * @return the cellPhone
	 */
	public String getCellPhone() {
		return cellPhone == null ? "" : cellPhone.trim();
	}

	/**
	 * @param cellPhone
	 *            the cellPhone to set
	 */
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email == null ? "" : email.trim();
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the fax
	 */
	public String getFax() {
		return fax == null ? "" : fax.trim();
	}

	/**
	 * @param fax
	 *            the fax to set
	 */
	public void setFax(String fax) {
		this.fax = fax;
	}

	/**
	 * @return the certTypeName
	 */
	public String getCertTypeName() {
		return certTypeName == null ? "" : certTypeName.trim();
	}

	/**
	 * @param certTypeName
	 *            the certTypeName to set
	 */
	public void setCertTypeName(String certTypeName) {
		this.certTypeName = certTypeName;
	}

	/**
	 * @return the certName
	 */
	public String getCertName() {
		return certName == null ? "" : certName.trim();
	}

	/**
	 * @param certName
	 *            the certName to set
	 */
	public void setCertName(String certName) {
		this.certName = certName;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName == null ? "" : userName.trim();
	}

	/**
	 * @param userName
	 *            the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the userRealName
	 */
	public String getUserRealName() {
		return userRealName == null ? "" : userRealName.trim();
	}

	/**
	 * @param userRealName
	 *            the userRealName to set
	 */
	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	/**
	 * @return the registerStatusName
	 */
	public String getRegisterStatusName() {
		return registerStatusName == null ? "" : registerStatusName.trim();
	}

	/**
	 * @param registerStatusName
	 *            the registerStatusName to set
	 */
	public void setRegisterStatusName(String registerStatusName) {
		this.registerStatusName = registerStatusName;
	}

	/**
	 * @return the specialFieldName
	 */
	public String getSpecialFieldName() {
		return specialFieldName == null ? "" : specialFieldName.trim();
	}

	/**
	 * @param specialFieldName
	 *            the specialFieldName to set
	 */
	public void setSpecialFieldName(String specialFieldName) {
		this.specialFieldName = specialFieldName;
	}

	/**
	 * @return the provinceName
	 */
	public String getProvinceName() {
		return provinceName == null ? "" : provinceName.trim();
	}

	/**
	 * @param provinceName
	 *            the provinceName to set
	 */
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	/**
	 * @return the cityName
	 */
	public String getCityName() {
		return cityName == null ? "" : cityName.trim();
	}

	/**
	 * @param cityName
	 *            the cityName to set
	 */
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	/**
	 * @return the areaName
	 */
	public String getAreaName() {
		return areaName == null ? "" : areaName.trim();
	}

	/**
	 * @param areaName
	 *            the areaName to set
	 */
	public void setAreaName(String areaName) {
		this.areaName = areaName;
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

}
