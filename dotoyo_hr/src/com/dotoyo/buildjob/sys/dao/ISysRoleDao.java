package com.dotoyo.buildjob.sys.dao;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysRoleDto;

/**
 * 角色维护
 * @author wisdy.xiao
 *
 */
public interface ISysRoleDao {
	/**
	 * 增加角色
	 * @param dto
	 */
	public void add(SysRoleDto dto);
	/**
	 * 删除角色
	 * @param dto
	 */
	public void remove(SysRoleDto dto);
	/**
	 * 查询角色
	 * @param dto
	 * @return
	 */
	public SysRoleDto search(SysRoleDto dto);
	/**
	 * 查询角色list
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysRoleDto> searchList(PageInfo pageInfo,SysRoleDto dto);
	/**
	 * 更新角色
	 * @param dto
	 */
	public void update(SysRoleDto dto);
}
