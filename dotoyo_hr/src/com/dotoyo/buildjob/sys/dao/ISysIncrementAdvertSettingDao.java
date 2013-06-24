package com.dotoyo.buildjob.sys.dao;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysIncrementAdvertSettingDto;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 广告位服务设置接口
 */
public interface ISysIncrementAdvertSettingDao {
	/**
	 * 增加人才挖掘服务字段
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int addIncrementAdvertSetting(SysIncrementAdvertSettingDto dto);
	/**
	 * 查询广告位服务服务集合
	 * @param dto
	 * @return DTO list
	 * @throws Exception
	 */
	public List<SysIncrementAdvertSettingDto> queryIncrementAdvertList(PageInfo pageInfo,SysIncrementAdvertSettingDto dto);
	/**
	 * 根据服务代码查询广告位服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public SysIncrementAdvertSettingDto queryIncrementAdvert(SysIncrementAdvertSettingDto dto);
	/**
	 * 更新广告位服务服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int updateIncrementAdvertSetting(SysIncrementAdvertSettingDto dto);
	/**
	 * 删除广告位服务服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int removeIncrementAdvertSetting(SysIncrementAdvertSettingDto dto);
}
