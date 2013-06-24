package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
/**
 * 用户角色映射DTO
 * @author wisdy.xiao
 *
 */
public class SysUserRoleDto implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = -576400397233669738L;
	private Long id;
	private Long userid;   //用户ID
	private Long roleid;   //角色ID
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getUserid() {
		return userid;
	}
	public void setUserid(Long userid) {
		this.userid = userid;
	}
	public Long getRoleid() {
		return roleid;
	}
	public void setRoleid(Long roleid) {
		this.roleid = roleid;
	}

}
