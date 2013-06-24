package com.dotoyo.buildjob.sys.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.sys.dto.SysFilterWordDto;
/**
 * 过滤词管理
 * @author wisdy.xiao
 *
 */
public interface ISysFilterWordService {
	/**
	 * 增加过滤词
	 * @param dto
	 */
	public void add(SysFilterWordDto dto);
	/**
	 * 删除过滤词
	 * @param dto
	 */
	public void remove(SysFilterWordDto dto);
	/**
	 * 查询过滤词
	 * @param dto
	 * @return
	 */
	public SysFilterWordDto search(SysFilterWordDto dto);
	/**
	 * 查询过滤词list
	 * @param pageInfo
	 * @param dto
	 * @return
	 */
	public List<SysFilterWordDto> searchList(PageInfo pageInfo,SysFilterWordDto dto);
	/**
	 * 更新过滤词
	 * @param dto
	 */
	public void update(SysFilterWordDto dto);
	/**
	 * 查询字符串中数据是否含有过滤词
	 * @param words
	 * @return
	 */
	public boolean isExistsWords(String words);
}
