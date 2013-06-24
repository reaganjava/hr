package com.dotoyo.buildjob.enterpriseCenter.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.danga.MemCached.MemCachedClient;
import com.dotoyo.buildjob.certificateCenter.service.ICertificateService;
import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.common.util.CacheManager;
import com.dotoyo.buildjob.common.util.DateUtil;
import com.dotoyo.buildjob.headhunterCenter.dto.JobInfoDto;
import com.dotoyo.buildjob.headhunterCenter.service.IJobInfoService;
import com.dotoyo.buildjob.headhunterCenter.vo.JobSearchVo;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.dotoyo.buildjob.sys.service.ISysOrderService;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-25
 * @description 企业后台管理入口
 * 
 */
public class EnterpriseCenterAction extends BuildJobAction {

	private static final long serialVersionUID = 1L;
	private IJobInfoService jobInfoService;
	private ISysOrderService sysOrderService;
	private IUserService userService;
	private String requestType;// 请示类型（源）：发布中、暂停的、即将到期的、已结束的职位
	private PageInfo pageInfo;
	private String jobName;
	private Date jobIssuetDate;
	private Date jobExpiryDate;
	private String[] myPublishedJobs;

	private List<JobInfoDto> enterprisePublishedJobList;
	private JobInfoDto jobInfo;
	private String jobId;
	private Date extendedReleaseDateOfJob;// 延长发布时间
	private BlogUserInfoDto blogUserinfo;
	private int expireJobs;
	private int trimester;// 用户近三个月收到的申请
	private int recruitingJobs;// 正在发布的职位数
	private int expiringCertNeedsAmount;// 即将过期的证书需求数量
	private ICertificateService certificateService;
	private int notYetPaidOrders;// 用户还未支付订单统计
	private int aboutToExpireOrders;// 即将到期订单
	private long remainPublishCertNeeds;// 剩余发布证书需求次数
	private long remainPublishJobs;// 剩余发布职位次数
	private int submitCertNeedsAmount;
	private String fromReq;// 修改请求来自(发布中, 暂停,即将到期, 已结束的职位)
	private String extendationDate;// 延长日期
	private int applyJobCountToday;
	private JobSearchVo jobSearchVo;

	/**
	 * 企业后台初始化
	 */
	public String init() {
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		LoginUserInfoDto newDto = userService.getUserById(userId);
		loginUserInfo.setPoint(newDto.getPoint());
		ServletActionContext.getRequest().getSession().setAttribute(ApplicationConstant.SESSION_PARAMETER_USER_INFO, loginUserInfo);
		getLoginUserInfo();
		blogUserinfo = getUserService().loadUserInfoByUserName(
				loginUserInfoDto.getUserName());
		// 特别提醒
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", this.getLoginUserInfo().getId());
		paramMap.put("status", ApplicationConstant.PUBLISHING);
		paramMap.put("currentDate", DateUtil.getCurrentDateString("yyyy-MM-dd"));
		expireJobs = jobInfoService.getCountOfUserExpireJobs(paramMap);
		searchCertNeedsCount4EnterpriseCenter();
		applicationsReceivedsOfTrimester();
		cAreRecruitingStatisticsTheNumOfPosts();
		notYetPaidOrders = sysOrderService
				.getCountOfHaveNotYetPaidOrder(loginUserInfoDto.getId());
		aboutToExpireOrders = sysOrderService.getCountAboutToExpireOrder(
				loginUserInfoDto.getId(), ApplicationConstant.ORDER_DAY_END);
		loadRemainPublishCertNeeds();
		loadRemainPublishJobs();
		searchPublishCertNeeds();
		applyJobCountToday = jobInfoService.queryApplicationsReceivedsOfToday(this.getLoginUserInfo().getId());
		return "init";
	}

	private void loadRemainPublishCertNeeds() {
		SysOrderDto sysOrderDto = new SysOrderDto();
		sysOrderDto.setService2Remains(new Long(1));
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		remainPublishCertNeeds = sysOrderService.getAvailableServiceTimes(
				sysOrderDto, loginUserInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_HUNTCARD_CODE, "2");
	}

	private void loadRemainPublishJobs() {
		SysOrderDto sysOrderDto = new SysOrderDto();
		sysOrderDto.setService1Remains(new Long(1));
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		remainPublishJobs = sysOrderService.getAvailableServiceTimes(
				sysOrderDto, loginUserInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE, "1");
	}

