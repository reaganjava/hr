package com.dotoyo.buildjob.innovationSalon.dto;

import java.io.Serializable;

/**
 * @author Bill xu
 * @dateCreated 2011-02-18
 * @description 首页显示沙龙DTO
 *
 */
public class SalonHomePageDisplayDto implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;

	private Long salonId;  //沙龙ID
	private int intOrder;   //顺序号

	public SalonHomePageDisplayDto() {
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

	public int getIntOrder() {
		return intOrder;
	}

	public void setIntOrder(int intOrder) {
		this.intOrder = intOrder;
	}


}
