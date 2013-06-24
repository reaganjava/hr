package com.dotoyo.buildjob.personalCenter.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.UUID;

import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.EssentialDataUtil;
import com.dotoyo.buildjob.common.util.StringUtil;
import com.dotoyo.buildjob.sys.dto.IncrementServiceDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementAdvertSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementHangCardSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementHuntCardSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementRecruitSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementServiceNameMaintainanceDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundOfflineSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundSettingDto;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.dotoyo.buildjob.sys.service.ISysIncrementAdvertSettingService;
import com.dotoyo.buildjob.sys.service.ISysIncrementHangCardSettingService;
import com.dotoyo.buildjob.sys.service.ISysIncrementHuntCardSettingService;
import com.dotoyo.buildjob.sys.service.ISysIncrementRecruitSettingService;
import com.dotoyo.buildjob.sys.service.ISysIncrementServiceNameMaintainanceService;
import com.dotoyo.buildjob.sys.service.ISysIncrementTalentsFoundOfflineSettingService;
import com.dotoyo.buildjob.sys.service.ISysIncrementTalentsFoundSettingService;
import com.dotoyo.buildjob.sys.service.ISysOrderService;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;
import com.dotoyo.buildjob.systemManage.dto.SysParameterDto;
import com.dotoyo.buildjob.systemManage.service.ISysParameterService;
/**
 * 猎头服务管理
 * @author wisdy.xiao
 *
 */
public class HeadHuntServiceManageAction extends BuildJobAction{
	/** 订单 **/
	private ISysOrderService sysOrderService;
	/** 服务名称服务 **/
	private ISysIncrementServiceNameMaintainanceService sysIncrementServiceNameMaintainanceService;
	/** 人才挖掘服务 **/
	private ISysIncrementTalentsFoundSettingService sysIncrementTalentsFoundSettingService;
	/** 挂证服务 **/
	private ISysIncrementHangCardSettingService sysIncrementHangCardSettingService;
	/** 猎证服务 **/
	private ISysIncrementHuntCardSettingService sysIncrementHuntCardSettingService;
	/** 人才招聘服务 **/
	private ISysIncrementRecruitSettingService sysIncrementRecruitSettingService;
	/** 广告服务 **/
	private ISysIncrementAdvertSettingService sysIncrementAdvertSettingService;
	/** 参数表 **/
	private ISysParameterService sysParameterService;
	private String payDueTime;//支付期限
	private Map<String,String> serviceItems;
	private String msg;
	private String [] selectAlls;
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	/**  --------------- buy service ------------------**/
	private IncrementServiceDto buySearchDto;
	private List<IncrementServiceDto> buyServiceList;
	private IncrementServiceDto buyDetailDto;
	private PageInfo pageInfo;
	private Map<String,String> advertisings;
	private Map<String,String> fieldsOfSearchs;
	/** ---------------- bought service --------------- **/
	private SysOrderDto boughtSearchDto;
	private List<SysOrderDto> boughtList;
	private SysOrderDto boughtDetailDto;
	private String extensionOrderId;//续期订单
	private String extensionResId;//续期唯一订单ID
	private String decideExtensionFlag = "0"; //商定续费标志 0 否，1 已购买服务商定续费标志, 2已过期页面商定续费标志
	private ISysIncrementTalentsFoundOfflineSettingService sysIncrementTalentsFoundOfflineSettingService;

