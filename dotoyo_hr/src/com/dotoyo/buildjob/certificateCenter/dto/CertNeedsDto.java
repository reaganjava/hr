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
public class CertNeedsDto implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 1710187452719053215L;
	private Long id;// 证书需求ID
	private String certTypeCode;// 证书类型编码
	private String certTypeName;// 证书类型名称
	private String certCode;// 证书编码
	private String certName;// 证书名称
	private Long userId;// 用户ID
	private String userName;// 用户帐号
	private String userRealName;// 用户名称
	private String registerStatusCode;// 证书注册状况（未注册、初始注册等）
	private String registerStatusName;// 证书注册状况名称
	private String specialFieldCode;// 专业
	private String specialFieldName;// 专业名称
	private String provinceCode;// 省份
	private String provinceName;// 省份名称
	private String cityCode;// 城市
	private String cityName;// 城市名称
	private String areaCode;// 区域
	private String areaName;// 区域名称
	private int certNeedsAmount;// 证书需求数量
	private Date effDate;// 生效日期
	private Date expDate;// 失效日期
	private String descp;// 其他要求
	private String contact;// 联系人
	private String telephone;// 联系电话
	private String cellPhone;// 手机号码
	private String email;// 电子邮件
	private String fax;// 传真
	private String isIndeed;// 是否急需证书
	private Date submitDate;// 发布日期
	private Date lastEditDate;// 最近修改日期
	private String certNeedsStatus;// 证书需求信息挂靠情况（已猎证、未猎证、暂停猎证）
	private String companySizeCode;// 单位规模编码
	private String companySizeName;// 单位规模名称
	private String remainsDays;// 剩余天数

	public CertNeedsDto() {
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
	 * @return the certNeedsAmount
	 */
	public int getCertNeedsAmount() {
		return certNeedsAmount;
	}

	/**
	 * @param certNeedsAmount
	 *            the certNeedsAmount to set
	 */
	public void setCertNeedsAmount(int certNeedsAmount) {
		this.certNeedsAmount = certNeedsAmount;
	}

	/**
	 * @return the effDate
	 */
	public Date getEffDate() {
		return effDate;
	}

	/**
	 * @param effDate
	 *            the effDate to set
	 */
	public void setEffDate(Date effDate) {
		this.effDate = effDate;
	}

	/**
	 * @return the expDate
	 */
	public Date getExpDate() {
		return expDate;
	}

	/**
	 * @param expDate
	 *            the expDate to set
	 */
	public void setExpDate(Date expDate) {
		this.expDate = expDate;
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
	 * @return the isIndeed
	 */
	public String getIsIndeed() {
		return isIndeed == null ? "" : isIndeed.trim();
	}

	/**
	 * @param isIndeed
	 *            the isIndeed to set
	 */
	public void setIsIndeed(String isIndeed) {
		this.isIndeed = isIndeed;
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
	 * @return the certNeedsStatus
	 */
	public String getCertNeedsStatus() {
		return certNeedsStatus == null ? "" : certNeedsStatus.trim();
	}

	/**
	 * @param certNeedsStatus
	 *            the certNeedsStatus to set
	 */
	public void setCertNeedsStatus(String certNeedsStatus) {
		this.certNeedsStatus = certNeedsStatus;
	}

	/**
	 * @return the companySizeCode
	 */
	public String getCompanySizeCode() {
		return companySizeCode == null ? "" : companySizeCode.trim();
	}

	/**
	 * @param companySizeCode
	 *            the companySizeCode to set
	 */
	public void setCompanySizeCode(String companySizeCode) {
		this.companySizeCode = companySizeCode;
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

	/**
	 * @return the companySizeName
	 */
	public String getCompanySizeName() {
		return companySizeName == null ? "" : companySizeName.trim();
	}

	/**
	 * @param companySizeName
	 *            the companySizeName to set
	 */
	public void setCompanySizeName(String companySizeName) {
		this.companySizeName = companySizeName;
	}

	/**
	 * @return the remainsDays
	 */
	public String getRemainsDays() {
		return remainsDays == null ? "" : remainsDays.trim();
	}

	/**
	 * @param remainsDays
	 *            the remainsDays to set
	 */
	public void setRemainsDays(String remainsDays) {
		this.remainsDays = remainsDays;
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
