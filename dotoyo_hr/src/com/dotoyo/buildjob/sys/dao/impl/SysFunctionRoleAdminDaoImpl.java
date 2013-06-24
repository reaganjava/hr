package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysFunctionRoleAdminDao;
import com.dotoyo.buildjob.sys.dto.SysFunctionDto;
import com.dotoyo.buildjob.sys.dto.SysFunctionRoleDto;

public class SysFunctionRoleAdminDaoImpl implements ISysFunctionRoleAdminDao{
	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	public void add(SysFunctionRoleDto dto) {
		sqlMapClientTemplate.insert("addSysFunctionRoleAdmin",dto);
	}

	public void remove(SysFunctionRoleDto dto) {
		sqlMapClientTemplate.delete("removeSysFunctionRoleAdmin",dto);
	}

	public SysFunctionRoleDto search(SysFunctionRoleDto dto) {
		return (SysFunctionRoleDto)sqlMapClientTemplate.queryForObject("querySysFunctionRoleAdmin", dto);
	}

	public List<SysFunctionDto> searchList(PageInfo pageInfo, SysFunctionDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("code", dto.getCode());
		paraMap.put("name", dto.getName());
		paraMap.put("roleid", dto.getRoleid());
		paraMap.put("userid", dto.getUserid());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysFunctionRolesCountAdmin", "querySysFunctionRolesListAdmin", paraMap);
	}

	public void update(SysFunctionRoleDto dto) {
		sqlMapClientTemplate.update("updateSysFunctionRoleAdmin",dto);
	}

}
