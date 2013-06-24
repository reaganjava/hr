package com.dotoyo.buildjob.systemManage.service;

import java.util.List;

import com.dotoyo.buildjob.systemManage.dto.FilterWordsDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-2
 * @description 过滤词逻辑管理
 * 
 */
public interface IFilterWordsService {
	// 添加过滤词
	public void addFilterWord(FilterWordsDto filterWord);
	
	// 删除过滤词
	public int deleteFilterWords(String ids);
	
	// 修改过滤词
	public int updateFilterWord(FilterWordsDto filterWord); 
	
	// 加载过滤词列表
	public List<FilterWordsDto> queryFilterWordsList();
}
