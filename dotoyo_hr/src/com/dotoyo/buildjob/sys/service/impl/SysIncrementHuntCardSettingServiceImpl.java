package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysIncrementHuntCardSettingDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementHuntCardSettingDto;
import com.dotoyo.buildjob.sys.service.ISysIncrementHuntCardSettingService;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 增值服务猎证服务设置接口
 */
public class SysIncrementHuntCardSettingServiceImpl implements
	ISysIncrementHuntCardSettingService {
	private ISysIncrementHuntCardSettingDao sysIncrementHuntCardSettingDao;

	public ISysIncrementHuntCardSettingDao getSysIncrementHuntCardSettingDao() {
		return sysIncrementHuntCardSettingDao;
	}

	public void setSysIncrementHuntCardSettingDao(
			ISysIncrementHuntCardSettingDao sysIncrementHuntCardSettingDao) {
		this.sysIncrementHuntCardSettingDao = sysIncrementHuntCardSettingDao;
	}

	public int addIncrementHuntCardSetting(
			SysIncrementHuntCardSettingDto dto) {
		return sysIncrementHuntCardSettingDao.addIncrementHuntCardSetting(dto);
	}

	public SysIncrementHuntCardSettingDto queryIncrementHuntCard(
			SysIncrementHuntCardSettingDto dto) {
		return sysIncrementHuntCardSettingDao.queryIncrementHuntCard(dto);
	}

	public List<SysIncrementHuntCardSettingDto> queryIncrementHuntCardList(
			PageInfo pageInfo,SysIncrementHuntCardSettingDto dto) {
		return sysIncrementHuntCardSettingDao.queryIncrementHuntCardList(pageInfo,dto);
	}

	public int removeIncrementHuntCardSetting(
			SysIncrementHuntCardSettingDto dto) {
		return sysIncrementHuntCardSettingDao.removeIncrementHuntCardSetting(dto);
	}

	public int updateIncrementHuntCardSetting(
			SysIncrementHuntCardSettingDto dto) {
		return sysIncrementHuntCardSettingDao.updateIncrementHuntCardSetting(dto);
	}


}
