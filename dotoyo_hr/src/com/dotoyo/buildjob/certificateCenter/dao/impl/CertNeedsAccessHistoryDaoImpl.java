package com.dotoyo.buildjob.certificateCenter.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.certificateCenter.dao.ICertNeedsAccessHistoryDao;
import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsAccessHistoryDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-14
 * @description
 */
public class CertNeedsAccessHistoryDaoImpl implements
		ICertNeedsAccessHistoryDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void saveCertNeedsAccessHistory(
			CertNeedsAccessHistoryDto certNeedsAccessHistoryDto) {
		sqlMapClientTemplate.insert("saveCertNeedsAccessHistory",
				certNeedsAccessHistoryDto);

	}

	public void deleteCertNeedsAccessHistory(Long id) {
		sqlMapClientTemplate.delete("deleteCertNeedsAccessHistory", id);

	}

	public void deleteCertNeedsAccessHistoryCertNeedsId(String ids) {
		sqlMapClientTemplate.delete("deleteCertNeedsAccessHistoryCertNeedsId",
				ids);

	}

	@SuppressWarnings("unchecked")
	public List<CertNeedsAccessHistoryDto> queryCertNeedsAccessHistoryByCertNeedsId(
			Long certNeedsId) {
		return sqlMapClientTemplate.queryForList(
				"queryCertNeedsAccessHistoryByCertNeedsId", certNeedsId);
	}

	public Integer queryCertNeedsAccessHistoryCountByCertNeedsId(
			Long certNeedsId) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"queryCertNeedsAccessHistoryCountByCertNeedsId", certNeedsId);
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

}
