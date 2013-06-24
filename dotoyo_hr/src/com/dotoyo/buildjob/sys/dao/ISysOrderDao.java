package com.dotoyo.buildjob.sys.dao;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 订单管理接口
 */
public interface ISysOrderDao {
	public int addOrder(SysOrderDto dto);

	/**
	 * 查询订单集合
	 * 
	 * @param dto
	 * @return DTO list
	 * @throws Exception
	 */
	public List<SysOrderDto> queryOrderList(PageInfo pageInfo, SysOrderDto dto);

	public List<SysOrderDto> queryOrderList(SysOrderDto dto);

	/**
	 * 查询有效订单：即订单未过期，参数中指定的可用次数大于0
	 * 
	 * @param dto
	 * @return
	 */
	public List<SysOrderDto> queryEffectiveOrderList(SysOrderDto dto);

	/**
	 * 查询订单
	 * 
	 * @param dto
	 * @return
	 */
	public List<SysOrderDto> queryOrderByOrderIdList(SysOrderDto dto);

	/**
	 * 查询单个订单
	 * 
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public SysOrderDto queryOrder(SysOrderDto dto);

	/**
	 * 更新订单
	 * 
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int updateOrder(SysOrderDto dto);
	
	/**
	 * 更新服务次数
	 * @param dto
	 * @return
	 */
	public int updateServiceTimes(SysOrderDto dto);

	/**
	 * 删除订单
	 * 
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	public int removeOrder(SysOrderDto dto);

	/**
	 * 当天新增订单数统计
	 */
	public int getNewOrdersStatisticsToDay();

	/**
	 * 根据 dto参数 设置条件
	 * 
	 * @param dto
	 * @return
	 */
	public int getOrdersCount(SysOrderDto dto);

	/**
	 * 用户还未支付订单统计
	 */
	public int getCountOfHaveNotYetPaidOrder(Long userId);

	/**
	 * 用户即将到期的订单统计
	 */
	public int getCountAboutToExpireOrder(Long userId, int dayEnd);
}
