package com.dotoyo.buildjob.systemManage.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.systemManage.dao.IClassMasterDao;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-3
 * @description  
 * 
 */
public class ClassMasterDaoImpl implements IClassMasterDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> queryClassMasterList() {
		return sqlMapClientTemplate.queryForList("queryClassMasterForList");
	}

	public int updateClassMaster(ClassMasterDto classMasterDto) {
		return sqlMapClientTemplate.update("updateClassMaster",classMasterDto);
	}

	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> queryClassMasterListOfClassMaster(
			ClassMasterDto classMasterDto) {
		return sqlMapClientTemplate.queryForList("queryClassMasterListOfClassMaster", classMasterDto);
	}

	public void addClassMaster(ClassMasterDto classMasterDto) {
		sqlMapClientTemplate.insert("addClassMaster",classMasterDto);
	}

	public int deleteClassMasterById(Long id){
		return sqlMapClientTemplate.delete("deleteClassMasterById", id);
	}
	
	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}
	
	/**
	 * 检索某类基础数据code
	 */
	@SuppressWarnings("unchecked")
	public List<String> getClassMasterCodeByParentCode(String parentCode) {
		return sqlMapClientTemplate.queryForList("getClassMasterCodeByParentId",parentCode);
	}

}
