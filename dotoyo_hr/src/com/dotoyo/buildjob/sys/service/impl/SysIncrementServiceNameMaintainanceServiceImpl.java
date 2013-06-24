package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysIncrementServiceNameMaintainanceDao;
import com.dotoyo.buildjob.sys.dto.IncrementServiceDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementServiceNameMaintainanceDto;
import com.dotoyo.buildjob.sys.service.ISysIncrementServiceNameMaintainanceService;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-10
 * @description 增值服务名称维护实现
 */
public class SysIncrementServiceNameMaintainanceServiceImpl implements
		ISysIncrementServiceNameMaintainanceService {
	private ISysIncrementServiceNameMaintainanceDao sysIncrementServiceNameMaintainanceDao;

	public int addIncrementServiceName(
			SysIncrementServiceNameMaintainanceDto dto) {

		return sysIncrementServiceNameMaintainanceDao.addIncrementServiceName(dto);
	}

	public SysIncrementServiceNameMaintainanceDto queryIncrementSerivceName(
			SysIncrementServiceNameMaintainanceDto dto) {
		return sysIncrementServiceNameMaintainanceDao.queryIncrementSerivceName(dto);
	}

	public List<SysIncrementServiceNameMaintainanceDto> queryIncrementSerivceNameList(
			PageInfo pageInfo,SysIncrementServiceNameMaintainanceDto dto) {
		return sysIncrementServiceNameMaintainanceDao.queryIncrementSerivceNameList(pageInfo,dto);
	}
	public List<SysIncrementServiceNameMaintainanceDto> queryIncrementSerivceNameList(
			SysIncrementServiceNameMaintainanceDto dto) {
		return sysIncrementServiceNameMaintainanceDao.queryIncrementSerivceNameList(dto);
	}
	public int removeIncrementSerivceNameByCode(
			SysIncrementServiceNameMaintainanceDto dto) {
		return sysIncrementServiceNameMaintainanceDao.removeIncrementSerivceNameByCode(dto);
	}

	public int updateIncrementSerivceName(
			SysIncrementServiceNameMaintainanceDto dto) {
		return sysIncrementServiceNameMaintainanceDao.updateIncrementSerivceName(dto);
	}

	public ISysIncrementServiceNameMaintainanceDao getSysIncrementServiceNameMaintainanceDao() {
		return sysIncrementServiceNameMaintainanceDao;
	}

	public void setSysIncrementServiceNameMaintainanceDao(
			ISysIncrementServiceNameMaintainanceDao sysIncrementServiceNameMaintainanceDao) {
		this.sysIncrementServiceNameMaintainanceDao = sysIncrementServiceNameMaintainanceDao;
	}

	public List<IncrementServiceDto> queryHeadHunterServiceList(
			PageInfo pageInfo, IncrementServiceDto dto) {
		return sysIncrementServiceNameMaintainanceDao.queryHeadHunterServiceList(pageInfo, dto);
	}

}
