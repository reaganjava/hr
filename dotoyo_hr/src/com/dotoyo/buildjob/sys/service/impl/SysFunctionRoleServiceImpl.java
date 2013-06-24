package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysFunctionRoleDao;
import com.dotoyo.buildjob.sys.dto.SysFunctionDto;
import com.dotoyo.buildjob.sys.dto.SysFunctionRoleDto;
import com.dotoyo.buildjob.sys.service.ISysFunctionRoleService;

public class SysFunctionRoleServiceImpl implements ISysFunctionRoleService {
	private ISysFunctionRoleDao sysFunctionRoleDao;


	public ISysFunctionRoleDao getSysFunctionRoleDao() {
		return sysFunctionRoleDao;
	}

	public void setSysFunctionRoleDao(ISysFunctionRoleDao sysFunctionRoleDao) {
		this.sysFunctionRoleDao = sysFunctionRoleDao;
	}

	public void add(SysFunctionRoleDto dto) {
		sysFunctionRoleDao.add(dto);

	}

	public void remove(SysFunctionRoleDto dto) {
		sysFunctionRoleDao.remove(dto);
	}

	public SysFunctionRoleDto search(SysFunctionRoleDto dto) {
		return sysFunctionRoleDao.search(dto);
	}

	public List<SysFunctionDto> searchList(PageInfo pageInfo, SysFunctionDto dto) {
		return sysFunctionRoleDao.searchList(pageInfo, dto);
	}
	public List<SysFunctionDto> searchListByNotPage(SysFunctionDto dto) {
		return sysFunctionRoleDao.searchListByNotPage( dto);
	}

	public void update(SysFunctionRoleDto dto) {
		sysFunctionRoleDao.update(dto);

	}
    /**
	 * 获取某用户具有功能点的数，目的是判断是否有操作某个功能点的权限(前端)
	 * @param 
     */
	public boolean existFunctionRight(Long userId, String functionCode) {
		int existFunctionCount = this.sysFunctionRoleDao.getRightFunctionPointCount(userId, functionCode);
		if(existFunctionCount>0){
			return true;
		}else{
			return false;	
		}
	}

	  /**
	 * 获取某用户具有功能点的数，目的是判断是否有操作某个功能点的权限(后端)
	 * @param 
     */
	public boolean existFunctionRight4Admin(Long userId, String functionCode) {
		int existFunctionCount = this.sysFunctionRoleDao.getRightFunctionPointCount4Admin(userId, functionCode);
		if(existFunctionCount>0){
			return true;
		}else{
			return false;	
		}
	}

	public SysFunctionDto getFunctionDtoByCode(String functionCode) {
		return (SysFunctionDto)sysFunctionRoleDao.getFunctionDtoByCode(functionCode);
	}

}
