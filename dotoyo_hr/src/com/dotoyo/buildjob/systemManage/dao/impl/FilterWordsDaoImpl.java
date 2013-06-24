package com.dotoyo.buildjob.systemManage.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.systemManage.dao.IFilterWordsDao;
import com.dotoyo.buildjob.systemManage.dto.FilterWordsDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-2
 * @description  
 * 
 */
public class FilterWordsDaoImpl implements IFilterWordsDao{
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void addFilterWord(FilterWordsDto filterWord) {
		sqlMapClientTemplate.insert("addFilterWord", filterWord);
	}

	public int deleteFilterWords(String ids) {
		return sqlMapClientTemplate.delete("deleteFilterWord", ids);
	}

	public int updateFilterWord(FilterWordsDto filterWord) {
		return sqlMapClientTemplate.update("updateFilterWord", filterWord);
	}

	@SuppressWarnings("unchecked")
	public List<FilterWordsDto> queryFilterWordsList(){
		return sqlMapClientTemplate.queryForList("queryFilterWordsForList");
	}
	
	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

}
