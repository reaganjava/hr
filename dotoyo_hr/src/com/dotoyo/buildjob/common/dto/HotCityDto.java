package com.dotoyo.buildjob.common.dto;

import java.io.Serializable;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.mysql.jdbc.Blob;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-21
 * @description
 *
 */
public class HotCityDto implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	protected Long id;
	protected String cityCode;// 城市CODE
	protected String pic;// 图片
	protected int orderNumber;// 排列序号

	public HotCityDto() {
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCityCode() {
		return cityCode == null ? "" : cityCode.trim();
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	public String getPic() {
		return pic == null ? "" : pic.trim();
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
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
