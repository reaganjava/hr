package com.dotoyo.buildjob.sys.service;

import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysRoleDto;
import com.dotoyo.buildjob.sys.dto.SysUserDto;
import com.dotoyo.buildjob.sys.dto.SysUserRoleDto;

/**
 * 会员角色维护
 * @author wisdy.xiao
 *
 */
public interface ISysUserRoleService {
	/**
	 * 增加会员角色
	 * @param dto
	 */
	public void add(SysUserRoleDto dto);
	/**
	 * 删除会员角色
	 * @param dto
	 */
	public void remove(SysUserRoleDto dto);
	/**
	 * 查询会员角色
	 * @param dto
	 * @return
	 */
	public SysUserRoleDto search(SysUserRoleDto dto);
	/**
	 * 查询会员角色list
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysUserDto> searchList(PageInfo pageInfo,SysUserDto dto);
	/**
	 * 更新会员角色
	 * @param dto
	 */
	public void update(SysUserRoleDto dto);
	/**
	 * 查询会员管理-会员list
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysUserDto> searchMemberList(PageInfo pageInfo,SysUserDto dto);
	/**
	 * 查询会员
	 * @param dto
	 * @return
	 */
	public SysUserDto search(SysUserDto dto);
	/**
	 * 更新会员
	 * @param dto
	 */
	public int update(SysUserDto dto);
	/**
	 * 查询会员角色list
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysRoleDto> searchRoleList(PageInfo pageInfo,SysUserDto dto);
	/**
	 * 重置会员密码
	 * @param dto
	 */
	public void updatePassword(SysUserDto dto);
	
	/**
	 * 新增个人会员数据统计
	 */
	public int getCountOfSysMemberToDayRegister(String userType);

	/**
	 * 个人会员 数据加载
	 */
	public List<SysUserDto> queryIndividualMemberList(PageInfo pageInfo,Map paramMap);
	
	/**
	 * 企业会员数据加载 
	 */
	public List<SysUserDto> queryCorporateMember(PageInfo pageInfo,Map paramMap);
}
