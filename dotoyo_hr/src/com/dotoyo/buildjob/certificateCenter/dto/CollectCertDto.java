package com.dotoyo.buildjob.certificateCenter.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * 
 * @author arthas.zou
 * @dateCreated Dec 13, 2010
 * @description
 */
public class CollectCertDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8874734767536669152L;
	private Long id;// 证书搜藏信息ID
	private Long personalCertID;// 个人证书ID
	private Long collectorID;// 搜藏者ID
	private Date collectDate;// 搜藏日期

	public CollectCertDto() {

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
	 * @return the personalCertID
	 */
	public Long getPersonalCertID() {
		return personalCertID;
	}

	/**
	 * @param personalCertID
	 *            the personalCertID to set
	 */
	public void setPersonalCertID(Long personalCertID) {
		this.personalCertID = personalCertID;
	}

	/**
	 * @return the collectorID
	 */
	public Long getCollectorID() {
		return collectorID;
	}

	/**
	 * @param collectorID
	 *            the collectorID to set
	 */
	public void setCollectorID(Long collectorID) {
		this.collectorID = collectorID;
	}

	/**
	 * @return the collectDate
	 */
	public Date getCollectDate() {
		return collectDate;
	}

	/**
	 * @param collectDate
	 *            the collectDate to set
	 */
	public void setCollectDate(Date collectDate) {
		this.collectDate = collectDate;
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
}
