package com.dotoyo.buildjob.personalCenter.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.dotoyo.buildjob.applyJobCenter.service.IApplyJobService;
import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.InterviewNoticeDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-11
 * @description
 */
public class ReceiveInterviewNoticeManageAction extends BuildJobAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1749532995061097993L;
	private IApplyJobService applyJobService;
	private InterviewNoticeDto interviewNoticeDto;
	private List<InterviewNoticeDto> interviewNoticeList;
	private PageInfo pageInfo;
	private HttpServletRequest request = null;
	private String[] interviewNoticeCheckBox;

	/**
	 * 查看面试通知列表
	 * 
	 * @return
	 */
	public String viewInterviewNoticeList() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.PERSONALCENTER_INTERVIEWNOTICE_LIST_SIZE);
		/**
		 * 获得当前用户ID
		 */
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long receiverId = loginUserInfo.getId();
		if(interviewNoticeDto==null){
			interviewNoticeDto = new InterviewNoticeDto();
		}
		interviewNoticeDto.setReceiverId(receiverId);
		interviewNoticeList = applyJobService
				.queryInterviewReceiveNoticeListByReceiverId(pageInfo,
						interviewNoticeDto);
		return "viewInterviewNoticeList";
	}

	/**
	 * 查看面试通知详细信息
	 * 
	 * @return
	 */
	public String viewInterviewNoticeDetail() {
		request = ServletActionContext.getRequest();
		Long id = Long.parseLong(request.getParameter("id"));
		interviewNoticeDto = applyJobService.getInterviewReceiveNoticeById(id);
		
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		if (interviewNoticeDto == null
				|| !interviewNoticeDto.getReceiverId().equals(
						loginUserInfo.getId())) {
			return "accessDenied";
		}
		
		return "viewInterviewNoticeDetail";
	}

	/**
	 * 批量删除面试接收通知信息
	 * 
	 * @return
	 */
	public String deleteInterviewNotice() {
		String ids = StringUtils.join(interviewNoticeCheckBox, ",");
		applyJobService.deleteInterviewReceiveNotice(ids);
		return viewInterviewNoticeList();
	}

	/**
	 * @return the applyJobService
	 */
	public IApplyJobService getApplyJobService() {
		return applyJobService;
	}

	/**
	 * @param applyJobService
	 *            the applyJobService to set
	 */
	public void setApplyJobService(IApplyJobService applyJobService) {
		this.applyJobService = applyJobService;
	}

	/**
	 * @return the interviewNoticeList
	 */
	public List<InterviewNoticeDto> getInterviewNoticeList() {
		return interviewNoticeList;
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
	 * @return the interviewNoticeDto
	 */
	public InterviewNoticeDto getInterviewNoticeDto() {
		return interviewNoticeDto;
	}

	/**
	 * @param interviewNoticeDto
	 *            the interviewNoticeDto to set
	 */
	public void setInterviewNoticeDto(InterviewNoticeDto interviewNoticeDto) {
		this.interviewNoticeDto = interviewNoticeDto;
	}

	/**
	 * @return the interviewNoticeCheckBox
	 */
	public String[] getInterviewNoticeCheckBox() {
		return interviewNoticeCheckBox;
	}

	/**
	 * @param interviewNoticeCheckBox
	 *            the interviewNoticeCheckBox to set
	 */
	public void setInterviewNoticeCheckBox(String[] interviewNoticeCheckBox) {
		this.interviewNoticeCheckBox = interviewNoticeCheckBox;
	}

}
