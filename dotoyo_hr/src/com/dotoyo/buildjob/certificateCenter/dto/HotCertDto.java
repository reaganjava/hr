package com.dotoyo.buildjob.certificateCenter.dto;

import java.io.Serializable;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

public class HotCertDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 7141792024866083592L;
	private Long id;
	private String certCode;// 证书编码

	public HotCertDto() {

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
	 * @return the certCode
	 */
	public String getCertCode() {
		return certCode == null ? "" : certCode.trim();
	}

	/**
	 * @param certCode
	 *            the certCode to set
	 */
	public void setCertCode(String certCode) {
		this.certCode = certCode;
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
