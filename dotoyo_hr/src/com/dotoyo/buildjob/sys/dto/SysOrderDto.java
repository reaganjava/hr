package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dotoyo.buildjob.common.util.StringUtil;

/**
 * 订单管理
 * 
 * @author wisdy.xiao
 * 
 */
public class SysOrderDto implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 6094894084895318281L;
	private Long id;
	private String serviceCode; // 服务代码
	private String serviceName; // 服务名称
	private String itemCode; // 服务项目
	private String itemName; // 服务项目名称
	private Long inOrder; // 下单人
	private String inOrderName; // 下单人名称

	private String status; // 订单状态
	private String statusName; // 订单状态
	private Date payDate; // 支付日期
	private Date fromPayDate; // 支付日期起
	private Date toPayDate; // 支付日期止
	private String fromPay;
	private String toPay;
	private String pay; // 支付日期

	private Date orderDate; // 订单日期
	private Date fromOrderDate; // 订单日期起
	private Date toOrderDate; // 订单日期止
	private String fromOrder;
	private String toOrder;

	private String price; // 价格
	private String priceStatus;// 价格状态
	private Long confirmor; // 确认人
	private String confirmorName; // 确认人名称

	private Long operator; // 操作人
	private Date lastEditDate; // 最后更新时间
	private String remark = ""; // 备注

	private String orderId; // 订单ID
	private String resId;// 唯一订单ID
	private String extensionFlag; // '续期标志,0 否 ，1 是',
	private Long extensionDays; // '续期天数
	private Date startDate; // 服务开始时间
	private Date endDate; // 服务结束时间
	private String serviceStatus = ""; // 服务状态
	private SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd");

	private Long service1Remains;
	private Long service2Remains;
	private Long service3Remains;
	private String isNew;//是否新订单

	private Boolean canEdit = true; // 是否可修改

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getServiceCode() {
		return serviceCode;
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}

	public Long getInOrder() {
		return inOrder;
	}

	public void setInOrder(Long inOrder) {
		this.inOrder = inOrder;
	}

	public String getStatus() {
		return status == null ? "" : status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getPayDate() throws ParseException {
		if (pay != null && !pay.equals("")) {
			if (StringUtil.newInstance().sNull(pay).equals(""))
				return null;
			return simpleFormat.parse(pay);
		}
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getPrice() {
		return price == null ? "" : price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Long getConfirmor() {
		return confirmor;
	}

	public void setConfirmor(Long confirmor) {
		this.confirmor = confirmor;
	}

	public Long getOperator() {
		return operator;
	}

	public void setOperator(Long operator) {
		this.operator = operator;
	}

	public Date getLastEditDate() {
		return lastEditDate;
	}

	public void setLastEditDate(Date lastEditDate) {
		this.lastEditDate = lastEditDate;
	}

	public String getServiceName() {
		return serviceName == null ? "" : serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getInOrderName() {
		return inOrderName == null ? "" : inOrderName;
	}

	public void setInOrderName(String inOrderName) {
		this.inOrderName = inOrderName;
	}

	public Date getFromPayDate() throws ParseException {
		if (StringUtil.newInstance().sNull(fromPay).equals(""))
			return null;
		return simpleFormat.parse(fromPay);
	}

	public void setFromPayDate(Date fromPayDate) {
		this.fromPayDate = fromPayDate;
	}

	public Date getToPayDate() throws ParseException {
		if (StringUtil.newInstance().sNull(toPay).equals(""))
			return null;
		return simpleFormat.parse(toPay);
	}

	public void setToPayDate(Date toPayDate) {
		this.toPayDate = toPayDate;
	}

	public Date getFromOrderDate() throws ParseException {
		if (StringUtil.newInstance().sNull(fromOrder).equals(""))
			return null;
		return simpleFormat.parse(fromOrder);
	}

	public void setFromOrderDate(Date fromOrderDate) {
		this.fromOrderDate = fromOrderDate;
	}

	public Date getToOrderDate() throws ParseException {
		if (StringUtil.newInstance().sNull(toOrder).equals(""))
			return null;
		return simpleFormat.parse(toOrder);
	}

	public void setToOrderDate(Date toOrderDate) {
		this.toOrderDate = toOrderDate;
	}

	public String getConfirmorName() {
		return confirmorName == null ? "" : confirmorName;
	}

	public void setConfirmorName(String confirmorName) {
		this.confirmorName = confirmorName;
	}

	public String getStatusName() {
		return statusName == null ? "" : statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getFromPay() {
		return fromPay == null ? "" : fromPay;
	}

	public void setFromPay(String fromPay) {
		this.fromPay = fromPay;
	}

	public String getToPay() {
		return toPay == null ? "" : toPay;
	}

	public void setToPay(String toPay) {
		this.toPay = toPay;
	}

	public String getFromOrder() {
		return fromOrder == null ? "" : fromOrder;
	}

	public void setFromOrder(String fromOrder) {
		this.fromOrder = fromOrder;
	}

	public String getToOrder() {
		return toOrder == null ? "" : toOrder;
	}

	public void setToOrder(String toOrder) {
		this.toOrder = toOrder;
	}

	public String getRemark() {
		return remark == null ? "" : remark.trim();
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getPay() {
		return pay == null ? "" : pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getItemCode() {
		return itemCode == null ? "" : itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName == null ? "" : itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getExtensionFlag() {
		return extensionFlag == null ? "" : extensionFlag;
	}

	public void setExtensionFlag(String extensionFlag) {
		this.extensionFlag = extensionFlag;
	}

	public Long getExtensionDays() {
		return extensionDays;
	}

	public void setExtensionDays(Long extensionDays) {
		this.extensionDays = extensionDays;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public SimpleDateFormat getSimpleFormat() {
		return simpleFormat;
	}

	public void setSimpleFormat(SimpleDateFormat simpleFormat) {
		this.simpleFormat = simpleFormat;
	}

	public String getServiceStatus() {
		return serviceStatus == null ? "" : serviceStatus;
	}

	public void setServiceStatus(String serviceStatus) {
		this.serviceStatus = serviceStatus;
	}

	public Boolean getCanEdit() {
		return canEdit;
	}

	public void setCanEdit(Boolean canEdit) {
		this.canEdit = canEdit;
	}

	public Long getService1Remains() {
		return service1Remains;
	}

	public void setService1Remains(Long service1Remains) {
		this.service1Remains = service1Remains;
	}

	public Long getService2Remains() {
		return service2Remains;
	}

	public void setService2Remains(Long service2Remains) {
		this.service2Remains = service2Remains;
	}

	public Long getService3Remains() {
		return service3Remains;
	}

	public void setService3Remains(Long service3Remains) {
		this.service3Remains = service3Remains;
	}

	public String getPriceStatus() {
		return priceStatus;
	}

	public void setPriceStatus(String priceStatus) {
		this.priceStatus = priceStatus;
	}

	public String getResId() {
		return resId;
	}

	public void setResId(String resId) {
		this.resId = resId;
	}

	public String getIsNew() {
		return isNew;
	}

	public void setIsNew(String isNew) {
		this.isNew = isNew;
	}
	
}
