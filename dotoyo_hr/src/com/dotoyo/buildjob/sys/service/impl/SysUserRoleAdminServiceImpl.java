package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysUserRoleAdminDao;
import com.dotoyo.buildjob.sys.dto.SysRoleDto;
import com.dotoyo.buildjob.sys.dto.SysUserDto;
import com.dotoyo.buildjob.sys.dto.SysUserRoleDto;
import com.dotoyo.buildjob.sys.service.ISysUserRoleAdminService;

public class SysUserRoleAdminServiceImpl implements ISysUserRoleAdminService {
	private ISysUserRoleAdminDao sysUserRoleAdminDao;

	public ISysUserRoleAdminDao getSysUserRoleAdminDao() {
		return sysUserRoleAdminDao;
	}

	public void setSysUserRoleAdminDao(ISysUserRoleAdminDao sysUserRoleAdminDao) {
		this.sysUserRoleAdminDao = sysUserRoleAdminDao;
	}

	public void add(SysUserRoleDto dto) {
		sysUserRoleAdminDao.add(dto);
	}

	public void remove(SysUserRoleDto dto) {
		sysUserRoleAdminDao.remove(dto);
	}

	public SysUserRoleDto search(SysUserRoleDto dto) {
		return sysUserRoleAdminDao.search(dto);
	}

	public List<SysUserDto> searchList(PageInfo pageInfo, SysUserDto dto) {
		return sysUserRoleAdminDao.searchList(pageInfo, dto);
	}

	public void update(SysUserRoleDto dto) {
		sysUserRoleAdminDao.update(dto);
	}

	public List<SysUserDto> searchMemberList(PageInfo pageInfo, SysUserDto dto,String defaultUserName) {
		return sysUserRoleAdminDao.searchMemberList(pageInfo, dto,defaultUserName);
	}

	public SysUserDto search(SysUserDto dto) {
		return sysUserRoleAdminDao.search(dto);
	}

	public void update(SysUserDto dto) {
		sysUserRoleAdminDao.update(dto);
	}

	public List<SysRoleDto> searchRoleList(PageInfo pageInfo, SysUserDto dto) {
		return sysUserRoleAdminDao.searchRoleList(pageInfo, dto);
	}

	public void updatePassword(SysUserDto dto) {
		sysUserRoleAdminDao.updatePassword(dto);
	}

	public void addAdminUser(SysUserDto dto) {
		sysUserRoleAdminDao.addAdminUser(dto);

	}

	public SysUserDto getUserByUserNameAndPasswordAdmin(SysUserDto dto) {
		return sysUserRoleAdminDao.getUserByUserNameAndPasswordAdmin(dto);
	}

	public void removeAdminUser(SysUserDto dto) {
		sysUserRoleAdminDao.removeAdminUser(dto);

	}

}
