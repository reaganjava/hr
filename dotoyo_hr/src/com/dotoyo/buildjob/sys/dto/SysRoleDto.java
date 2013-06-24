package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
/**
 * 系统管理角色DTO
 * @author wisdy.xiao
 *
 */

public class SysRoleDto implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = -4670313261313870248L;
	private Long id;
	private String code;    //角色编码
	private String name;    //角色名称
	private Long assignCounts;//角色分配给用户的个数
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
	public String getName() {
		return name != null ? name.trim() : "";
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getAssignCounts() {
		return assignCounts;
	}
	public void setAssignCounts(Long assignCounts) {
		this.assignCounts = assignCounts;
	}


}
