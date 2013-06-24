package com.dotoyo.buildjob.certificateCenter.vo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 *
 * @author arthas.zou
 * @dateCreated Dec 13, 2010
 * @description
 */
public class CollectCertVo implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -3981300699530680431L;
	private Long id;
	private Long personalCertID;// 个人证书ID
	private Long certID;// 证书ID
	private Long userID;// 用户ID
	private String registerStatus;// 证书注册状况（初始注册\未注册等）
	private String specialField;// 专业
	private String province;// 省份
	private String city;// 城市
	private String areas;// 区域
	private String descp;// 补充说明
	private String certStatus;// 个人证书状态（已挂靠、未挂靠）
	private Date submitDate;// 发布日期
	private Date lastEditDate;// 最后修改日期
	private String contact;// 联系人
	private String telephone;// 联系电话
	private String cellPhone;// 手机号码
	private String email;// 电子邮件
	private String fax;// 传真
	private Long collectorID;// 搜藏者ID
	private Date collectDate;// 搜藏日期

	public CollectCertVo() {

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
	 * @return the personalCertID
	 */
	public Long getPersonalCertID() {
		return personalCertID;
	}

	/**
	 * @param personalCertID
	 *            the personalCertID to set
	 */
	public void setPersonalCertID(Long personalCertID) {
		this.personalCertID = personalCertID;
	}

	/**
	 * @return the certID
	 */
	public Long getCertID() {
		return certID;
	}

	/**
	 * @param certID
	 *            the certID to set
	 */
	public void setCertID(Long certID) {
		this.certID = certID;
	}

	/**
	 * @return the userID
	 */
	public Long getUserID() {
		return userID;
	}

	/**
	 * @param userID
	 *            the userID to set
	 */
	public void setUserID(Long userID) {
		this.userID = userID;
	}

	/**
	 * @return the registerStatus
	 */
	public String getRegisterStatus() {
		return registerStatus == null ? "" : registerStatus.trim();
	}

	/**
	 * @param registerStatus
	 *            the registerStatus to set
	 */
	public void setRegisterStatus(String registerStatus) {
		this.registerStatus = registerStatus;
	}

	/**
	 * @return the specialField
	 */
	public String getSpecialField() {
		return specialField == null ? "" : specialField.trim();
	}

	/**
	 * @param specialField
	 *            the specialField to set
	 */
	public void setSpecialField(String specialField) {
		this.specialField = specialField;
	}

	/**
	 * @return the province
	 */
	public String getProvince() {
		return province == null ? "" : province.trim();
	}

	/**
	 * @param province
	 *            the province to set
	 */
	public void setProvince(String province) {
		this.province = province;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city == null ? "" : city.trim();
	}

	/**
	 * @param city
	 *            the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the areas
	 */
	public String getAreas() {
		return areas == null ? "" : areas.trim();
	}

	/**
	 * @param areas
	 *            the areas to set
	 */
	public void setAreas(String areas) {
		this.areas = areas;
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
	 * @return the collectorID
	 */
	public Long getCollectorID() {
		return collectorID;
	}

	/**
	 * @param collectorID
	 *            the collectorID to set
	 */
	public void setCollectorID(Long collectorID) {
		this.collectorID = collectorID;
	}

	/**
	 * @return the collectDate
	 */
	public Date getCollectDate() {
		return collectDate;
	}

	/**
	 * @param collectDate
	 *            the collectDate to set
	 */
	public void setCollectDate(Date collectDate) {
		this.collectDate = collectDate;
	}

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
