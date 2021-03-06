package com.dotoyo.buildjob.sys.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysFunctionDto;
import com.dotoyo.buildjob.sys.dto.SysFunctionRoleDto;

/**
 * 功能点角色映射维护
 * @author wisdy.xiao
 *
 */
public interface ISysFunctionRoleService {
	/**
	 * 增加功能点角色映射
	 * @param dto
	 */
	public void add(SysFunctionRoleDto dto);
	/**
	 * 删除功能点角色映射
	 * @param dto
	 */
	public void remove(SysFunctionRoleDto dto);
	/**
	 * 查询功能点角色映射
	 * @param dto
	 * @return
	 */
	public SysFunctionRoleDto search(SysFunctionRoleDto dto);
	/**
	 * 查询功能点角色映射list
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysFunctionDto> searchList(PageInfo pageInfo,SysFunctionDto dto);
	/**
	 * 更新功能点角色映射
	 * @param dto
	 */
	public void update(SysFunctionRoleDto dto);
	
	/**
	 * 获取某用户具有功能点的数，目的是判断是否有操作某个功能点的权限
	 * @param 
	 */
	public boolean existFunctionRight(Long userId,String functionCode);
	
	/**
	 * 获取某用户具有功能点的数，目的是判断是否有操作某个功能点的权限(后端)
	 * @param 
	 */
	public boolean existFunctionRight4Admin(Long userId,String functionCode);
	
	public SysFunctionDto getFunctionDtoByCode(String functionCode);
	public List<SysFunctionDto> searchListByNotPage(SysFunctionDto dto);
}
