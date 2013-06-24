package com.dotoyo.buildjob.sys.service.impl;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dao.ISysFilterWordDao;
import com.dotoyo.buildjob.sys.dto.SysFilterWordDto;
import com.dotoyo.buildjob.sys.service.ISysFilterWordService;
import com.dotoyo.buildjob.systemManage.dto.FilterWordsDto;

public class SysFilterWordServiceImpl implements ISysFilterWordService {
	private ISysFilterWordDao sysFilterWordDao;

	public ISysFilterWordDao getSysFilterWordDao() {
		return sysFilterWordDao;
	}

	public void setSysFilterWordDao(ISysFilterWordDao sysFilterWordDao) {
		this.sysFilterWordDao = sysFilterWordDao;
	}

	public void add(SysFilterWordDto dto) {
		sysFilterWordDao.add(dto);
	}

	public void remove(SysFilterWordDto dto) {
		sysFilterWordDao.remove(dto);
	}

	public SysFilterWordDto search(SysFilterWordDto dto) {
		return sysFilterWordDao.search(dto);
	}

	public List<SysFilterWordDto> searchList(PageInfo pageInfo,
			SysFilterWordDto dto) {
		return sysFilterWordDao.searchList(pageInfo, dto);
	}

	public void update(SysFilterWordDto dto) {
		sysFilterWordDao.update(dto);
	}
	//判断提交的内容里面是否有过滤词
	public boolean isExistsWords(String words){
		boolean blnExist =false;
		List<SysFilterWordDto> list = sysFilterWordDao.getAllFilterWords();
		for(SysFilterWordDto dto : list){
			if(words.contains(dto.getWords())){
				blnExist = true;
				break;
			}
		}
		return blnExist;
	}
}
