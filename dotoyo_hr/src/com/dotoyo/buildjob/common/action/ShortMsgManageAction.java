package com.dotoyo.buildjob.common.action;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.AutoShortMsgConfigDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ShortMessageDto;
import com.dotoyo.buildjob.common.service.IShortMessageService;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-20
 * @description
 */
public class ShortMsgManageAction extends BuildJobAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 468807802096276035L;
	private IShortMessageService shortMessageService;
	private List<ShortMessageDto> shortMessageList;
	private PageInfo pageInfo;
	private ShortMessageDto shortMessageDto;
	private ShortMessageDto replyShortMessageDto;
	private String[] shortMsgCheckBox;
	private AutoShortMsgConfigDto autoShortMsgConfigDto;
	private List<LoginUserInfoDto> receiveContactList;
	private IUserService userService;
	private String[] receiveContactCheckBox;
	private String receiveShortMsgId;
	private String actionMessage;

	/**
	 * 查看收件箱站内信列表
	 * 
	 * @return
	 */
	public String viewRecieveShortMsgList() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.SHORT_MSG_LIST_SIZE);
		if (shortMessageDto == null) {
			shortMessageDto = new ShortMessageDto();
		}
		LoginUserInfoDto userInfo = getLoginUserInfo();
		Long userId = userInfo.getId();
		shortMessageDto.setReceiverId(userId);
		shortMessageList = shortMessageService.queryReceiveMsgList(pageInfo,
				shortMessageDto);
		return "viewRecieveShortMsgList";
	}

	/**
	 * 查看收件箱站内信详细信息
	 * 
	 * @return
	 */
	public String viewReceiveShortMsgDetail() {
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		request = ServletActionContext.getRequest();
		Long id = Long.parseLong(request.getParameter("id"));
		shortMessageDto = shortMessageService.getReceiveMsgDetailById(id);
		
		if (shortMessageDto == null
				|| !shortMessageDto.getReceiverId().equals(userId)) {
			return "accessDenied";
		}
		
		return "viewReceiveShortMsgDetail";
	}

	/**
	 * 删除收件箱内站内信
	 * 
	 * @return
	 */
	public String deleteReceiveShortMsg() {
		String ids = StringUtils.join(shortMsgCheckBox, ",");
		shortMessageService.deleteReceiveMsg(ids);
		return this.viewRecieveShortMsgList();
	}

	/**
	 * 查看自动回复站内信设置
	 * 
	 * @return
	 */
	public String viewAutoShortMsgConfig() {
		LoginUserInfoDto userInfo = getLoginUserInfo();
		Long userId = userInfo.getId();
		autoShortMsgConfigDto = shortMessageService
				.getAutoShortMsgConfigByUserId(userId);
		if (autoShortMsgConfigDto == null) {
			autoShortMsgConfigDto = new AutoShortMsgConfigDto();
		}
		return "viewAutoShortMsgConfig";
	}

	/**
	 * 更新自动回复站内信设置
	 * 
	 * @return
	 */
	public String updateAutoShortMsgConfig() {
		LoginUserInfoDto userInfo = getLoginUserInfo();
		Long userId = userInfo.getId();
		autoShortMsgConfigDto.setUserId(userId);
		// 判断当前用户是否存在自动回复站内信设置，如果没有，为该用户添加一条记录
		if (shortMessageService.getAutoShortMsgConfigByUserId(userId) == null) {
			shortMessageService.saveAutoShortMsgConfig(autoShortMsgConfigDto);
		} else {
			shortMessageService.updateAutoShortMsgConfig(autoShortMsgConfigDto);
		}
		actionMessage = "保存成功";
		return viewAutoShortMsgConfig();
	}

	/**
	 * 进入回复站内信页面
	 * 
	 * @return
	 */
	public String toReplyShortMsg() {
		loginUserInfoDto = this.getLoginUserInfo();
		Long id = Long.parseLong(receiveShortMsgId);
		shortMessageDto = shortMessageService.getReceiveMsgDetailById(id);
		
		if (shortMessageDto == null
				|| !shortMessageDto.getReceiverId().equals(
						loginUserInfoDto.getId())) {
			return "accessDenied";
		}
		
		if (replyShortMessageDto == null) {
			replyShortMessageDto = new ShortMessageDto();
			replyShortMessageDto.setReceiverId(shortMessageDto.getReceiverId());
			replyShortMessageDto.setTitle("RE：" + shortMessageDto.getTitle());
			replyShortMessageDto.setReceiverId(shortMessageDto.getSenderId());
			replyShortMessageDto.setReceiverUserName(shortMessageDto
					.getSenderUserName());
		} else {
			String receiverUserNames = StringUtils.join(receiveContactCheckBox,
					";");
			String receiverUserName = replyShortMessageDto
					.getReceiverUserName();
			if (receiverUserName == null)
				receiverUserName = "";
			if (receiverUserNames == null)
				receiverUserNames = "";
			if (receiverUserName.endsWith(";")
					|| "".equalsIgnoreCase(receiverUserName)) {
				replyShortMessageDto.setReceiverUserName(receiverUserName
						+ receiverUserNames);
			} else {
				replyShortMessageDto.setReceiverUserName(receiverUserName + ";"
						+ receiverUserNames);
			}
		}

		return "toReplyShortMsg";
	}

	/**
	 * 保存回复站内信
	 * 
	 * @return
	 */
	public String saveReplyShortMsg() {
		LoginUserInfoDto userInfo = getLoginUserInfo();
		Long senderId = userInfo.getId();
		replyShortMessageDto.setSenderId(senderId);
		replyShortMessageDto.setReceiveDate(new Date());
		replyShortMessageDto.setType("1");
		replyShortMessageDto.setStatus(ApplicationConstant.NOTICE_UNREAD);
		shortMessageService.saveBatchReceiveMsg(replyShortMessageDto);
		return "saveReplyShortMsg";
	}

	/**
	 * 查看收件人列表
	 * 
	 * @return
	 */
	public String viewReceiveContact() {
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.RECEIVE_CONTACT_LIST_SIZE);
		receiveContactList = userService.queryContactList(pageInfo, userId);
		return "viewReceiveContact";
	}

	/**
	 * 选取收件人列表
	 * 
	 * @return
	 */
	public String selectReceiveContact() {
		return toReplyShortMsg();
	}

	/**
	 * @return the shortMessageService
	 */
	public IShortMessageService getShortMessageService() {
		return shortMessageService;
	}

	/**
	 * @param shortMessageService
	 *            the shortMessageService to set
	 */
	public void setShortMessageService(IShortMessageService shortMessageService) {
		this.shortMessageService = shortMessageService;
	}

	/**
	 * @return the shortMessageList
	 */
	public List<ShortMessageDto> getShortMessageList() {
		return shortMessageList;
	}

	/**
	 * @return the pageInfo
	 */
	public PageInfo getPageInfo() {
		return pageInfo;
	}

	/**
	 * @param pageInfo
	 *            the pageInfo to set
	 */
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	/**
	 * @return the shortMessageDto
	 */
	public ShortMessageDto getShortMessageDto() {
		return shortMessageDto;
	}

	/**
	 * @param shortMessageDto
	 *            the shortMessageDto to set
	 */
	public void setShortMessageDto(ShortMessageDto shortMessageDto) {
		this.shortMessageDto = shortMessageDto;
	}

	/**
	 * @return the shortMsgCheckBox
	 */
	public String[] getShortMsgCheckBox() {
		return shortMsgCheckBox;
	}

	/**
	 * @param shortMsgCheckBox
	 *            the shortMsgCheckBox to set
	 */
	public void setShortMsgCheckBox(String[] shortMsgCheckBox) {
		this.shortMsgCheckBox = shortMsgCheckBox;
	}

	/**
	 * @return the autoShortMsgConfigDto
	 */
	public AutoShortMsgConfigDto getAutoShortMsgConfigDto() {
		return autoShortMsgConfigDto;
	}

	/**
	 * @param autoShortMsgConfigDto
	 *            the autoShortMsgConfigDto to set
	 */
	public void setAutoShortMsgConfigDto(
			AutoShortMsgConfigDto autoShortMsgConfigDto) {
		this.autoShortMsgConfigDto = autoShortMsgConfigDto;
	}

	/**
	 * @return the replyShortMessageDto
	 */
	public ShortMessageDto getReplyShortMessageDto() {
		return replyShortMessageDto;
	}

	/**
	 * @param replyShortMessageDto
	 *            the replyShortMessageDto to set
	 */
	public void setReplyShortMessageDto(ShortMessageDto replyShortMessageDto) {
		this.replyShortMessageDto = replyShortMessageDto;
	}

	/**
	 * @return the receiveContactList
	 */
	public List<LoginUserInfoDto> getReceiveContactList() {
		return receiveContactList;
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

	/**
	 * @return the receiveContactCheckBox
	 */
	public String[] getReceiveContactCheckBox() {
		return receiveContactCheckBox;
	}

	/**
	 * @param receiveContactCheckBox
	 *            the receiveContactCheckBox to set
	 */
	public void setReceiveContactCheckBox(String[] receiveContactCheckBox) {
		this.receiveContactCheckBox = receiveContactCheckBox;
	}

	/**
	 * @return the receiveShortMsgId
	 */
	public String getReceiveShortMsgId() {
		return receiveShortMsgId;
	}

	/**
	 * @param receiveShortMsgId
	 *            the receiveShortMsgId to set
	 */
	public void setReceiveShortMsgId(String receiveShortMsgId) {
		this.receiveShortMsgId = receiveShortMsgId;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

}
