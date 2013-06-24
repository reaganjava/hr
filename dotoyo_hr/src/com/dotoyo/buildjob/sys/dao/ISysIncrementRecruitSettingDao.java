package com.dotoyo.buildjob.sys.dao;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysIncrementRecruitSettingDto;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 招聘服务设置接口
 */
public interface ISysIncrementRecruitSettingDao {
	/**
	 * 增加招聘服务字段
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int addIncrementRecruitSetting(SysIncrementRecruitSettingDto dto);
	/**
	 * 查询招聘服务服务集合
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
	 * 删除招聘服务服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int removeIncrementRecruitSetting(SysIncrementRecruitSettingDto dto);
}
