package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dao.ISysFilterWordDao;
import com.dotoyo.buildjob.sys.dto.SysFilterWordDto;

public class SysFilterWordDaoImpl implements ISysFilterWordDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	public void add(SysFilterWordDto dto) {
		sqlMapClientTemplate.insert("addSysFilterWord",dto);
	}

	public void remove(SysFilterWordDto dto) {
		sqlMapClientTemplate.delete("removeSysFilterWord",dto);
	}

	public SysFilterWordDto search(SysFilterWordDto dto) {
		return (SysFilterWordDto)sqlMapClientTemplate.queryForObject("querySysFilterWord", dto);
	}

	@SuppressWarnings("unchecked")
	public List<SysFilterWordDto> searchList(PageInfo pageInfo, SysFilterWordDto dto) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("words", dto.getWords());
		return PagingDataListUtil.getPagingData(pageInfo, "querySysFilterWordsCount", "querySysFilterWordsList", paraMap);
	}
	@SuppressWarnings("unchecked")
	public List<SysFilterWordDto> getAllFilterWords() {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("words", "");
		return sqlMapClientTemplate.queryForList("querySysFilterWordsList", paraMap);
	}

	public void update(SysFilterWordDto dto) {
		sqlMapClientTemplate.update("updateSysFilterWord",dto);
	}
}
