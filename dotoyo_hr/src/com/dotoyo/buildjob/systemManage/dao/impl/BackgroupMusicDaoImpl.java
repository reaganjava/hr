package com.dotoyo.buildjob.systemManage.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.systemManage.dao.IBackgroupMusicDao;
import com.dotoyo.buildjob.systemManage.dto.BackgroupMusicDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-6
 * @description  
 * 
 */
public class BackgroupMusicDaoImpl implements IBackgroupMusicDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public int deleteBackgroupMusic(BackgroupMusicDto backGroupMusic) {
		return sqlMapClientTemplate.delete("deleteBackgroupMusic", backGroupMusic);
	}

	public int updateBackgroupMusicStatusById(Long id,
			String status) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("id", id.toString());
		paraMap.put("status", status);
		return sqlMapClientTemplate.update("updateBackgroupMusicStatusById", paraMap);
	}
	
	public void addBackgroupMusic(BackgroupMusicDto backGroupMusic) {
		sqlMapClientTemplate.insert("addBackgroupMusic",backGroupMusic);
	}
	
	@SuppressWarnings("unchecked")
	public List<BackgroupMusicDto> queryBackgroupMustForList(){
		return sqlMapClientTemplate.queryForList("queryBackgroupMustForList");
	}
	
	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

}
