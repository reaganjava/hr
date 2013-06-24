package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;

public class IncrementServiceDto implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	/** 广告服务 **/
	private SysIncrementAdvertSettingDto advertSettingDto;
	/** 挂证服务 **/
	private SysIncrementHangCardSettingDto hangCardSettingDto;
	/** 猎证服务 **/
	private SysIncrementHuntCardSettingDto huntCardSettingDto;
	/** 招聘服务 **/
	private SysIncrementRecruitSettingDto recruitSettingDto;
	/** 人才挖掘服务 **/
	private SysIncrementTalentsFoundSettingDto talentsFoundSettingDto;
	
	private SysIncrementTalentsFoundOfflineSettingDto talentsFoundOfflineSettingDto;
	/** 服务名称 **/
	private SysIncrementServiceNameMaintainanceDto nameMaintainanceDto;
	private String price;
	private String priceStatus;
	private String serviceItem;
	private String itemName;
	private String serviceName;
	private String intro;
	private String serviceCode;
	private String userType;//用户类型 0 个人用户 1企业
	private String advertising;


	public SysIncrementAdvertSettingDto getAdvertSettingDto() {
		return advertSettingDto;
	}

	public void setAdvertSettingDto(SysIncrementAdvertSettingDto advertSettingDto) {
		this.advertSettingDto = advertSettingDto;
	}

	public SysIncrementHangCardSettingDto getHangCardSettingDto() {
		return hangCardSettingDto;
	}

	public void setHangCardSettingDto(
			SysIncrementHangCardSettingDto hangCardSettingDto) {
		this.hangCardSettingDto = hangCardSettingDto;
	}

	public SysIncrementHuntCardSettingDto getHuntCardSettingDto() {
		return huntCardSettingDto;
	}

	public void setHuntCardSettingDto(
			SysIncrementHuntCardSettingDto huntCardSettingDto) {
		this.huntCardSettingDto = huntCardSettingDto;
	}

	public SysIncrementRecruitSettingDto getRecruitSettingDto() {
		return recruitSettingDto;
	}

	public void setRecruitSettingDto(SysIncrementRecruitSettingDto recruitSettingDto) {
		this.recruitSettingDto = recruitSettingDto;
	}

	public SysIncrementTalentsFoundSettingDto getTalentsFoundSettingDto() {
		return talentsFoundSettingDto;
	}

	public void setTalentsFoundSettingDto(
			SysIncrementTalentsFoundSettingDto talentsFoundSettingDto) {
		this.talentsFoundSettingDto = talentsFoundSettingDto;
	}

	public SysIncrementServiceNameMaintainanceDto getNameMaintainanceDto() {
		return nameMaintainanceDto;
	}

	public void setNameMaintainanceDto(
			SysIncrementServiceNameMaintainanceDto nameMaintainanceDto) {
		this.nameMaintainanceDto = nameMaintainanceDto;
	}

	public String getServiceItem() {
		return serviceItem == null ? "" : serviceItem;
	}

	public void setServiceItem(String serviceItem) {
		this.serviceItem = serviceItem;
	}

	public String getPrice() {
		return price == null ? "" : price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getServiceName() {
		return serviceName == null ? "" : serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getIntro() {
		return intro == null ? "" : intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getServiceCode() {
		return serviceCode == null ? "" : serviceCode;
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}

	public String getItemName() {
		return itemName == null ? "" : itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getPriceStatus() {
		return priceStatus;
	}

	public void setPriceStatus(String priceStatus) {
		this.priceStatus = priceStatus;
	}

	public String getAdvertising() {
		return advertising;
	}

	public void setAdvertising(String advertising) {
		this.advertising = advertising;
	}

	public SysIncrementTalentsFoundOfflineSettingDto getTalentsFoundOfflineSettingDto() {
		return talentsFoundOfflineSettingDto;
	}

	public void setTalentsFoundOfflineSettingDto(
			SysIncrementTalentsFoundOfflineSettingDto talentsFoundOfflineSettingDto) {
		this.talentsFoundOfflineSettingDto = talentsFoundOfflineSettingDto;
	}
	
}
