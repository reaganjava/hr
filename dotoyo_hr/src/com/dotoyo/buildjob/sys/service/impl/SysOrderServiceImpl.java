package com.dotoyo.buildjob.sys.service.impl;

import java.util.Date;
import java.util.List;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.sys.dao.ISysOrderDao;
import com.dotoyo.buildjob.sys.dto.SysIncrementAdvertSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementHangCardSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementHuntCardSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementRecruitSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundOfflineSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundSettingDto;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.dotoyo.buildjob.sys.service.ISysIncrementAdvertSettingService;
import com.dotoyo.buildjob.sys.service.ISysIncrementHangCardSettingService;
import com.dotoyo.buildjob.sys.service.ISysIncrementHuntCardSettingService;
import com.dotoyo.buildjob.sys.service.ISysIncrementRecruitSettingService;
import com.dotoyo.buildjob.sys.service.ISysIncrementTalentsFoundOfflineSettingService;
import com.dotoyo.buildjob.sys.service.ISysIncrementTalentsFoundSettingService;
import com.dotoyo.buildjob.sys.service.ISysOrderService;

public class SysOrderServiceImpl implements ISysOrderService {
	private ISysOrderDao sysOrderDao;
	private ISysIncrementTalentsFoundSettingService sysIncrementTalentsFoundSettingService;
	private ISysIncrementTalentsFoundOfflineSettingService sysIncrementTalentsFoundOfflineSettingService;
	private ISysIncrementHangCardSettingService sysIncrementHangCardSettingService;
	private ISysIncrementHuntCardSettingService sysIncrementHuntCardSettingService;
	private ISysIncrementRecruitSettingService sysIncrementRecruitSettingService;
	private ISysIncrementAdvertSettingService sysIncrementAdvertSettingService;

	public int addOrder(List<SysOrderDto> sysOrderList) {
		
		int result = 0;
		for(SysOrderDto dto:sysOrderList){
			String itemCode = dto.getItemCode();
			String serviceCode = dto.getServiceCode();

			// 线下人才挖掘服务
			if (ApplicationConstant.SERVICE_ITEM_NAME_TALENTSFOUND_OFFLINE_CODE
					.equalsIgnoreCase(itemCode)) {
				SysIncrementTalentsFoundOfflineSettingDto sysIncrementTalentsFoundOfflineSettingDto = new SysIncrementTalentsFoundOfflineSettingDto();
				sysIncrementTalentsFoundOfflineSettingDto.setServiceCode(serviceCode);
				sysIncrementTalentsFoundOfflineSettingDto = sysIncrementTalentsFoundOfflineSettingService
						.queryIncrementTalentsFound(sysIncrementTalentsFoundOfflineSettingDto);
				dto.setService1Remains(sysIncrementTalentsFoundOfflineSettingDto
						.getTimesOfSearch());
			}
			// 人才挖掘服务
			if (ApplicationConstant.SERVICE_ITEM_NAME_TALENTSFOUND_CODE
					.equalsIgnoreCase(itemCode)) {
				SysIncrementTalentsFoundSettingDto sysIncrementTalentsFoundSettingDto = new SysIncrementTalentsFoundSettingDto();
				sysIncrementTalentsFoundSettingDto.setServiceCode(serviceCode);
				sysIncrementTalentsFoundSettingDto = sysIncrementTalentsFoundSettingService
				.queryIncrementTalentsFound(sysIncrementTalentsFoundSettingDto);
				dto.setService1Remains(sysIncrementTalentsFoundSettingDto
						.getTimesOfSearch());
			}

			// 挂证服务
			if (ApplicationConstant.SERVICE_ITEM_NAME_HANGCARD_CODE
					.equalsIgnoreCase(itemCode)) {

				SysIncrementHangCardSettingDto sysIncrementHangCardSettingDto = new SysIncrementHangCardSettingDto();
				sysIncrementHangCardSettingDto.setServiceCode(serviceCode);
				sysIncrementHangCardSettingDto = sysIncrementHangCardSettingService
						.queryIncrementHangCard(sysIncrementHangCardSettingDto);
				dto.setService1Remains(sysIncrementHangCardSettingDto
						.getCountOfSubmit());
			}

			// 猎证服务
			if (ApplicationConstant.SERVICE_ITEM_NAME_HUNTCARD_CODE
					.equalsIgnoreCase(itemCode)) {
				SysIncrementHuntCardSettingDto sysIncrementHuntCardSettingDto = new SysIncrementHuntCardSettingDto();
				sysIncrementHuntCardSettingDto.setServiceCode(serviceCode);
				sysIncrementHuntCardSettingDto = sysIncrementHuntCardSettingService
						.queryIncrementHuntCard(sysIncrementHuntCardSettingDto);
				dto.setService1Remains(sysIncrementHuntCardSettingDto
						.getTimesOfLookup());
				dto.setService2Remains(sysIncrementHuntCardSettingDto
						.getTimesOfSubmitCertNeeds());
			}

			// 招聘服务
			if (ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE
					.equalsIgnoreCase(itemCode)) {
				SysIncrementRecruitSettingDto sysIncrementRecruitSettingDto = new SysIncrementRecruitSettingDto();
				sysIncrementRecruitSettingDto.setServiceCode(serviceCode);
				sysIncrementRecruitSettingDto = sysIncrementRecruitSettingService
						.queryIncrementRecruit(sysIncrementRecruitSettingDto);
				dto.setService1Remains(sysIncrementRecruitSettingDto
						.getTimesOfPublicPosition());
				dto.setService2Remains(sysIncrementRecruitSettingDto
						.getTimesOfLookupBlog());
				dto.setService3Remains(sysIncrementRecruitSettingDto
						.getTimesOfLookupInvite());
			}

			// 广告位服务
			if (ApplicationConstant.SERVICE_ITEM_NAME_ADVERT_CODE
					.equalsIgnoreCase(itemCode)) {
				SysIncrementAdvertSettingDto sysIncrementAdvertSettingDto = new SysIncrementAdvertSettingDto();
				sysIncrementAdvertSettingDto.setServiceCode(serviceCode);
				sysIncrementAdvertSettingDto = sysIncrementAdvertSettingService
						.queryIncrementAdvert(sysIncrementAdvertSettingDto);
			}

			result =  sysOrderDao.addOrder(dto);
		}
		return result;
	}

