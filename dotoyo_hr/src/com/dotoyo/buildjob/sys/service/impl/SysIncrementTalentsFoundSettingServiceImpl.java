package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysIncrementTalentsFoundSettingDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundSettingDto;
import com.dotoyo.buildjob.sys.service.ISysIncrementTalentsFoundSettingService;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 增值服务人才挖掘设置接口
 */
public class SysIncrementTalentsFoundSettingServiceImpl implements
	ISysIncrementTalentsFoundSettingService {
	private ISysIncrementTalentsFoundSettingDao sysIncrementTalentsFoundSettingDao;

	public ISysIncrementTalentsFoundSettingDao getSysIncrementTalentsFoundSettingDao() {
		return sysIncrementTalentsFoundSettingDao;
	}

	public void setSysIncrementTalentsFoundSettingDao(
			ISysIncrementTalentsFoundSettingDao sysIncrementTalentsFoundSettingDao) {
		this.sysIncrementTalentsFoundSettingDao = sysIncrementTalentsFoundSettingDao;
	}

	public int addIncrementTalentsFoundSetting(
			SysIncrementTalentsFoundSettingDto dto) {
		return sysIncrementTalentsFoundSettingDao.addIncrementTalentsFoundSetting(dto);
	}

	public SysIncrementTalentsFoundSettingDto queryIncrementTalentsFound(
			SysIncrementTalentsFoundSettingDto dto) {
		return sysIncrementTalentsFoundSettingDao.queryIncrementTalentsFound(dto);
	}

	public List<SysIncrementTalentsFoundSettingDto> queryIncrementTalentsFoundList(
			PageInfo pageInfo,SysIncrementTalentsFoundSettingDto dto) {
		return sysIncrementTalentsFoundSettingDao.queryIncrementTalentsFoundList(pageInfo,dto);
	}

	public int removeIncrementTalentsFoundSetting(
			SysIncrementTalentsFoundSettingDto dto) {
		return sysIncrementTalentsFoundSettingDao.removeIncrementTalentsFoundSetting(dto);
	}

	public int updateIncrementTalentsFoundSetting(
			SysIncrementTalentsFoundSettingDto dto) {
		return sysIncrementTalentsFoundSettingDao.updateIncrementTalentsFoundSetting(dto);
	}


}
