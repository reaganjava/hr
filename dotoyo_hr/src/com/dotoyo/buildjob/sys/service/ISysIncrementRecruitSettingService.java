package com.dotoyo.buildjob.sys.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysIncrementRecruitSettingDto;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 增值服务招聘设置接口
 */
public interface ISysIncrementRecruitSettingService {
	/**
	 * 增加招聘服务字段
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int addIncrementRecruitSetting(SysIncrementRecruitSettingDto dto);
	/**
	 * 查询招聘服务集合
	 * @param dto
	 * @return DTO list
	 * @throws Exception
	 */
	public List<SysIncrementRecruitSettingDto> queryIncrementRecruitList(PageInfo pageInfo,SysIncrementRecruitSettingDto dto);
	/**
	 * 根据服务代码查询招聘服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public SysIncrementRecruitSettingDto queryIncrementRecruit(SysIncrementRecruitSettingDto dto);
	/**
	 * 更新招聘服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int updateIncrementRecruitSetting(SysIncrementRecruitSettingDto dto);
	/**
	 * 删除招聘服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int removeIncrementRecruitSetting(SysIncrementRecruitSettingDto dto);
}
