package com.dotoyo.buildjob.common.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dao.IOfflineSearchResultDao;
import com.dotoyo.buildjob.common.dto.OfflineSearchResultDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-3-2
 * @description
 */
public class OfflineSearchResultDaoImpl implements IOfflineSearchResultDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void saveOfflineSearchResult(
			OfflineSearchResultDto offlineSearchResultDto) {
		sqlMapClientTemplate.insert("saveOfflineSearchResult",
				offlineSearchResultDto);

	}

	public void deleteOfflineSearchResult(String ids) {
		sqlMapClientTemplate.delete("deleteOfflineSearchResult", ids);

	}

	@SuppressWarnings("unchecked")
	public List<OfflineSearchResultDto> queryOfflineSearchResultList(
			PageInfo pageInfo, OfflineSearchResultDto offlineSearchResultDto) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryOfflineSearchResultCount",
				"queryOfflineSearchResultList", offlineSearchResultDto);
	}

	public OfflineSearchResultDto getOfflineSearchResultById(Long id) {
		return (OfflineSearchResultDto) sqlMapClientTemplate.queryForObject(
				"getOfflineSearchResultById", id);
	}

	public void updateOfflineSearchResult(
			OfflineSearchResultDto offlineSearchResultDto) {
		sqlMapClientTemplate.update("updateOfflineSearchResult",
				offlineSearchResultDto);
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
