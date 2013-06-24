package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.applyJobCenter.dto.ApplyJobInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.headhunterCenter.dto.ApplicationJobRecordDto;
import com.dotoyo.buildjob.sys.dao.IApplyJobAdminDao;
import com.dotoyo.buildjob.sys.service.IApplyJobAdminService;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-25
 * @description
 */
public class ApplyJobAdminServiceImpl implements IApplyJobAdminService {

	private IApplyJobAdminDao applyJobAdminDao;

	public List<ApplyJobInfoDto> queryApplyJobList4Admin(PageInfo pageInfo,
			Map<String, String> applyJobMap) {
		return applyJobAdminDao.queryApplyJobList4Admin(pageInfo, applyJobMap);
	}

	public Integer queryApplyJobCount4Admin(Map<String, String> applyJobMap) {
		return applyJobAdminDao.queryApplyJobCount4Admin(applyJobMap);
	}

	/**
	 * @return the applyJobAdminDao
	 */
	public IApplyJobAdminDao getApplyJobAdminDao() {
		return applyJobAdminDao;
	}

	/**
	 * @param applyJobAdminDao
	 *            the applyJobAdminDao to set
	 */
	public void setApplyJobAdminDao(IApplyJobAdminDao applyJobAdminDao) {
		this.applyJobAdminDao = applyJobAdminDao;
	}

	public List<ApplicationJobRecordDto> queryApplyJobRecordList4Admin(
			PageInfo pageInfo, Map<String, String> recordMap) {
		return applyJobAdminDao.queryApplyJobRecordList4Admin(pageInfo,
				recordMap);
	}

}
