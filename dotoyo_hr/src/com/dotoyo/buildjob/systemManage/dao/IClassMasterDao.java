package com.dotoyo.buildjob.systemManage.dao;

import java.util.List;

import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-3
 * @description 系统基础数据数据库操作接口  
 * 
 */
public interface IClassMasterDao {
	// 系统类别信息加载(行业、职能、专业、证书分类一级数据)
	public List<ClassMasterDto> queryClassMasterList();
	
	// 修改类别信息（code,name）
	public int updateClassMaster(ClassMasterDto classMasterDto);
	
	// 查看类别明细（二级、三级数据）
	public List<ClassMasterDto> queryClassMasterListOfClassMaster(ClassMasterDto classMasterDto);
	
	// 增加类别明细
	public void addClassMaster(ClassMasterDto classMasterDto);
	
	// 删除类别子数据
	public int deleteClassMasterById(Long id);
	
	// 检索某类基础数据code
	public List<String> getClassMasterCodeByParentCode(String parentCode);
}
