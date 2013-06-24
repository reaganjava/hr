package com.dotoyo.buildjob.sys.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-11
 * @description 订单管理接口
 */
public interface ISysOrderService {
	public int addOrder(List<SysOrderDto> sysOrderList);

	/**
	 * 查询订单集合
	 * 
	 * @param dto
	 * @return DTO list
	 * @throws Exception
	 */
	public List<SysOrderDto> queryOrderList(PageInfo pageInfo, SysOrderDto dto);

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

	/**
	 * 查询用户是否具有某项服务的权限，如果是，服务次数减1
	 * 
	 * @param loginUserInfo
	 * @param itemCode
	 *            哪项服务
	 * @param serviceType
	 *            具体对应到哪一条次数
	 * @param cost
	 *            减少的服务次数，0次或者1次
	 * @return
	 */
	public boolean verifyAuthority(SysOrderDto dto,
			LoginUserInfoDto loginUserInfo, String itemCode,
			String serviceType, int cost);

	/**
	 * 查找指定服务可用次数
	 * 
	 * @param dto
	 * @param loginUserInfo
	 * @param itemCode
	 * @param serviceType
	 * @return
	 */
	public long getAvailableServiceTimes(SysOrderDto dto,
			LoginUserInfoDto loginUserInfo, String itemCode, String serviceType);

	/**
	 * 扣除用户某项服务指定次数，必须保证用户可用次数大于指定次数，配合getAvailableServiceTimes方法使用
	 * 
	 * @param dto
	 * @param loginUserInfo
	 * @param itemCode
	 *            哪项服务
	 * @param serviceType
	 *            具体对应到哪一条次数
	 * @param cost
	 *            减少的服务次数
	 */
	public void batchVerifyAuthority(SysOrderDto dto,
			LoginUserInfoDto loginUserInfo, String itemCode,
			String serviceType, int cost);
}
