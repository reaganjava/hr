package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysRoleDao;
import com.dotoyo.buildjob.sys.dto.SysRoleDto;
import com.dotoyo.buildjob.sys.service.ISysRoleService;

public class SysRoleServiceImpl implements ISysRoleService {
	private ISysRoleDao sysRoleDao;

	public ISysRoleDao getSysRoleDao() {
		return sysRoleDao;
	}

	public void setSysRoleDao(ISysRoleDao sysRoleDao) {
		this.sysRoleDao = sysRoleDao;
	}

	public void add(SysRoleDto dto) {
		sysRoleDao.add(dto);
	}

	public void remove(SysRoleDto dto) {
		sysRoleDao.remove(dto);
	}

	public SysRoleDto search(SysRoleDto dto) {
		return sysRoleDao.search(dto);
	}

	public List<SysRoleDto> searchList(PageInfo pageInfo, SysRoleDto dto) {
		return sysRoleDao.searchList(pageInfo, dto);
	}

	public void update(SysRoleDto dto) {
		sysRoleDao.update(dto);
	}

}
