package com.dotoyo.buildjob.sys.dao;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.IncrementServiceDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementServiceNameMaintainanceDto;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-10
 * @description 增值服务名称维护接口
 */
public interface ISysIncrementServiceNameMaintainanceDao {
	/**
	 * 增加服务名称
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int addIncrementServiceName(SysIncrementServiceNameMaintainanceDto dto);
	/**
	 * 查询服务名称集合
	 * @param dto
	 * @return DTO list
	 * @throws Exception
	 */
	public List<SysIncrementServiceNameMaintainanceDto> queryIncrementSerivceNameList(SysIncrementServiceNameMaintainanceDto dto);
	public List<SysIncrementServiceNameMaintainanceDto> queryIncrementSerivceNameList(PageInfo pageInfo,SysIncrementServiceNameMaintainanceDto dto);
	/**
	 * 根据服务代码查询服务名称
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public SysIncrementServiceNameMaintainanceDto queryIncrementSerivceName(SysIncrementServiceNameMaintainanceDto dto);
	/**
	 * 更新服务名称
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int updateIncrementSerivceName(SysIncrementServiceNameMaintainanceDto dto);
	/**
	 * 删除服务名称
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int removeIncrementSerivceNameByCode(SysIncrementServiceNameMaintainanceDto dto);
	/**
	 * 查询已设置的服务集合
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public List<IncrementServiceDto> queryHeadHunterServiceList(PageInfo pageInfo,IncrementServiceDto dto);
}
