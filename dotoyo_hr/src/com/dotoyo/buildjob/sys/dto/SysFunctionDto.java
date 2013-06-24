package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
/**
 * 系统管理功能点DTO
 * @author wisdy.xiao
 *
 */
public class SysFunctionDto implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 6616756305680112050L;
	private Long id;
	private String code;    //功能编码
	private String name;    //功能名称
	private Long roleid;  //角色
	private Long userid;  //用户
	
	/**
	 * 属性editable，表示在对单独的一个管理员进行权限分配时，该管理员的某个权限是否已选择，是否可编辑。如果该管理已所属的角色包含此权限，
	 * 那么这个权限对于这个管理员来说默认是选中并且不可编辑的，这时editable字段不为空
	 */
	private Long editable;

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
	public Long getEditable() {
		return editable;
	}
	public void setEditable(Long editable) {
		this.editable = editable;
	}
	
}
