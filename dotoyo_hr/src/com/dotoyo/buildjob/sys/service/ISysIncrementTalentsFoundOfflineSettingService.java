package com.dotoyo.buildjob.sys.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundOfflineSettingDto;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 增值服务人才挖掘设置接口
 */
public interface ISysIncrementTalentsFoundOfflineSettingService {
	/**
	 * 增加人才挖掘服务字段
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int addIncrementTalentsFoundSetting(SysIncrementTalentsFoundOfflineSettingDto dto);
	/**
	 * 查询人才挖掘服务集合
	 * @param dto
	 * @return DTO list
	 * @throws Exception
	 */
	public List<SysIncrementTalentsFoundOfflineSettingDto> queryIncrementTalentsFoundList(PageInfo pageInfo,SysIncrementTalentsFoundOfflineSettingDto dto);
	/**
	 * 根据服务代码查询人才挖掘服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public SysIncrementTalentsFoundOfflineSettingDto queryIncrementTalentsFound(SysIncrementTalentsFoundOfflineSettingDto dto);
	/**
	 * 更新人才挖掘服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int updateIncrementTalentsFoundSetting(SysIncrementTalentsFoundOfflineSettingDto dto);
	/**
	 * 删除人才挖掘服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int removeIncrementTalentsFoundSetting(SysIncrementTalentsFoundOfflineSettingDto dto);
}
