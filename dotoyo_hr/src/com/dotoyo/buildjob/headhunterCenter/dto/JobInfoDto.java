package com.dotoyo.buildjob.headhunterCenter.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-21
 * @description 职位信息值对象
 *
 */
public class JobInfoDto implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	protected Long userId;
	protected String jobName;// 职位名称

	protected String industryType;// 行业类型
	protected String industryName;// 行业类型

	protected String competency;// 职能
	protected String competencyName;// 职能

	protected String specializedType;// 专业类型
	protected String specializedName;// 专业类型

	protected String jobNature;// 工作性质
	protected String jobNatureName;// 工作性质

	protected String isAdviser;// 是否是顾问
	protected String isAdviserName;// 是否是顾问

	protected int recruitingNumber;// 招聘人数
	private int applicantsNumber;// 申请人数

	protected String provinceCode;
	protected String provinceName;

	protected String cityCode;
	protected String cityName;

	protected String areaCode;
	protected String areaName;

	protected String salary;
	private String salaryName;
	protected String age;
	private String ageName;
	protected String sex;

	protected String education;
	protected String educationName;

	protected String workingLife;
	protected String workingLifeName;

	protected String langCapa;
	private String langCapaName;
	protected String mastery;// 掌握程度
	protected String masteryName;// 掌握程度
	protected String computerGrade;
	protected String computerGradeName;
	protected String jobResponsibility;// 岗位职责
	protected String jobRequirements;// 任职要求
	protected int templateId;
	protected Date jobIssuetDate;// 发布日期
	protected Date jobEffectiveStartDate;// 有效期开始日期
	protected Date jobExpiryDate;// 有效期结束日期
	protected String status;// 职位状态: 0 已过期， 1 正常，2暂停
	protected Date lastUpdateTime; // 职位最后更新日期
	private String daysRemainingMaturity; // 剩余天到期


	private String tmpName;// 模板名称
	private String romanNum;// 罗马数字－模板后缀
	private String filterIndustryType;// 行业类型(面试者行业类型)过滤
	private String filterIndustryName;// 行业类型(面试者行业类型)过滤

	private String filterSpecializedType;// 专业类型过滤
	private String filterSpecializedName;// 专业类型过滤

	private String filterMetier;// 专长过滤
	private String filterJobNature;// 工作性质过滤
	private String filterJobNatureName;// 工作性质过滤


	private String filterltWorkingLife;// 工作年限过滤
	private String filtergtWorkingLife;// 工作年限过滤

	private String filterEducation;// 学历要求过滤
	private String filterEducationName;// 学历要求过滤

	private String filterSex;// 性别:0 女;1 男 过滤

	private String filterltAge;// 工作年限过滤
	private String filtergtAge;// 工作年限过滤

	protected String companyName;// 公司名称
	private int clicks;// 被点击次数

	public JobInfoDto() {
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getJobName() {
		return jobName  == null ? "" :  jobName.trim();
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getIndustryType() {
		return industryType  == null ? "" :  industryType.trim();
	}
	public void setIndustryType(String industryType) {
		this.industryType = industryType;
	}
	public String getCompetency() {
		return competency == null ? "" : competency.trim();
	}
	public void setCompetency(String competency) {
		this.competency = competency;
	}
	public String getSpecializedType() {
		return specializedType == null ? "" : specializedType.trim();
	}
	public void setSpecializedType(String specializedType) {
		this.specializedType = specializedType;
	}
	public String getJobNature() {
		return jobNature == null ? "" : jobNature.trim();
	}
	public void setJobNature(String jobNature) {
		this.jobNature = jobNature;
	}
	public String getIsAdviser() {
		return isAdviser == null ? "" : isAdviser.trim();
	}
	public void setIsAdviser(String isAdviser) {
		this.isAdviser = isAdviser;
	}
	public String getIsAdviserName() {
		return isAdviserName == null ? "" : isAdviserName.trim();
	}
	public void setIsAdviserName(String isAdviserName) {
		this.isAdviserName = isAdviserName;
	}

	public int getRecruitingNumber() {
		return recruitingNumber;
	}
	public void setRecruitingNumber(int recruitingNumber) {
		this.recruitingNumber = recruitingNumber;
	}
	public String getSalary() {
		return salary == null ? "" : salary.trim();
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getWorkingLife() {
		return workingLife;
	}
	public void setWorkingLife(String workingLife) {
		this.workingLife = workingLife;
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
	public int getTemplateId() {
		return templateId;
	}
	public void setTemplateId(int templateId) {
		this.templateId = templateId;
	}
	public Date getJobIssuetDate() {
		return jobIssuetDate;
	}
	public void setJobIssuetDate(Date jobIssuetDate) {
		this.jobIssuetDate = jobIssuetDate;
	}
	public Date getJobEffectiveStartDate() {
		return jobEffectiveStartDate;
	}
	public void setJobEffectiveStartDate(Date jobEffectiveStartDate) {
		this.jobEffectiveStartDate = jobEffectiveStartDate;
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
    	    Logger.getLogger(this.getClass()).error(ApplicationConstant.ERROR_CONVERTING_OBJECT_TO_STRING, e);
    	}
    	    return super.toString();
    }

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSex() {
		return sex == null ? "" : sex.trim();
	}



	public String getFilterIndustryType() {
		return filterIndustryType == null ? "" : filterIndustryType.trim();
	}

	public void setFilterIndustryType(String filterIndustryType) {
		this.filterIndustryType = filterIndustryType;
	}

	public String getFilterSpecializedType() {
		return filterSpecializedType == null ? "" : filterSpecializedType.trim();
	}

	public void setFilterSpecializedType(String filterSpecializedType) {
		this.filterSpecializedType = filterSpecializedType;
	}

	public String getFilterMetier() {
		return filterMetier == null ? "" : filterMetier.trim();
	}

	public void setFilterMetier(String filterMetier) {
		this.filterMetier = filterMetier;
	}

	public String getFilterJobNature() {
		return filterJobNature == null ? "" : filterJobNature.trim();
	}

	public void setFilterJobNature(String filterJobNature) {
		this.filterJobNature = filterJobNature;
	}

	public String getFilterltWorkingLife() {
		return filterltWorkingLife == null ? "" : filterltWorkingLife.trim();
	}

	public void setFilterltWorkingLife(String filterltWorkingLife) {
		this.filterltWorkingLife = filterltWorkingLife;
	}

	public String getFiltergtWorkingLife() {
		return filtergtWorkingLife == null ? "" : filtergtWorkingLife.trim();
	}

	public void setFiltergtWorkingLife(String filtergtWorkingLife) {
		this.filtergtWorkingLife = filtergtWorkingLife;
	}

	public String getFilterEducation() {
		return filterEducation == null ? "" : filterEducation.trim();
	}

	public void setFilterEducation(String filterEducation) {
		this.filterEducation = filterEducation;
	}

	public String getFilterSex() {
		return filterSex == null ? "" : filterSex.trim();
	}

	public void setFilterSex(String filterSex) {
		this.filterSex = filterSex;
	}

	public String getFilterltAge() {
		return filterltAge == null ? "" : filterltAge.trim();
	}

	public void setFilterltAge(String filterltAge) {
		this.filterltAge = filterltAge;
	}

	public String getFiltergtAge() {
		return filtergtAge == null ? "" : filtergtAge.trim();
	}

	public void setFiltergtAge(String filtergtAge) {
		this.filtergtAge = filtergtAge;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setTmpName(String tmpName) {
		this.tmpName = tmpName;
	}

	public String getTmpName() {
		return tmpName == null ? "" : tmpName.trim();
	}

	public void setLangCapa(String langCapa) {
		this.langCapa = langCapa;
	}

	public String getLangCapa() {
		return langCapa == null ? "" : langCapa.trim();
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getAreaCode() {
		return areaCode == null ? "" : areaCode.trim();
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getCityCode() {
		return cityCode == null ? "" : cityCode.trim();
	}

	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}

	public String getProvinceCode() {
		return provinceCode == null ? "" : provinceCode.trim();
	}

	public void setRomanNum(String romanNum) {
		this.romanNum = romanNum;
	}

	public String getRomanNum() {
		return romanNum == null ? "" : romanNum.trim();
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyName() {
		return companyName == null ? "" : companyName.trim();
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status == null ? "" : status.trim();
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setDaysRemainingMaturity(String daysRemainingMaturity) {
		this.daysRemainingMaturity = daysRemainingMaturity;
	}

	public String getDaysRemainingMaturity() {
		return daysRemainingMaturity == null ? "" : daysRemainingMaturity.trim();
	}

	public String getIndustryName() {
		return industryName == null ? "" : industryName.trim();
	}

	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}

	public String getCompetencyName() {
		return competencyName == null ? "" : competencyName.trim();
	}

	public void setCompetencyName(String competencyName) {
		this.competencyName = competencyName;
	}

	public String getSpecializedName() {
		return specializedName == null ? "" : specializedName.trim();
	}

	public void setSpecializedName(String specializedName) {
		this.specializedName = specializedName;
	}

	public String getJobNatureName() {
		return jobNatureName == null ? "" : jobNatureName.trim();
	}

	public void setJobNatureName(String jobNatureName) {
		this.jobNatureName = jobNatureName;
	}

	public String getProvinceName() {
		return provinceName == null ? "" : provinceName.trim();
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getCityName() {
		return cityName == null ? "" : cityName.trim();
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getAreaName() {
		return areaName == null ? "" : areaName.trim();
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getEducationName() {
		return educationName == null ? "" : educationName.trim();
	}

	public void setEducationName(String educationName) {
		this.educationName = educationName;
	}

	public String getWorkingLifeName() {
		return workingLifeName == null ? "" : workingLifeName.trim();
	}

	public void setWorkingLifeName(String workingLifeName) {
		this.workingLifeName = workingLifeName;
	}

	public void setLangCapaName(String langCapaName) {
		this.langCapaName = langCapaName;
	}

	public String getLangCapaName() {
		return langCapaName == null ? "" : langCapaName.trim();
	}

	public void setSalaryName(String salaryName) {
		this.salaryName = salaryName;
	}

	public String getSalaryName() {
		return salaryName == null ? "" : salaryName.trim();
	}

	public void setMasteryName(String masteryName) {
		this.masteryName = masteryName;
	}

	public String getMasteryName() {
		return masteryName == null ? "" : masteryName.trim();
	}

	public void setComputerGradeName(String computerGradeName) {
		this.computerGradeName = computerGradeName;
	}

	public String getComputerGradeName() {
		return computerGradeName == null ? "" : computerGradeName.trim();
	}

	public String getFilterIndustryName() {
		return filterIndustryName == null ? "" : filterIndustryName.trim();
	}

	public void setFilterIndustryName(String filterIndustryName) {
		this.filterIndustryName = filterIndustryName;
	}

	public String getFilterSpecializedName() {
		return filterSpecializedName == null ? "" : filterSpecializedName.trim();
	}

	public void setFilterSpecializedName(String filterSpecializedName) {
		this.filterSpecializedName = filterSpecializedName;
	}

	public String getFilterJobNatureName() {
		return filterJobNatureName == null ? "" : filterJobNatureName.trim();
	}

	public void setFilterJobNatureName(String filterJobNatureName) {
		this.filterJobNatureName = filterJobNatureName;
	}

	public String getFilterEducationName() {
		return filterEducationName == null ? "" : filterEducationName.trim();
	}

	public void setFilterEducationName(String filterEducationName) {
		this.filterEducationName = filterEducationName;
	}

	public void setClicks(int clicks) {
		this.clicks = clicks;
	}

	public int getClicks() {
		return clicks;
	}

	public void setApplicantsNumber(int applicantsNumber) {
		this.applicantsNumber = applicantsNumber;
	}

	public int getApplicantsNumber() {
		return applicantsNumber;
	}

	public void setAgeName(String ageName) {
		this.ageName = ageName;
	}

	public String getAgeName() {
		return ageName;
	}

}
