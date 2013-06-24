package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysFunctionDao;
import com.dotoyo.buildjob.sys.dto.SysFunctionDto;
import com.dotoyo.buildjob.sys.service.ISysFunctionService;

public class SysFunctionServiceImpl implements ISysFunctionService {
	private ISysFunctionDao sysFunctionDao;

	public ISysFunctionDao getSysFunctionDao() {
		return sysFunctionDao;
	}

	public void setSysFunctionDao(ISysFunctionDao sysFunctionDao) {
		this.sysFunctionDao = sysFunctionDao;
	}

	public void add(SysFunctionDto dto) {
		sysFunctionDao.add(dto);
	}

	public void remove(SysFunctionDto dto) {
		sysFunctionDao.remove(dto);
	}

	public SysFunctionDto search(SysFunctionDto dto) {
		return sysFunctionDao.search(dto);
	}

	public List<SysFunctionDto> searchList(PageInfo pageInfo, SysFunctionDto dto) {
		return sysFunctionDao.searchList(pageInfo, dto);
	}

	public void update(SysFunctionDto dto) {
		sysFunctionDao.update(dto);
	}

}
