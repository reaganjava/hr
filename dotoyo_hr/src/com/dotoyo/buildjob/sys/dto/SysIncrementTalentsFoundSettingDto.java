package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
import java.util.Date;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
/**
 * 人才挖掘服务设置DTO
 * @author wisdy.xiao
 *
 */
public class SysIncrementTalentsFoundSettingDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 7768173177060391820L;
	private Long id;
	private String serviceCode;       //服务代码
	private String serviceName;
	private String itemName = ApplicationConstant.SERVICE_ITEM_NAME_TALENTSFOUND;
	private Long timesOfSearch;   //可搜索的次数',
	private String fieldsOfSearch = "";//016-1001行业筛选,016-1002职位筛选,016-1003地区筛选,016-1004证书名称',
	private String fieldsOfSearchName;//字段名称
	private Long operator;        //操作人
	private String operatorName;  //操作人名称
	private Date submitDate;      //创建/提交时间
	private Date lastEditDate;    //最后编辑/更新时间
	
	public SysIncrementTalentsFoundSettingDto() {
	}
	
	public Long getId() {
		return id;
	}

	public String getOperatorName() {
		return operatorName == null ? "" : operatorName.trim();
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
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

	public Long getTimesOfSearch() {
		return timesOfSearch;
	}
	public void setTimesOfSearch(Long timesOfSearch) {
		this.timesOfSearch = timesOfSearch;
	}
	public String getFieldsOfSearch() {
		//去空格
		if(fieldsOfSearch != null){
			String tmps [] = fieldsOfSearch.split(",");
			String str = "";
			for(String tmp : tmps){
				str += tmp.trim() + ",";
			}
			fieldsOfSearch = str.substring(0,str.length()-1);
		}
		return fieldsOfSearch == null ? "" : fieldsOfSearch.trim();
	}
	public void setFieldsOfSearch(String fieldsOfSearch) {
		this.fieldsOfSearch = fieldsOfSearch;
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

	public String getFieldsOfSearchName() {
		return fieldsOfSearchName == null ? "" : fieldsOfSearchName.trim();
	}

	public void setFieldsOfSearchName(String fieldsOfSearchName) {
		this.fieldsOfSearchName = fieldsOfSearchName;
	}

	public String getItemName() {
		return itemName == null ? "" : itemName.trim();
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}



}
