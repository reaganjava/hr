package com.dotoyo.buildjob.sys.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysFunctionDto;
import com.dotoyo.buildjob.sys.dto.SysFunctionRoleDto;

/**
 * 功管理员能点角色映射维护
 * @author wisdy.xiao
 *
 */
public interface ISysFunctionRoleAdminService {
	/**
	 * 增加功能点角色映射
	 * @param dto
	 */
	public void add(SysFunctionRoleDto dto);
	/**
	 * 删除功能点角色映射
	 * @param dto
	 */
	public void remove(SysFunctionRoleDto dto);
	/**
	 * 查询功能点角色映射
	 * @param dto
	 * @return
	 */
	public SysFunctionRoleDto search(SysFunctionRoleDto dto);
	/**
	 * 查询功能点角色映射list
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysFunctionDto> searchList(PageInfo pageInfo,SysFunctionDto dto);
	/**
	 * 更新功能点角色映射
	 * @param dto
	 */
	public void update(SysFunctionRoleDto dto);
}
