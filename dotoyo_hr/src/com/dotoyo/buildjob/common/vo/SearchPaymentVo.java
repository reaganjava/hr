package com.dotoyo.buildjob.common.vo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author tyler.qu
 * @dateCreated 2010-11-30
 * @description
 *
 */
public class SearchPaymentVo implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private String userName;
	private Date startSubmitDate;
	private Date endSubmitDate;
	private Date startConfirmDate;
	private Date endConfirmDate;
	private String status;
	public SearchPaymentVo() {
	}

	public String getUserName() {
		return userName == null ? "" : userName.trim();
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getStartSubmitDate() {
		return startSubmitDate;
	}
	public void setStartSubmitDate(Date startSubmitDate) {
		this.startSubmitDate = startSubmitDate;
	}
	public Date getEndSubmitDate() {
		return endSubmitDate;
	}
	public void setEndSubmitDate(Date endSubmitDate) {
		this.endSubmitDate = endSubmitDate;
	}
	public Date getStartConfirmDate() {
		return startConfirmDate;
	}
	public void setStartConfirmDate(Date startConfirmDate) {
		this.startConfirmDate = startConfirmDate;
	}
	public Date getEndConfirmDate() {
		return endConfirmDate;
	}
	public void setEndConfirmDate(Date endConfirmDate) {
		this.endConfirmDate = endConfirmDate;
	}
	public String getStatus() {
		return status == null ? "" : status.trim();
	}
	public void setStatus(String status) {
		this.status = status;
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
