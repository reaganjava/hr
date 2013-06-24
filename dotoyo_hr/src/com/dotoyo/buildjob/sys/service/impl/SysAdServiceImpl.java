package com.dotoyo.buildjob.sys.service.impl;

import java.text.ParseException;
import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysAdDao;
import com.dotoyo.buildjob.sys.dto.SysAdDto;
import com.dotoyo.buildjob.sys.service.ISysAdService;

public class SysAdServiceImpl implements ISysAdService {
	private ISysAdDao sysAdDao;
	public void add(SysAdDto dto) {
		sysAdDao.add(dto);
	}

	public void remove(SysAdDto dto) {
		sysAdDao.remove(dto);
	}

	public SysAdDto search(SysAdDto dto) {
		return sysAdDao.search(dto);
	}

	public List<SysAdDto> searchList(PageInfo pageInfo, SysAdDto dto)
			throws ParseException {
		return sysAdDao.searchList(pageInfo, dto);
	}

	public void update(SysAdDto dto) {
		sysAdDao.update(dto);
	}

	public ISysAdDao getSysAdDao() {
		return sysAdDao;
	}

	public void setSysAdDao(ISysAdDao sysAdDao) {
		this.sysAdDao = sysAdDao;
	}

	public void updateStatus(SysAdDto dto) {
		sysAdDao.updateStatus(dto);
	}
	
	public List<SysAdDto> queryAdForList(SysAdDto dto){
		return sysAdDao.queryAdForList(dto);
	}

	/**
	 * 热门城市 企业加载
	 */
	public List<SysAdDto> queryCitySiteHotEnterprises(SysAdDto dto){
		return sysAdDao.queryCitySiteHotEnterprises(dto);
	}
	

}
