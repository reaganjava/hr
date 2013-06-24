package com.dotoyo.buildjob.certificateCenter.dto;

import java.io.Serializable;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

public class CertVerifyInfoDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 8639698206178444895L;
	private Long id;
	private String certCode;
	private String certName;
	private String verifySite;

	public CertVerifyInfoDto() {

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

	/**
	 * @return the certName
	 */
	public String getCertName() {
		return certName == null ? "" : certName.trim();
	}

	/**
	 * @param certName
	 *            the certName to set
	 */
	public void setCertName(String certName) {
		this.certName = certName;
	}

	/**
	 * @return the verifySite
	 */
	public String getVerifySite() {
		return verifySite == null ? "" : verifySite.trim();
	}

	/**
	 * @param verifySite
	 *            the verifySite to set
	 */
	public void setVerifySite(String verifySite) {
		this.verifySite = verifySite;
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
