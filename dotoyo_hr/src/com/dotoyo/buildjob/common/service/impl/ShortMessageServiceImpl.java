package com.dotoyo.buildjob.common.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dao.IShortMessageDao;
import com.dotoyo.buildjob.common.dto.AutoShortMsgConfigDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ShortMessageDto;
import com.dotoyo.buildjob.common.service.IShortMessageService;
import com.dotoyo.buildjob.common.user.service.IUserService;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-20
 * @description
 */
public class ShortMessageServiceImpl implements IShortMessageService {
	private IShortMessageDao shortMessageDao;
	private IUserService userService;

	public void saveReceiveMsg(ShortMessageDto shortMessageDto) {
		shortMessageDao.saveReceiveMsg(shortMessageDto);

	}

	public void updateReceiveMsgStatus(ShortMessageDto shortMessageDto) {
		shortMessageDao.updateReceiveMsgStatus(shortMessageDto);
	}

	public void deleteReceiveMsg(String ids) {
		shortMessageDao.deleteReceiveMsg(ids);

	}

	public List<ShortMessageDto> queryReceiveMsgList(PageInfo pageInfo,
			ShortMessageDto shortMessageDto) {
		return shortMessageDao.queryReceiveMsgList(pageInfo, shortMessageDto);
	}

	public ShortMessageDto getReceiveMsgDetailById(Long id) {
		ShortMessageDto result = shortMessageDao.getReceiveMsgDetailById(id);
		if (result != null) {
			result.setStatus(ApplicationConstant.NOTICE_READ);
			shortMessageDao.updateReceiveMsgStatus(result);
		}
		return result;
	}

	public void saveAutoShortMsgConfig(
			AutoShortMsgConfigDto autoShortMsgConfigDto) {
		shortMessageDao.saveAutoShortMsgConfig(autoShortMsgConfigDto);

	}

	public void saveBatchReceiveMsg(ShortMessageDto shortMessageDto) {

		// 获得站内信基本信息
		String title = shortMessageDto.getTitle();
		String message = shortMessageDto.getMessage();
		Long senderId = shortMessageDto.getSenderId();
		String type = shortMessageDto.getType();
		String status = shortMessageDto.getStatus();
		Date receiveDate = shortMessageDto.getReceiveDate();

		// 获得收信人用户ID列表
		String receiverUserNames = shortMessageDto.getReceiverUserName();
		String[] receiverUserNameArray = receiverUserNames.split(";");
		for (int i = 0; i < receiverUserNameArray.length; i++) {
			receiverUserNameArray[i] = "'" + receiverUserNameArray[i] + "'";
		}
		receiverUserNames = StringUtils.join(receiverUserNameArray, ",");
		List<Long> loginUserIdList = userService
				.queryLoginUserIdListByUserNameList(receiverUserNames);

		List<ShortMessageDto> shortMessageList = new ArrayList<ShortMessageDto>();
		for (Long receiverId : loginUserIdList) {
			ShortMessageDto paramDto = new ShortMessageDto();
			paramDto.setMessage(message);
			paramDto.setReceiveDate(receiveDate);
			paramDto.setReceiverId(receiverId);
			paramDto.setSenderId(senderId);
			paramDto.setType(type);
			paramDto.setStatus(status);
			paramDto.setTitle(title);
			shortMessageList.add(paramDto);
		}

		shortMessageDao.saveBatchReceiveMsg(shortMessageList);
	}

	public void updateAutoShortMsgConfig(
			AutoShortMsgConfigDto autoShortMsgConfigDto) {
		shortMessageDao.updateAutoShortMsgConfig(autoShortMsgConfigDto);

	}

	public AutoShortMsgConfigDto getAutoShortMsgConfigByUserId(Long userId) {
		return shortMessageDao.getAutoShortMsgConfigByUserId(userId);
	}

	/**
	 * @return the shortMessageDao
	 */
	public IShortMessageDao getShortMessageDao() {
		return shortMessageDao;
	}

	/**
	 * @param shortMessageDao
	 *            the shortMessageDao to set
	 */
	public void setShortMessageDao(IShortMessageDao shortMessageDao) {
		this.shortMessageDao = shortMessageDao;
	}

	/**
	 * @return the userService
	 */
	public IUserService getUserService() {
		return userService;
	}

	/**
	 * @param userService
	 *            the userService to set
	 */
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

}
