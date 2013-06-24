package com.dotoyo.buildjob.sys.dao;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysRoleDto;
import com.dotoyo.buildjob.sys.dto.SysUserDto;
import com.dotoyo.buildjob.sys.dto.SysUserRoleDto;

/**
 * 管理员角色维护
 * @author wisdy.xiao
 *
 */
public interface ISysUserRoleAdminDao {
	/**
	 * 增加管理员角色
	 * @param dto
	 */
	public void add(SysUserRoleDto dto);
	/**
	 * 删除管理员角色
	 * @param dto
	 */
	public void remove(SysUserRoleDto dto);
	/**
	 * 查询管理员角色
	 * @param dto
	 * @return
	 */
	public SysUserRoleDto search(SysUserRoleDto dto);
	/**
	 * 查询管理员list带角色确认
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysUserDto> searchList(PageInfo pageInfo,SysUserDto dto);
	/**
	 * 更新管理员角色
	 * @param dto
	 */
	public void update(SysUserRoleDto dto);
	/**
	 * 查询管理员管理-管理员list
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysUserDto> searchMemberList(PageInfo pageInfo,SysUserDto dto,String defaultUserName);
	/**
	 * 查询管理员
	 * @param dto
	 * @return
	 */
	public SysUserDto search(SysUserDto dto);
	/**
	 * 更新管理员  积分, 状态
	 * @param dto
	 */
	public void update(SysUserDto dto);

	/**
	 * 重置管理员密码
	 * @param dto
	 */
	public void updatePassword(SysUserDto dto);

	/**
	 * 查询管理员角色list
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysRoleDto> searchRoleList(PageInfo pageInfo,SysUserDto dto);
	/**
	 * 获取管理员信息
	 * @param dto
	 * @return
	 */
	public SysUserDto getUserByUserNameAndPasswordAdmin(SysUserDto dto);
	/**
	 * 增加管理员
	 * @param dto
	 */
	public void addAdminUser(SysUserDto dto);
	/**
	 * 删除管理员
	 * @param dto
	 */
	public void removeAdminUser(SysUserDto dto);
}
