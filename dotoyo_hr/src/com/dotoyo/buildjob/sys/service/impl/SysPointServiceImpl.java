package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.sys.dao.ISysPointDao;
import com.dotoyo.buildjob.sys.dto.SysPointDto;
import com.dotoyo.buildjob.sys.service.ISysPointService;

public class SysPointServiceImpl implements ISysPointService {
	private ISysPointDao sysPointDao;
	public SysPointDto search(String code) {

		return sysPointDao.search(code);
	}

	public List<SysPointDto> searchList(PageInfo pageInfo, String action) {
		return sysPointDao.searchList(pageInfo, action);
	}

	public void update(SysPointDto dto) {
		sysPointDao.update(dto);
	}

	public ISysPointDao getSysPointDao() {
		return sysPointDao;
	}

	public void setSysPointDao(ISysPointDao sysPointDao) {
		this.sysPointDao = sysPointDao;
	}

	public List<LoginUserInfoDto> searchList(PageInfo pageInfo,
			String userName, String status,String point) {
		return sysPointDao.searchList(pageInfo, userName, status,point);
	}

	public void updateUserPoint(Long id, Long point) {
		sysPointDao.updateUserPoint(id, point);

	}

	public Long getPointValueByCode(String code) {
		return sysPointDao.getPointValueByCode(code);
	}

}
