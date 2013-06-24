package com.dotoyo.buildjob.systemManage.service;

import java.util.List;

import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-3
 * @description 系统基础数据逻辑操作接口  
 * 
 */
public interface IClassMasterService {
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
	
	public String generateClassMasterCode(String parentCode);
}
