package com.dotoyo.buildjob.common.dao;

import java.util.List;

import com.dotoyo.buildjob.common.dto.AutoShortMsgConfigDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ShortMessageDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-20
 * @description
 */
public interface IShortMessageDao {
	/**
	 * 添加接收站内信
	 * 
	 * @param shortMessageDto
	 */
	public void saveReceiveMsg(ShortMessageDto shortMessageDto);

	/**
	 * 批量添加接收站内信
	 * 
	 * @param list
	 */
	public void saveBatchReceiveMsg(final List<ShortMessageDto> list);

	/**
	 * 批量删除接收站内信
	 * 
	 * @param shortMessageDto
	 */
	public void deleteReceiveMsg(String ids);

	/**
	 * 根据接收者ID查找站内信列表
	 * 
	 * @param receiverId
	 * @return
	 */
	public List<ShortMessageDto> queryReceiveMsgList(PageInfo pageIfo,
			ShortMessageDto shortMessageDto);

	/**
	 * 加载接收站内信详细信息
	 * 
	 * @param id
	 * @return
	 */
	public ShortMessageDto getReceiveMsgDetailById(Long id);

	/**
	 * 添加企业自动回复站内信设置
	 * 
	 * @param autoShortMsgConfigDto
	 */
	public void saveAutoShortMsgConfig(
			AutoShortMsgConfigDto autoShortMsgConfigDto);

	/**
	 * 修改企业自动回复站内信设置
	 * 
	 * @param autoShortMsgConfigDto
	 */
	public void updateAutoShortMsgConfig(
			AutoShortMsgConfigDto autoShortMsgConfigDto);

	/**
	 * 根据用户ID查找企业自动回复站内信设置
	 * 
	 * @param userId
	 * @return
	 */
	public AutoShortMsgConfigDto getAutoShortMsgConfigByUserId(Long userId);

	/**
	 * 更新接收站内信状态
	 * 
	 * @param shortMessageDto
	 */
	public void updateReceiveMsgStatus(ShortMessageDto shortMessageDto);
}
