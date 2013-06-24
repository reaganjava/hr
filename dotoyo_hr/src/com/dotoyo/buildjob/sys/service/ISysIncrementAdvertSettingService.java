package com.dotoyo.buildjob.sys.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysIncrementAdvertSettingDto;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 增值服务广告位设置接口
 */
public interface ISysIncrementAdvertSettingService {
	/**
	 * 增加广告位服务字段
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int addIncrementAdvertSetting(SysIncrementAdvertSettingDto dto);
	/**
	 * 查询广告位服务集合
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
	 * 更新广告位服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int updateIncrementAdvertSetting(SysIncrementAdvertSettingDto dto);
	/**
	 * 删除广告位服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int removeIncrementAdvertSetting(SysIncrementAdvertSettingDto dto);
}
