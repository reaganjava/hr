package com.dotoyo.buildjob.sys.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.applyJobCenter.dto.ApplyJobInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.headhunterCenter.dto.ApplicationJobRecordDto;
import com.dotoyo.buildjob.sys.dao.IApplyJobAdminDao;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-25
 * @description
 */
public class ApplyJobAdminDaoImpl implements IApplyJobAdminDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	@SuppressWarnings("unchecked")
	public List<ApplyJobInfoDto> queryApplyJobList4Admin(PageInfo pageInfo,
			Map<String, String> applyJobMap) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryApplyJobCount4Admin", "queryApplyJobList4Admin",
				applyJobMap);
	}

	public Integer queryApplyJobCount4Admin(Map<String, String> applyJobMap) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"queryApplyJobCount4Admin", applyJobMap);
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

	@SuppressWarnings("unchecked")
	public List<ApplicationJobRecordDto> queryApplyJobRecordList4Admin(
			PageInfo pageInfo, Map<String, String> RecordMap) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryApplyJobRecordCount4Admin",
				"queryApplyJobRecordList4Admin", RecordMap);
	}

}
