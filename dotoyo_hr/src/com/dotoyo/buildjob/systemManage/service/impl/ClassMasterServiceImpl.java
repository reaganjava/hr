package com.dotoyo.buildjob.systemManage.service.impl;

import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.systemManage.dao.IClassMasterDao;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;
import com.dotoyo.buildjob.systemManage.service.IClassMasterService;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-3
 * @description  
 * 
 */
public class ClassMasterServiceImpl implements IClassMasterService {
	private IClassMasterDao classMasterDao;
	
	public List<ClassMasterDto> queryClassMasterList() {
		return classMasterDao.queryClassMasterList();
	}

	public int updateClassMaster(ClassMasterDto classMasterDto) {
		return classMasterDao.updateClassMaster(classMasterDto);
	}

	public List<ClassMasterDto> queryClassMasterListOfClassMaster(
			ClassMasterDto classMasterDto) {
		return classMasterDao.queryClassMasterListOfClassMaster(classMasterDto);
	}

	public void addClassMaster(ClassMasterDto classMasterDto) {
		classMasterDao.addClassMaster(classMasterDto);
	}
	
	public int deleteClassMasterById(Long id){
		return classMasterDao.deleteClassMasterById(id);
	}

	public void setClassMasterDao(IClassMasterDao classMasterDao) {
		this.classMasterDao = classMasterDao;
	}

	public IClassMasterDao getClassMasterDao() {
		return classMasterDao;
	}

	/**
	 *  code生成规则定义:
	 *  1.通过对parentCode的判断，判断将要增加的基础数据是什么类型
	 *  再将取得这类基础数据同级当前的最大code，再进行加1－〉生成新
	 *  的code。
	 */
	public String generateClassMasterCode(String parentCode){
		// 查询出SELECT t.code  FROM t_comm_class_master t WHERE t.code LIKE '005%'
		// 如果还没有增加过下级基础数据那么就直接加上。有则加1
		String code=null;
		List<String> codeList = classMasterDao.getClassMasterCodeByParentCode(parentCode);
		int codeListSize=codeList.size();
		if (null!=codeList&&codeListSize>1) {
			SortedSet<String> codeSet = new TreeSet<String>();
			for (String string : codeList) {
				codeSet.add(string.split(ApplicationConstant.SEPARATOR_DASH)[string.split(ApplicationConstant.SEPARATOR_DASH).length-1]);
			}
			
			code = parentCode+ApplicationConstant.SEPARATOR_DASH+String.valueOf((Integer.parseInt(codeSet.last())+1));
		}else if(codeListSize==1){// 只有一级基础数据名称，暂无数据。
			code=parentCode+ApplicationConstant.SEPARATOR_DASH+ApplicationConstant.BASIC_DATA_CODE;
		}
		
		return code;
	}
}
