package com.dotoyo.buildjob.peopleExcavate.vo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.OfflineSearchResultDto;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-15
 * @description
 * 
 */
public class PeopleExcavateVo implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private Long userId;// 用户Id
	private String industryType;// 行业类型
	private String specializedType;// 专业类型
	private String competency;// 职能
	private String provinceCode;
	private String cityCode;
	private String areaCode;
	private String metier;// 专长
	private String education;
	private String workingLife;
	private String ltWorkingLife;
	private String gtWorkingLife;
	private String age;
	private String ltAge;
	private String gtAge;
	private String sex;
	private String langCapa;
	private String mastery;// 掌握程度
	private String computerGrade;
	private String isAdviser;// 是否是顾问
	private String jobNature;// 工作性质
	private Date userInfoUpdateDate;// 用户资料更新日期
	private String categoryIndex;// 星级指数
	private String jobKeyWord;// 职位关键词
	private String companyName;

	private String jobResponsibility;// 岗位职责
	private String jobRequirements;// 任职要求

	private int recruitingNumber;// 招聘人数
	private Date jobIssuetDate;// 有效期开始日期
	private Date jobExpiryDate;// 有效期结束日期

	private String orderBy;// 排序字段(用户资料更新日期)
	private String showPattern;// 查看样式
	private String excavate;
	public PeopleExcavateVo() {
	}

	public PeopleExcavateVo(OfflineSearchResultDto offlineSearchResultDto) {
		this.setAge(offlineSearchResultDto.getAge());
		this.setAreaCode(offlineSearchResultDto.getAreaCode());
		this.setCategoryIndex(offlineSearchResultDto.getCategoryIndex());
		this.setCityCode(offlineSearchResultDto.getCityCode());
		this.setCompetency(offlineSearchResultDto.getCompetencyCode());
		this.setComputerGrade(offlineSearchResultDto.getComputerGradeCode());
		this.setEducation(offlineSearchResultDto.getEducationCode());
		this.setIndustryType(offlineSearchResultDto.getIndustryTypeCode());
		this.setIsAdviser(offlineSearchResultDto.getIsAdviser());
		this.setJobExpiryDate(offlineSearchResultDto.getJobExpiryDate());
		this.setJobIssuetDate(offlineSearchResultDto.getJobIssuetDate());
		this.setJobKeyWord(offlineSearchResultDto.getJobKeyWord());
		this.setJobNature(offlineSearchResultDto.getJobNatureCode());
		this.setJobRequirements(offlineSearchResultDto.getJobRequirements());
		this.setJobResponsibility(offlineSearchResultDto.getJobResponsibility());
		this.setLangCapa(offlineSearchResultDto.getLangCapaCode());
		this.setMastery(offlineSearchResultDto.getMasteryCode());
		this.setMetier(offlineSearchResultDto.getMetier());
		this.setProvinceCode(offlineSearchResultDto.getProvinceCode());
		this.setRecruitingNumber(offlineSearchResultDto.getRecruitingNumber());
		this.setSex(offlineSearchResultDto.getSex());
		this.setSpecializedType(offlineSearchResultDto.getSpecializedTypeCode());
		this.setWorkingLife(offlineSearchResultDto.getWorkingLifeCode());
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

	public String getCompetency() {
		return competency == null ? "" : competency.trim();
	}

	public void setCompetency(String competency) {
		this.competency = competency;
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

	public Date getUserInfoUpdateDate() {
		return userInfoUpdateDate;
	}

	public void setUserInfoUpdateDate(Date userInfoUpdateDate) {
		this.userInfoUpdateDate = userInfoUpdateDate;
	}

	public String getCategoryIndex() {
		return categoryIndex == null ? "" : categoryIndex.trim();
	}

	public void setCategoryIndex(String categoryIndex) {
		this.categoryIndex = categoryIndex;
	}

	public String getJobKeyWord() {
		return jobKeyWord == null ? "" : jobKeyWord.trim();
	}

	public void setJobKeyWord(String jobKeyWord) {
		this.jobKeyWord = jobKeyWord.trim().equals(
				ApplicationConstant.ENTER_KEYWORDS) ? "" : jobKeyWord;
	}

	public String getJobResponsibility() {
		return jobResponsibility == null ? "" : jobResponsibility.trim();
	}

	public void setJobResponsibility(String jobResponsibility) {
		this.jobResponsibility = jobResponsibility;
	}

	public String getJobRequirements() {
		return jobRequirements == null ? "" : jobRequirements.trim();
	}

	public void setJobRequirements(String jobRequirements) {
		this.jobRequirements = jobRequirements;
	}

	public int getRecruitingNumber() {
		return recruitingNumber;
	}

	public void setRecruitingNumber(int recruitingNumber) {
		this.recruitingNumber = recruitingNumber;
	}

	/**
	 * @return the jobIssuetDate
	 */
	public Date getJobIssuetDate() {
		return jobIssuetDate;
	}

	/**
	 * @param jobIssuetDate
	 *            the jobIssuetDate to set
	 */
	public void setJobIssuetDate(Date jobIssuetDate) {
		this.jobIssuetDate = jobIssuetDate;
	}

	public Date getJobExpiryDate() {
		return jobExpiryDate;
	}

	public void setJobExpiryDate(Date jobExpiryDate) {
		this.jobExpiryDate = jobExpiryDate;
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

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getOrderBy() {
		return orderBy == null ? "" : orderBy.trim();
	}

	public void setShowPattern(String showPattern) {
		this.showPattern = showPattern;
	}

	public String getShowPattern() {
		return showPattern == null ? "" : showPattern.trim();
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyName() {
		return companyName;
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

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setExcavate(String excavate) {
		this.excavate = excavate;
	}

	public String getExcavate() {
		return excavate;
	}

	

}