	public SysOrderDto queryOrder(SysOrderDto dto) {

		return sysOrderDao.queryOrder(dto);
	}

	public List<SysOrderDto> queryOrderList(PageInfo pageInfo, SysOrderDto dto) {

		return sysOrderDao.queryOrderList(pageInfo, dto);
	}

	public List<SysOrderDto> queryOrderList(SysOrderDto dto) {

		return sysOrderDao.queryOrderList(dto);
	}

	public int removeOrder(SysOrderDto dto) {

		return sysOrderDao.removeOrder(dto);
	}

	public int updateOrder(SysOrderDto dto) {

		return sysOrderDao.updateOrder(dto);
	}

	public ISysOrderDao getSysOrderDao() {
		return sysOrderDao;
	}

	public void setSysOrderDao(ISysOrderDao sysOrderDao) {
		this.sysOrderDao = sysOrderDao;
	}

	public List<SysOrderDto> queryOrderByOrderIdList(SysOrderDto dto) {
		return sysOrderDao.queryOrderByOrderIdList(dto);
	}

	/**
	 * 当天新增订单数统计
	 */
	public int getNewOrdersStatisticsToDay() {
		return sysOrderDao.getNewOrdersStatisticsToDay();
	}

	public int getOrdersCount(SysOrderDto dto) {
		return sysOrderDao.getOrdersCount(dto);
	}

	/**
	 * 用户还未支付订单统计
	 */
	public int getCountOfHaveNotYetPaidOrder(Long userId) {
		return sysOrderDao.getCountOfHaveNotYetPaidOrder(userId);
	}

	/**
	 * 用户即将到期的订单统计
	 */
	public int getCountAboutToExpireOrder(Long userId, int dayEnd) {
		return sysOrderDao.getCountAboutToExpireOrder(userId, dayEnd);
	}