	/**
	 * 购买服务初始化
	 * @return
	 */
	public String buyServiceInit(){
		initData();
		clear();
		decideExtensionFlag = "0";
		searchServiceData();
		return "buyMain";
	}
	private void initData(){
		super.getLoginUserInfo();
		serviceItems = new TreeMap<String,String>();
		serviceItems.put("", "");
		if("1".equals(loginUserInfoDto.getUserType())){
			serviceItems.put("0", ApplicationConstant.SERVICE_ITEM_NAME_TALENTSFOUND_OFFLINE);
			serviceItems.put("1", ApplicationConstant.SERVICE_ITEM_NAME_TALENTSFOUND);
			serviceItems.put("3", ApplicationConstant.SERVICE_ITEM_NAME_HUNTCARD);
			serviceItems.put("4", ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT);
		}
		serviceItems.put("2", ApplicationConstant.SERVICE_ITEM_NAME_HANGCARD);
		serviceItems.put("5", ApplicationConstant.SERVICE_ITEM_NAME_ADVERT);
	}
	/**
	 * 服务列表查询
	 * @return
	 */
	public String searchService(){
		searchServiceData();
		return "buyMain";
	}
	private void searchServiceData(){
		if(pageInfo == null){
			pageInfo = new PageInfo();
		}
		super.getLoginUserInfo();
		buySearchDto.setUserType(loginUserInfoDto.getUserType());
		buySearchDto.setAdvertising("Advertising");
		buyServiceList = sysIncrementServiceNameMaintainanceService.queryHeadHunterServiceList(pageInfo, buySearchDto);
//		initData();
//		if(buyServiceList != null){
//			for(int i = 0;i < buyServiceList.size();i++){
//				String item = buyServiceList.get(i).getServiceItem();
//				String itemName = serviceItems.get(item);
//				buyServiceList.get(i).setItemName(itemName);
//			}
//		}

	}
	public String cancelBuy(){
		initData();
		if(decideExtensionFlag.equals("0")){
			return "buyMain";
		}else if(decideExtensionFlag.equals("1")){
			return "boughtMain";
		}else{
			return "expiredMain";
		}
	}
	/**
	 * On click view button
	 * @return
	 */
	public String beforeView(){
		initData();
		//查询
		/** 服务信息 **/
		String serviceCode = buyDetailDto.getServiceCode();
		String price = buyDetailDto.getPrice();
		String priceStatus = buyDetailDto.getPriceStatus();
		clear();
		buyDetailDto.setServiceCode(serviceCode);
		buyDetailDto.setPrice(price);
		buyDetailDto.setPriceStatus(priceStatus);
		SysIncrementServiceNameMaintainanceDto serviceDto = new SysIncrementServiceNameMaintainanceDto();
		serviceDto.setServiceCode(serviceCode);
		serviceDto = sysIncrementServiceNameMaintainanceService.queryIncrementSerivceName(serviceDto);
		buyDetailDto.setNameMaintainanceDto(serviceDto);
		
		/** 线下人才挖掘服务信息 **/
		SysIncrementTalentsFoundOfflineSettingDto talentsOfflineDto = getTalentsFoundOfflineDto(serviceCode);
		buyDetailDto.setTalentsFoundOfflineSettingDto(talentsOfflineDto);
		if (talentsOfflineDto != null) {
			if (fieldsOfSearchs == null) {
				// 初始化字段设置
				fieldsOfSearchs = new TreeMap<String, String>();
				List<ClassMasterDto> mastlist = EssentialDataUtil
						.queryEssentialDataListByParentCode(ApplicationConstant.SYS_INCREMENT_TALENTS_SEARCH_FIELD);
				if (mastlist != null) {
					for (ClassMasterDto tmp : mastlist) {
						if (!tmp.getCode()
								.equals(ApplicationConstant.SYS_INCREMENT_TALENTS_SEARCH_FIELD)) {
							fieldsOfSearchs.put(tmp.getCode().trim(), tmp
									.getName().trim());
						}
					}
				}
			}
			String[] fields = talentsOfflineDto.getFieldsOfSearch().split(",");
			String tmpStr = "";
			for (String field : fields) {
				tmpStr += fieldsOfSearchs.get(field.trim()) + "，";
			}
			talentsOfflineDto.setFieldsOfSearchName(tmpStr.substring(0,
					tmpStr.length() - 1));
		}
		
			/** 人才挖掘服务信息 **/
			SysIncrementTalentsFoundSettingDto talentsDto = getTalentsFoundDto(serviceCode);
			buyDetailDto.setTalentsFoundSettingDto(talentsDto);
			if(talentsDto != null){
				if(fieldsOfSearchs == null){
					//初始化字段设置
					fieldsOfSearchs = new TreeMap<String,String>();
					List<ClassMasterDto> mastlist = EssentialDataUtil.queryEssentialDataListByParentCode(ApplicationConstant.SYS_INCREMENT_TALENTS_SEARCH_FIELD);
					if(mastlist != null){
						for(ClassMasterDto tmp : mastlist){
							if(!tmp.getCode().equals(ApplicationConstant.SYS_INCREMENT_TALENTS_SEARCH_FIELD)){
								fieldsOfSearchs.put(tmp.getCode().trim(), tmp.getName().trim());
							}
						}
					}
				}
				String []fields = talentsDto.getFieldsOfSearch().split(",");
				String tmpStr = "";
				for(String field : fields){
					tmpStr += fieldsOfSearchs.get(field.trim()) + "，";
				}
				talentsDto.setFieldsOfSearchName(tmpStr.substring(0,tmpStr.length()-1));
			}
			/** 挂证服务信息 **/
			SysIncrementHangCardSettingDto hang = getHangCardDto(serviceCode);
			buyDetailDto.setHangCardSettingDto(hang);
			/** 猎证服务信息 **/
			SysIncrementHuntCardSettingDto hunt = getHuntCardDto(serviceCode);
			buyDetailDto.setHuntCardSettingDto(hunt);
			/** 招聘服务信息 **/
			SysIncrementRecruitSettingDto recruit = getRecruitDto(serviceCode);
			buyDetailDto.setRecruitSettingDto(recruit);
			/** 广告位服务信息 **/
			SysIncrementAdvertSettingDto advertDto = getAdvertDto(serviceCode);
			buyDetailDto.setAdvertSettingDto(advertDto);
			if(advertDto != null){
				//初始化字段设置
				if(advertisings == null){
					advertisings = new TreeMap<String,String>();
					//List<ClassMasterDto> mastlist = EssentialDataUtil.queryEssentialDataListByParentCode(Constants.SYS_INCREMENT_ADVERSITING_SEARCH_POSITION);
					List<ClassMasterDto> mastlist = EssentialDataUtil.querySpecializeListLikeCode(ApplicationConstant.SYS_INCREMENT_ADVERSITING_SEARCH_POSITION + "-");
					if(mastlist != null){
						for(ClassMasterDto tmp : mastlist){
							if(!tmp.getCode().equals(ApplicationConstant.SYS_INCREMENT_ADVERSITING_SEARCH_POSITION)){
								advertisings.put(tmp.getCode().trim(), tmp.getName().trim());
							}
						}
					}
				}
				String []fields = advertDto.getAdvertising().split(",");
				String tmpStr = "";
				for(String field : fields){
					tmpStr += advertisings.get(field.trim()) + "，";
				}
				advertDto.setAdvertisingName(tmpStr.substring(0,tmpStr.length()-1));
			}
		return "buyDetail";
	}
	/**
	 * 人才挖掘
	 * @param serviceCode
	 * @return
	 */
	private SysIncrementTalentsFoundSettingDto getTalentsFoundDto(String serviceCode){
		SysIncrementTalentsFoundSettingDto talentsDto = new SysIncrementTalentsFoundSettingDto();
		talentsDto.setServiceCode(serviceCode);
		return sysIncrementTalentsFoundSettingService.queryIncrementTalentsFound(talentsDto);
	}
	/**
	 * 线下人才挖掘
	 * @param serviceCode
	 * @return
	 */
	private SysIncrementTalentsFoundOfflineSettingDto getTalentsFoundOfflineDto(String serviceCode){
		SysIncrementTalentsFoundOfflineSettingDto talentsDto = new SysIncrementTalentsFoundOfflineSettingDto();
		talentsDto.setServiceCode(serviceCode);
		return sysIncrementTalentsFoundOfflineSettingService.queryIncrementTalentsFound(talentsDto);
	}
	/**
	 * 挂证服务
	 * @param serviceCode
	 * @return
	 */
	private SysIncrementHangCardSettingDto getHangCardDto(String serviceCode){
		SysIncrementHangCardSettingDto hangDto = new SysIncrementHangCardSettingDto();
		hangDto.setServiceCode(serviceCode);
		hangDto = sysIncrementHangCardSettingService.queryIncrementHangCard(hangDto);
		return hangDto;
	}
	/**
	 * 猎证服务
	 * @param serviceCode
	 * @return
	 */
	private SysIncrementHuntCardSettingDto getHuntCardDto(String serviceCode){
		SysIncrementHuntCardSettingDto huntDto = new SysIncrementHuntCardSettingDto();
		huntDto.setServiceCode(serviceCode);
		huntDto = sysIncrementHuntCardSettingService.queryIncrementHuntCard(huntDto);
		return huntDto;
	}
	/**
	 * 招聘服务
	 * @param serviceCode
	 * @return
	 */
	private SysIncrementRecruitSettingDto getRecruitDto(String serviceCode){
		SysIncrementRecruitSettingDto recruitDto = new SysIncrementRecruitSettingDto();
		recruitDto.setServiceCode(serviceCode);
		recruitDto = sysIncrementRecruitSettingService.queryIncrementRecruit(recruitDto);
		return recruitDto;
	}
	/**
	 * 广告位服务
	 * @param serviceCode
	 * @return
	 */
	private SysIncrementAdvertSettingDto getAdvertDto(String serviceCode){
		SysIncrementAdvertSettingDto advertDto = new SysIncrementAdvertSettingDto();
		advertDto.setServiceCode(serviceCode);
		advertDto = sysIncrementAdvertSettingService.queryIncrementAdvert(advertDto);
		return advertDto;
	}
	
