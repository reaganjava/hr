package com.dotoyo.buildjob.systemManage.dto;

import java.io.Serializable;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-6
 * @description  
 * 
 */

public class SysParameterDto implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String code;
	private String name;
	private String sysValue;
	private String notes;
	public SysParameterDto() {
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public void setSysValue(String sysValue) {
		this.sysValue = sysValue;
	}
	public String getSysValue() {
		return sysValue;
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		try {
		    return BeanUtils.describe(this).toString();
		} catch (Exception e) {
		    Logger.getLogger(this.getClass()).error(ApplicationConstant.ERROR_CONVERTING_OBJECT_TO_STRING, e);
		}
		    return super.toString();
	}
	
}
