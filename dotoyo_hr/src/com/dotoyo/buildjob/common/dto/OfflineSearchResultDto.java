package com.dotoyo.buildjob.common.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.peopleExcavate.vo.PeopleExcavateVo;

/**
 *
 * @author arthas.zou
 * @dateCreated 2011-3-2
 * @description
 */
public class OfflineSearchResultDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -5620478145261160450L;
	private Long id;
	private Long userId;
	private String userName;
	private String userRealName;
	private String industryTypeCode;
	private String industryTypeName;
	private String specializedTypeCode;
	private String specializedTypeName;
	private String competencyCode;
	private String competencyName;
	private String provinceCode;
	private String provinceName;
	private String cityCode;
	private String cityName;
	private String areaCode;
	private String areaName;
	private String metier;
	private String educationCode;
	private String educationName;
	private String workingLifeCode;
	private String workingLifeName;
	private String age;
	private String sex;
	private String langCapaCode;
	private String langCapaName;
	private String masteryCode;
	private String masteryName;
	private String computerGradeCode;
	private String computerGradeName;
	private String isAdviser;
	private String jobNatureCode;
	private String jobNatureName;
	private int userInfoUpdateDate;
	private String categoryIndex;
	private String jobKeyWord;
	private int recruitingNumber;
	private Date jobIssuetDate;
	private Date jobExpiryDate;
	private String jobResponsibility;
	private String jobRequirements;

	public OfflineSearchResultDto() {

	}

	public OfflineSearchResultDto(PeopleExcavateVo peopleExcavateVo) {
		this.setAge(peopleExcavateVo.getAge());
		this.setAreaCode(peopleExcavateVo.getAreaCode());
		this.setCategoryIndex(peopleExcavateVo.getCategoryIndex());
		this.setCityCode(peopleExcavateVo.getCityCode());
		this.setCompetencyCode(peopleExcavateVo.getCompetency());
		this.setComputerGradeCode(peopleExcavateVo.getComputerGrade());
		this.setEducationCode(peopleExcavateVo.getEducation());
		this.setIndustryTypeCode(peopleExcavateVo.getIndustryType());
		this.setIsAdviser(peopleExcavateVo.getIsAdviser());
		this.setJobExpiryDate(peopleExcavateVo.getJobExpiryDate());
		this.setJobIssuetDate(peopleExcavateVo.getJobIssuetDate());
		this.setJobKeyWord(peopleExcavateVo.getJobKeyWord());
		this.setJobNatureCode(peopleExcavateVo.getJobNature());
		this.setJobRequirements(peopleExcavateVo.getJobRequirements());
		this.setJobResponsibility(peopleExcavateVo.getJobResponsibility());
		this.setLangCapaCode(peopleExcavateVo.getLangCapa());
		this.setMasteryCode(peopleExcavateVo.getMastery());
		this.setMetier(peopleExcavateVo.getMetier());
		this.setProvinceCode(peopleExcavateVo.getProvinceCode());
		this.setRecruitingNumber(peopleExcavateVo.getRecruitingNumber());
		this.setSex(peopleExcavateVo.getSex());
		this.setSpecializedTypeCode(peopleExcavateVo.getSpecializedType());
		this.setWorkingLifeCode(peopleExcavateVo.getWorkingLife());
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
	 * @return the industryTypeCode
	 */
	public String getIndustryTypeCode() {
		return industryTypeCode == null ? "" : industryTypeCode.trim();
	}

	/**
	 * @param industryTypeCode
	 *            the industryTypeCode to set
	 */
	public void setIndustryTypeCode(String industryTypeCode) {
		this.industryTypeCode = industryTypeCode;
	}

	/**
	 * @return the industryTypeName
	 */
	public String getIndustryTypeName() {
		return industryTypeName == null ? "" : industryTypeName.trim();
	}

	/**
	 * @param industryTypeName
	 *            the industryTypeName to set
	 */
	public void setIndustryTypeName(String industryTypeName) {
		this.industryTypeName = industryTypeName;
	}

	/**
	 * @return the specializedTypeCode
	 */
	public String getSpecializedTypeCode() {
		return specializedTypeCode == null ? "" : specializedTypeCode.trim();
	}

	/**
	 * @param specializedTypeCode
	 *            the specializedTypeCode to set
	 */
	public void setSpecializedTypeCode(String specializedTypeCode) {
		this.specializedTypeCode = specializedTypeCode;
	}

	/**
	 * @return the specializedTypeName
	 */
	public String getSpecializedTypeName() {
		return specializedTypeName == null ? "" : specializedTypeName.trim();
	}

	/**
	 * @param specializedTypeName
	 *            the specializedTypeName to set
	 */
	public void setSpecializedTypeName(String specializedTypeName) {
		this.specializedTypeName = specializedTypeName;
	}

	/**
	 * @return the competencyCode
	 */
	public String getCompetencyCode() {
		return competencyCode == null ? "" : competencyCode.trim();
	}

	/**
	 * @param competencyCode
	 *            the competencyCode to set
	 */
	public void setCompetencyCode(String competencyCode) {
		this.competencyCode = competencyCode;
	}

	/**
	 * @return the competencyName
	 */
	public String getCompetencyName() {
		return competencyName == null ? "" : competencyName.trim();
	}

	/**
	 * @param competencyName
	 *            the competencyName to set
	 */
	public void setCompetencyName(String competencyName) {
		this.competencyName = competencyName;
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
	 * @return the metier
	 */
	public String getMetier() {
		return metier == null ? "" : metier.trim();
	}

	/**
	 * @param metier
	 *            the metier to set
	 */
	public void setMetier(String metier) {
		this.metier = metier;
	}

	/**
	 * @return the educationCode
	 */
	public String getEducationCode() {
		return educationCode == null ? "" : educationCode.trim();
	}

	/**
	 * @param educationCode
	 *            the educationCode to set
	 */
	public void setEducationCode(String educationCode) {
		this.educationCode = educationCode;
	}

	/**
	 * @return the educationName
	 */
	public String getEducationName() {
		return educationName == null ? "" : educationName.trim();
	}

	/**
	 * @param educationName
	 *            the educationName to set
	 */
	public void setEducationName(String educationName) {
		this.educationName = educationName;
	}

	/**
	 * @return the workingLifeCode
	 */
	public String getWorkingLifeCode() {
		return workingLifeCode == null ? "" : workingLifeCode.trim();
	}

	/**
	 * @param workingLifeCode
	 *            the workingLifeCode to set
	 */
	public void setWorkingLifeCode(String workingLifeCode) {
		this.workingLifeCode = workingLifeCode;
	}

	/**
	 * @return the workingLifeName
	 */
	public String getWorkingLifeName() {
		return workingLifeName == null ? "" : workingLifeName.trim();
	}

	/**
	 * @param workingLifeName
	 *            the workingLifeName to set
	 */
	public void setWorkingLifeName(String workingLifeName) {
		this.workingLifeName = workingLifeName;
	}

	/**
	 * @return the age
	 */
	public String getAge() {
		return age;
	}

	/**
	 * @param age
	 *            the age to set
	 */
	public void setAge(String age) {
		this.age = age;
	}

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex == null ? "" : sex.trim();
	}

	/**
	 * @param sex
	 *            the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * @return the langCapaCode
	 */
	public String getLangCapaCode() {
		return langCapaCode == null ? "" : langCapaCode.trim();
	}

	/**
	 * @param langCapaCode
	 *            the langCapaCode to set
	 */
	public void setLangCapaCode(String langCapaCode) {
		this.langCapaCode = langCapaCode;
	}

	/**
	 * @return the langCapaName
	 */
	public String getLangCapaName() {
		return langCapaName == null ? "" : langCapaName.trim();
	}

	/**
	 * @param langCapaName
	 *            the langCapaName to set
	 */
	public void setLangCapaName(String langCapaName) {
		this.langCapaName = langCapaName;
	}

	/**
	 * @return the masteryCode
	 */
	public String getMasteryCode() {
		return masteryCode == null ? "" : masteryCode.trim();
	}

	/**
	 * @param masteryCode
	 *            the masteryCode to set
	 */
	public void setMasteryCode(String masteryCode) {
		this.masteryCode = masteryCode;
	}

	/**
	 * @return the masteryName
	 */
	public String getMasteryName() {
		return masteryName == null ? "" : masteryName.trim();
	}

	/**
	 * @param masteryName
	 *            the masteryName to set
	 */
	public void setMasteryName(String masteryName) {
		this.masteryName = masteryName;
	}

	/**
	 * @return the computerGradeCode
	 */
	public String getComputerGradeCode() {
		return computerGradeCode == null ? "" : computerGradeCode.trim();
	}

	/**
	 * @param computerGradeCode
	 *            the computerGradeCode to set
	 */
	public void setComputerGradeCode(String computerGradeCode) {
		this.computerGradeCode = computerGradeCode;
	}

	/**
	 * @return the computerGradeName
	 */
	public String getComputerGradeName() {
		return computerGradeName == null ? "" : computerGradeName.trim();
	}

	/**
	 * @param computerGradeName
	 *            the computerGradeName to set
	 */
	public void setComputerGradeName(String computerGradeName) {
		this.computerGradeName = computerGradeName;
	}

	/**
	 * @return the isAdviser
	 */
	public String getIsAdviser() {
		return isAdviser == null ? "" : isAdviser.trim();
	}

	/**
	 * @param isAdviser
	 *            the isAdviser to set
	 */
	public void setIsAdviser(String isAdviser) {
		this.isAdviser = isAdviser;
	}

	/**
	 * @return the jobNatureCode
	 */
	public String getJobNatureCode() {
		return jobNatureCode == null ? "" : jobNatureCode.trim();
	}

	/**
	 * @param jobNatureCode
	 *            the jobNatureCode to set
	 */
	public void setJobNatureCode(String jobNatureCode) {
		this.jobNatureCode = jobNatureCode;
	}

	/**
	 * @return the jobNatureName
	 */
	public String getJobNatureName() {
		return jobNatureName == null ? "" : jobNatureName.trim();
	}

	/**
	 * @param jobNatureName
	 *            the jobNatureName to set
	 */
	public void setJobNatureName(String jobNatureName) {
		this.jobNatureName = jobNatureName;
	}


	/**
	 * @return the categoryIndex
	 */
	public String getCategoryIndex() {
		return categoryIndex == null ? "" : categoryIndex.trim();
	}

	/**
	 * @param categoryIndex
	 *            the categoryIndex to set
	 */
	public void setCategoryIndex(String categoryIndex) {
		this.categoryIndex = categoryIndex;
	}

	/**
	 * @return the jobKeyWord
	 */
	public String getJobKeyWord() {
		return jobKeyWord == null ? "" : jobKeyWord.trim();
	}

	/**
	 * @param jobKeyWord
	 *            the jobKeyWord to set
	 */
	public void setJobKeyWord(String jobKeyWord) {
		this.jobKeyWord = jobKeyWord;
	}

	/**
	 * @return the recruitingNumber
	 */
	public int getRecruitingNumber() {
		return recruitingNumber;
	}

	/**
	 * @param recruitingNumber
	 *            the recruitingNumber to set
	 */
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

	/**
	 * @return the jobExpiryDate
	 */
	public Date getJobExpiryDate() {
		return jobExpiryDate;
	}

	/**
	 * @param jobExpiryDate
	 *            the jobExpiryDate to set
	 */
	public void setJobExpiryDate(Date jobExpiryDate) {
		this.jobExpiryDate = jobExpiryDate;
	}

	/**
	 * @return the jobResponsibility
	 */
	public String getJobResponsibility() {
		return jobResponsibility == null ? "" : jobResponsibility.trim();
	}

	/**
	 * @param jobResponsibility
	 *            the jobResponsibility to set
	 */
	public void setJobResponsibility(String jobResponsibility) {
		this.jobResponsibility = jobResponsibility;
	}

	/**
	 * @return the jobRequirements
	 */
	public String getJobRequirements() {
		return jobRequirements == null ? "" : jobRequirements.trim();
	}

	/**
	 * @param jobRequirements
	 *            the jobRequirements to set
	 */
	public void setJobRequirements(String jobRequirements) {
		this.jobRequirements = jobRequirements;
	}
	
	public int getUserInfoUpdateDate() {
		return userInfoUpdateDate;
	}

	public void setUserInfoUpdateDate(int userInfoUpdateDate) {
		this.userInfoUpdateDate = userInfoUpdateDate;
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
