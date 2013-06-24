package com.dotoyo.buildjob.personalCenter.dao;

import com.dotoyo.buildjob.personalCenter.dto.FilterCompanyDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-1-25
 * @description
 */
public interface IFilterCompanyDao {

	/**
	 * 增加屏蔽公司信息
	 * 
	 * @param filterCompanyDto
	 */
	public void SaveFilterCompany(FilterCompanyDto filterCompanyDto);

	/**
	 * 更新屏蔽公司信息
	 * 
	 * @param filterCompanyDto
	 */
	public void updateFilterCompany(FilterCompanyDto filterCompanyDto);

	/**
	 * 根据用户ID加载屏蔽公司信息
	 * 
	 * @param userId
	 * @return
	 */
	public FilterCompanyDto getFilterCompanyByUserId(Long userId);
}
