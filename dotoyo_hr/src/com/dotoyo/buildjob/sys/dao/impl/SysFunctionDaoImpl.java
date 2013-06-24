package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysFunctionDao;
import com.dotoyo.buildjob.sys.dto.SysFunctionDto;

public class SysFunctionDaoImpl implements ISysFunctionDao{
	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	public void add(SysFunctionDto dto) {
		sqlMapClientTemplate.insert("addSysFunction",dto);
	}

	public void remove(SysFunctionDto dto) {
		sqlMapClientTemplate.delete("removeSysFunction",dto);
	}

	public SysFunctionDto search(SysFunctionDto dto) {
		return (SysFunctionDto)sqlMapClientTemplate.queryForObject("querySysFunction", dto);
	}

	public List<SysFunctionDto> searchList(PageInfo pageInfo, SysFunctionDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("code", dto.getCode());
		paraMap.put("name", dto.getName());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysFunctionsCount", "querySysFunctionsList", paraMap);
	}

	public void update(SysFunctionDto dto) {
		sqlMapClientTemplate.update("updateSysFunction",dto);
	}

}
