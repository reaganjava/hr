package com.dotoyo.buildjob.systemManage.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-6
 * @description 背景音乐实体
 * 
 */
public class BackgroupMusicDto implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private Long articleid;
	private String url;
	private String status;
	private Date modifyDate;
	public BackgroupMusicDto() {
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getArticleid() {
		return articleid;
	}
	public void setArticleid(Long articleid) {
		this.articleid = articleid;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
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
