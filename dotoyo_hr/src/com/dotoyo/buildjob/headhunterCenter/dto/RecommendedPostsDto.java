package com.dotoyo.buildjob.headhunterCenter.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-21
 * @description 职位推荐值对象  
 * 
 */
public class RecommendedPostsDto implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private Long jobId;// 职位ID
	private Long recommendUserId;// 推荐用户ID',
	private Long receiveUserId;// 接收用户ID
	private Date recommendDate;// 推荐时间
	
	public RecommendedPostsDto() {
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getJobId() {
		return jobId;
	}
	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}
	public Long getRecommendUserId() {
		return recommendUserId;
	}
	public void setRecommendUserId(Long recommendUserId) {
		this.recommendUserId = recommendUserId;
	}
	public Long getReceiveUserId() {
		return receiveUserId;
	}
	public void setReceiveUserId(Long receiveUserId) {
		this.receiveUserId = receiveUserId;
	}
	public Date getRecommendDate() {
		return recommendDate;
	}
	public void setRecommendDate(Date recommendDate) {
		this.recommendDate = recommendDate;
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
}
