package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysIncrementTalentsFoundOfflineSettingDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundOfflineSettingDto;
import com.dotoyo.buildjob.sys.service.ISysIncrementTalentsFoundOfflineSettingService;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 增值服务人才挖掘设置接口
 */
public class SysIncrementTalentsFoundOfflineSettingServiceImpl implements
	ISysIncrementTalentsFoundOfflineSettingService {
	private ISysIncrementTalentsFoundOfflineSettingDao sysIncrementTalentsFoundOfflineSettingDao;
	
	public ISysIncrementTalentsFoundOfflineSettingDao getSysIncrementTalentsFoundOfflineSettingDao() {
		return sysIncrementTalentsFoundOfflineSettingDao;
	}

	public void setSysIncrementTalentsFoundOfflineSettingDao(
			ISysIncrementTalentsFoundOfflineSettingDao sysIncrementTalentsFoundOfflineSettingDao) {
		this.sysIncrementTalentsFoundOfflineSettingDao = sysIncrementTalentsFoundOfflineSettingDao;
	}

	public int addIncrementTalentsFoundSetting(
			SysIncrementTalentsFoundOfflineSettingDto dto) {
		return sysIncrementTalentsFoundOfflineSettingDao.addIncrementTalentsFoundSetting(dto);
	}

	public SysIncrementTalentsFoundOfflineSettingDto queryIncrementTalentsFound(
			SysIncrementTalentsFoundOfflineSettingDto dto) {
		return sysIncrementTalentsFoundOfflineSettingDao.queryIncrementTalentsFound(dto);
	}

	public List<SysIncrementTalentsFoundOfflineSettingDto> queryIncrementTalentsFoundList(
			PageInfo pageInfo,SysIncrementTalentsFoundOfflineSettingDto dto) {
		return sysIncrementTalentsFoundOfflineSettingDao.queryIncrementTalentsFoundList(pageInfo,dto);
	}

	public int removeIncrementTalentsFoundSetting(
			SysIncrementTalentsFoundOfflineSettingDto dto) {
		return sysIncrementTalentsFoundOfflineSettingDao.removeIncrementTalentsFoundSetting(dto);
	}

	public int updateIncrementTalentsFoundSetting(
			SysIncrementTalentsFoundOfflineSettingDto dto) {
		return sysIncrementTalentsFoundOfflineSettingDao.updateIncrementTalentsFoundSetting(dto);
	}


}
