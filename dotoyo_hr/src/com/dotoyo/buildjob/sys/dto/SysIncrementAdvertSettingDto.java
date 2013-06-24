package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
import java.util.Date;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
/**
 * 广告服务设置DTO
 * @author wisdy.xiao
 *
 */
public class SysIncrementAdvertSettingDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 7768173177060391820L;
	private Long id;
	private String serviceCode;  //服务编码
	private String serviceName;  //服务名称
	private String itemName = ApplicationConstant.SERVICE_ITEM_NAME_ADVERT;
	private String advertising;   //查看发布职位次数(017-1001首页---第一个位置,017-1002首页---第二个位置,017-1003人才中心---第一个位置....)
	private String advertisingName;//次数名称
	private Long operator;        //操作人
	private String operatorName;  //操作人名称
	private Date submitDate;      //创建/提交时间
	private Date lastEditDate;    //最后编辑/更新时间
	public Long getId() {
		return id;
	}

	public String getServiceName() {
		return serviceName == null ? "" : serviceName.trim();
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getServiceCode() {
		return serviceCode == null ? "" : serviceCode.trim();
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}

	public String getAdvertisingName() {
		return advertisingName == null ? "" : advertisingName;
	}

	public void setAdvertisingName(String advertisingName) {
		this.advertisingName = advertisingName;
	}

	public String getAdvertising() {
		if(advertising != null){
			String tmps [] = advertising.split(",");
			String str = "";
			for(String tmp : tmps){
				str += tmp.trim() + ",";
			}
			advertising = str.substring(0,str.length()-1);
		}
		return advertising == null ? "" : advertising.trim();
	}
	public void setAdvertising(String advertising) {
		this.advertising = advertising;
	}
	public Long getOperator() {
		return operator;
	}
	public void setOperator(Long operator) {
		this.operator = operator;
	}
	public Date getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}
	public Date getLastEditDate() {
		return lastEditDate;
	}
	public void setLastEditDate(Date lastEditDate) {
		this.lastEditDate = lastEditDate;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getOperatorName() {
		return operatorName == null ? "" : operatorName.trim();
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	public String getItemName() {
		return itemName == null ? "" : itemName.trim();
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

}
