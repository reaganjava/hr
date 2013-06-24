package com.dotoyo.buildjob.personalCenter.dto;

import java.io.Serializable;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

public class FilterCompanyDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -8940797727171228830L;
	private Long id;
	private Long userId;
	private String companyName1;
	private String companyName2;
	private String companyName3;
	private String companyName4;
	private String companyName5;

	public FilterCompanyDto() {

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
	 * @return the userId
	 */
	public Long getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}

	/**
	 * @return the companyName1
	 */
	public String getCompanyName1() {
		return companyName1 == null ? "" : companyName1.trim();
	}

	/**
	 * @param companyName1
	 *            the companyName1 to set
	 */
	public void setCompanyName1(String companyName1) {
		this.companyName1 = companyName1;
	}

	/**
	 * @return the companyName2
	 */
	public String getCompanyName2() {
		return companyName2 == null ? "" : companyName2.trim();
	}

	/**
	 * @param companyName2
	 *            the companyName2 to set
	 */
	public void setCompanyName2(String companyName2) {
		this.companyName2 = companyName2;
	}

	/**
	 * @return the companyName3
	 */
	public String getCompanyName3() {
		return companyName3 == null ? "" : companyName3.trim();
	}

	/**
	 * @param companyName3
	 *            the companyName3 to set
	 */
	public void setCompanyName3(String companyName3) {
		this.companyName3 = companyName3;
	}

	/**
	 * @return the companyName4
	 */
	public String getCompanyName4() {
		return companyName4 == null ? "" : companyName4.trim();
	}

	/**
	 * @param companyName4
	 *            the companyName4 to set
	 */
	public void setCompanyName4(String companyName4) {
		this.companyName4 = companyName4;
	}

	/**
	 * @return the companyName5
	 */
	public String getCompanyName5() {
		return companyName5 == null ? "" : companyName5.trim();
	}

	/**
	 * @param companyName5
	 *            the companyName5 to set
	 */
	public void setCompanyName5(String companyName5) {
		this.companyName5 = companyName5;
	}

	@Override
	public String toString() {
		try {
			BeanUtils.describe(this).toString();
		} catch (Exception e) {
			Logger.getLogger(this.getClass()).error(
					ApplicationConstant.ERROR_CONVERTING_OBJECT_TO_STRING, e);
		}
		return super.toString();
	}

}
