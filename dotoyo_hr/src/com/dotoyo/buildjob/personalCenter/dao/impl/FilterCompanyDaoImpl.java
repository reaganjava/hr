package com.dotoyo.buildjob.personalCenter.dao.impl;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.personalCenter.dao.IFilterCompanyDao;
import com.dotoyo.buildjob.personalCenter.dto.FilterCompanyDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-1-25
 * @description
 */
public class FilterCompanyDaoImpl implements IFilterCompanyDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void SaveFilterCompany(FilterCompanyDto filterCompanyDto) {
		sqlMapClientTemplate.insert("saveFilterCompany", filterCompanyDto);
	}

	public void updateFilterCompany(FilterCompanyDto filterCompanyDto) {
		sqlMapClientTemplate.update("updateFilterCompany", filterCompanyDto);
	}

	public FilterCompanyDto getFilterCompanyByUserId(Long userId) {

		return (FilterCompanyDto) sqlMapClientTemplate.queryForObject(
				"getFilterCompanyByUserId", userId);
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
