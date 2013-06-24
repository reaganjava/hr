package com.dotoyo.buildjob.enterpriseCenter.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.dotoyo.buildjob.applyJobCenter.service.IApplyJobService;
import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.InterviewNoticeDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.headhunterCenter.dto.JobInfoDto;
import com.dotoyo.buildjob.headhunterCenter.service.IJobInfoService;
import com.dotoyo.buildjob.headhunterCenter.vo.JobSearchVo;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.dotoyo.buildjob.sys.service.ISysOrderService;

/**
 * @author tyler.qu
 * @dateCreated 2011-2-26
 * @description 招聘管理之收到的申请
 * 
 */
public class ApplicationsReceivedAction extends BuildJobAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3940284791097878278L;
	private IJobInfoService jobInfoService;
	private IUserService userService;
	private IApplyJobService applyJobService;
	private ISysOrderService sysOrderService;
	private PageInfo pageInfo;
	private JobSearchVo jobSearchVo;
	private String columnName = "applicationDate";
	private List<JobInfoDto> applicationsReceivedList;
	private List<BlogUserInfoDto> jobApplicationDetailList;
	private BlogUserInfoDto blogUser;
	private String jobId;
	private String applyJobQueryType;
	private String[] candidates;
	private Map<String, String> appStatusMap;
	private String status;
	private String success = "0";
	private String showAbstract;

	/**
	 * 收到的申请记录列表
	 * 
	 * @return
	 */
	public String applicationsReceiveds() {
		if (this.getPageInfo() == null) {
			this.setPageInfo(new PageInfo());
		}
		if (null == jobSearchVo) {
			jobSearchVo = new JobSearchVo();
		}
		jobSearchVo.setUserId(this.getLoginUserInfo().getId());
		this.getPageInfo().setPageSize(
				ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);
		applicationsReceivedList = jobInfoService.queryApplicationsReceiveds(
				jobSearchVo, getPageInfo());
		return "applicationsReceiveds";
	}

	/**
	 * 申请记录详情
	 */
	public String detailsOfJobApplications() {
		if (this.getPageInfo() == null) {
			this.setPageInfo(new PageInfo());
		}
		this.getPageInfo().setPageSize(
				ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("jobId", jobId);
		paramMap.put("applyJobQueryType", applyJobQueryType);
		paramMap.put("receiverId", this.getLoginUserInfo().getId().toString());
		if (null != blogUser) {
			paramMap.put("userName", blogUser.getUserName());
			paramMap.put("metier", blogUser.getMetier());
			paramMap.put("status", blogUser.getStatus());
		}
		paramMap.put("columnName", columnName);
		jobApplicationDetailList = userService.queryJobApplicationsDetails(
				pageInfo, paramMap);

		appStatusMap = new TreeMap<String, String>();
		appStatusMap.put("", "");// 全部
		appStatusMap
				.put("0", ApplicationConstant.APPLICATIONS_RECEIVED_NOT_SEE);
		appStatusMap.put("1", ApplicationConstant.APPLICATIONS_RECEIVED_VIEWED);
		appStatusMap
				.put("2",
						ApplicationConstant.APPLICATIONS_RECEIVED_INVITATION_HAS_BEEN_SENT);// 已发送邀请
		return "detailsOfJobApplications";
	}

	/**
	 * 删除职位申请用户
	 */
	public String removeCandidates() {
		String[] appIds = new String[candidates.length];
		for (int i = 0; i < candidates.length; i++) {
			String[] tArray = candidates[i].split("-");// 拆分出jobId,userId
			appIds[i] = tArray[0];
		}

		jobInfoService.deleteReveiveApplyRecord(StringUtils.join(appIds, ','));
		return "redirectReceiveds";
	}

	/**
	 * 用户服务验证
	 */
	public String userAuthenticationService() {
		request = ServletActionContext.getRequest();
		String checked = request.getParameter("checked");
		SysOrderDto dto = new SysOrderDto();
		dto.setService3Remains(new Long(3));
		LoginUserInfoDto userInfo = getLoginUserInfo();
		if (getSysOrderService().getAvailableServiceTimes(dto, userInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE,
				ApplicationConstant.SERVICE_3_REMAINS) < Integer
				.parseInt(checked)) {
			setSuccess(checked);
			return "userAuthenticationService";
		}
		return "userAuthenticationService";
	}

	/**
	 * 邀请面试
	 */
	public String interviewInvite() {
		JobInfoDto jobInfoDto = jobInfoService.getJobInfo(new Long(jobId), this.getLoginUserInfo().getId());
		String jobName = "";
		if(jobInfoDto!=null){
			jobName = jobInfoDto.getJobName();
		}
		List<InterviewNoticeDto> talentList = new ArrayList<InterviewNoticeDto>();
		String[] appIds = new String[candidates.length];
		if (null != candidates && candidates.length > 0) {
			for (int i = 0; i < candidates.length; i++) {
				String[] tArray = candidates[i].split("-");// 拆分出jobId,userId
				appIds[i] = tArray[0];
				InterviewNoticeDto interviewNoticeDto = new InterviewNoticeDto();
				interviewNoticeDto.setSenderId(this.getLoginUserInfo().getId());
				interviewNoticeDto.setReceiverId(Long.parseLong(tArray[1]));
				interviewNoticeDto.setJobName(jobName);
				interviewNoticeDto
						.setTitle(ApplicationConstant.INTERVIEW_NOTICE_TITLE);
				interviewNoticeDto
						.setMessage(ApplicationConstant.INTERVIEW_NOTICE_MESSAGE);
				interviewNoticeDto.setNoticeDate(new Date());
				interviewNoticeDto.setStatus("0");
				talentList.add(interviewNoticeDto);
			}
		}

		SysOrderDto dto = new SysOrderDto();
		dto.setService3Remains(new Long(3));
		LoginUserInfoDto userInfo = getLoginUserInfo();
		sysOrderService.batchVerifyAuthority(dto, userInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE,
				ApplicationConstant.SERVICE_3_REMAINS, candidates.length);
		applyJobService.fastBatchApply(talentList);
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("appIds", StringUtils.join(appIds, ','));
		paramMap.put("status", status);
		userService.updateApplicationJobRecordStatus(paramMap);
		return "redirectReceiveds";
	}

	/**
	 * 查看用户博站
	 * 
	 * @return
	 */
	public String linkBoStation() {
		request = ServletActionContext.getRequest();
		String appId = request.getParameter("appIds");
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("appIds", appId);
		paramMap.put("status", status);
		if (userService.updateApplicationJobRecordStatus(paramMap) > 0) {
			success = "1";
			return "linkBoStation";
		}
		return "redirectReceiveds";
	}

	public void setJobInfoService(IJobInfoService jobInfoService) {
		this.jobInfoService = jobInfoService;
	}

	public IJobInfoService getJobInfoService() {
		return jobInfoService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setJobSearchVo(JobSearchVo jobSearchVo) {
		this.jobSearchVo = jobSearchVo;
	}

	public JobSearchVo getJobSearchVo() {
		return jobSearchVo;
	}

	public void setApplicationsReceivedList(
			List<JobInfoDto> applicationsReceivedList) {
		this.applicationsReceivedList = applicationsReceivedList;
	}

	public List<JobInfoDto> getApplicationsReceivedList() {
		return applicationsReceivedList;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setJobApplicationDetailList(
			List<BlogUserInfoDto> jobApplicationDetailList) {
		this.jobApplicationDetailList = jobApplicationDetailList;
	}

	public List<BlogUserInfoDto> getJobApplicationDetailList() {
		return jobApplicationDetailList;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getColumnName() {
		return columnName;
	}

	public void setBlogUser(BlogUserInfoDto blogUser) {
		this.blogUser = blogUser;
	}

	public BlogUserInfoDto getBlogUser() {
		return blogUser;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJobId() {
		return jobId;
	}

	public void setCandidates(String[] candidates) {
		this.candidates = candidates;
	}

	public String[] getCandidates() {
		return candidates;
	}

	public void setAppStatusMap(Map appStatusMap) {
		this.appStatusMap = appStatusMap;
	}

	public Map getAppStatusMap() {
		return appStatusMap;
	}

	public void setApplyJobService(IApplyJobService applyJobService) {
		this.applyJobService = applyJobService;
	}

	public IApplyJobService getApplyJobService() {
		return applyJobService;
	}

	public static void main(String[] args) {
		String[] c = { "1", "2", "3", "4", "," };
		System.out.println(StringUtils.join(c, ','));
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getSuccess() {
		return success;
	}

	public void setSysOrderService(ISysOrderService sysOrderService) {
		this.sysOrderService = sysOrderService;
	}

	public ISysOrderService getSysOrderService() {
		return sysOrderService;
	}

	public String getApplyJobQueryType() {
		return applyJobQueryType;
	}

	public void setApplyJobQueryType(String applyJobQueryType) {
		this.applyJobQueryType = applyJobQueryType;
	}

	public String getShowAbstract() {
		return showAbstract;
	}

	public void setShowAbstract(String showAbstract) {
		this.showAbstract = showAbstract;
	}
	
}
