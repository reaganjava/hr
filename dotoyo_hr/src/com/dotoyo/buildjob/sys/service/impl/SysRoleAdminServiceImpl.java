package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysRoleAdminDao;
import com.dotoyo.buildjob.sys.dto.SysRoleDto;
import com.dotoyo.buildjob.sys.service.ISysRoleAdminService;

public class SysRoleAdminServiceImpl implements ISysRoleAdminService {
	private ISysRoleAdminDao sysRoleAdminDao;
	public ISysRoleAdminDao getSysRoleAdminDao() {
		return sysRoleAdminDao;
	}

	public void setSysRoleAdminDao(ISysRoleAdminDao sysRoleAdminDao) {
		this.sysRoleAdminDao = sysRoleAdminDao;
	}

	public void add(SysRoleDto dto) {
		sysRoleAdminDao.add(dto);
	}

	public void remove(SysRoleDto dto) {
		sysRoleAdminDao.remove(dto);
	}

	public SysRoleDto search(SysRoleDto dto) {
		return sysRoleAdminDao.search(dto);
	}

	public List<SysRoleDto> searchList(PageInfo pageInfo, SysRoleDto dto) {
		return sysRoleAdminDao.searchList(pageInfo, dto);
	}

	public void update(SysRoleDto dto) {
		sysRoleAdminDao.update(dto);
	}

}
