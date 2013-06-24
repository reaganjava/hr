package com.dotoyo.buildjob.sys.service;

import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.applyJobCenter.dto.ApplyJobInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.headhunterCenter.dto.ApplicationJobRecordDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-25
 * @description
 */
public interface IApplyJobAdminService {
	public List<ApplyJobInfoDto> queryApplyJobList4Admin(PageInfo pageInfo,
			Map<String, String> applyJobMap);

	public Integer queryApplyJobCount4Admin(Map<String, String> applyJobMap);

	public List<ApplicationJobRecordDto> queryApplyJobRecordList4Admin(
			PageInfo pageInfo, Map<String, String> recordMap);

}
