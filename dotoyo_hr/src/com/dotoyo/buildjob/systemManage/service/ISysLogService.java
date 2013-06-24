package com.dotoyo.buildjob.systemManage.service;

import java.text.ParseException;
import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.systemManage.dto.SysLogDto;
/**
 * 系统日志接口
 * @author wisdy.xiao
 *
 */
public interface ISysLogService {
	/**
	 * 增加日志
	 * @param dto
	 */
	public void addSysLog(SysLogDto dto);
	/**
	 * 删除日志
	 * @param id
	 */
	public void removeSysLog(Long id);
	/**
	 * 查询日志集合
	 * @param dto
	 * @return DTO list
	 * @throws Exception
	 */
	public List<SysLogDto> querySysLogList(PageInfo pageInfo,SysLogDto dto) throws ParseException;
}
