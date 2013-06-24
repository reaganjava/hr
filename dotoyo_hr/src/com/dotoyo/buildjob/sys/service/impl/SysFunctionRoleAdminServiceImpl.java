package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysFunctionRoleAdminDao;
import com.dotoyo.buildjob.sys.dto.SysFunctionDto;
import com.dotoyo.buildjob.sys.dto.SysFunctionRoleDto;
import com.dotoyo.buildjob.sys.service.ISysFunctionRoleAdminService;

public class SysFunctionRoleAdminServiceImpl implements ISysFunctionRoleAdminService {
	private ISysFunctionRoleAdminDao sysFunctionRoleAdminDao;

	public ISysFunctionRoleAdminDao getSysFunctionRoleAdminDao() {
		return sysFunctionRoleAdminDao;
	}

	public void setSysFunctionRoleAdminDao(
			ISysFunctionRoleAdminDao sysFunctionRoleAdminDao) {
		this.sysFunctionRoleAdminDao = sysFunctionRoleAdminDao;
	}

	public void add(SysFunctionRoleDto dto) {
		sysFunctionRoleAdminDao.add(dto);

	}

	public void remove(SysFunctionRoleDto dto) {
		sysFunctionRoleAdminDao.remove(dto);
	}

	public SysFunctionRoleDto search(SysFunctionRoleDto dto) {
		return sysFunctionRoleAdminDao.search(dto);
	}

	public List<SysFunctionDto> searchList(PageInfo pageInfo, SysFunctionDto dto) {
		return sysFunctionRoleAdminDao.searchList(pageInfo, dto);
	}

	public void update(SysFunctionRoleDto dto) {
		sysFunctionRoleAdminDao.update(dto);

	}



}
