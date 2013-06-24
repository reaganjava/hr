package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysUserRoleAdminDao;
import com.dotoyo.buildjob.sys.dto.SysRoleDto;
import com.dotoyo.buildjob.sys.dto.SysUserDto;
import com.dotoyo.buildjob.sys.dto.SysUserRoleDto;

public class SysUserRoleAdminDaoImpl implements ISysUserRoleAdminDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	public void add(SysUserRoleDto dto) {
		sqlMapClientTemplate.insert("addSysUserRoleAdmin",dto);
	}

	public void remove(SysUserRoleDto dto) {
		sqlMapClientTemplate.delete("removeSysUserRoleAdmin",dto);
	}

	public SysUserRoleDto search(SysUserRoleDto dto) {
		return (SysUserRoleDto)sqlMapClientTemplate.queryForObject("querySysUserRoleAdmin", dto);
	}

	public List<SysUserDto> searchList(PageInfo pageInfo, SysUserDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("roleid", dto.getRoleid());
		paraMap.put("username", dto.getUserName());
		paraMap.put("status", dto.getStatus());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysUsersCountAdmin", "querySysUsersListAdmin", paraMap);
	}

	public void update(SysUserRoleDto dto) {
		sqlMapClientTemplate.update("updateSysUserRoleAdmin",dto);
	}

	public List<SysUserDto> searchMemberList(PageInfo pageInfo, SysUserDto dto,String defaultUserName) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("username", dto.getUserName());
		paraMap.put("rolenames", dto.getRolenames());
		paraMap.put("status", dto.getStatus());
		paraMap.put("defaultUserName", defaultUserName);
		return PagingDataListUtil.getPagingData(pageInfo, "querySysMembersCountAdmin", "querySysMembersListAdmin", paraMap);
	}

	public SysUserDto search(SysUserDto dto) {
		return (SysUserDto)sqlMapClientTemplate.queryForObject("querySysUserAdmin",dto);
	}

	public void update(SysUserDto dto) {
		sqlMapClientTemplate.update("updateSysUserAdmin",dto);
	}

	public List<SysRoleDto> searchRoleList(PageInfo pageInfo, SysUserDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("id", dto.getId());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysRolesByUserCountAdmin", "querySysRolesByUserListAdmin", paraMap);
	}

	public void updatePassword(SysUserDto dto) {
		sqlMapClientTemplate.update("updatePasswordBySysUserAdmin",dto);

	}

	public void addAdminUser(SysUserDto dto) {
		sqlMapClientTemplate.insert("addUserAdmin",dto);

	}

	public SysUserDto getUserByUserNameAndPasswordAdmin(SysUserDto dto) {
		return (SysUserDto)sqlMapClientTemplate.queryForObject("getUserByUserNameAndPasswordAdmin",dto);
	}

	public void removeAdminUser(SysUserDto dto) {
		sqlMapClientTemplate.insert("removeSysUserAdmin",dto);

	}

}
