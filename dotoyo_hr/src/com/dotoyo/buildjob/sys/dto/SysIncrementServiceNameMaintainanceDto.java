package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
import java.util.Date;
/**
 * 增值服务名称维护DTO
 * @author wisdy.xiao
 *
 */
public class SysIncrementServiceNameMaintainanceDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 7768173177060391820L;
	private String serviceCode; // 服务编码
	private String serviceType;// 套餐类型
	private String serviceName; // 服务名称
	private Long usableDays; // 可用天数
	private String serviceIntro; // 服务简介
	private Long operator; // 操作人
	private String operatorName; // 操作人名称
	private Date submitDate; // 创建/提交时间
	private Date lastEditDate; // 最后编辑/更新时间
	private String price = ""; // 价格
	private String priceStatus = ""; // 价格状态
	public String getServiceCode() {
		return serviceCode != null ? serviceCode.trim() : "";
	}
	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}
	public String getServiceName() {
		return serviceName != null ? serviceName.trim() : "";
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public Long getUsableDays() {
		return usableDays;
	}
	public void setUsableDays(Long usableDays) {
		this.usableDays = usableDays;
	}
	public String getServiceIntro() {
		return serviceIntro != null ? serviceIntro.trim() : "";
	}
	public void setServiceIntro(String serviceIntro) {
		this.serviceIntro = serviceIntro;
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
	public String getOperatorName() {
		return operatorName  == null ? "" :  operatorName.trim();
	}
	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPriceStatus() {
		return priceStatus;
	}
	public void setPriceStatus(String priceStatus) {
		this.priceStatus = priceStatus;
	}
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	
}
