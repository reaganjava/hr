package com.dotoyo.buildjob.personalCenter.service.impl;

import com.dotoyo.buildjob.personalCenter.dao.IFilterCompanyDao;
import com.dotoyo.buildjob.personalCenter.dto.FilterCompanyDto;
import com.dotoyo.buildjob.personalCenter.service.IFilterCompanyService;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-1-25
 * @description
 */
public class FilterCompanyServiceImpl implements IFilterCompanyService {
	private IFilterCompanyDao filterCompanyDao;

	public void SaveFilterCompany(FilterCompanyDto filterCompanyDto) {
		filterCompanyDao.SaveFilterCompany(filterCompanyDto);

	}

	public void updateFilterCompany(FilterCompanyDto filterCompanyDto) {
		filterCompanyDao.updateFilterCompany(filterCompanyDto);

	}

	public FilterCompanyDto getFilterCompanyByUserId(Long userId) {
		return filterCompanyDao.getFilterCompanyByUserId(userId);
	}

	/**
	 * @return the filterCompanyDao
	 */
	public IFilterCompanyDao getFilterCompanyDao() {
		return filterCompanyDao;
	}

	/**
	 * @param filterCompanyDao
	 *            the filterCompanyDao to set
	 */
	public void setFilterCompanyDao(IFilterCompanyDao filterCompanyDao) {
		this.filterCompanyDao = filterCompanyDao;
	}

}
