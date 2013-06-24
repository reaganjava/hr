package com.dotoyo.buildjob.headhunterCenter.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-21
 * @description 职位收藏夹
 * 
 */
public class JobadfavoritesDto implements Serializable {
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private Long jobId;// 职位ID
	private Long userId;// 用户ID
	private Date collectionDate;// 收藏时间
	
	public JobadfavoritesDto() {
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
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Date getCollectionDate() {
		return collectionDate;
	}
	public void setCollectionDate(Date collectionDate) {
		this.collectionDate = collectionDate;
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
