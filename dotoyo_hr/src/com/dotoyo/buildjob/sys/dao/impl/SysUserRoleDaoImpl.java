package com.dotoyo.buildjob.sys.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysUserRoleDao;
import com.dotoyo.buildjob.sys.dto.SysRoleDto;
import com.dotoyo.buildjob.sys.dto.SysUserDto;
import com.dotoyo.buildjob.sys.dto.SysUserRoleDto;

public class SysUserRoleDaoImpl implements ISysUserRoleDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	public void add(SysUserRoleDto dto) {
		sqlMapClientTemplate.insert("addSysUserRole",dto);
	}

	public void remove(SysUserRoleDto dto) {
		sqlMapClientTemplate.delete("removeSysUserRole",dto);
	}

	public SysUserRoleDto search(SysUserRoleDto dto) {
		return (SysUserRoleDto)sqlMapClientTemplate.queryForObject("querySysUserRole", dto);
	}

	public List<SysUserDto> searchList(PageInfo pageInfo, SysUserDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("roleid", dto.getRoleid());
		paraMap.put("userName", dto.getUserName());
		paraMap.put("status", dto.getStatus());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysUsersCount", "querySysUsersList", paraMap);
	}

	public void update(SysUserRoleDto dto) {
		sqlMapClientTemplate.update("updateSysUserRole",dto);
	}

	public List<SysUserDto> searchMemberList(PageInfo pageInfo, SysUserDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("userName", dto.getUserName());
		paraMap.put("rolenames", dto.getRolenames());
		paraMap.put("status", dto.getStatus());
		paraMap.put("userType", dto.getUserType());
		paraMap.put("registerDate", dto.getRegisterDate());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysMembersCount", "querySysMembersList", paraMap);
	}

	public SysUserDto search(SysUserDto dto) {
		return (SysUserDto)sqlMapClientTemplate.queryForObject("querySysUser",dto);
	}

	public int update(SysUserDto dto) {
		return sqlMapClientTemplate.update("updateSysUser",dto);
	}

	public List<SysRoleDto> searchRoleList(PageInfo pageInfo, SysUserDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("id", dto.getId());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysRolesByUserCount", "querySysRolesByUserList", paraMap);
	}

	public void updatePassword(SysUserDto dto) {
		sqlMapClientTemplate.update("updatePasswordBySysUser",dto);
	}

	/**
	 * 新增个人/企业会员数据统计
	 */
	public int getCountOfSysMemberToDayRegister(String userType){
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("toDay", new Date());
		paramMap.put("userType", userType);
		return (Integer) sqlMapClientTemplate.queryForObject("sysMemberToDayRegister", paramMap);
	}

	/**
	 * 个人会员 数据加载
	 */
	@SuppressWarnings("unchecked")
	public List<SysUserDto> queryIndividualMemberList(PageInfo pageInfo,Map paramMap){
		return PagingDataListUtil.getPagingData(pageInfo, "querySQLCountId", "querySQLId", paramMap);
	}

	/**
	 * 企业会员数据加载
	 */
	@SuppressWarnings("unchecked")
	public List<SysUserDto> queryCorporateMember(PageInfo pageInfo,Map paramMap){
		return PagingDataListUtil.getPagingData(pageInfo, "querySQLCountId", "querySQLId", paramMap);
	}

}
