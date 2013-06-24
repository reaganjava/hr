package com.dotoyo.buildjob.common.dto;

import java.io.Serializable;

/**
 * @author tyler.qu
 * @dateCreated 2011-2-16
 * @description
 *
 */
public class CitySiteDto extends HotCityDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String cityName;

	public CitySiteDto() {
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCityName() {
		return cityName == null ? "" : cityName.trim();
	}

}
