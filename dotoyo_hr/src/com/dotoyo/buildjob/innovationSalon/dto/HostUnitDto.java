package com.dotoyo.buildjob.innovationSalon.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author Bill xu
 * @dateCreated 2011-01-07
 * @description 主办单位DTO
 *
 */
public class HostUnitDto implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;

	private String unitName; // 主办单位名称
	private String pictureName; // 主办单位图片
	private String introduction; // 简介
	private int intOrder; // 排列顺序号
	private String linkURL; // 链接URL

	public HostUnitDto() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUnitName() {
		return unitName == null ? "" : unitName.trim();
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getPictureName() {
		return pictureName == null ? "" : pictureName.trim();
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public String getIntroduction() {
		return introduction == null ? "" : introduction.trim();
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public int getIntOrder() {
		return intOrder;
	}

	public void setIntOrder(int intOrder) {
		this.intOrder = intOrder;
	}

	public String getLinkURL() {
		return linkURL == null ? "" : linkURL.trim();
	}

	public void setLinkURL(String linkURL) {
		this.linkURL = linkURL;
	}





}
