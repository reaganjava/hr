package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysUserRoleDao;
import com.dotoyo.buildjob.sys.dto.SysRoleDto;
import com.dotoyo.buildjob.sys.dto.SysUserDto;
import com.dotoyo.buildjob.sys.dto.SysUserRoleDto;
import com.dotoyo.buildjob.sys.service.ISysUserRoleService;

public class SysUserRoleServiceImpl implements ISysUserRoleService {
	private ISysUserRoleDao sysUserRoleDao;

	public ISysUserRoleDao getSysUserRoleDao() {
		return sysUserRoleDao;
	}

	public void setSysUserRoleDao(ISysUserRoleDao sysUserRoleDao) {
		this.sysUserRoleDao = sysUserRoleDao;
	}

	public void add(SysUserRoleDto dto) {
		sysUserRoleDao.add(dto);
	}

	public void remove(SysUserRoleDto dto) {
		sysUserRoleDao.remove(dto);
	}

	public SysUserRoleDto search(SysUserRoleDto dto) {
		return sysUserRoleDao.search(dto);
	}

	public List<SysUserDto> searchList(PageInfo pageInfo, SysUserDto dto) {
		return sysUserRoleDao.searchList(pageInfo, dto);
	}

	public void update(SysUserRoleDto dto) {
		sysUserRoleDao.update(dto);
	}

	public List<SysUserDto> searchMemberList(PageInfo pageInfo, SysUserDto dto) {
		return sysUserRoleDao.searchMemberList(pageInfo, dto);
	}

	public SysUserDto search(SysUserDto dto) {
		return sysUserRoleDao.search(dto);
	}

	public int update(SysUserDto dto) {
		return sysUserRoleDao.update(dto);
	}

	public List<SysRoleDto> searchRoleList(PageInfo pageInfo, SysUserDto dto) {
		return sysUserRoleDao.searchRoleList(pageInfo, dto);
	}

	public void updatePassword(SysUserDto dto) {
		sysUserRoleDao.updatePassword(dto);
	}
	
	/**
	 * 新增个人会员数据统计
	 */
	public int getCountOfSysMemberToDayRegister(String userType){
		return sysUserRoleDao.getCountOfSysMemberToDayRegister(userType);
	}

	/**
	 * 个人会员 数据加载
	 */
	public List<SysUserDto> queryIndividualMemberList(PageInfo pageInfo,Map paramMap){
		return sysUserRoleDao.queryIndividualMemberList(pageInfo, paramMap);
	}
	
	/**
	 * 企业会员数据加载 
	 */
	public List<SysUserDto> queryCorporateMember(PageInfo pageInfo,Map paramMap){
		return sysUserRoleDao.queryCorporateMember(pageInfo, paramMap);
	}

}
