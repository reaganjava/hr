package com.dotoyo.buildjob.innovationSalon.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author Bill xu
 * @dateCreated 2011-01-11
 * @description 沙龙参加DTO
 * 
 */
public class SalonAttendDto implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;

	private Long salonId;  //针对的沙龙
	private Long userId;   //作者ID
	private Date joinDate;     //参加日期

	
	

	public SalonAttendDto() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getSalonId() {
		return salonId;
	}

	public void setSalonId(Long salonId) {
		this.salonId = salonId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	
}
