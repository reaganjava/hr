package com.dotoyo.buildjob.sys.dao;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysIncrementHangCardSettingDto;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 挂证服务设置接口
 */
public interface ISysIncrementHangCardSettingDao {
	/**
	 * 增加人才挖掘服务字段
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int addIncrementHangCardSetting(SysIncrementHangCardSettingDto dto);
	/**
	 * 查询挂证服务服务集合
	 * @param dto
	 * @return DTO list
	 * @throws Exception
	 */
	public List<SysIncrementHangCardSettingDto> queryIncrementHangCardList(PageInfo pageInfo,SysIncrementHangCardSettingDto dto);
	/**
	 * 根据服务代码查询挂证服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public SysIncrementHangCardSettingDto queryIncrementHangCard(SysIncrementHangCardSettingDto dto);
	/**
	 * 更新挂证服务服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int updateIncrementHangCardSetting(SysIncrementHangCardSettingDto dto);
	/**
	 * 删除挂证服务服务设置
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int removeIncrementHangCardSetting(SysIncrementHangCardSettingDto dto);
}
