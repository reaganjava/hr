package com.dotoyo.buildjob.sys.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysIncrementHuntCardSettingDto;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 增值服务猎证设置接口
 */
public interface ISysIncrementHuntCardSettingService {
	/**
	 * 增加猎证服务字段
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int addIncrementHuntCardSetting(SysIncrementHuntCardSettingDto dto);
	/**
	 * 查询猎证服务集合
	 * @param dto
	 * @return DTO list
	 * @throws Exception
	 */
	public List<SysIncrementHuntCardSettingDto> queryIncrementHuntCardList(PageInfo pageInfo,SysIncrementHuntCardSettingDto dto);
	/**
	 * 根据服务代码查询猎证服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public SysIncrementHuntCardSettingDto queryIncrementHuntCard(SysIncrementHuntCardSettingDto dto);
	/**
	 * 更新猎证服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int updateIncrementHuntCardSetting(SysIncrementHuntCardSettingDto dto);
	/**
	 * 删除猎证服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int removeIncrementHuntCardSetting(SysIncrementHuntCardSettingDto dto);
}
