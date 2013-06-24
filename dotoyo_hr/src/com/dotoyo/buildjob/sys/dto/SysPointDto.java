package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
/**
 * 积分设置DTO
 * @author wisdy.xiao
 *
 */
public class SysPointDto implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 6616756305680112050L;
	private Long id;
	private String code;    //积分编码
	private String action;    //操作行为
	private Long point;  //积分值
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCode() {
		return code == null ? "" : code.trim();
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAction() {
		return action == null ? "" : action.trim();
	}
	public void setAction(String action) {
		this.action = action;
	}
	public Long getPoint() {
		return point;
	}
	public void setPoint(Long point) {
		this.point = point;
	}

}
