package com.dotoyo.buildjob.certificateCenter.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.certificateCenter.dao.ICertAccessHistoryDao;
import com.dotoyo.buildjob.certificateCenter.dto.CertAccessHistoryDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-1-26
 * @description
 */
public class CertAccessHistoryDaoImpl implements ICertAccessHistoryDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void saveCertAccessHistory(CertAccessHistoryDto certAccessHistoryDto) {
		sqlMapClientTemplate.insert("saveCertAccessHistory",
				certAccessHistoryDto);

	}

	public void deleteCertAccessHistory(Long id) {
		sqlMapClientTemplate.delete("deleteCertAccessHistory", id);

	}

	public void deleteCertAccessHistoryByPersonalCertId(String ids) {
		sqlMapClientTemplate.delete("deleteCertAccessHistoryByPersonalCertId",
				ids);
	}

	@SuppressWarnings("unchecked")
	public List<CertAccessHistoryDto> queryCertAccessHistoryByCertId(Long certId) {
		return sqlMapClientTemplate.queryForList(
				"queryCertAccessHistoryByCertId", certId);
	}

	public Integer queryCertAccessHistoryCountByCertId(Long certId) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"queryCertAccessHistoryCountByCertId", certId);
	}
	
	@SuppressWarnings("unchecked")
	public List<CertAccessHistoryDto> queryCertAccessHistoryListByCertIdAndCompanyId(CertAccessHistoryDto certAccessHistoryDto){
		return sqlMapClientTemplate.queryForList("queryCertAccessHistoryListByCertIdAndCompanyId",certAccessHistoryDto);
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
