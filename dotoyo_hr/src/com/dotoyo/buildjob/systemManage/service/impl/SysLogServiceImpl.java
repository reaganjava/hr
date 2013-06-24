package com.dotoyo.buildjob.systemManage.service.impl;

import java.text.ParseException;
import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.systemManage.dao.ISysLogDao;
import com.dotoyo.buildjob.systemManage.dto.SysLogDto;
import com.dotoyo.buildjob.systemManage.service.ISysLogService;

public class SysLogServiceImpl implements ISysLogService {
	private ISysLogDao sysLogDao;
	public void addSysLog(SysLogDto dto) {
		sysLogDao.addSysLog(dto);
	}

	public List<SysLogDto> querySysLogList(PageInfo pageInfo, SysLogDto dto) throws ParseException {
		return sysLogDao.querySysLogList(pageInfo, dto);
	}

	public void removeSysLog(Long id) {
		sysLogDao.removeSysLog(id);
	}

	public ISysLogDao getSysLogDao() {
		return sysLogDao;
	}

	public void setSysLogDao(ISysLogDao sysLogDao) {
		this.sysLogDao = sysLogDao;
	}

}
