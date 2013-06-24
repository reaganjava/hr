package com.dotoyo.buildjob.common.util;

import java.util.List;

import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * @author tyler.qu
 * @dateCreated 2011-3-7
 * @description 基础数据工具类  
 * 
 */
public class ClassMasterUtil {
	/**
	 * 根据基础数据code从缓存中获取其name
	 */
	public static String getNameInCacheByCode(String key,String code){
		@SuppressWarnings("unchecked")
		List<ClassMasterDto> list = (List<ClassMasterDto>) CacheManager.getInstanceMemcachedClient().get(key);
		for (ClassMasterDto classMasterDto : list) {
			if(classMasterDto.getCode().equals(code)){
				return classMasterDto.getName();
			}
		}
		return null;
	}
}
