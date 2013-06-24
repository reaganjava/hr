package com.dotoyo.buildjob.certificateCenter.util;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-1-26
 * @description
 */
public class CertificateUtil {
	private static SqlMapClientTemplate sqlMapClientTemplate;

	/**
	 * 根据个人证书ID查找浏览次数
	 * 
	 * @param certId
	 * @return
	 */
	public static Integer queryCertAccessHistoryCountByCertId(Long certId) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"queryCertAccessHistoryCountByCertId", certId);
	}

	/**
	 * 根据证书需求ID查找浏览次数
	 * 
	 * @param certNeedsId
	 * @return
	 */
	public static Integer queryCertNeedsAccessHistoryCountByCertNeedsId(
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
		CertificateUtil.sqlMapClientTemplate = sqlMapClientTemplate;
	}

}
