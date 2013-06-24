package com.dotoyo.buildjob.applyJobCenter.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 *
 * @author arthas.zou
 * @dateCreated 2010-12-2
 * @description
 */
public class ApplyJobInfoDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 3499426394064912692L;
	private Long id;// 求职信息ID
	private Long userId;// 用户ID
	private String userName;// 用户帐号
	private String userRealName;// 用户真实姓名
	private String functionCode;// 职能编码
	private String functionName;
	private String expectedPosition;// 意向职位
	private String provinceCode;// 省份编码
	private String provinceName;// 省份名称
	private String cityCode;// 城市编码
	private String cityName;// 城市名称
	private String areaCode;// 区域编码
	private String areaName;// 区域名称
	private String jobTypeCode;// 工作类型（全职、兼职）编码
	private String jobTypeName;// 工作类型名称
	private String isAdvisor;// 是否顾问（Y、N）
	private Date submitDate;// 发布日期
	private Date lastEditDate;// 修改日期
	private String expectedSalaryCode;// 期望薪水编码
	private String expectedSalaryName;// 期望薪水名称
	private String actStatus;// 状态（有效、无效）

	public ApplyJobInfoDto() {
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
	 * @return the userId
	 */
	public Long getUserId() {
		return userId;
	}

	/**
	 * @param userID
	 *            the userID to set
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}

	/**
	 * @return the functionCode
	 */
	public String getFunctionCode() {
		return functionCode == null ? "" : functionCode.trim();
	}

	/**
	 * @param functionCode
	 *            the functionCode to set
	 */
	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}

	/**
	 * @return the expectedPosition
	 */
	public String getExpectedPosition() {
		return expectedPosition == null ? "" : expectedPosition.trim();
	}

	/**
	 * @param expectedPosition
	 *            the expectedPosition to set
	 */
	public void setExpectedPosition(String expectedPosition) {
		this.expectedPosition = expectedPosition;
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
	 * @return the jobTypeCode
	 */
	public String getJobTypeCode() {
		return jobTypeCode == null ? "" : jobTypeCode.trim();
	}

	/**
	 * @param jobTypeCode
	 *            the jobTypeCode to set
	 */
	public void setJobTypeCode(String jobTypeCode) {
		this.jobTypeCode = jobTypeCode;
	}

	/**
	 * @return the isAdvisor
	 */
	public String getIsAdvisor() {
		return isAdvisor == null ? "" : isAdvisor.trim();
	}

	/**
	 * @param isAdvisor
	 *            the isAdvisor to set
	 */
	public void setIsAdvisor(String isAdvisor) {
		this.isAdvisor = isAdvisor;
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
	 * @return the expectedSalaryCode
	 */
	public String getExpectedSalaryCode() {
		return expectedSalaryCode == null ? "" : expectedSalaryCode.trim();
	}

	/**
	 * @param expectedSalaryCode
	 *            the expectedSalaryCode to set
	 */
	public void setExpectedSalaryCode(String expectedSalaryCode) {
		this.expectedSalaryCode = expectedSalaryCode;
	}

	/**
	 * @return the actStatus
	 */
	public String getActStatus() {
		return actStatus == null ? "" : actStatus.trim();
	}

	/**
	 * @param actStatus
	 *            the actStatus to set
	 */
	public void setActStatus(String actStatus) {
		this.actStatus = actStatus;
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
	 * @return the functionName
	 */
	public String getFunctionName() {
		return functionName == null ? "" : functionName.trim();
	}

	/**
	 * @param functionName
	 *            the functionName to set
	 */
	public void setFunctionName(String functionName) {
		this.functionName = functionName;
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
	 * @return the jobTypeName
	 */
	public String getJobTypeName() {
		return jobTypeName == null ? "" : jobTypeName.trim();
	}

	/**
	 * @param jobTypeName
	 *            the jobTypeName to set
	 */
	public void setJobTypeName(String jobTypeName) {
		this.jobTypeName = jobTypeName;
	}

	/**
	 * @return the expectedSalaryName
	 */
	public String getExpectedSalaryName() {
		return expectedSalaryName == null ? "" : expectedSalaryName.trim();
	}

	/**
	 * @param expectedSalaryName
	 *            the expectedSalaryName to set
	 */
	public void setExpectedSalaryName(String expectedSalaryName) {
		this.expectedSalaryName = expectedSalaryName;
	}

	/**
	 * 用户发布线上求职信息，选择同时申请成为线下推荐对象时，封装线下推荐对象信息
	 *
	 * @return 线下推荐对象信息值对象
	 */
	public RecommendationDto getRecommendationDto() {
		RecommendationDto recommendationDto = new RecommendationDto();
		recommendationDto.setAreaCode(this.getAreaCode());
		recommendationDto.setCityCode(this.getCityCode());
		recommendationDto.setExpectedPosition(this.getExpectedPosition());
		recommendationDto.setExpectedSalaryCode(this.getExpectedSalaryCode());
		recommendationDto.setFunctionCode(this.getFunctionCode());
		recommendationDto.setIsAdvisor(this.getIsAdvisor());
		recommendationDto.setJobTypeCode(this.getJobTypeCode());
		recommendationDto.setLastEditDate(this.getLastEditDate());
		recommendationDto.setProvinceCode(this.getProvinceCode());
		recommendationDto.setSubmitDate(this.getSubmitDate());
		recommendationDto.setRecommendationType("0");
		recommendationDto.setUserId(this.getUserId());
		recommendationDto.setVerifyStatus("0");
		recommendationDto.setInterviewStatus("0");
		return recommendationDto;
	}

}
