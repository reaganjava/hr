package com.dotoyo.buildjob.systemManage.service;

import java.util.List;

import com.dotoyo.buildjob.systemManage.dto.BackgroupMusicDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-6
 * @description 背景音乐逻辑操作接口  
 * 
 */
public interface IBackgroupMusicService {
	/**
	 * 删除背景音乐
	 */
	public int deleteBackgroupMusic(BackgroupMusicDto backGroupMusic);
	
	/**
	 * 修改背景音乐状态
	 */
	public int updateBackgroupMusicStatusById(Long id,String status);
	
	/**
	 * 增加背景音乐
	 */
	public void addBackgroupMusic(BackgroupMusicDto backGroupMusic);
	
	/**
	 * 加载所有背景音乐
	 */
	public List<BackgroupMusicDto> queryBackgroupMustForList();
}
