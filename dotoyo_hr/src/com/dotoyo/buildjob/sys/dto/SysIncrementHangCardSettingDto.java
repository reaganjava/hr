package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
import java.util.Date;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
/**
 * 挂证服务设置DTO
 * @author wisdy.xiao
 *
 */
public class SysIncrementHangCardSettingDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 7768173177060391820L;
	private Long id;
	private String serviceCode;  //服务编码
	private String serviceName;  //服务名称
	private String itemName = ApplicationConstant.SERVICE_ITEM_NAME_HANGCARD;
	public String getItemName() {
		return itemName;
	}
	private Long countOfSubmit; //整数提交个数
	private Long operator;      //操作人
	private String operatorName;  //操作人名称
	public String getOperatorName() {
		return operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}
	private Date submitDate;    //创建/提交时间
	private Date lastEditDate;  //最后编辑/更新时间
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

	public Long getCountOfSubmit() {
		return countOfSubmit;
	}
	public void setCountOfSubmit(Long countOfSubmit) {
		this.countOfSubmit = countOfSubmit;
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
}
