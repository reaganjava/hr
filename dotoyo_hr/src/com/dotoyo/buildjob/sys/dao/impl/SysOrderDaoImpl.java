package com.dotoyo.buildjob.sys.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysOrderDao;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;

/**
 * @author wisdy.xiao
 * @createDate 2011-01-10
 * @description 订单管理实现
 */
public class SysOrderDaoImpl implements ISysOrderDao {
	private static Logger logger = Logger.getLogger(SysOrderDaoImpl.class);
	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public SysOrderDto queryOrder(SysOrderDto dto) {
		return (SysOrderDto) sqlMapClientTemplate.queryForObject("queryOrder",
				dto);
	}

	public List<SysOrderDto> queryOrderList(PageInfo pageInfo, SysOrderDto dto) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		try {
			paraMap.put("fromOrderDate", dto.getFromOrderDate());
			paraMap.put("toOrderDate", dto.getToOrderDate());
			paraMap.put("fromPayDate", dto.getFromPayDate());
			paraMap.put("toPayDate", dto.getToPayDate());
			paraMap.put("status", dto.getStatus());
			paraMap.put("payDate", dto.getPayDate());
			paraMap.put("serviceCode", dto.getServiceCode());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("serviceName", dto.getServiceName());
			paraMap.put("itemCode", dto.getItemCode());
			paraMap.put("inOrder", dto.getInOrder());
			paraMap.put("endDate", dto.getEndDate());
			paraMap.put("service1Remains", dto.getService1Remains());
			paraMap.put("service2Remains", dto.getService2Remains());
			paraMap.put("service3Remains", dto.getService3Remains());
			paraMap.put("isNew", dto.getIsNew());
		} catch (Exception e) {
			logger.error(e);
		}
		return PagingDataListUtil.getPagingData(pageInfo, "queryOrderCount",
				"queryOrderList", paraMap);
	}

	@SuppressWarnings("unchecked")
	public List<SysOrderDto> queryOrderList(SysOrderDto dto) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		try {
			paraMap.put("fromOrderDate", dto.getFromOrderDate());
			paraMap.put("toOrderDate", dto.getToOrderDate());
			paraMap.put("fromPayDate", dto.getFromPayDate());
			paraMap.put("toPayDate", dto.getToPayDate());
			paraMap.put("status", dto.getStatus());
			paraMap.put("payDate", dto.getPayDate());
			paraMap.put("serviceCode", dto.getServiceCode());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("serviceName", dto.getServiceName());
			paraMap.put("itemCode", dto.getItemCode());
			paraMap.put("inOrder", dto.getInOrder());
			paraMap.put("endDate", dto.getEndDate());
			paraMap.put("service1Remains", dto.getService1Remains());
			paraMap.put("service2Remains", dto.getService2Remains());
			paraMap.put("service3Remains", dto.getService3Remains());
			paraMap.put("isNew", dto.getIsNew());
		} catch (Exception e) {
			logger.error(e);
		}
		return sqlMapClientTemplate.queryForList("queryOrderList", paraMap);
	}

	@SuppressWarnings("unchecked")
	public List<SysOrderDto> queryEffectiveOrderList(SysOrderDto dto) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		try {
			paraMap.put("fromOrderDate", dto.getFromOrderDate());
			paraMap.put("toOrderDate", dto.getToOrderDate());
			paraMap.put("fromPayDate", dto.getFromPayDate());
			paraMap.put("toPayDate", dto.getToPayDate());
			paraMap.put("status", dto.getStatus());
			paraMap.put("payDate", dto.getPayDate());
			paraMap.put("serviceCode", dto.getServiceCode());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("serviceName", dto.getServiceName());
			paraMap.put("itemCode", dto.getItemCode());
			paraMap.put("inOrder", dto.getInOrder());
			paraMap.put("endDate", dto.getEndDate());
			paraMap.put("service1Remains", dto.getService1Remains());
			paraMap.put("service2Remains", dto.getService2Remains());
			paraMap.put("service3Remains", dto.getService3Remains());
		} catch (Exception e) {
			logger.error(e);
		}
		return sqlMapClientTemplate.queryForList("queryEffectiveOrderList",	paraMap);
	}

	public int removeOrder(SysOrderDto dto) {
		return sqlMapClientTemplate.delete("removeOrder", dto);
	}

	public int updateOrder(SysOrderDto dto) {
		return sqlMapClientTemplate.update("updateOrder", dto);
	}
	
	public int updateServiceTimes(SysOrderDto dto){
		return sqlMapClientTemplate.update("updateServiceTimes", dto);
	}

	public int addOrder(SysOrderDto dto) {
		sqlMapClientTemplate.insert("addOrder", dto);
		return 1;
	}

	public List<SysOrderDto> queryOrderByOrderIdList(SysOrderDto dto) {
		return sqlMapClientTemplate
				.queryForList("queryOrderByOrderIdList", dto);
	}

	/**
	 * 当天新增订单数统计
	 */
	public int getNewOrdersStatisticsToDay() {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"getNewOrdersStatisticsToDay", new Date());
	}

	public int getOrdersCount(SysOrderDto dto) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		try {
			paraMap.put("fromOrderDate", dto.getFromOrderDate());
			paraMap.put("toOrderDate", dto.getToOrderDate());
			paraMap.put("fromPayDate", dto.getFromPayDate());
			paraMap.put("toPayDate", dto.getToPayDate());
			paraMap.put("status", dto.getStatus());
			paraMap.put("payDate", dto.getPayDate());
			paraMap.put("serviceCode", dto.getServiceCode());
			paraMap.put("inOrderName", dto.getInOrderName());
			paraMap.put("itemCode", dto.getItemCode());
			paraMap.put("inOrder", dto.getInOrder());
			paraMap.put("endDate", dto.getEndDate());
			paraMap.put("service1Remains", dto.getService1Remains());
			paraMap.put("service2Remains", dto.getService2Remains());
			paraMap.put("service3Remains", dto.getService3Remains());
		} catch (Exception e) {
			logger.error(e);
		}
		Object obj = sqlMapClientTemplate.queryForObject("queryOrderCount",
				paraMap);
		return obj != null ? Integer.valueOf(obj.toString()) : 0;
	}

	/**
	 * 用户还未支付订单统计
	 */
	public int getCountOfHaveNotYetPaidOrder(Long userId) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"getCountOfHaveNotYetPaidOrder", userId);
	}

	/**
	 * 用户即将到期的订单统计
	 */
	public int getCountAboutToExpireOrder(Long userId, int dayEnd) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", userId);
		paramMap.put("dayEnd", dayEnd);
		paramMap.put("currentDate", new Date());
		Object obj = sqlMapClientTemplate.queryForObject("getCountAboutToExpireOrder", paramMap);
		return obj != null ? Integer.valueOf(obj.toString()) : 0;
	}

}