	/**
	 * 快速预定 ，可购买的服务列表里直接点击预定
	 * @return
	 */
	public String fastOrder(){
		this.beforeView();
		return this.order();
	}
	
	/**
	 * 预定服务/商定续费
	 * @return
	 */
	public String order(){
		initData();
		if(buyDetailDto.getServiceCode() != null){
			String serviceCode = buyDetailDto.getServiceCode();
			
			//获取五类服务
			SysIncrementAdvertSettingDto advertSettingDto = buyDetailDto.getAdvertSettingDto();
			SysIncrementHangCardSettingDto hangCardSettingDto = buyDetailDto.getHangCardSettingDto();
			SysIncrementHuntCardSettingDto huntCardSettingDto = buyDetailDto.getHuntCardSettingDto();
			SysIncrementRecruitSettingDto recruitSettingDto = buyDetailDto.getRecruitSettingDto();
			SysIncrementTalentsFoundSettingDto talentsFoundSettingDto = buyDetailDto.getTalentsFoundSettingDto();
			SysIncrementTalentsFoundOfflineSettingDto talentsFoundOfflineSettingDto = buyDetailDto.getTalentsFoundOfflineSettingDto();
			
			//获取套餐价格
			String price = buyDetailDto.getPrice();
			String priceStatus = buyDetailDto.getPriceStatus();
			
			//新预定服务判断是否已存在
			if(decideExtensionFlag.equals("0")){
				//SysOrderDto tmp = new SysOrderDto();
				//tmp.setServiceCode(serviceCode);
				//tmp.setItemCode(serviceItem);
				//sysOrderService.queryOrder(tmp);
			}
			clear();
			
			//参数表
			List<SysOrderDto> paramList = new ArrayList<SysOrderDto>();
			Date currentDate = new Date();
			String orderId = StringUtil.newInstance().createIdTwenty();
			String resId = UUID.randomUUID().toString();
			
			if(advertSettingDto!=null){
				SysOrderDto dto1 = new SysOrderDto();
				dto1.setServiceCode(serviceCode);
				dto1.setItemCode(ApplicationConstant.SERVICE_ITEM_NAME_ADVERT_CODE);
				dto1.setInOrder(getLoginUserInfo().getId());
				dto1.setStatus(ApplicationConstant.ORDER_STATUS_0);
				dto1.setOrderDate(currentDate);
				dto1.setOrderId(orderId);
				dto1.setResId(resId);
				dto1.setExtensionFlag(ApplicationConstant.ORDER_EXTENSION_FLAG_NO);
				dto1.setPrice(price);
				dto1.setPriceStatus(priceStatus);
				dto1.setLastEditDate(currentDate);
				paramList.add(dto1);
			}
			
			if(hangCardSettingDto!=null){
				SysOrderDto dto2 = new SysOrderDto();
				dto2.setServiceCode(serviceCode);
				dto2.setItemCode(ApplicationConstant.SERVICE_ITEM_NAME_HANGCARD_CODE);
				dto2.setInOrder(getLoginUserInfo().getId());
				dto2.setStatus(ApplicationConstant.ORDER_STATUS_0);
				dto2.setOrderDate(currentDate);
				dto2.setOrderId(orderId);
				dto2.setResId(resId);
				dto2.setExtensionFlag(ApplicationConstant.ORDER_EXTENSION_FLAG_NO);
				dto2.setPrice(price);
				dto2.setPriceStatus(priceStatus);
				dto2.setLastEditDate(currentDate);
				paramList.add(dto2);
			}
			
			if(huntCardSettingDto!=null){
				SysOrderDto dto3 = new SysOrderDto();
				dto3.setServiceCode(serviceCode);
				dto3.setItemCode(ApplicationConstant.SERVICE_ITEM_NAME_HUNTCARD_CODE);
				dto3.setInOrder(getLoginUserInfo().getId());
				dto3.setStatus(ApplicationConstant.ORDER_STATUS_0);
				dto3.setOrderDate(currentDate);
				dto3.setOrderId(orderId);
				dto3.setResId(resId);
				dto3.setExtensionFlag(ApplicationConstant.ORDER_EXTENSION_FLAG_NO);
				dto3.setPrice(price);
				dto3.setPriceStatus(priceStatus);
				dto3.setLastEditDate(currentDate);
				paramList.add(dto3);
			}
			
			if(recruitSettingDto!=null){
				SysOrderDto dto4 = new SysOrderDto();
				dto4.setServiceCode(serviceCode);
				dto4.setItemCode(ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE);
				dto4.setInOrder(getLoginUserInfo().getId());
				dto4.setStatus(ApplicationConstant.ORDER_STATUS_0);
				dto4.setOrderDate(currentDate);
				dto4.setOrderId(orderId);
				dto4.setResId(resId);
				dto4.setExtensionFlag(ApplicationConstant.ORDER_EXTENSION_FLAG_NO);
				dto4.setPrice(price);
				dto4.setPriceStatus(priceStatus);
				dto4.setLastEditDate(currentDate);
				paramList.add(dto4);
			}
			
			if(talentsFoundSettingDto!=null){
				SysOrderDto dto5 = new SysOrderDto();
				dto5.setServiceCode(serviceCode);
				dto5.setItemCode(ApplicationConstant.SERVICE_ITEM_NAME_TALENTSFOUND_CODE);
				dto5.setInOrder(getLoginUserInfo().getId());
				dto5.setStatus(ApplicationConstant.ORDER_STATUS_0);
				dto5.setOrderDate(currentDate);
				dto5.setOrderId(orderId);
				dto5.setResId(resId);
				dto5.setExtensionFlag(ApplicationConstant.ORDER_EXTENSION_FLAG_NO);
				dto5.setPrice(price);
				dto5.setPriceStatus(priceStatus);
				dto5.setLastEditDate(currentDate);
				paramList.add(dto5);
			}
			if(talentsFoundOfflineSettingDto!=null){
				SysOrderDto dto6 = new SysOrderDto();
				dto6.setServiceCode(serviceCode);
				dto6.setItemCode(ApplicationConstant.SERVICE_ITEM_NAME_TALENTSFOUND_OFFLINE_CODE);
				dto6.setInOrder(getLoginUserInfo().getId());
				dto6.setStatus(ApplicationConstant.ORDER_STATUS_0);
				dto6.setOrderDate(currentDate);
				dto6.setOrderId(orderId);
				dto6.setResId(resId);
				dto6.setExtensionFlag(ApplicationConstant.ORDER_EXTENSION_FLAG_NO);
				dto6.setPrice(price);
				dto6.setPriceStatus(priceStatus);
				dto6.setLastEditDate(currentDate);
				paramList.add(dto6);
			}
			
			if(!paramList.isEmpty()){
				sysOrderService.addOrder(paramList);
				//msg = "<script>function init(){alert('预定成功');}</script>";
				msg = "1";
			}
			else{
				//msg = "<script>function init(){alert('预定失败');}</script>";
				msg = "0";
			}
		}
		return "orderSuccess";
	}
	/**
	 * 清空对象
	 */
	private void clear(){
		buySearchDto = new IncrementServiceDto();
		buyDetailDto = new IncrementServiceDto();
		boughtSearchDto = new SysOrderDto();
		boughtDetailDto = new SysOrderDto();
		msg = "";
	}
	/** -------------------------------------- bought service ----------------------------------**/
	/**
	 * 已购买的服务初始化
	 * @return
	 */
	public String boughtServiceInit(){
		initData();
		clear();
		//已购买标志
		decideExtensionFlag = "1";
		searchBoughtData();
		return "boughtMain";
	}
	/**
	 * 查询已购买的服务
	 * @return
	 */
	public String searchBought(){
		initData();
		searchBoughtData();
		decideExtensionFlag = "1";
		return "boughtMain";
	}
	private void searchBoughtData(){
		if(pageInfo == null){
			pageInfo = new PageInfo();
		}
		boughtSearchDto.setInOrder(getLoginUserInfo().getId());
		//已购买服务设置
		boughtSearchDto.setEndDate(null);
		if(decideExtensionFlag.equals("1")){
		//已过期服务设置
		}else if(decideExtensionFlag.equals("2")){
			boughtSearchDto.setEndDate(new Date());
		}
		//过期时间
		SysParameterDto parameter = sysParameterService.getSysParameterDtoBycode(ApplicationConstant.ORDER_PAY_DUE_TIME);
		Long afterTime = new Date().getTime();
		if(parameter != null){
			payDueTime = parameter.getSysValue();
			afterTime = StringUtil.newInstance().Ds(-Integer.valueOf(payDueTime)).getTime();
		}
		boughtList = sysOrderService.queryOrderList(pageInfo, boughtSearchDto);
		if(boughtList != null){
			for(int i = 0;i < boughtList.size();i++){
				SysOrderDto tmp = boughtList.get(i);
				String item = tmp.getItemCode();
				String itemName = serviceItems.get(item);
				boughtList.get(i).setItemName(itemName);
				String status = tmp.getStatus();
				String statusName = "";
				if(status.equals("0")){
					statusName = "未支付";
				}else if(status.equals("1")){
					statusName = "已支付";
				}
				//是否过期
				Long orderTime = tmp.getOrderDate().getTime();
				//超出订单支付时间
				if(orderTime < afterTime  || tmp.getStatus().equals("1")){
					boughtList.get(i).setCanEdit(false);
				}
				boughtList.get(i).setStatusName(statusName);
				//设置服务状态
				if(status.equals("1")){
					if(new Date().getTime() > tmp.getEndDate().getTime()){
						boughtList.get(i).setServiceStatus(ApplicationConstant.ORDER_SERVICE_STATUS_EXPIRED);
					}else{
						boughtList.get(i).setServiceStatus(ApplicationConstant.ORDER_SERVICE_STATUS_ENABLED);
					}
				}else{
					boughtList.get(i).setServiceStatus(ApplicationConstant.ORDER_SERVICE_STATUS_DISABLED);
				}
			}
		}
	}
	/**
	 * 续期
	 * @return
	 */
	public String extension(){
		initData();
		if(extensionResId != null){
			SysOrderDto tmp = new SysOrderDto();
			
			//只根据resId查找，清除ID
			tmp.setId(null);
			tmp.setResId(extensionResId);
			List<SysOrderDto> orderList = sysOrderService.queryOrderByOrderIdList(tmp);
			String resId = UUID.randomUUID().toString();
			String orderId = StringUtil.newInstance().createIdTwenty();
			Date currentDate = new Date();
			
			for (SysOrderDto temp : orderList){
				temp.setOrderId(orderId);
				temp.setResId(resId);
				temp.setOrderDate(currentDate);
				temp.setLastEditDate(currentDate);
				temp.setStartDate(null);
				temp.setEndDate(null);
				temp.setPayDate(null);
				temp.setStatus("0");
				temp.setConfirmor(null);
				temp.setExtensionFlag(ApplicationConstant.ORDER_EXTENSION_FLAG_YES);
			}
			sysOrderService.addOrder(orderList);
			searchBoughtData();
		}
		if(decideExtensionFlag.equals("1")){
			return "extensionFromBought";
		}else if(decideExtensionFlag.equals("2")){
			return "extensionFromExpired";
		}
		return null;
	}
	/**
	 * 商定续费
	 * @return
	 */
	public String decideExtension(){
		initData();
		if(extensionResId != null){
			SysOrderDto tmp = new SysOrderDto();
			
			//只根据resId查找，清除ID
			tmp.setId(null);
			tmp.setResId(extensionResId);
			List<SysOrderDto> orderList = sysOrderService.queryOrderByOrderIdList(tmp);
			
			String resId = UUID.randomUUID().toString();
			String orderId = StringUtil.newInstance().createIdTwenty();
			Date currentDate = new Date();
			
			for (SysOrderDto temp : orderList){
				temp.setOrderDate(currentDate);
				temp.setLastEditDate(currentDate);
				temp.setOrderId(orderId);
				temp.setResId(resId);
				temp.setStartDate(null);
				temp.setEndDate(null);
				temp.setPayDate(null);
				temp.setStatus("0");
				temp.setConfirmor(null);
				temp.setPrice(buyDetailDto.getPrice());
				temp.setPriceStatus("0");
				temp.setExtensionFlag(ApplicationConstant.ORDER_EXTENSION_FLAG_YES);
			}
			

			sysOrderService.addOrder(orderList);
			searchBoughtData();
		}
		if(decideExtensionFlag.equals("1")){
			return "extensionFromBought";
		}else if(decideExtensionFlag.equals("2")){
			return "extensionFromExpired";
		}
		return null;
	}
	/**
	 * 删除订单
	 * @return
	 */
	public String remove(){
		initData();
		if(selectAlls != null){
			for(String resId : selectAlls){
				SysOrderDto tmp = new SysOrderDto();
				tmp.setResId(resId);
				sysOrderService.removeOrder(tmp);
			}
		}
		searchBoughtData();
		if(decideExtensionFlag.equals("1")){
			return "removeFromBought";
		}else if(decideExtensionFlag.equals("2")){
			return "removeFromExpired";
		}
		return null;
	}
	/**
	 * 已过期的服务初始化
	 * @return
	 */
	public String expiredServiceInit(){
		initData();
		clear();
		//已过期标志
		decideExtensionFlag = "2";
		searchBoughtData();
		return "expiredMain";
	}
	/**
	 * 过期服务查询
	 * @return
	 */
	public String searchExpiredService(){
		decideExtensionFlag = "2";
		searchBoughtData();
		return "expiredMain";
	}
	public ISysOrderService getSysOrderService() {
		return sysOrderService;
	}
	public void setSysOrderService(ISysOrderService sysOrderService) {
		this.sysOrderService = sysOrderService;
	}
	public ISysIncrementServiceNameMaintainanceService getSysIncrementServiceNameMaintainanceService() {
		return sysIncrementServiceNameMaintainanceService;
	}
	public void setSysIncrementServiceNameMaintainanceService(
			ISysIncrementServiceNameMaintainanceService sysIncrementServiceNameMaintainanceService) {
		this.sysIncrementServiceNameMaintainanceService = sysIncrementServiceNameMaintainanceService;
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

	public Map<String, String> getServiceItems() {
		return serviceItems;
	}

	public void setServiceItems(Map<String, String> serviceItems) {
		this.serviceItems = serviceItems;
	}
	public IncrementServiceDto getBuySearchDto() {
		return buySearchDto;
	}
	public void setBuySearchDto(IncrementServiceDto buySearchDto) {
		this.buySearchDto = buySearchDto;
	}
	public List<IncrementServiceDto> getBuyServiceList() {
		return buyServiceList;
	}
	public void setBuyServiceList(List<IncrementServiceDto> buyServiceList) {
		this.buyServiceList = buyServiceList;
	}
	public IncrementServiceDto getBuyDetailDto() {
		return buyDetailDto;
	}
	public void setBuyDetailDto(IncrementServiceDto buyDetailDto) {
		this.buyDetailDto = buyDetailDto;
	}
	public PageInfo getPageInfo() {
		return pageInfo;
	}
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public SysOrderDto getBoughtSearchDto() {
		return boughtSearchDto;
	}
	public void setBoughtSearchDto(SysOrderDto boughtSearchDto) {
		this.boughtSearchDto = boughtSearchDto;
	}
	public List<SysOrderDto> getBoughtList() {
		return boughtList;
	}
	public void setBoughtList(List<SysOrderDto> boughtList) {
		this.boughtList = boughtList;
	}
	public SysOrderDto getBoughtDetailDto() {
		return boughtDetailDto;
	}
	public void setBoughtDetailDto(SysOrderDto boughtDetailDto) {
		this.boughtDetailDto = boughtDetailDto;
	}
	public String[] getSelectAlls() {
		return selectAlls;
	}
	public void setSelectAlls(String[] selectAlls) {
		this.selectAlls = selectAlls;
	}
	public String getExtensionOrderId() {
		return extensionOrderId;
	}
	public void setExtensionOrderId(String extensionOrderId) {
		this.extensionOrderId = extensionOrderId;
	}
	public String getDecideExtensionFlag() {
		return decideExtensionFlag;
	}
	public void setDecideExtensionFlag(String decideExtensionFlag) {
		this.decideExtensionFlag = decideExtensionFlag;
	}
	public ISysParameterService getSysParameterService() {
		return sysParameterService;
	}
	public void setSysParameterService(ISysParameterService sysParameterService) {
		this.sysParameterService = sysParameterService;
	}
	public String getExtensionResId() {
		return extensionResId;
	}
	public void setExtensionResId(String extensionResId) {
		this.extensionResId = extensionResId;
	}
	public ISysIncrementTalentsFoundOfflineSettingService getSysIncrementTalentsFoundOfflineSettingService() {
		return sysIncrementTalentsFoundOfflineSettingService;
	}
	public void setSysIncrementTalentsFoundOfflineSettingService(
			ISysIncrementTalentsFoundOfflineSettingService sysIncrementTalentsFoundOfflineSettingService) {
		this.sysIncrementTalentsFoundOfflineSettingService = sysIncrementTalentsFoundOfflineSettingService;
	}
	

}
