package com.dotoyo.buildjob.systemManage.service.impl;

import java.util.List;

import com.dotoyo.buildjob.systemManage.dao.IFilterWordsDao;
import com.dotoyo.buildjob.systemManage.dto.FilterWordsDto;
import com.dotoyo.buildjob.systemManage.service.IFilterWordsService;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-2
 * @description  
 * 
 */
public class FilterWordsServiceImpl implements IFilterWordsService {
	private IFilterWordsDao filterWordsDao;

	public void addFilterWord(FilterWordsDto filterWord) {
		filterWordsDao.addFilterWord(filterWord);
	}

	public int deleteFilterWords(String ids) {
		return filterWordsDao.deleteFilterWords(ids);
	}

	public int updateFilterWord(FilterWordsDto filterWord) {
		return filterWordsDao.updateFilterWord(filterWord);
	}
	
	public List<FilterWordsDto> queryFilterWordsList(){
		return filterWordsDao.queryFilterWordsList();
	}

	public void setFilterWordsDao(IFilterWordsDao filterWordsDao) {
		this.filterWordsDao = filterWordsDao;
	}

	public IFilterWordsDao getFilterWordsDao() {
		return filterWordsDao;
	}

}
