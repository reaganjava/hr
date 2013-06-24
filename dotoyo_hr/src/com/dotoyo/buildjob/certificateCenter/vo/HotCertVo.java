package com.dotoyo.buildjob.certificateCenter.vo;

import java.io.Serializable;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

public class HotCertVo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4171792610637555776L;
	private Long id;
	private ClassMasterDto hotCert;// 热门证书

	public HotCertVo() {

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
	 * @return the hotCert
	 */
	public ClassMasterDto getHotCert() {
		return hotCert;
	}

	/**
	 * @param hotCert
	 *            the hotCert to set
	 */
	public void setHotCert(ClassMasterDto hotCert) {
		this.hotCert = hotCert;
	}

	@Override
	public String toString() {
		try {
			return BeanUtils.describe(this).toString();
		} catch (Exception e) {
			Logger.getLogger(this.getClass()).error(
					ApplicationConstant.ERROR_CONVERTING_OBJECT_TO_STRING, e);
		}
		return super.toString();
	}

}
