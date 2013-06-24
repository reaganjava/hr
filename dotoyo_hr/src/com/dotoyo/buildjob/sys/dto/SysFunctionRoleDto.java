package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
/**
 * 功能与角色映射DTO
 * @author wisdy.xiao
 *
 */
public class SysFunctionRoleDto implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 1977062895053884577L;
	private Long id;
	private Long functionid;   //功能ID
	private Long roleid;       //角色ID
	private Long userid;       //用户ID
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getFunctionid() {
		return functionid;
	}
	public void setFunctionid(Long functionid) {
		this.functionid = functionid;
	}
	public Long getRoleid() {
		return roleid;
	}
	public void setRoleid(Long roleid) {
		this.roleid = roleid;
	}
	public Long getUserid() {
		return userid;
	}
	public void setUserid(Long userid) {
		this.userid = userid;
	}

}
