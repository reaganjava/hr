package com.dotoyo.buildjob.certificateCenter.vo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsDto;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.AreaDto;
import com.dotoyo.buildjob.common.dto.CityDto;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2010-12-3
 * @description
 */
public class CertNeedsVo implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -6508218874591962922L;
	private Long id;// 证书需求ID
	private ClassMasterDto certType;// 证书类型
	private ClassMasterDto cert;// 证书信息
	private Long userId;// 用户ID
	private ClassMasterDto registerStatus;// 注册状况
	private ClassMasterDto specialField;// 专业
	private ProvinceDto province;// 省份
	private CityDto city;// 城市
	private AreaDto area;// 区域
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
	private String certNeedsStatus;// 证书需求信息挂靠情况（已猎证、未猎证）
	private ClassMasterDto companySize;// 单位规模
	private String remainsDays;// 剩余天数

	public CertNeedsVo() {

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
	 * @return the certType
	 */
	public ClassMasterDto getCertType() {
		if (this.certType == null)
			this.setCertType(new ClassMasterDto());
		return certType;
	}

	/**
	 * @param certType
	 *            the certType to set
	 */
	public void setCertType(ClassMasterDto certType) {
		this.certType = certType;
	}

	/**
	 * @return the cert
	 */
	public ClassMasterDto getCert() {
		if (this.cert == null)
			this.setCert(new ClassMasterDto());
		return cert;
	}

	/**
	 * @param cert
	 *            the cert to set
	 */
	public void setCert(ClassMasterDto cert) {
		this.cert = cert;
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
	 * @return the registerStatus
	 */
	public ClassMasterDto getRegisterStatus() {
		if (this.registerStatus == null)
			this.setRegisterStatus(new ClassMasterDto());
		return registerStatus;
	}

	/**
	 * @param registerStatus
	 *            the registerStatus to set
	 */
	public void setRegisterStatus(ClassMasterDto registerStatus) {
		this.registerStatus = registerStatus;
	}

	/**
	 * @return the specialField
	 */
	public ClassMasterDto getSpecialField() {
		if (this.specialField == null)
			this.setSpecialField(new ClassMasterDto());
		return specialField;
	}

	/**
	 * @param specialField
	 *            the specialField to set
	 */
	public void setSpecialField(ClassMasterDto specialField) {
		this.specialField = specialField;
	}

	/**
	 * @return the province
	 */
	public ProvinceDto getProvince() {
		if (this.province == null)
			this.setProvince(new ProvinceDto());
		return province;
	}

	/**
	 * @param province
	 *            the province to set
	 */
	public void setProvince(ProvinceDto province) {
		this.province = province;
	}

	/**
	 * @return the city
	 */
	public CityDto getCity() {
		if (this.city == null)
			this.setCity(new CityDto());
		return city;
	}

	/**
	 * @param city
	 *            the city to set
	 */
	public void setCity(CityDto city) {
		this.city = city;
	}

	/**
	 * @return the area
	 */
	public AreaDto getArea() {
		if (this.area == null)
			this.setArea(new AreaDto());
		return area;
	}

	/**
	 * @param area
	 *            the area to set
	 */
	public void setArea(AreaDto area) {
		this.area = area;
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
	 * @return the companySize
	 */
	public ClassMasterDto getCompanySize() {
		if (this.companySize == null)
			this.setCompanySize(new ClassMasterDto());
		return companySize;
	}

	/**
	 * @param companySize
	 *            the companySize to set
	 */
	public void setCompanySize(ClassMasterDto companySize) {
		this.companySize = companySize;
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

	public CertNeedsDto convertToDto() {
		CertNeedsDto resultDto = new CertNeedsDto();
		if (this.getArea() != null)
			resultDto.setAreaCode(this.getArea().getCode());
		resultDto.setCellPhone(this.getCellPhone());
		resultDto.setCertCode(this.getCert().getCode());
		resultDto.setCertNeedsAmount(this.getCertNeedsAmount());
		resultDto.setCertNeedsStatus(this.getCertNeedsStatus());
		resultDto.setCertTypeCode(this.getCertType().getCode());
		resultDto.setCityCode(this.getCity().getCode());
		resultDto.setCompanySizeCode(this.getCompanySize().getCode());
		resultDto.setContact(this.getContact());
		resultDto.setDescp(this.getDescp());
		resultDto.setEffDate(this.getEffDate());
		resultDto.setEmail(this.getEmail());
		resultDto.setExpDate(this.getExpDate());
		resultDto.setFax(this.getFax());
		resultDto.setId(this.getId());
		resultDto.setIsIndeed(this.getIsIndeed());
		resultDto.setLastEditDate(this.getLastEditDate());
		resultDto.setProvinceCode(this.getProvince().getCode());
		resultDto.setRegisterStatusCode(this.getRegisterStatus().getCode());
		resultDto.setSpecialFieldCode(this.getSpecialField().getCode());
		resultDto.setSubmitDate(this.getSubmitDate());
		resultDto.setTelephone(this.getTelephone());
		resultDto.setUserId(this.getUserId());
		return resultDto;
	}

}
