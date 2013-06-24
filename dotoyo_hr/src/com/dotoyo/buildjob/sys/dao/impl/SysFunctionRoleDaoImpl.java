package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysFunctionRoleDao;
import com.dotoyo.buildjob.sys.dto.SysFunctionDto;
import com.dotoyo.buildjob.sys.dto.SysFunctionRoleDto;

public class SysFunctionRoleDaoImpl implements ISysFunctionRoleDao{
	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	public void add(SysFunctionRoleDto dto) {
		sqlMapClientTemplate.insert("addSysFunctionRole",dto);
	}

	public void remove(SysFunctionRoleDto dto) {
		sqlMapClientTemplate.delete("removeSysFunctionRole",dto);
	}

	public SysFunctionRoleDto search(SysFunctionRoleDto dto) {
		return (SysFunctionRoleDto)sqlMapClientTemplate.queryForObject("querySysFunctionRole", dto);
	}

	@SuppressWarnings("unchecked")
	public List<SysFunctionDto> searchList(PageInfo pageInfo, SysFunctionDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("code", dto.getCode());
		paraMap.put("name", dto.getName());
		paraMap.put("roleid", dto.getRoleid());
		paraMap.put("userid", dto.getUserid());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysFunctionRolesCount", "querySysFunctionRolesList", paraMap);
	}
	@SuppressWarnings("unchecked")
	public List<SysFunctionDto> searchListByNotPage( SysFunctionDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("code", dto.getCode());
		paraMap.put("name", dto.getName());
		paraMap.put("roleid", dto.getRoleid());
		paraMap.put("userid", dto.getUserid());
		return sqlMapClientTemplate.queryForList("querySysFunctionRolesList",paraMap);
	}
	public void update(SysFunctionRoleDto dto) {
		sqlMapClientTemplate.update("updateSysFunctionRole",dto);
	}

	public int getRightFunctionPointCount(Long userId, String functionCode) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("userId", userId);
		paraMap.put("functionCode",functionCode);
		return (Integer)sqlMapClientTemplate.queryForObject("existFunctionRight", paraMap);
	}
	public int getRightFunctionPointCount4Admin(Long userId, String functionCode) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("userId", userId);
		paraMap.put("functionCode",functionCode);
		return (Integer)sqlMapClientTemplate.queryForObject("existFunctionRight4Admin", paraMap);
	}
    /**
     * 根据code获取function DTO
     */
	public SysFunctionDto getFunctionDtoByCode(String functionCode) {
		SysFunctionDto sysFunctionDto = new SysFunctionDto();
		sysFunctionDto.setCode(functionCode);
		return (SysFunctionDto)sqlMapClientTemplate.queryForObject("querySysFunction", sysFunctionDto);
	}


}