	public boolean verifyAuthority(SysOrderDto dto,
			LoginUserInfoDto loginUserInfo, String itemCode,
			String serviceType, int cost) {

		// 获得该用户所有对应该服务所有未过期的订单信息
		Long userId = loginUserInfo.getId();
		String userName = loginUserInfo.getUserName();
		dto.setInOrder(userId);
		dto.setInOrderName(userName);
		dto.setItemCode(itemCode);
		dto.setEndDate(new Date());
		List<SysOrderDto> orderList = sysOrderDao.queryEffectiveOrderList(dto);

		// 如果订单表为空，表明用户没有购买该服务，或服务已过期，返回失败
		if (orderList == null || orderList.isEmpty()) {
			return false;
		}

		// 人才挖掘服务
		if (ApplicationConstant.SERVICE_ITEM_NAME_TALENTSFOUND_CODE
				.equalsIgnoreCase(itemCode)) {
			SysOrderDto sysOrderDto = orderList.get(0);
			sysOrderDto.setService1Remains(sysOrderDto.getService1Remains()
					- cost);
			sysOrderDao.updateServiceTimes(sysOrderDto);
			return true;
		}

		// 挂证服务
		if (ApplicationConstant.SERVICE_ITEM_NAME_HANGCARD_CODE
				.equalsIgnoreCase(itemCode)) {
			SysOrderDto sysOrderDto = orderList.get(0);
			sysOrderDto.setService1Remains(sysOrderDto.getService1Remains()
					- cost);
			sysOrderDao.updateServiceTimes(sysOrderDto);
			return true;
		}

		// 猎证服务
		if (ApplicationConstant.SERVICE_ITEM_NAME_HUNTCARD_CODE
				.equalsIgnoreCase(itemCode)) {
			SysOrderDto sysOrderDto = orderList.get(0);

			// 子服务——查看联系方式
			if ("1".equalsIgnoreCase(serviceType)) {
				sysOrderDto.setService1Remains(sysOrderDto.getService1Remains()
						- cost);
				sysOrderDao.updateServiceTimes(sysOrderDto);
				return true;
			}

			// 子服务——提交证书需求
			if ("2".equalsIgnoreCase(serviceType)) {
				sysOrderDto.setService2Remains(sysOrderDto.getService2Remains()
						- cost);
				sysOrderDao.updateServiceTimes(sysOrderDto);
				return true;
			}

		}

		// 招聘服务
		if (ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE
				.equalsIgnoreCase(itemCode)) {
			SysOrderDto sysOrderDto = orderList.get(0);

			// 子服务——发布职位次数
			if ("1".equalsIgnoreCase(serviceType)) {
				sysOrderDto.setService1Remains(sysOrderDto.getService1Remains()
						- cost);
				sysOrderDao.updateServiceTimes(sysOrderDto);
				return true;
			}

			// 子服务——查看博站次数
			if ("2".equalsIgnoreCase(serviceType)) {
				sysOrderDto
						.setService2Remains(sysOrderDto.getService2Remains() - 1);
				sysOrderDao.updateServiceTimes(sysOrderDto);
				return true;
			}

			// 子服务——邀请面试次数
			if ("3".equalsIgnoreCase(serviceType)) {
				sysOrderDto
						.setService3Remains(sysOrderDto.getService3Remains() - 1);
				sysOrderDao.updateServiceTimes(sysOrderDto);
				return true;
			}
		}
		return false;
	}

