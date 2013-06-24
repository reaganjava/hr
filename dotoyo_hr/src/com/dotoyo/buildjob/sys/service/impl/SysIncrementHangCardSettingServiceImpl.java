package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysIncrementHangCardSettingDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementHangCardSettingDto;
import com.dotoyo.buildjob.sys.service.ISysIncrementHangCardSettingService;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 增值服务挂证服务设置接口
 */
public class SysIncrementHangCardSettingServiceImpl implements
	ISysIncrementHangCardSettingService {
	private ISysIncrementHangCardSettingDao sysIncrementHangCardSettingDao;

	public ISysIncrementHangCardSettingDao getSysIncrementHangCardSettingDao() {
		return sysIncrementHangCardSettingDao;
	}

	public void setSysIncrementHangCardSettingDao(
			ISysIncrementHangCardSettingDao sysIncrementHangCardSettingDao) {
		this.sysIncrementHangCardSettingDao = sysIncrementHangCardSettingDao;
	}

	public int addIncrementHangCardSetting(
			SysIncrementHangCardSettingDto dto) {
		return sysIncrementHangCardSettingDao.addIncrementHangCardSetting(dto);
	}

	public SysIncrementHangCardSettingDto queryIncrementHangCard(
			SysIncrementHangCardSettingDto dto) {
		return sysIncrementHangCardSettingDao.queryIncrementHangCard(dto);
	}

	public List<SysIncrementHangCardSettingDto> queryIncrementHangCardList(
			PageInfo pageInfo,SysIncrementHangCardSettingDto dto) {
		return sysIncrementHangCardSettingDao.queryIncrementHangCardList(pageInfo,dto);
	}

	public int removeIncrementHangCardSetting(
			SysIncrementHangCardSettingDto dto) {
		return sysIncrementHangCardSettingDao.removeIncrementHangCardSetting(dto);
	}

	public int updateIncrementHangCardSetting(
			SysIncrementHangCardSettingDto dto) {
		return sysIncrementHangCardSettingDao.updateIncrementHangCardSetting(dto);
	}


}
