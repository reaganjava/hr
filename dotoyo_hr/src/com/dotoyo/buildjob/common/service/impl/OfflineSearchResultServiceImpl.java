package com.dotoyo.buildjob.common.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dao.IOfflineSearchResultDao;
import com.dotoyo.buildjob.common.dto.OfflineSearchResultDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.service.IOfflineSearchResultService;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-3-2
 * @description
 */
public class OfflineSearchResultServiceImpl implements
		IOfflineSearchResultService {

	private IOfflineSearchResultDao offlineSearchResultDao;

	public void saveOfflineSearchResult(
			OfflineSearchResultDto offlineSearchResultDto) {
		offlineSearchResultDao.saveOfflineSearchResult(offlineSearchResultDto);

	}

	public void deleteOfflineSearchResult(String ids) {
		offlineSearchResultDao.deleteOfflineSearchResult(ids);

	}

	public List<OfflineSearchResultDto> queryOfflineSearchResultList(
			PageInfo pageInfo, OfflineSearchResultDto offlineSearchResultDto) {
		return offlineSearchResultDao.queryOfflineSearchResultList(pageInfo,
				offlineSearchResultDto);
	}

	public void updateOfflineSearchResult(
			OfflineSearchResultDto offlineSearchResultDto) {
		offlineSearchResultDao
				.updateOfflineSearchResult(offlineSearchResultDto);
	}

	public OfflineSearchResultDto getOfflineSearchResultById(Long id) {
		return offlineSearchResultDao.getOfflineSearchResultById(id);
	}

	/**
	 * @return the offlineSearchResultDao
	 */
	public IOfflineSearchResultDao getOfflineSearchResultDao() {
		return offlineSearchResultDao;
	}

	/**
	 * @param offlineSearchResultDao
	 *            the offlineSearchResultDao to set
	 */
	public void setOfflineSearchResultDao(
			IOfflineSearchResultDao offlineSearchResultDao) {
		this.offlineSearchResultDao = offlineSearchResultDao;
	}

}