	public void batchVerifyAuthority(SysOrderDto dto,
			LoginUserInfoDto loginUserInfo, String itemCode,
			String serviceType, int cost) {
		// 获得该用户所有对应该服务所有未过期的订单信息
		Long userId = loginUserInfo.getId();
		String userName = loginUserInfo.getUserName();
		dto.setInOrder(userId);
		dto.setInOrderName(userName);
		dto.setItemCode(itemCode);
		dto.setEndDate(new Date());
		List<SysOrderDto> orderList = sysOrderDao.queryEffectiveOrderList(dto);
		long totalCost = cost;

		// 人才挖掘服务
		if (ApplicationConstant.SERVICE_ITEM_NAME_TALENTSFOUND_CODE
				.equalsIgnoreCase(itemCode)) {
			for (SysOrderDto sysOrder : orderList) {
				long availibaleCost = sysOrder.getService1Remains();
				if (availibaleCost - totalCost >= 0) {
					sysOrder.setService1Remains(availibaleCost - totalCost);
					sysOrderDao.updateServiceTimes(sysOrder);
					break;
				} else {
					sysOrder.setService1Remains(0L);
					sysOrderDao.updateServiceTimes(sysOrder);
					totalCost = totalCost - availibaleCost;
					continue;
				}
			}
		}

		// 挂证服务
		if (ApplicationConstant.SERVICE_ITEM_NAME_HANGCARD_CODE
				.equalsIgnoreCase(itemCode)) {
			for (SysOrderDto sysOrder : orderList) {
				long availibaleCost = sysOrder.getService1Remains();
				if (availibaleCost - totalCost >= 0) {
					sysOrder.setService1Remains(availibaleCost - totalCost);
					sysOrderDao.updateServiceTimes(sysOrder);
					break;
				} else {
					sysOrder.setService1Remains(0L);
					sysOrderDao.updateServiceTimes(sysOrder);
					totalCost = totalCost - availibaleCost;
					continue;
				}
			}
			;
		}

		// 猎证服务
		if (ApplicationConstant.SERVICE_ITEM_NAME_HUNTCARD_CODE
				.equalsIgnoreCase(itemCode)) {

			// 子服务——查看联系方式次数
			if ("1".equalsIgnoreCase(serviceType)) {
				for (SysOrderDto sysOrder : orderList) {
					long availibaleCost = sysOrder.getService1Remains();
					if (availibaleCost - totalCost >= 0) {
						sysOrder.setService1Remains(availibaleCost - totalCost);
						sysOrderDao.updateServiceTimes(sysOrder);
						break;
					} else {
						sysOrder.setService1Remains(0L);
						sysOrderDao.updateServiceTimes(sysOrder);
						totalCost = totalCost - availibaleCost;
						continue;
					}
				}
			}

			// 子服务——发布证书需求个数
			if ("2".equalsIgnoreCase(serviceType)) {
				for (SysOrderDto sysOrder : orderList) {
					long availibaleCost = sysOrder.getService2Remains();
					if (availibaleCost - totalCost >= 0) {
						sysOrder.setService2Remains(availibaleCost - totalCost);
						sysOrderDao.updateServiceTimes(sysOrder);
						break;
					} else {
						sysOrder.setService2Remains(0L);
						sysOrderDao.updateServiceTimes(sysOrder);
						totalCost = totalCost - availibaleCost;
						continue;
					}
				}
			}
		}

		// 招聘服务
		if (ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE
				.equalsIgnoreCase(itemCode)) {

			// 子服务——发布职位次数
			if ("1".equalsIgnoreCase(serviceType)) {
				for (SysOrderDto sysOrder : orderList) {
					long availibaleCost = sysOrder.getService1Remains();
					if (availibaleCost - totalCost >= 0) {
						sysOrder.setService1Remains(availibaleCost - totalCost);
						sysOrderDao.updateServiceTimes(sysOrder);
						break;
					} else {
						sysOrder.setService1Remains(0L);
						sysOrderDao.updateServiceTimes(sysOrder);
						totalCost = totalCost - availibaleCost;
						continue;
					}
				}
			}

			// 子服务——查看博站次数
			if ("2".equalsIgnoreCase(serviceType)) {
				for (SysOrderDto sysOrder : orderList) {
					long availibaleCost = sysOrder.getService2Remains();
					if (availibaleCost - totalCost >= 0) {
						sysOrder.setService2Remains(availibaleCost - totalCost);
						sysOrderDao.updateServiceTimes(sysOrder);
						break;
					} else {
						sysOrder.setService2Remains(0L);
						sysOrderDao.updateServiceTimes(sysOrder);
						totalCost = totalCost - availibaleCost;
						continue;
					}
				}
			}

			// 子服务——邀请面试次数
			if ("3".equalsIgnoreCase(serviceType)) {
				for (SysOrderDto sysOrder : orderList) {
					long availibaleCost = sysOrder.getService3Remains();
					if (availibaleCost - totalCost >= 0) {
						sysOrder.setService3Remains(availibaleCost - totalCost);
						sysOrderDao.updateServiceTimes(sysOrder);
						break;
					} else {
						sysOrder.setService3Remains(0L);
						sysOrderDao.updateServiceTimes(sysOrder);
						totalCost = totalCost - availibaleCost;
						continue;
					}
				}
			}
		}
	}

