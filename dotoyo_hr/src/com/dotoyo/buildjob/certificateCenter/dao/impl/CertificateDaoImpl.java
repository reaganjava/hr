package com.dotoyo.buildjob.certificateCenter.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.certificateCenter.dao.ICertificateDao;
import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsDto;
import com.dotoyo.buildjob.certificateCenter.dto.CertVerifyInfoDto;
import com.dotoyo.buildjob.certificateCenter.dto.CollectCertDto;
import com.dotoyo.buildjob.certificateCenter.dto.HotCertDto;
import com.dotoyo.buildjob.certificateCenter.dto.PersonalCertDto;
import com.dotoyo.buildjob.certificateCenter.vo.CertNeedsVo;
import com.dotoyo.buildjob.certificateCenter.vo.CollectCertVo;
import com.dotoyo.buildjob.certificateCenter.vo.HotCertVo;
import com.dotoyo.buildjob.certificateCenter.vo.PersonalCertVo;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2010-11-30
 * @description
 */
public class CertificateDaoImpl implements ICertificateDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void savePersonalCert(PersonalCertDto personalCertDto) {

		sqlMapClientTemplate.insert("savePersonalCert", personalCertDto);
	}

	public void saveCertNeeds(CertNeedsDto certNeedsDto) {

		sqlMapClientTemplate.insert("saveCertNeeds", certNeedsDto);
	}

	@SuppressWarnings("unchecked")
	public List<PersonalCertVo> queryPersonalCertList() {

		return sqlMapClientTemplate.queryForList("queryPersonalCertList", 0,
				ApplicationConstant.CERTCTR_LATESTCERTLIST_MAX_RESULT);
	}

	public Integer queryDuplicatedCertNeedsCount(CertNeedsDto certNeedsDto) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"queryDuplicatedCertNeedsCount", certNeedsDto);
	}

	@SuppressWarnings("unchecked")
	public List<Long> queryDuplicatedPersonalCertIdList(
			PersonalCertDto personalCertDto) {
		return sqlMapClientTemplate.queryForList(
				"queryDuplicatedPersonalCertIdList", personalCertDto);
	}

	@SuppressWarnings("unchecked")
	public List<Long> queryDuplicatedCertNeedsIdList(CertNeedsDto certNeedsDto) {
		return sqlMapClientTemplate.queryForList(
				"queryDuplicatedCertNeedsIdList", certNeedsDto);
	}

	public Integer queryDuplicatedPersonalCertCount(
			PersonalCertDto personalCertDto) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"queryDuplicatedPersonalCertCount", personalCertDto);
	}

	@SuppressWarnings("unchecked")
	public List<PersonalCertVo> searchCertList4PersonalCenter(
			PageInfo pageInfo, Map<String, String> personalCertMap) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"searchCountCert4PersonalCenter",
				"searchCertList4PersonalCenter", personalCertMap);
	}

	@SuppressWarnings("unchecked")
	public List<CertNeedsVo> searchCertNeedsList4EnterpriseCenter(
			PageInfo pageInfo, Map<String, String> certNeedsMap) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"searchCertNeedsCount4EnterpriseCenter",
				"searchCertNeedsList4EnterpriseCenter", certNeedsMap);
	}

	public Integer searchCertNeedsCount4EnterpriseCenter(
			Map<String, String> certNeedsMap) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"searchCertNeedsCount4EnterpriseCenter", certNeedsMap);
	}

	@SuppressWarnings("unchecked")
	public List<PersonalCertVo> queryPersonalCertPaginatedList(
			PageInfo pageInfo, PersonalCertDto personalCertDto) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryPersonalCertCount", "queryPersonalCertPaginatedList",
				personalCertDto);
	}

	@SuppressWarnings("unchecked")
	public List<CertNeedsVo> queryCertNeedsList(String isIndeed) {
		return sqlMapClientTemplate.queryForList("queryCertNeedsList",
				isIndeed, 0,
				ApplicationConstant.CERTCTR_LATESTNEEDSLIST_MAX_RESULT);
	}

	/**
	 * 今日新增证书需求 统计
	 */
	public int getCountOfCertNeedsToday(Date today) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"getCountOfCertNeedsToday", today);
	}

	@SuppressWarnings("unchecked")
	public List<CertNeedsVo> queryCertNeedsPaginatedList(PageInfo pageInfo,
			CertNeedsDto certNeedsDto) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryCertNeedsCount", "queryCertNeedsPaginatedList",
				certNeedsDto);
	}

	public PersonalCertVo getPersonalCertById(Long id) {

		return (PersonalCertVo) sqlMapClientTemplate.queryForObject(
				"getPersonalCertById", id);
	}

	public CertNeedsVo getCertNeedsById(Long id) {

		return (CertNeedsVo) sqlMapClientTemplate.queryForObject(
				"getCertNeedsById", id);
	}

	public void deleteCertNeeds(String ids) {
		sqlMapClientTemplate.delete("deleteCertNeeds", ids);
	}

	public void updateCertNeeds(CertNeedsDto certNeedsDto) {
		sqlMapClientTemplate.update("updateCertNeeds", certNeedsDto);
	}

	public void deletePersonalCert(String ids) {
		sqlMapClientTemplate.delete("deletePersonalCert", ids);
	}

	public void updatePersonalCert(PersonalCertDto personalCertDto) {
		sqlMapClientTemplate.update("updatePersonalCert", personalCertDto);
	}

	public void saveCollectCert(CollectCertDto collectCertDto) {
		sqlMapClientTemplate.insert("saveCollectCert", collectCertDto);
	}

	public void deleteCollectCert(Long id) {
		sqlMapClientTemplate.delete("deleteCollectCert", id);
	}

	public void updateCollectCert(CollectCertDto collectCertDto) {
		sqlMapClientTemplate.update("updateCollcetCert", collectCertDto);
	}

	@SuppressWarnings("unchecked")
	public List<CollectCertVo> queryCollectCertList(Long collectorID) {
		return sqlMapClientTemplate.queryForList("queryCollectCertList",
				collectorID);
	}

	public CollectCertVo getCollectCertById(Long id) {
		return (CollectCertVo) sqlMapClientTemplate.queryForObject(
				"getCollectCertById", id);
	}

	public void saveHotCert(HotCertDto hotCertDto) {
		sqlMapClientTemplate.insert("saveHotCert", hotCertDto);
	}

	public void deleteHotCert(Long id) {
		sqlMapClientTemplate.delete("deleteHotCert", id);
	}

	@SuppressWarnings("unchecked")
	public List<HotCertVo> queryHotCertList() {
		return sqlMapClientTemplate.queryForList("queryHotCertList", 0, 16);
	}

	@SuppressWarnings("unchecked")
	public List<CertVerifyInfoDto> queryCertVerifyInfoList() {
		return sqlMapClientTemplate.queryForList("queryCertVerifyInfoList");
	}

	public void editCertAttachStatus(Map<String, Object> personalCertMap) {
		sqlMapClientTemplate.update("editCertAttachStatus", personalCertMap);
	}

	public void editCertNeedsStatus(Map<String, Object> certNeedsMap) {
		sqlMapClientTemplate.update("editCertNeedsStatus", certNeedsMap);
	}

	public void extendsExpDate(Map<String, String> certNeedsMap) {
		sqlMapClientTemplate.update("extendsExpDate", certNeedsMap);
	}

	public void republishCertNeeds(Map<String, String> certNeedsMap) {
		sqlMapClientTemplate.update("republishCertNeeds", certNeedsMap);
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	@SuppressWarnings("unchecked")
	public List<CertNeedsVo> queryRelatedCertNeedsList(PageInfo pageInfo,
			CertNeedsDto certNeedsDto) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryRelatedCertNeedsCount", "queryRelatedCertNeedsList",
				certNeedsDto);
	}

}
