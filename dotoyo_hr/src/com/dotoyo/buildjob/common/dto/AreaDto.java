package com.dotoyo.buildjob.common.dto;

import java.io.Serializable;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-2
 * @description
 *
 */
public class AreaDto implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String city_Code;
	private String code;
	private String name;

	public AreaDto() {
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCode() {
		return code == null ? "" : code.trim();
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name == null ? "" : name.trim();
	}
	public void setName(String name) {
		this.name = name;
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

	public void setCity_Code(String city_Code) {
		this.city_Code = city_Code;
	}

	public String getCity_Code() {
		return city_Code == null ? "" : city_Code.trim();
	}

}