	public long getAvailableServiceTimes(SysOrderDto dto,
			LoginUserInfoDto loginUserInfo, String itemCode, String serviceType) {

		long result = 0L;

		// 获得该用户所有对应该服务所有未过期的订单信息
		Long userId = loginUserInfo.getId();
		String userName = loginUserInfo.getUserName();
		dto.setInOrder(userId);
		dto.setInOrderName(userName);
		dto.setItemCode(itemCode);
		dto.setEndDate(new Date());
		List<SysOrderDto> orderList = sysOrderDao.queryEffectiveOrderList(dto);

		// 如果订单表为空，表明用户没有购买该服务，或服务已过期，返回失败
		if (orderList == null || orderList.isEmpty()) {
			return 0;
		}

		// 人才挖掘服务
		if (ApplicationConstant.SERVICE_ITEM_NAME_TALENTSFOUND_CODE
				.equalsIgnoreCase(itemCode)) {
			for (SysOrderDto orderDto : orderList) {
				result = result + orderDto.getService1Remains();
			}
			return result;
		}

		// 挂证服务
		if (ApplicationConstant.SERVICE_ITEM_NAME_HANGCARD_CODE
				.equalsIgnoreCase(itemCode)) {
			for (SysOrderDto orderDto : orderList) {
				result = result + orderDto.getService1Remains();
			}
			return result;
		}

		// 猎证服务
		if (ApplicationConstant.SERVICE_ITEM_NAME_HUNTCARD_CODE
				.equalsIgnoreCase(itemCode)) {

			// 子服务——查看联系方式次数
			if ("1".equalsIgnoreCase(serviceType)) {
				for (SysOrderDto orderDto : orderList) {
					result = result + orderDto.getService1Remains();
				}
				return result;
			}

			// 子服务——提交证书需求个数
			if ("2".equalsIgnoreCase(serviceType)) {
				for (SysOrderDto orderDto : orderList) {
					result = result + orderDto.getService2Remains();
				}
				return result;
			}
		}

		// 招聘服务
		if (ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE
				.equalsIgnoreCase(itemCode)) {

			// 子服务——发布职位次数
			if ("1".equalsIgnoreCase(serviceType)) {
				for (SysOrderDto orderDto : orderList) {
					result = result + orderDto.getService1Remains();
				}
				return result;
			}

			// 子服务——查看博站次数
			if ("2".equalsIgnoreCase(serviceType)) {
				for (SysOrderDto orderDto : orderList) {
					result = result + orderDto.getService2Remains();
				}
				return result;
			}

			// 子服务——邀请面试次数
			if ("3".equalsIgnoreCase(serviceType)) {
				for (SysOrderDto orderDto : orderList) {
					result = result + orderDto.getService3Remains();
				}
				return result;
			}
		}
		return 0;
	}

	public ISysIncrementTalentsFoundSettingService getSysIncrementTalentsFoundSettingService() {
		return sysIncrementTalentsFoundSettingService;
	}

	public void setSysIncrementTalentsFoundSettingService(
			ISysIncrementTalentsFoundSettingService sysIncrementTalentsFoundSettingService) {
		this.sysIncrementTalentsFoundSettingService = sysIncrementTalentsFoundSettingService;
	}

	public ISysIncrementHangCardSettingService getSysIncrementHangCardSettingService() {
		return sysIncrementHangCardSettingService;
	}

	public void setSysIncrementHangCardSettingService(
			ISysIncrementHangCardSettingService sysIncrementHangCardSettingService) {
		this.sysIncrementHangCardSettingService = sysIncrementHangCardSettingService;
	}

	public ISysIncrementHuntCardSettingService getSysIncrementHuntCardSettingService() {
		return sysIncrementHuntCardSettingService;
	}

	public void setSysIncrementHuntCardSettingService(
			ISysIncrementHuntCardSettingService sysIncrementHuntCardSettingService) {
		this.sysIncrementHuntCardSettingService = sysIncrementHuntCardSettingService;
	}

	public ISysIncrementRecruitSettingService getSysIncrementRecruitSettingService() {
		return sysIncrementRecruitSettingService;
	}

	public void setSysIncrementRecruitSettingService(
			ISysIncrementRecruitSettingService sysIncrementRecruitSettingService) {
		this.sysIncrementRecruitSettingService = sysIncrementRecruitSettingService;
	}

	public ISysIncrementAdvertSettingService getSysIncrementAdvertSettingService() {
		return sysIncrementAdvertSettingService;
	}

	public void setSysIncrementAdvertSettingService(
			ISysIncrementAdvertSettingService sysIncrementAdvertSettingService) {
		this.sysIncrementAdvertSettingService = sysIncrementAdvertSettingService;
	}

	public ISysIncrementTalentsFoundOfflineSettingService getSysIncrementTalentsFoundOfflineSettingService() {
		return sysIncrementTalentsFoundOfflineSettingService;
	}

	public void setSysIncrementTalentsFoundOfflineSettingService(
			ISysIncrementTalentsFoundOfflineSettingService sysIncrementTalentsFoundOfflineSettingService) {
		this.sysIncrementTalentsFoundOfflineSettingService = sysIncrementTalentsFoundOfflineSettingService;
	}
	
}
