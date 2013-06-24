package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
/**
 * 重写User
 * @author wisdy.xiao
 *
 */
public class SysUserDto implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private Long roleid;   //当前角色ID
	private String rolenames;//所有角色名称,
	private Long id;
	protected String userName;// email
	protected String password;
	protected Long point;
	protected String status;
	protected Date registerDate;
	protected Date lastLoginDate;

	protected String expectedPosition;// 期望职位
	protected String userType; // 用户类型，表示是企业用户还是个人用户

	protected Long userId;

	protected String companyName;
	protected String categoryIndex;// 星级指数
	protected String competency;
	protected String competencyName;

	protected String jobName;// 职位名称
	protected String industryType;// 行业类型
	protected String industryName;

	protected String specializedType;// 专业类型
	protected String specializedName;

	protected String metier;// 专长
	protected Date userInfoUpdateDate;// 用户资料最后更新时间
	protected String provinceCode;
	protected String cityCode;
	protected String areaCode;
	protected String education;
	protected String workingLife;
	private String ltWorkingLife;
	private String gtWorkingLife;
	protected String age;
	private String ltAge;
	private String gtAge;
	protected String sex;
	protected String langCapa;
	protected String mastery;// 掌握程度
	protected String computerGrade;
	protected String isAdviser;
	protected String jobNature;

	protected String havePublished; // 已发布职位

	protected String verifyStatus; // 审核状态（0：待审核，1：正在审核，2：审核通过，3：审核失败）
	protected String interviewStatus;// 面试情况（0：未面试，1：面试通过，2：面试失败）
	protected String recommendationType; // 类型（线上申请、管理员手工录入）
	protected Date lastEditDate; // 线下人才库 信息最后更改时间
	protected String servicesHavePurchased;// 用户已购买服务串。




	public Long getPoint() {
		return point;
	}

	public void setPoint(Long point) {
		this.point = point;
	}



	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}


	public String getJobName() {
		return jobName == null ? "" : jobName.trim();
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getIndustryType() {
		return industryType == null ? "" : industryType.trim();
	}

	public void setIndustryType(String industryType) {
		this.industryType = industryType;
	}

	public String getSpecializedType() {
		return specializedType == null ? "" : specializedType.trim();
	}

	public void setSpecializedType(String specializedType) {
		this.specializedType = specializedType;
	}

	public Date getUserInfoUpdateDate() {
		return userInfoUpdateDate;
	}

	public void setUserInfoUpdateDate(Date userInfoUpdateDate) {
		this.userInfoUpdateDate = userInfoUpdateDate;
	}

	public String getProvinceCode() {
		return provinceCode == null ? "" : provinceCode.trim();
	}

	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	public String getCityCode() {
		return cityCode == null ? "" : cityCode.trim();
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getAreaCode() {
		return areaCode == null ? "" : areaCode.trim();
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getEducation() {
		return education == null ? "" : education.trim();
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getWorkingLife() {
		return workingLife == null ? "" : workingLife.trim();
	}

	public void setWorkingLife(String workingLife) {
		this.workingLife = workingLife;
	}

	public String getAge() {
		return age == null ? "" : age.trim();
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getSex() {
		return sex == null ? "" : sex.trim();
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getLangCapa() {
		return langCapa == null ? "" : langCapa.trim();
	}

	public void setLangCapa(String langCapa) {
		this.langCapa = langCapa;
	}

	public String getMastery() {
		return mastery == null ? "" : mastery.trim();
	}

	public void setMastery(String mastery) {
		this.mastery = mastery;
	}

	public String getComputerGrade() {
		return computerGrade == null ? "" : computerGrade.trim();
	}

	public void setComputerGrade(String computerGrade) {
		this.computerGrade = computerGrade;
	}

	public String getIsAdviser() {
		return isAdviser == null ? "" : isAdviser.trim();
	}

	public void setIsAdviser(String isAdviser) {
		this.isAdviser = isAdviser;
	}

	public String getJobNature() {
		return jobNature == null ? "" : jobNature.trim();
	}

	public void setJobNature(String jobNature) {
		this.jobNature = jobNature;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName == null ? "" : userName.trim();
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password == null ? "" : password.trim();
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCompanyName() {
		return companyName == null ? "" : companyName.trim();
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCategoryIndex() {
		return categoryIndex == null ? "" : categoryIndex.trim();
	}

	public void setCategoryIndex(String categoryIndex) {
		this.categoryIndex = categoryIndex;
	}

	public String getCompetency() {
		return competency == null ? "" : competency.trim();
	}

	public void setCompetency(String competency) {
		this.competency = competency;
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

	public void setMetier(String metier) {
		this.metier = metier;
	}

	public String getMetier() {
		return metier == null ? "" : metier.trim();
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setCompetencyName(String competencyName) {
		this.competencyName = competencyName;
	}

	public String getCompetencyName() {
		return competencyName == null ? "" : competencyName.trim();
	}

	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}

	public String getIndustryName() {
		return industryName == null ? "" : industryName.trim();
	}

	public void setSpecializedName(String specializedName) {
		this.specializedName = specializedName;
	}

	public String getSpecializedName() {
		return specializedName == null ? "" : specializedName.trim();
	}

	public void setHavePublished(String havePublished) {
		this.havePublished = havePublished;
	}

	public String getHavePublished() {
		return havePublished == null ? "" : havePublished.trim();
	}

	public void setExpectedPosition(String expectedPosition) {
		this.expectedPosition = expectedPosition;
	}

	public String getExpectedPosition() {
		return expectedPosition == null ? "" : expectedPosition.trim();
	}

	public void setVerifyStatus(String verifyStatus) {
		this.verifyStatus = verifyStatus;
	}

	public String getVerifyStatus() {
		return verifyStatus == null ? "" : verifyStatus.trim();
	}

	public void setRecommendationType(String recommendationType) {
		this.recommendationType = recommendationType;
	}

	public String getRecommendationType() {
		return recommendationType == null ? "" : recommendationType.trim();
	}

	public void setLastEditDate(Date lastEditDate) {
		this.lastEditDate = lastEditDate;
	}

	public Date getLastEditDate() {
		return lastEditDate;
	}

	public void setServicesHavePurchased(String servicesHavePurchased) {
		this.servicesHavePurchased = servicesHavePurchased;
	}

	public String getServicesHavePurchased() {
		return servicesHavePurchased;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status == null ? "" : status.trim();
	}

	public String getInterviewStatus() {
		return interviewStatus;
	}

	public void setInterviewStatus(String interviewStatus) {
		this.interviewStatus = interviewStatus;
	}

	public void setLtWorkingLife(String ltWorkingLife) {
		this.ltWorkingLife = ltWorkingLife;
	}

	public String getLtWorkingLife() {
		return ltWorkingLife;
	}

	public void setGtWorkingLife(String gtWorkingLife) {
		this.gtWorkingLife = gtWorkingLife;
	}

	public String getGtWorkingLife() {
		return gtWorkingLife;
	}

	public void setLtAge(String ltAge) {
		this.ltAge = ltAge;
	}

	public String getLtAge() {
		return ltAge;
	}

	public void setGtAge(String gtAge) {
		this.gtAge = gtAge;
	}

	public String getGtAge() {
		return gtAge;
	}

	public Long getRoleid() {
		return roleid;
	}

	public void setRoleid(Long roleid) {
		this.roleid = roleid;
	}

	public String getRolenames() {
		return rolenames == null ? "" : rolenames.trim();
	}

	public void setRolenames(String rolenames) {
		this.rolenames = rolenames;
	}

}
