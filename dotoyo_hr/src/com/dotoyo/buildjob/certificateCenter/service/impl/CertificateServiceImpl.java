package com.dotoyo.buildjob.certificateCenter.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.certificateCenter.dao.ICertAccessHistoryDao;
import com.dotoyo.buildjob.certificateCenter.dao.ICertificateDao;
import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsDto;
import com.dotoyo.buildjob.certificateCenter.dto.CertVerifyInfoDto;
import com.dotoyo.buildjob.certificateCenter.dto.CollectCertDto;
import com.dotoyo.buildjob.certificateCenter.dto.HotCertDto;
import com.dotoyo.buildjob.certificateCenter.dto.PersonalCertDto;
import com.dotoyo.buildjob.certificateCenter.service.ICertificateService;
import com.dotoyo.buildjob.certificateCenter.vo.CertNeedsVo;
import com.dotoyo.buildjob.certificateCenter.vo.CollectCertVo;
import com.dotoyo.buildjob.certificateCenter.vo.HotCertVo;
import com.dotoyo.buildjob.certificateCenter.vo.PersonalCertVo;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.dotoyo.buildjob.sys.service.ISysOrderService;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2010-11-30
 * @description
 */
public class CertificateServiceImpl implements ICertificateService {

	private ICertificateDao certificateDao;
	private ICertAccessHistoryDao certAccessHistoryDao;
	private ISysOrderService sysOrderService;

	public boolean savePersonalCert(PersonalCertDto personalCertDto,
			LoginUserInfoDto loginUserInfoDto) {

		// 判断当前用户是否具有可用的服务，如果是，服务次数减1
		SysOrderDto dto = new SysOrderDto();
		dto.setService1Remains(new Long(1));
		LoginUserInfoDto userInfo = loginUserInfoDto;
		if (sysOrderService.verifyAuthority(dto, userInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_HANGCARD_CODE, "1", 1)) {
			certificateDao.savePersonalCert(personalCertDto);
			return true;
		}
		return false;
	}

	public boolean saveCertNeeds(CertNeedsDto certNeedsDto,
			LoginUserInfoDto loginUserInfoDto) {

		// 判断服务是否已到期
		SysOrderDto dto = new SysOrderDto();
		dto.setService2Remains(new Long(1));
		LoginUserInfoDto userInfo = loginUserInfoDto;
		if (sysOrderService.verifyAuthority(dto, userInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_HUNTCARD_CODE, "2", 1)) {
			certificateDao.saveCertNeeds(certNeedsDto);
			return true;
		}

		return false;
	}

	public List<PersonalCertVo> queryPersonalCertList() {

		return certificateDao.queryPersonalCertList();
	}

	public List<PersonalCertVo> queryPersonalCertPaginatedList(
			PageInfo pageInfo, PersonalCertDto personalCertDto) {
		return certificateDao.queryPersonalCertPaginatedList(pageInfo,
				personalCertDto);
	}

	public List<PersonalCertVo> searchCertList4PersonalCenter(
			PageInfo pageInfo, Map<String, String> personalCertMap) {
		return certificateDao.searchCertList4PersonalCenter(pageInfo,
				personalCertMap);
	}

	public List<CertNeedsVo> searchCertNeedsList4EnterpriseCenter(
			PageInfo pageInfo, Map<String, String> certNeedsMap) {
		return certificateDao.searchCertNeedsList4EnterpriseCenter(pageInfo,
				certNeedsMap);
	}

	public Integer searchCertNeedsCount4EnterpriseCenter(
			Map<String, String> certNeedsMap) {
		return certificateDao
				.searchCertNeedsCount4EnterpriseCenter(certNeedsMap);
	}

	public List<CertNeedsVo> queryCertNeedsList(String isIndeed) {
		return certificateDao.queryCertNeedsList(isIndeed);
	}

	/**
	 * 今日新增证书需求 统计
	 */
	public int getCountOfCertNeedsToday(Date today) {
		return certificateDao.getCountOfCertNeedsToday(today);
	}

	public List<CertNeedsVo> queryCertNeedsPaginatedList(PageInfo pageInfo,
			CertNeedsDto certNeedsDto) {
		return certificateDao.queryCertNeedsPaginatedList(pageInfo,
				certNeedsDto);
	}

	public PersonalCertVo getPersonalCertById(Long id) {
		return certificateDao.getPersonalCertById(id);
	}

