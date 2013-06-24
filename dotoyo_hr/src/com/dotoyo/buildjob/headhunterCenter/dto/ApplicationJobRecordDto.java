package com.dotoyo.buildjob.headhunterCenter.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-21
 * @description 用户职位申请记录值对象(企业收到职位申请)
 *
 */
public class ApplicationJobRecordDto extends JobInfoDto implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private Long jobId;// 职位Id
	private Long recruitLtdId;// 招聘公司
	private Date applicationDate;// 申请时间
	private String lookOver; // 是否已查看:1 已查看;0 未查看',
	private String status; // 1 已删除;0 正常
	private String interviews; // '是否发出面试邀请:1 已经发出;0 没有'
	private BlogUserInfoDto companyUserInfo;// 公司博站用户信息
	private BlogUserInfoDto personalUserInfo;// 个人博站用户信息

	public ApplicationJobRecordDto() {
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

	public Long getJobId() {
		return jobId;
	}

	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}

	public Long getRecruitLtdId() {
		return recruitLtdId;
	}

	public void setRecruitLtdId(Long recruitLtdId) {
		this.recruitLtdId = recruitLtdId;
	}

	public Date getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
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

	public void setLookOver(String lookOver) {
		this.lookOver = lookOver;
	}

	public String getLookOver() {
		return lookOver == null ? "" : lookOver.trim();
	}

	public String getStatus() {
		return status == null ? "" : status.trim();
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getInterviews() {
		return interviews == null ? "" : interviews.trim();
	}

	public void setInterviews(String interviews) {
		this.interviews = interviews;
	}

	/**
	 * @return the companyUserInfo
	 */
	public BlogUserInfoDto getCompanyUserInfo() {
		return companyUserInfo;
	}

	/**
	 * @param companyUserInfo
	 *            the companyUserInfo to set
	 */
	public void setCompanyUserInfo(BlogUserInfoDto companyUserInfo) {
		this.companyUserInfo = companyUserInfo;
	}

	/**
	 * @return the personalUserInfo
	 */
	public BlogUserInfoDto getPersonalUserInfo() {
		return personalUserInfo;
	}

	/**
	 * @param personalUserInfo
	 *            the personalUserInfo to set
	 */
	public void setPersonalUserInfo(BlogUserInfoDto personalUserInfo) {
		this.personalUserInfo = personalUserInfo;
	}

}
