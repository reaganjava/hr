package com.dotoyo.buildjob.applyJobCenter.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 *
 * @author arthas.zou
 * @dateCreated 2010-12-7
 * @description
 */
public class RecommendationDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -3068770401079564283L;
	private Long id;// 申请推荐信息ID
	private Long userId;// 用户ID
	private String userName;// 用户帐号
	private String userRealName;// 用户真实姓名
	private String functionCode;// 职能编码
	private String expectedPosition;// 意向职位
	private String provinceCode;// 省份编码
	private String cityCode;// 城市编码
	private String areaCode;// 区域编码
	private String jobTypeCode;// 工作类型编码
	private String isAdvisor;// 是否顾问
	private Date submitDate;// 申请日期
	private Date lastEditDate;// 最近修改日期
	private String expectedSalaryCode;// 期望月薪编码
	private String recommendationType;// 申请类型（用户线上自助申请、管理员手工录入）
	private String verifyStatus;// 审核状态（未审核、通过审核、不通过审核）
	private String interviewStatus;// 面试情况

	public RecommendationDto() {

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
	 * @return the recommendationType
	 */
	public String getRecommendationType() {
		return recommendationType == null ? "" : recommendationType.trim();
	}

	/**
	 * @param recommendationType
	 *            the recommendationType to set
	 */
	public void setRecommendationType(String recommendationType) {
		this.recommendationType = recommendationType;
	}

	/**
	 * @return the verifyStatus
	 */
	public String getVerifyStatus() {
		return verifyStatus == null ? "" : verifyStatus.trim();
	}

	/**
	 * @param verifyStatus
	 *            the verifyStatus to set
	 */
	public void setVerifyStatus(String verifyStatus) {
		this.verifyStatus = verifyStatus;
	}

	/**
	 * @return the interviewStatus
	 */
	public String getInterviewStatus() {
		return interviewStatus == null ? "" : interviewStatus.trim();
	}

	/**
	 * @param interviewStatus
	 *            the interviewStatus to set
	 */
	public void setInterviewStatus(String interviewStatus) {
		this.interviewStatus = interviewStatus;
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
	 * 用户申请成为线下推荐对象，同时选择发布线上求职信息时，封装线上求职信息值对象
	 *
	 * @return 线上求职信息值对象
	 */
	public ApplyJobInfoDto getApplyJobInfoDto() {
		ApplyJobInfoDto applyJobInfoDto = new ApplyJobInfoDto();
		applyJobInfoDto.setActStatus("A");
		applyJobInfoDto.setAreaCode(this.getAreaCode());
		applyJobInfoDto.setCityCode(this.getCityCode());
		applyJobInfoDto.setExpectedPosition(this.getExpectedPosition());
		applyJobInfoDto.setExpectedSalaryCode(this.getExpectedSalaryCode());
		applyJobInfoDto.setFunctionCode(this.getFunctionCode());
		applyJobInfoDto.setIsAdvisor(this.getIsAdvisor());
		applyJobInfoDto.setJobTypeCode(this.getJobTypeCode());
		applyJobInfoDto.setLastEditDate(this.getLastEditDate());
		applyJobInfoDto.setProvinceCode(this.getProvinceCode());
		applyJobInfoDto.setSubmitDate(this.getSubmitDate());
		applyJobInfoDto.setUserId(this.getUserId());
		return applyJobInfoDto;
	}
}
