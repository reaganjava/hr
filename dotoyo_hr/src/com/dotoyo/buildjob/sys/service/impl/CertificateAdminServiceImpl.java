package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsDto;
import com.dotoyo.buildjob.certificateCenter.dto.PersonalCertDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.sys.dao.ICertificateAdminDao;
import com.dotoyo.buildjob.sys.service.ICertificateAdminService;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-22
 * @description
 */
public class CertificateAdminServiceImpl implements ICertificateAdminService {

	private ICertificateAdminDao certificateAdminDao;

	public List<CertNeedsDto> queryCertNeedsList4Admin(PageInfo pageInfo,
			Map<String, String> certNeedsMap) {
		return certificateAdminDao.queryCertNeedsList4Admin(pageInfo,
				certNeedsMap);
	}

	public List<PersonalCertDto> queryPersonalCertList4Admin(PageInfo pageInfo,
			Map<String, String> personalCertMap) {
		return certificateAdminDao.queryPersonalCertList4Admin(pageInfo,
				personalCertMap);
	}

	/**
	 * @return the certificateAdminDao
	 */
	public ICertificateAdminDao getCertificateAdminDao() {
		return certificateAdminDao;
	}

	/**
	 * @param certificateAdminDao
	 *            the certificateAdminDao to set
	 */
	public void setCertificateAdminDao(ICertificateAdminDao certificateAdminDao) {
		this.certificateAdminDao = certificateAdminDao;
	}

	public CertNeedsDto getCertNeedsById4Admin(Long id) {
		return certificateAdminDao.getCertNeedsById4Admin(id);
	}

	public void editIndeedStatus(Map<String, String> certNeedsMap) {
		certificateAdminDao.editIndeedStatus(certNeedsMap);
		refreshCertificateCenterPage();
	}

	public PersonalCertDto getPersonalCertById4Admin(Long id) {
		return certificateAdminDao.getPersonalCertById4Admin(id);
	}

	public Integer getCertNeedsCount() {
		return certificateAdminDao.getCertNeedsCount();
	}

	public Integer getPersonalCertCount() {
		return certificateAdminDao.getPersonalCertCount();
	}

	public Integer queryCertNeedsCount4Admin(Map<String, String> certNeedsMap) {
		return certificateAdminDao.queryCertNeedsCount4Admin(certNeedsMap);
	}

	public Integer queryPersonalCertCount4Admin(
			Map<String, String> personalCertMap) {
		return certificateAdminDao
				.queryPersonalCertCount4Admin(personalCertMap);
	}

	/**
	 * 重新生产猎证中心HTML页面
	 */
	private void refreshCertificateCenterPage() {
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshCertificateCenterPage();
	}

}
