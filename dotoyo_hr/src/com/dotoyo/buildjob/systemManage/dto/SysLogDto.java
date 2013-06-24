package com.dotoyo.buildjob.systemManage.dto;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dotoyo.buildjob.common.util.StringUtil;
/**
 * 系统日志
 * @author wisdy.xiao
 *
 */
public class SysLogDto implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = -746833584559123927L;
	private Long id;
	private Long operator;
	private String operatorName;
	private String action;
	private String ip;
	private Date operate_time;
	private String operateTime;
	private SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd");
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getOperator() {
		return operator;
	}
	public void setOperator(Long operator) {
		this.operator = operator;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getOperate_time() throws ParseException {
		if(operateTime != null && !operateTime.equals("")){
			if(StringUtil.newInstance().sNull(operateTime).equals("")) return null;
			return simpleFormat.parse(operateTime);
		}
		return operate_time;
	}
	public void setOperate_time(Date operateTime) {
		operate_time = operateTime;
	}
	public String getOperatorName() {
		return operatorName == null ? "" : operatorName.trim();
	}
	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}
	public String getOperateTime() {
		return operateTime == null ? "" : operateTime.trim();
	}
	public void setOperateTime(String operateTime) {
		this.operateTime = operateTime;
	}

}
