package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysRoleAdminDao;
import com.dotoyo.buildjob.sys.dto.SysRoleDto;

public class SysRoleAdminDaoImpl implements ISysRoleAdminDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	public void add(SysRoleDto dto) {
		sqlMapClientTemplate.insert("addSysRoleAdmin",dto);
	}

	public void remove(SysRoleDto dto) {
		sqlMapClientTemplate.delete("removeSysRoleAdmin",dto);
	}

	public SysRoleDto search(SysRoleDto dto) {
		return (SysRoleDto)sqlMapClientTemplate.queryForObject("querySysRoleAdmin", dto);
	}

	public List<SysRoleDto> searchList(PageInfo pageInfo, SysRoleDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("code", dto.getCode());
		paraMap.put("name", dto.getName());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysRolesCountAdmin", "querySysRolesListAdmin", paraMap);
	}

	public void update(SysRoleDto dto) {
		sqlMapClientTemplate.update("updateSysRoleAdmin",dto);
	}

}
