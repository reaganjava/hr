package com.dotoyo.buildjob.sys.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysFunctionDto;

/**
 * 功能点维护
 * @author wisdy.xiao
 *
 */
public interface ISysFunctionService {
	/**
	 * 增加功能点
	 * @param dto
	 */
	public void add(SysFunctionDto dto);
	/**
	 * 删除功能点
	 * @param dto
	 */
	public void remove(SysFunctionDto dto);
	/**
	 * 查询功能点
	 * @param dto
	 * @return
	 */
	public SysFunctionDto search(SysFunctionDto dto);
	/**
	 * 查询功能点list
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysFunctionDto> searchList(PageInfo pageInfo,SysFunctionDto dto);
	/**
	 * 更新功能点
	 * @param dto
	 */
	public void update(SysFunctionDto dto);
}
