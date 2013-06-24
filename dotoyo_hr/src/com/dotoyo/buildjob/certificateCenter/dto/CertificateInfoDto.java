package com.dotoyo.buildjob.certificateCenter.dto;

import java.io.Serializable;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 *
 * @author arthas.zou
 * @dateCreated 2010-11-30
 * @description
 */
public class CertificateInfoDto implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 3265979427009959473L;
	private Long id;// 证书ID
	private String certType;// 证书类型（执业证书、职称证书）
	private String certName;// 证书名称
	private String isHotCert;// 是否热门证书（Y/N）

	public CertificateInfoDto() {

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
	 * @return the certType
	 */
	public String getCertType() {
		return certType == null ? "" : certType.trim();
	}

	/**
	 * @param certType
	 *            the certType to set
	 */
	public void setCertType(String certType) {
		this.certType = certType;
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
	 * @return the isHotCert
	 */
	public String getIsHotCert() {
		return isHotCert == null ? "" : isHotCert.trim();
	}

	/**
	 * @param isHotCert
	 *            the isHotCert to set
	 */
	public void setIsHotCert(String isHotCert) {
		this.isHotCert = isHotCert;
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
