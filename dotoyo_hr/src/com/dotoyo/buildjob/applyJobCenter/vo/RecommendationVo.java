package com.dotoyo.buildjob.applyJobCenter.vo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.applyJobCenter.dto.RecommendationDto;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.AreaDto;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.CityDto;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

public class RecommendationVo implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 88992912387983083L;
	private Long id;// 申请推荐信息ID
	private Long userId;// 用户ID
	private BlogUserInfoDto userInfo;
	private ClassMasterDto function;// 职能
	private String expectedPosition;// 意向职位
	private ProvinceDto province;// 省份
	private CityDto city;// 城市
	private AreaDto area;// 区域
	private ClassMasterDto jobType;// 工作类型编码
	private String isAdvisor;// 是否顾问
	private Date submitDate;// 申请日期
	private Date lastEditDate;// 最近修改日期
	private ClassMasterDto expectedSalary;// 期望月薪
	private String recommendationType;// 申请类型（用户线上自助申请、管理员手工录入）
	private String verifyStatus;// 审核状态（未审核、通过审核、不通过审核）
	private String interviewStatus;// 面试情况

	public RecommendationVo() {

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
	 * @return the function
	 */
	public ClassMasterDto getFunction() {
		return function;
	}

	/**
	 * @param function
	 *            the function to set
	 */
	public void setFunction(ClassMasterDto function) {
		this.function = function;
	}

	/**
	 * @return the expectedPosition
	 */
	public String getExpectedPosition() {
		return expectedPosition;
	}

	/**
	 * @param expectedPosition
	 *            the expectedPosition to set
	 */
	public void setExpectedPosition(String expectedPosition) {
		this.expectedPosition = expectedPosition;
	}

	/**
	 * @return the province
	 */
	public ProvinceDto getProvince() {
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
	 * @return the jobType
	 */
	public ClassMasterDto getJobType() {
		return jobType;
	}

	/**
	 * @param jobType
	 *            the jobType to set
	 */
	public void setJobType(ClassMasterDto jobType) {
		this.jobType = jobType;
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
	 * @return the expectedSalary
	 */
	public ClassMasterDto getExpectedSalary() {
		return expectedSalary;
	}

	/**
	 * @param expectedSalary
	 *            the expectedSalary to set
	 */
	public void setExpectedSalary(ClassMasterDto expectedSalary) {
		this.expectedSalary = expectedSalary;
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

	/**
	 * @return the userInfo
	 */
	public BlogUserInfoDto getUserInfo() {
		return userInfo;
	}

	/**
	 * @param userInfo
	 *            the userInfo to set
	 */
	public void setUserInfo(BlogUserInfoDto userInfo) {
		this.userInfo = userInfo;
	}

	public RecommendationDto convertToDto() {
		RecommendationDto resultDto = new RecommendationDto();
		if (this.getArea() != null) {
			resultDto.setAreaCode(this.getArea().getCode());
		} else {
			resultDto.setAreaCode("");
		}
		resultDto.setCityCode(this.getCity().getCode());
		resultDto.setExpectedPosition(this.getExpectedPosition());
		resultDto.setExpectedSalaryCode(this.getExpectedSalary().getCode());
		resultDto.setFunctionCode(this.getFunction().getCode());
		resultDto.setId(this.getId());
		resultDto.setIsAdvisor(this.getIsAdvisor());
		resultDto.setJobTypeCode(this.getJobType().getCode());
		resultDto.setLastEditDate(this.getLastEditDate());
		resultDto.setProvinceCode(this.getProvince().getCode());
		resultDto.setRecommendationType(this.getRecommendationType());
		resultDto.setSubmitDate(this.getSubmitDate());
		resultDto.setUserId(this.getUserId());
		resultDto.setVerifyStatus(this.getVerifyStatus());
		resultDto.setInterviewStatus(this.getInterviewStatus());
		return resultDto;
	}
}