	public CertNeedsVo getCertNeedsById(Long id) {
		return certificateDao.getCertNeedsById(id);
	}

	public void deleteCertNeeds(String ids) {
		certificateDao.deleteCertNeeds(ids);
	}

	public void updateCertNeeds(CertNeedsDto certNeedsDto) {
		certificateDao.updateCertNeeds(certNeedsDto);
	}

	public void deletePersonalCert(String ids) {
		certAccessHistoryDao.deleteCertAccessHistoryByPersonalCertId(ids);
		certificateDao.deletePersonalCert(ids);
	}

	public void updatePersonalCert(PersonalCertDto personalCertDto) {

		certificateDao.updatePersonalCert(personalCertDto);
	}

	public void saveCollectCert(CollectCertDto collectCertDto) {
		certificateDao.saveCollectCert(collectCertDto);
	}

	public void deleteCollectCert(Long id) {
		certificateDao.deleteCollectCert(id);
	}

	public void updateCollectCert(CollectCertDto collectCertDto) {
		certificateDao.updateCollectCert(collectCertDto);
	}

	public List<CollectCertVo> queryCollectCertList(Long collectorID) {
		return certificateDao.queryCollectCertList(collectorID);
	}

	public CollectCertVo getCollectCertById(Long id) {
		return certificateDao.getCollectCertById(id);
	}

	public void saveHotCert(HotCertDto hotCertDto) {
		certificateDao.saveHotCert(hotCertDto);
	}

	public void deleteHotCert(Long id) {
		certificateDao.deleteHotCert(id);
	}

	public List<HotCertVo> queryHotCertList() {
		return certificateDao.queryHotCertList();
	}

	public List<CertVerifyInfoDto> queryCertVerifyInfoList() {
		return certificateDao.queryCertVerifyInfoList();
	}

	public void editCertAttachStatus(Map<String, Object> personalCertMap) {
		certificateDao.editCertAttachStatus(personalCertMap);
	}

	public void editCertNeedsStatus(Map<String, Object> certNeedsMap) {
		certificateDao.editCertNeedsStatus(certNeedsMap);
	}

	public void extendsExpDate(Map<String, String> certNeedsMap) {
		certificateDao.extendsExpDate(certNeedsMap);
	}

	public void republishCertNeeds(Map<String, String> certNeedsMap) {
		certificateDao.republishCertNeeds(certNeedsMap);
	}

	public ICertificateDao getCertificateDao() {
		return certificateDao;
	}

	public void setCertificateDao(ICertificateDao certificateDao) {
		this.certificateDao = certificateDao;
	}

	/**
	 * @return the certAccessHistoryDao
	 */
	public ICertAccessHistoryDao getCertAccessHistoryDao() {
		return certAccessHistoryDao;
	}

	/**
	 * @param certAccessHistoryDao
	 *            the certAccessHistoryDao to set
	 */
	public void setCertAccessHistoryDao(
			ICertAccessHistoryDao certAccessHistoryDao) {
		this.certAccessHistoryDao = certAccessHistoryDao;
	}


	public Integer queryDuplicatedPersonalCertCount(
			PersonalCertDto personalCertDto) {
		return certificateDao.queryDuplicatedPersonalCertCount(personalCertDto);
	}

	public Integer queryDuplicatedCertNeedsCount(CertNeedsDto certNeedsDto) {
		return certificateDao.queryDuplicatedCertNeedsCount(certNeedsDto);
	}

	public List<Long> queryDuplicatedCertNeedsIdList(CertNeedsDto certNeedsDto) {
		return certificateDao.queryDuplicatedCertNeedsIdList(certNeedsDto);
	}

	public List<Long> queryDuplicatedPersonalCertIdList(
			PersonalCertDto personalCertDto) {
		return certificateDao
				.queryDuplicatedPersonalCertIdList(personalCertDto);
	}

	public List<CertNeedsVo> queryRelatedCertNeedsList(PageInfo pageInfo,
			CertNeedsDto certNeedsDto) {
		return certificateDao.queryRelatedCertNeedsList(pageInfo, certNeedsDto);
	}

	public ISysOrderService getSysOrderService() {
		return sysOrderService;
	}

	public void setSysOrderService(ISysOrderService sysOrderService) {
		this.sysOrderService = sysOrderService;
	}

}