	private void searchPublishCertNeeds() {
		Map<String, String> certNeedsMap = new HashMap<String, String>();
		Long userId = this.getLoginUserInfo().getId();
		certNeedsMap.put("userId", userId.toString());
		certNeedsMap.put("certNeedsStatus", "0,1");
		certNeedsMap.put("currentDate",
				DateUtil.getCurrentDateString("yyyy-MM-dd"));
		submitCertNeedsAmount = certificateService
				.searchCertNeedsCount4EnterpriseCenter(certNeedsMap);
	}

	private Integer searchCertNeedsCount4EnterpriseCenter() {
		Map<String, String> certNeedsMap = new HashMap<String, String>();
		Long userId = this.getLoginUserInfo().getId();
		certNeedsMap.put("userId", userId.toString());
		certNeedsMap.put("certNeedsType",
				ApplicationConstant.EXPIRING_CERTNEEDS);
		certNeedsMap.put("currentDate",
				DateUtil.getCurrentDateString("yyyy-MM-dd"));
		expiringCertNeedsAmount = certificateService
				.searchCertNeedsCount4EnterpriseCenter(certNeedsMap);
		return expiringCertNeedsAmount;
	}

	/**
	 * 企业正在招聘的 职位数统计
	 */
	public void cAreRecruitingStatisticsTheNumOfPosts() {
		recruitingJobs = jobInfoService
				.cAreRecruitingStatisticsTheNumOfPosts(this.getLoginUserInfo()
						.getId());
	}

	/**
	 * 用户近三个收到的申请
	 */
	public void applicationsReceivedsOfTrimester() {
		trimester = jobInfoService.queryApplicationsReceivedsOfTrimester(this
				.getLoginUserInfo().getId(), DateUtil.addDate(new Date(), -90));
	}

	/**
	 * 暂停的职位
	 * 
	 * @return
	 */
	public String getMySuspendJobs() {
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", this.getLoginUserInfo().getId());
		paramMap.put("status", ApplicationConstant.SUSPEND);
		paramMap.put("jobName", jobName);
		paramMap.put("jobIssuetDate", jobIssuetDate);
		paramMap.put("jobExpiryDate", jobExpiryDate);

		enterprisePublishedJobList = jobInfoService
				.queryEnterprisePublishingJobs(paramMap, pageInfo);
		return "mySuspendJobs";
	}

