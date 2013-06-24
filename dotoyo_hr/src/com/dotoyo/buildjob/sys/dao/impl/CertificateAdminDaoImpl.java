package com.dotoyo.buildjob.sys.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsDto;
import com.dotoyo.buildjob.certificateCenter.dto.PersonalCertDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ICertificateAdminDao;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-22
 * @description
 */
public class CertificateAdminDaoImpl implements ICertificateAdminDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	@SuppressWarnings("unchecked")
	public List<CertNeedsDto> queryCertNeedsList4Admin(PageInfo pageInfo,
			Map<String, String> certNeedsMap) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryCertNeedsCount4Admin", "queryCertNeedsList4Admin",
				certNeedsMap);
	}

	@SuppressWarnings("unchecked")
	public List<PersonalCertDto> queryPersonalCertList4Admin(PageInfo pageInfo,
			Map<String, String> personalCertMap) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryPersonalCertCount4Admin", "queryPersonalCertList4Admin",
				personalCertMap);
	}

	/**
	 * @return the sqlMapClientTemplate
	 */
	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	/**
	 * @param sqlMapClientTemplate
	 *            the sqlMapClientTemplate to set
	 */
	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public CertNeedsDto getCertNeedsById4Admin(Long id) {
		return (CertNeedsDto) sqlMapClientTemplate.queryForObject(
				"getCertNeedsById4Admin", id);
	}

	public void editIndeedStatus(Map<String, String> certNeedsMap) {
		sqlMapClientTemplate.update("editIndeedStatus", certNeedsMap);

	}

	public PersonalCertDto getPersonalCertById4Admin(Long id) {
		// TODO Auto-generated method stub
		return (PersonalCertDto) sqlMapClientTemplate.queryForObject(
				"getPersonalCertById4Admin", id);
	}

	public Integer getCertNeedsCount() {
		return (Integer) sqlMapClientTemplate
				.queryForObject("getCertNeedsCount");
	}

	public Integer getPersonalCertCount() {
		return (Integer) sqlMapClientTemplate
				.queryForObject("getPersonalCertCount");
	}

	public Integer queryCertNeedsCount4Admin(Map<String, String> certNeedsMap) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"queryCertNeedsCount4Admin", certNeedsMap);
	}

	public Integer queryPersonalCertCount4Admin(
			Map<String, String> personalCertMap) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"queryPersonalCertCount4Admin", personalCertMap);
	}
}
