package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysIncrementAdvertSettingDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementAdvertSettingDto;
import com.dotoyo.buildjob.sys.service.ISysIncrementAdvertSettingService;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 增值服务广告位服务设置接口
 */
public class SysIncrementAdvertSettingServiceImpl implements
	ISysIncrementAdvertSettingService {
	private ISysIncrementAdvertSettingDao sysIncrementAdvertSettingDao;

	public ISysIncrementAdvertSettingDao getSysIncrementAdvertSettingDao() {
		return sysIncrementAdvertSettingDao;
	}

	public void setSysIncrementAdvertSettingDao(
			ISysIncrementAdvertSettingDao sysIncrementAdvertSettingDao) {
		this.sysIncrementAdvertSettingDao = sysIncrementAdvertSettingDao;
	}

	public int addIncrementAdvertSetting(
			SysIncrementAdvertSettingDto dto) {
		return sysIncrementAdvertSettingDao.addIncrementAdvertSetting(dto);
	}

	public SysIncrementAdvertSettingDto queryIncrementAdvert(
			SysIncrementAdvertSettingDto dto) {
		return sysIncrementAdvertSettingDao.queryIncrementAdvert(dto);
	}

	public List<SysIncrementAdvertSettingDto> queryIncrementAdvertList(
			PageInfo pageInfo,SysIncrementAdvertSettingDto dto) {
		return sysIncrementAdvertSettingDao.queryIncrementAdvertList(pageInfo,dto);
	}

	public int removeIncrementAdvertSetting(
			SysIncrementAdvertSettingDto dto) {
		return sysIncrementAdvertSettingDao.removeIncrementAdvertSetting(dto);
	}

	public int updateIncrementAdvertSetting(
			SysIncrementAdvertSettingDto dto) {
		return sysIncrementAdvertSettingDao.updateIncrementAdvertSetting(dto);
	}


}
