package com.dotoyo.buildjob.common.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.OfflineSearchResultDto;
import com.dotoyo.buildjob.common.dto.PageInfo;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-3-2
 * @description
 */
public interface IOfflineSearchResultService {
	/**
	 * 增加企业线下人才挖掘搜索记录
	 * 
	 * @param offlineSearchResultDto
	 */
	public void saveOfflineSearchResult(
			OfflineSearchResultDto offlineSearchResultDto);

	/**
	 * 批量删除企业线下人才挖掘搜索记录
	 * 
	 * @param ids
	 */
	public void deleteOfflineSearchResult(String ids);

	/**
	 * 加载企业线下人才挖掘搜索记录列表
	 * 
	 * @param pageInfo
	 * @param offlineSearchResultDto
	 * @return
	 */
	public List<OfflineSearchResultDto> queryOfflineSearchResultList(
			PageInfo pageInfo, OfflineSearchResultDto offlineSearchResultDto);

	/**
	 * 加载企业线下人才挖掘搜索记录详细信息
	 * 
	 * @param id
	 * @return
	 */
	public OfflineSearchResultDto getOfflineSearchResultById(Long id);

	/**
	 * 更新企业线下人才挖掘搜索记录信息
	 * 
	 * @param offlineSearchResultDto
	 */
	public void updateOfflineSearchResult(
			OfflineSearchResultDto offlineSearchResultDto);
}
