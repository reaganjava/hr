package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysRoleDao;
import com.dotoyo.buildjob.sys.dto.SysRoleDto;

public class SysRoleDaoImpl implements ISysRoleDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	public void add(SysRoleDto dto) {
		sqlMapClientTemplate.insert("addSysRole",dto);
	}

	public void remove(SysRoleDto dto) {
		sqlMapClientTemplate.delete("removeSysRole",dto);
	}

	public SysRoleDto search(SysRoleDto dto) {
		return (SysRoleDto)sqlMapClientTemplate.queryForObject("querySysRole", dto);
	}

	public List<SysRoleDto> searchList(PageInfo pageInfo, SysRoleDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("code", dto.getCode());
		paraMap.put("name", dto.getName());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysRolesCount", "querySysRolesList", paraMap);
	}

	public void update(SysRoleDto dto) {
		sqlMapClientTemplate.update("updateSysRole",dto);
	}

}
