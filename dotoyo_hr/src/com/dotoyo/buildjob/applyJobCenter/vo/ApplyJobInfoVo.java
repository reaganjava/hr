package com.dotoyo.buildjob.applyJobCenter.vo;

import java.io.Serializable;
import java.util.Date;

import com.dotoyo.buildjob.applyJobCenter.dto.ApplyJobInfoDto;
import com.dotoyo.buildjob.common.dto.AreaDto;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.CityDto;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

public class ApplyJobInfoVo implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -7447413618528966622L;
	private Long id;// 求职信息ID
	private Long userId;// 用户ID
	private BlogUserInfoDto userInfo;
	private ClassMasterDto function;// 职能
	private String expectedPosition;// 意向职位
	private ProvinceDto province;// 省份
	private CityDto city;// 城市
	private AreaDto area;// 区域
	private ClassMasterDto jobType;// 工作类型
	private String isAdvisor;// 是否顾问（Y、N）
	private String isAdvisorStr;// 是否顾问(是、否)，用于前台数据展示
	private Date submitDate;// 发布日期
	private Date lastEditDate;// 修改日期
	private ClassMasterDto expectedSalary;// 期望薪水
	private String actStatus;// 状态（有效、无效）

	public ApplyJobInfoVo() {

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
	 * @return the function
	 */
	public ClassMasterDto getFunction() {
		if (this.function == null)
			this.setFunction(new ClassMasterDto());
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
	 * @return the jobType
	 */
	public ClassMasterDto getJobType() {
		if (this.jobType == null)
			this.setJobType(new ClassMasterDto());
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
	 * @return the isAdvisorStr
	 */
	public String getIsAdvisorStr() {
		return isAdvisorStr == null ? "" : isAdvisorStr.trim();
	}

	/**
	 * @param isAdvisorStr
	 *            the isAdvisorStr to set
	 */
	public void setIsAdvisorStr(String isAdvisorStr) {
		this.isAdvisorStr = isAdvisorStr;
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
		if (this.expectedSalary == null)
			this.setExpectedSalary(new ClassMasterDto());
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

	/**
	 * @return the userInfo
	 */
	public BlogUserInfoDto getUserInfo() {
		if (this.userInfo == null)
			this.setUserInfo(new BlogUserInfoDto());
		return userInfo;
	}

	/**
	 * @param userInfo
	 *            the userInfo to set
	 */
	public void setUserInfo(BlogUserInfoDto userInfo) {
		this.userInfo = userInfo;
	}

	public ApplyJobInfoDto convertToDto() {
		ApplyJobInfoDto resultDto = new ApplyJobInfoDto();
		resultDto.setActStatus(this.getActStatus());

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
		resultDto.setSubmitDate(this.getSubmitDate());
		resultDto.setUserId(this.getUserId());
		return resultDto;
	}

}
