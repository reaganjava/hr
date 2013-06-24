package com.dotoyo.buildjob.systemManage.service.impl;

import java.util.List;

import com.dotoyo.buildjob.systemManage.dao.IBackgroupMusicDao;
import com.dotoyo.buildjob.systemManage.dto.BackgroupMusicDto;
import com.dotoyo.buildjob.systemManage.service.IBackgroupMusicService;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-6
 * @description  
 * 
 */
public class BackgroupMusicServiceImpl implements IBackgroupMusicService {
	private IBackgroupMusicDao backGroupMusicDao;
	
	public int deleteBackgroupMusic(BackgroupMusicDto backGroupMusic) {
		return backGroupMusicDao.deleteBackgroupMusic(backGroupMusic);
	}

	public int updateBackgroupMusicStatusById(Long id, String status) {
		return backGroupMusicDao.updateBackgroupMusicStatusById(id, status);
	}

	public void addBackgroupMusic(BackgroupMusicDto backGroupMusic) {
		backGroupMusicDao.addBackgroupMusic(backGroupMusic);
	}

	public List<BackgroupMusicDto> queryBackgroupMustForList(){
		return backGroupMusicDao.queryBackgroupMustForList();
	}

	public void setBackGroupMusicDao(IBackgroupMusicDao backGroupMusicDao) {
		this.backGroupMusicDao = backGroupMusicDao;
	}

	public IBackgroupMusicDao getBackGroupMusicDao() {
		return backGroupMusicDao;
	}

}
