package com.dotoyo.buildjob.certificateCenter.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-14
 * @description
 */
public class CertNeedsAccessHistoryDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1537952204197724304L;
	private Long id;
	private Long certNeedsId;
	private Long accessUserId;
	private Date accessDate;

	public CertNeedsAccessHistoryDto() {

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
	 * @return the certNeedsId
	 */
	public Long getCertNeedsId() {
		return certNeedsId;
	}

	/**
	 * @param certNeedsId
	 *            the certNeedsId to set
	 */
	public void setCertNeedsId(Long certNeedsId) {
		this.certNeedsId = certNeedsId;
	}

	/**
	 * @return the accessUserId
	 */
	public Long getAccessUserId() {
		return accessUserId;
	}

	/**
	 * @param accessUserId
	 *            the accessUserId to set
	 */
	public void setAccessUserId(Long accessUserId) {
		this.accessUserId = accessUserId;
	}

	/**
	 * @return the accessDate
	 */
	public Date getAccessDate() {
		return accessDate;
	}

	/**
	 * @param accessDate
	 *            the accessDate to set
	 */
	public void setAccessDate(Date accessDate) {
		this.accessDate = accessDate;
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

}
