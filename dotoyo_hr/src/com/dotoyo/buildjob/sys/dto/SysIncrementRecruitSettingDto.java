package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
import java.util.Date;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
/**
 * 招聘服务设置DTO
 * @author wisdy.xiao
 *
 */
public class SysIncrementRecruitSettingDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 7768173177060391820L;
	private Long id;
	private String serviceCode;  //服务编码
	private String serviceName;  //服务名称
	private String itemName = ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT;
	private Long timesOfPublicPosition; //查看发布职位次数
	private Long timesOfLookupBlog;    //查看发布职位次数
	private Long timesOfLookupInvite;  //查看邀请面试次数
	private Long operator;             //操作人
	private String operatorName;  //操作人名称
	private Date submitDate;           //创建/提交时间
	private Date lastEditDate;         //最后编辑/更新时间
	public Long getId() {
		return id;
	}
	public String getServiceName() {
		return serviceName == null ? "" : serviceName.trim();
	}

	public String getOperatorName() {
		return operatorName == null ? "" : operatorName.trim();
	}
	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
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

	public Long getTimesOfPublicPosition() {
		return timesOfPublicPosition;
	}
	public void setTimesOfPublicPosition(Long timesOfPublicPosition) {
		this.timesOfPublicPosition = timesOfPublicPosition;
	}
	public Long getTimesOfLookupBlog() {
		return timesOfLookupBlog;
	}
	public void setTimesOfLookupBlog(Long timesOfLookupBlog) {
		this.timesOfLookupBlog = timesOfLookupBlog;
	}
	public Long getTimesOfLookupInvite() {
		return timesOfLookupInvite;
	}
	public void setTimesOfLookupInvite(Long timesOfLookupInvite) {
		this.timesOfLookupInvite = timesOfLookupInvite;
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
	public String getItemName() {
		return itemName == null ? "" : itemName.trim();
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
}
