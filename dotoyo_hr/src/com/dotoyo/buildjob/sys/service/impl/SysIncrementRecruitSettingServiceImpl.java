package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysIncrementRecruitSettingDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementRecruitSettingDto;
import com.dotoyo.buildjob.sys.service.ISysIncrementRecruitSettingService;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 增值服务招聘服务设置接口
 */
public class SysIncrementRecruitSettingServiceImpl implements
	ISysIncrementRecruitSettingService {
	private ISysIncrementRecruitSettingDao sysIncrementRecruitSettingDao;

	public ISysIncrementRecruitSettingDao getSysIncrementRecruitSettingDao() {
		return sysIncrementRecruitSettingDao;
	}

	public void setSysIncrementRecruitSettingDao(
			ISysIncrementRecruitSettingDao sysIncrementRecruitSettingDao) {
		this.sysIncrementRecruitSettingDao = sysIncrementRecruitSettingDao;
	}

	public int addIncrementRecruitSetting(
			SysIncrementRecruitSettingDto dto) {
		return sysIncrementRecruitSettingDao.addIncrementRecruitSetting(dto);
	}

	public SysIncrementRecruitSettingDto queryIncrementRecruit(
			SysIncrementRecruitSettingDto dto) {
		return sysIncrementRecruitSettingDao.queryIncrementRecruit(dto);
	}

	public List<SysIncrementRecruitSettingDto> queryIncrementRecruitList(
			PageInfo pageInfo,SysIncrementRecruitSettingDto dto) {
		return sysIncrementRecruitSettingDao.queryIncrementRecruitList(pageInfo,dto);
	}

	public int removeIncrementRecruitSetting(
			SysIncrementRecruitSettingDto dto) {
		return sysIncrementRecruitSettingDao.removeIncrementRecruitSetting(dto);
	}

	public int updateIncrementRecruitSetting(
			SysIncrementRecruitSettingDto dto) {
		return sysIncrementRecruitSettingDao.updateIncrementRecruitSetting(dto);
	}


}
