package com.dotoyo.buildjob.common.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 *
 * @author arthas.zou
 * @dateCreated 2011-2-20
 * @description 站内信
 */
public class ShortMessageDto implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = -591427714977219383L;
	private Long id;
	private Long receiverId;
	private String receiverUserName;
	private String receiverRealName;
	private Long senderId;
	private String senderUserName;
	private String senderRealName;
	private String title;
	private String message;
	private String type;
	private String status;
	private Date receiveDate;

	public ShortMessageDto() {

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
	 * @return the receiverId
	 */
	public Long getReceiverId() {
		return receiverId;
	}

	/**
	 * @param receiverId
	 *            the receiverId to set
	 */
	public void setReceiverId(Long receiverId) {
		this.receiverId = receiverId;
	}

	/**
	 * @return the senderId
	 */
	public Long getSenderId() {
		return senderId;
	}

	/**
	 * @param senderId
	 *            the senderId to set
	 */
	public void setSenderId(Long senderId) {
		this.senderId = senderId;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title == null ? "" : title.trim();
	}

	/**
	 * @param title
	 *            the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message == null ? "" : message.trim();
	}

	/**
	 * @param message
	 *            the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type == null ? "" : type.trim();
	}

	/**
	 * @param type
	 *            the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status == null ? "" : status.trim();
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the receiveDate
	 */
	public Date getReceiveDate() {
		return receiveDate;
	}

	/**
	 * @param receiveDate
	 *            the receiveDate to set
	 */
	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
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
	 * @return the receiverUserName
	 */
	public String getReceiverUserName() {
		return receiverUserName == null ? "" : receiverUserName.trim();
	}

	/**
	 * @param receiverUserName
	 *            the receiverUserName to set
	 */
	public void setReceiverUserName(String receiverUserName) {
		this.receiverUserName = receiverUserName;
	}

	/**
	 * @return the receiverRealName
	 */
	public String getReceiverRealName() {
		return receiverRealName == null ? "" : receiverRealName.trim();
	}

	/**
	 * @param receiverRealName
	 *            the receiverRealName to set
	 */
	public void setReceiverRealName(String receiverRealName) {
		this.receiverRealName = receiverRealName;
	}

	/**
	 * @return the senderUserName
	 */
	public String getSenderUserName() {
		return senderUserName == null ? "" : senderUserName.trim();
	}

	/**
	 * @param senderUserName
	 *            the senderUserName to set
	 */
	public void setSenderUserName(String senderUserName) {
		this.senderUserName = senderUserName;
	}

	/**
	 * @return the senderRealName
	 */
	public String getSenderRealName() {
		return senderRealName == null ? "" : senderRealName.trim();
	}

	/**
	 * @param senderRealName
	 *            the senderRealName to set
	 */
	public void setSenderRealName(String senderRealName) {
		this.senderRealName = senderRealName;
	}

}