	/**
	 * 开启暂停的职位/职位发布
	 */
	public String unlockPublishingJob() {
		StringBuffer nonPublishedJobIds = new StringBuffer();
		StringBuffer suspendJobIds = new StringBuffer();
		boolean nonPublished = false, suspended = false;

		// 加载所选暂停职位
		List<JobInfoDto> selectedSuspendJobs = jobInfoService
				.loadSelectedSuspendJobs(StringUtils.join(myPublishedJobs, ','));
		for (JobInfoDto jobInfoDto : selectedSuspendJobs) {
			if (DateUtil.dateComparison(jobInfoDto.getJobIssuetDate(),
					new Date()).equals(ApplicationConstant.DATE_COMPARISON_STATUS_AFTER)) {
				nonPublishedJobIds.append(jobInfoDto.getId()).append(",");
				nonPublished = true;
				// 尚未发布的职位，修改issuetDate，状态
			} else {
				suspendJobIds.append(jobInfoDto.getId()).append(",");
				suspended = true;
				// 暂停的职位，修改状态，expDate
			}
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if (suspended) {
			paramMap.put("userId", this.getLoginUserInfo().getId());
			paramMap.put("jobIds",
					suspendJobIds.subSequence(0, suspendJobIds.length() - 1));
			paramMap.put("status", ApplicationConstant.PUBLISHING);
			paramMap.put("currentDate", new Date());
			jobInfoService.updatePublishedJob(
					ApplicationConstant.UNLOCK_PUBLISHING_JOB, paramMap);
			HtmlGeneration.getInstance().refreshHeadhunterCenterPage();
		}
		if (nonPublished) {
			paramMap.clear();
			paramMap.put("userId", this.getLoginUserInfo().getId());
			paramMap.put(
					"jobIds",
					nonPublishedJobIds.subSequence(0,
							nonPublishedJobIds.length() - 1));
			paramMap.put("status", ApplicationConstant.PUBLISHING);
			paramMap.put("currentDate", new Date());
			jobInfoService.updatePublishedJob(
					ApplicationConstant.PUBLISHING_SUSPENDED_JOB, paramMap);
			HtmlGeneration.getInstance().refreshHeadhunterCenterPage();
		}
		return "unlockPublishingJob";
	}

	/**
	 * 日期比较(职位状态 显示用)
	 */
	public static String comper(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			if (sdf.parse(date).before(new Date())) {
				return ApplicationConstant.EXPIRED;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return ApplicationConstant.NORMAL;
	}

	/**
	 * 即将到期的职位
	 */
	public String getIsAboutToExpireJobs() {
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", this.getLoginUserInfo().getId());
		paramMap.put("jobName", jobName);
		paramMap.put("jobIssuetDate", jobIssuetDate);
		paramMap.put("jobExpiryDate", jobExpiryDate);
		paramMap.put("currentDate", DateUtil.getCurrentDateString("yyyy-MM-dd"));
		paramMap.put("jobType", ApplicationConstant.IS_ABOUT_TO_EXPIRE);
		paramMap.put("status", ApplicationConstant.PUBLISHING);

		enterprisePublishedJobList = jobInfoService
				.queryEnterprisePublishingJobs(paramMap, pageInfo);

		Date currentDate = new Date(); // 新建一个日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		extendationDate = sdf.format(getDateAfter(currentDate, 7));
		return "isAboutToExpireJobs";
	}

	/**
	 * 得到几天后的时间
	 */

	private Date getDateAfter(Date d, int day) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) + day);
		return now.getTime();
	}

	/**
	 * 延长发布时间
	 */
	public String extendedReleaseDate() {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", this.getLoginUserInfo().getId());
		paramMap.put("jobIds", StringUtils.join(myPublishedJobs, ','));
		paramMap.put("extendedReleaseDate", extendedReleaseDateOfJob);
		paramMap.put("currentDate", DateUtil.getCurrentDateString());

		jobInfoService.updatePublishedJob(
				ApplicationConstant.EXTENDED_RELEASE_DATE, paramMap);
		HtmlGeneration.getInstance().refreshHeadhunterCenterPage();
		return "extendedReleaseDate";
	}

	/**
	 * 已结束的职位
	 * 
	 * @return
	 */
	public String getCompleteJobs() {
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", this.getLoginUserInfo().getId());
		paramMap.put("jobName", jobName);
		paramMap.put("status", ApplicationConstant.COMPLETE);
		paramMap.put("jobIssuetDate", jobIssuetDate);
		paramMap.put("jobExpiryDate", jobExpiryDate);
		paramMap.put("currentDate", DateUtil.getCurrentDateString());
		paramMap.put("completeDate",
				DateUtil.getCurrentDateString("yyyy-MM-dd"));
		enterprisePublishedJobList = jobInfoService
				.queryEnterprisePublishingJobs(paramMap, pageInfo);
		return "completeJobs";
	}

	/**
	 * 已结束的职位重新发布
	 */
	public String republishJobs() {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", this.getLoginUserInfo().getId());
		paramMap.put("jobIds", StringUtils.join(myPublishedJobs, ','));
		paramMap.put("status", ApplicationConstant.PUBLISHING);
		paramMap.put("currentDate", DateUtil.getCurrentDateString());

		jobInfoService.updatePublishedJob(ApplicationConstant.REPUBLISH_JOBS,
				paramMap);
		HtmlGeneration.getInstance().refreshHeadhunterCenterPage();
		return "republishJobs";
	}

	/**
	 * 职位信息查询(发布中)
	 */
	public String getMyPublishingJobs() {
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", this.getLoginUserInfo().getId());
		paramMap.put("status", ApplicationConstant.PUBLISHING);
		paramMap.put("jobName", jobName);
		paramMap.put("jobIssuetDate", jobIssuetDate);
		paramMap.put("jobExpiryDate", jobExpiryDate);

		enterprisePublishedJobList = jobInfoService
				.queryEnterprisePublishingJobs(paramMap, pageInfo);
		return "myPublishingJobs";
	}

	/**
	 * 暂停发布职位
	 */
	public String suspendPublishedJob() {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("jobIds", StringUtils.join(myPublishedJobs, ','));
		paramMap.put("status", ApplicationConstant.SUSPEND);
		paramMap.put("currentDate", new Date());

		jobInfoService.updatePublishedJob(
				ApplicationConstant.SUSPEND_PUBLISHED_JOB, paramMap);
		HtmlGeneration.getInstance().refreshHeadhunterCenterPage();
		return "suspendPublishedJob";
	}

	/**
	 * 删除选择中的已发布的职位
	 */
	public String deleteMyPublishedJob() {
		jobInfoService.deleteEnterprisePublishedJob(StringUtils.join(
				myPublishedJobs, ','));
		HtmlGeneration.getInstance().refreshHeadhunterCenterPage();

		switch (Integer.parseInt(requestType)) {
		case 0:
			return "deleteJobFromApplyRecord";
		case 1:
			return "deleteMyPublishingJob";
		case 2:
			return "deleteMySuspendJobs";
		case 3:
			return "deleteIsAboutToExpireJobs";
		case 4:
			return "deleteCompleteJobs";
		}
		return null;
	}

	/**
	 * 修改选择中的已发布的职位
	 */
	@SuppressWarnings("unchecked")
	public String modifyMyPublishedJob() {
		MemCachedClient memcachedClient = CacheManager
				.getInstanceMemcachedClient();
		jobInfo = jobInfoService.loadEJobInfo(Long.parseLong(jobId), this
				.getLoginUserInfo().getId());

		industrysList = (List<ClassMasterDto>) memcachedClient
				.get("industrysList");
		competencyList = (List<ClassMasterDto>) memcachedClient
				.get("competencyList");
		provinceList = (List<ProvinceDto>) memcachedClient.get("provinceList");
		specializedTypeList = (List<ClassMasterDto>) memcachedClient
				.get("specializedTypeList");
		jobNatureList = (List<ClassMasterDto>) memcachedClient
				.get("jobNatureList");
		salaryList = (List<ClassMasterDto>) memcachedClient.get("salaryList");
		workingLifeList = (List<ClassMasterDto>) memcachedClient
				.get("workingLifeList");
		educationList = (List<ClassMasterDto>) memcachedClient
				.get("educationList");
		langCapaList = (List<ClassMasterDto>) memcachedClient
				.get("langCapaList");
		ageList = (List<ClassMasterDto>) memcachedClient.get("ageList");
		masteryList = (List<ClassMasterDto>) memcachedClient.get("masteryList");
		computerGradeList = (List<ClassMasterDto>) memcachedClient
				.get("computerGradeList");
		return "updateMyPublishedJob";
	}

	/**
	 * 保存修改
	 */
	public String saveUpdatePublishedJob() {
		String status = DateUtil.dateComparison(new Date(), jobInfo.getJobExpiryDate());
		if(status.equals(ApplicationConstant.DATE_COMPARISON_STATUS_AFTER)){
			jobInfo.setStatus("2");
		}
		jobInfo.setLastUpdateTime(new Date());
		if (jobInfoService.updatePublishedJob(jobInfo) > 0) {
			HtmlGeneration.getInstance().refreshHeadhunterCenterPage();
			return "updateSuccess";
		}
		return null;
	}

	public void setJobInfoService(IJobInfoService jobInfoService) {
		this.jobInfoService = jobInfoService;
	}

	public IJobInfoService getJobInfoService() {
		return jobInfoService;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobIssuetDate(Date jobIssuetDate) {
		this.jobIssuetDate = jobIssuetDate;
	}

	public Date getJobIssuetDate() {
		return jobIssuetDate;
	}

	public void setJobExpiryDate(Date jobExpiryDate) {
		this.jobExpiryDate = jobExpiryDate;
	}

	public Date getJobExpiryDate() {
		return jobExpiryDate;
	}

	public void setEnterprisePublishedJobList(
			List<JobInfoDto> enterprisePublishedJobList) {
		this.enterprisePublishedJobList = enterprisePublishedJobList;
	}

	public List<JobInfoDto> getEnterprisePublishedJobList() {
		return enterprisePublishedJobList;
	}

	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}

	public String getRequestType() {
		return requestType;
	}

	public void setMyPublishedJobs(String[] myPublishedJobs) {
		this.myPublishedJobs = myPublishedJobs;
	}

	public String[] getMyPublishedJobs() {
		return myPublishedJobs;
	}

	public void setJobInfo(JobInfoDto jobInfo) {
		this.jobInfo = jobInfo;
	}

	public JobInfoDto getJobInfo() {
		return jobInfo;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJobId() {
		return jobId;
	}

	public void setExtendedReleaseDateOfJob(Date extendedReleaseDateOfJob) {
		this.extendedReleaseDateOfJob = extendedReleaseDateOfJob;
	}

	public Date getExtendedReleaseDateOfJob() {
		return extendedReleaseDateOfJob;
	}

	public void setBlogUserinfo(BlogUserInfoDto blogUserinfo) {
		this.blogUserinfo = blogUserinfo;
	}

	public BlogUserInfoDto getBlogUserinfo() {
		return blogUserinfo;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setExpireJobs(int expireJobs) {
		this.expireJobs = expireJobs;
	}

	public int getExpireJobs() {
		return expireJobs;
	}

	public void setTrimester(int trimester) {
		this.trimester = trimester;
	}

	public int getTrimester() {
		return trimester;
	}

	public void setRecruitingJobs(int recruitingJobs) {
		this.recruitingJobs = recruitingJobs;
	}

	public int getRecruitingJobs() {
		return recruitingJobs;
	}

	/**
	 * @return the expiringCertNeedsAmount
	 */
	public int getExpiringCertNeedsAmount() {
		return expiringCertNeedsAmount;
	}

	/**
	 * @param expiringCertNeedsAmount
	 *            the expiringCertNeedsAmount to set
	 */
	public void setExpiringCertNeedsAmount(int expiringCertNeedsAmount) {
		this.expiringCertNeedsAmount = expiringCertNeedsAmount;
	}

	/**
	 * @return the certificateService
	 */
	public ICertificateService getCertificateService() {
		return certificateService;
	}

	/**
	 * @param certificateService
	 *            the certificateService to set
	 */
	public void setCertificateService(ICertificateService certificateService) {
		this.certificateService = certificateService;
	}

	public void setSysOrderService(ISysOrderService sysOrderService) {
		this.sysOrderService = sysOrderService;
	}

	public ISysOrderService getSysOrderService() {
		return sysOrderService;
	}

	public void setNotYetPaidOrders(int notYetPaidOrders) {
		this.notYetPaidOrders = notYetPaidOrders;
	}

	public int getNotYetPaidOrders() {
		return notYetPaidOrders;
	}

	public void setAboutToExpireOrders(int aboutToExpireOrders) {
		this.aboutToExpireOrders = aboutToExpireOrders;
	}

	public int getAboutToExpireOrders() {
		return aboutToExpireOrders;
	}

	public long getRemainPublishCertNeeds() {
		return remainPublishCertNeeds;
	}

	public void setRemainPublishCertNeeds(long remainPublishCertNeeds) {
		this.remainPublishCertNeeds = remainPublishCertNeeds;
	}

	public int getSubmitCertNeedsAmount() {
		return submitCertNeedsAmount;
	}

	public void setSubmitCertNeedsAmount(int submitCertNeedsAmount) {
		this.submitCertNeedsAmount = submitCertNeedsAmount;
	}

	public long getRemainPublishJobs() {
		return remainPublishJobs;
	}

	public void setRemainPublishJobs(long remainPublishJobs) {
		this.remainPublishJobs = remainPublishJobs;
	}

	public void setFromReq(String fromReq) {
		this.fromReq = fromReq;
	}

	public String getFromReq() {
		return fromReq;
	}

	public String getExtendationDate() {
		return extendationDate;
	}

	public void setExtendationDate(String extendationDate) {
		this.extendationDate = extendationDate;
	}

	public int getApplyJobCountToday() {
		return applyJobCountToday;
	}

	public void setApplyJobCountToday(int applyJobCountToday) {
		this.applyJobCountToday = applyJobCountToday;
	}

	public JobSearchVo getJobSearchVo() {
		return jobSearchVo;
	}

	public void setJobSearchVo(JobSearchVo jobSearchVo) {
		this.jobSearchVo = jobSearchVo;
	}
	
}
