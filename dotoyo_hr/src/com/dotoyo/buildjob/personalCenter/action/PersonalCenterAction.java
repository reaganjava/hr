package com.dotoyo.buildjob.personalCenter.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.danga.MemCached.MemCachedClient;
import com.dotoyo.buildjob.applyJobCenter.dto.ApplyJobInfoDto;
import com.dotoyo.buildjob.applyJobCenter.dto.RecommendationDto;
import com.dotoyo.buildjob.applyJobCenter.service.IApplyJobService;
import com.dotoyo.buildjob.applyJobCenter.vo.ApplyJobInfoVo;
import com.dotoyo.buildjob.applyJobCenter.vo.RecommendationVo;
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
import com.dotoyo.buildjob.common.util.EssentialDataUtil;
import com.dotoyo.buildjob.common.util.RegionDataUtil;
import com.dotoyo.buildjob.headhunterCenter.dto.ApplicationJobRecordDto;
import com.dotoyo.buildjob.headhunterCenter.dto.JobInfoDto;
import com.dotoyo.buildjob.headhunterCenter.service.IJobInfoService;
import com.dotoyo.buildjob.headhunterCenter.vo.JobSearchVo;
import com.dotoyo.buildjob.sys.service.ISysOrderService;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

import edu.emory.mathcs.backport.java.util.Arrays;

public class PersonalCenterAction extends BuildJobAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7692329464101696109L;
	private IApplyJobService applyJobService;
	private IJobInfoService jobInfoService;
	private IUserService userService;
	private ISysOrderService sysOrderService;
	private ICertificateService certificateService;
	private List<ApplyJobInfoVo> applyJobInfoList;
	private ApplyJobInfoDto applyJobInfoDto;
	private ApplyJobInfoVo applyJobInfoVo;
	private PageInfo pageInfo;
	private MemCachedClient memcachedClient;
	private String[] applyJobInfoCheckBox;
	private List<ClassMasterDto> functionList;
	private List<ClassMasterDto> salaryList;
	private List<ClassMasterDto> jobTypeList;

	private String jobName;
	private String companyName;
	private Map<String, String> jobStatus;// 职位状态（1 正常，-1 已过期）20110125 待重构
	private String status;// 页面展示用，与职位
	private List<ApplicationJobRecordDto> myAppliedJobList;
	private JobInfoDto jobInfo;
	private String[] myJobs;

	private RecommendationDto recommendationDto;
	private RecommendationVo recommendationVo;
	private List<RecommendationVo> recommendationList;

	private BlogUserInfoDto blogUserinfo;
	private int newJobs;
	private int todayCertNeeds;// 今日最新证书需求
	private List<JobInfoDto> newJobList;
	private JobSearchVo jobSearchVo;
	private int notYetPaidOrders = 0;// 用户还未支付订单统计
	private int aboutToExpireOrders;// 即将到期订单
	private String actionMessage;
	private String isApplyRecommendation;//是否同时申请成为线下推荐对象
	private String isApplyJob;// 是否同时发布线上求职信息
	private int notSeeInvite;//未查看面试通知数量

	/**
	 * 个人后台初始化
	 * 
	 * @return
	 */
	public String init() {
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		LoginUserInfoDto newDto = userService.getUserById(userId);
		loginUserInfo.setPoint(newDto.getPoint());
		ServletActionContext.getRequest().getSession().setAttribute(ApplicationConstant.SESSION_PARAMETER_USER_INFO, loginUserInfo);
		getLoginUserInfo();
		blogUserinfo = userService.loadUserInfoByUserName(loginUserInfoDto
				.getUserName());
		// 特别提醒
		newJobs = jobInfoService
				.getCountOfNewJobsByUserExpectedPosition(loginUserInfoDto
						.getId());
		todayCertNeeds = certificateService
				.getCountOfCertNeedsToday(new Date());
		notYetPaidOrders = sysOrderService
				.getCountOfHaveNotYetPaidOrder(loginUserInfoDto.getId());
		aboutToExpireOrders = sysOrderService.getCountAboutToExpireOrder(
				loginUserInfoDto.getId(), ApplicationConstant.ORDER_DAY_END);
		notSeeInvite = applyJobService.getCountOfNotSeeInviteByUserId(this
				.getLoginUserInfo().getId());
		return "init";
	}

	/**
	 * 查看今日新增用户 期望职位列表
	 */
	@SuppressWarnings("unchecked")
	public String viewNewJobs() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		if (memcachedClient == null) {
			memcachedClient = CacheManager.getInstanceMemcachedClient();
		}
		pageInfo.setPageSize(ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);
		newJobList = jobInfoService.queryNewJobsByUserExpectedPosition(
				pageInfo, this.getLoginUserInfo().getId());
		industrysList = (List<ClassMasterDto>) memcachedClient
				.get("industrysList");
		competencyList = (List<ClassMasterDto>) memcachedClient
				.get("competencyList");
		provinceList = (List<ProvinceDto>) memcachedClient.get("provinceList");
		specializedTypeList = (List<ClassMasterDto>) memcachedClient
				.get("specializedTypeList");
		jobNatureList = (List<ClassMasterDto>) memcachedClient
				.get("jobNatureList");
		workingLifeList = (List<ClassMasterDto>) memcachedClient
				.get("workingLifeList");
		educationList = (List<ClassMasterDto>) memcachedClient
				.get("educationList");
		return "viewNewJobs";
	}

	/**
	 * 查看求职意向列表
	 * 
	 * @return
	 */
	public String viewApplyJobIntentionList() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		if (applyJobInfoDto == null) {
			applyJobInfoDto = new ApplyJobInfoDto();
		}
		// 为搜索初始化
		if (applyJobInfoDto.getExpectedPosition() == null) {
			applyJobInfoDto.setExpectedPosition("");
		}
		if (applyJobInfoDto.getActStatus() == null) {
			applyJobInfoDto.setActStatus("");
		}
		pageInfo.setPageSize(ApplicationConstant.APPLYJOBCTR_PAGE_SIZE);
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		applyJobInfoDto.setUserId(userId);
		applyJobInfoList = applyJobService.queryApplyJobInfoList(pageInfo,
				applyJobInfoDto);
		return "viewApplyJobIntentionList";
	}

	/**
	 * 查看申请成为线下推荐对象信息
	 * 
	 * @return
	 */
	public String viewApplyRecommendation() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.APPLYJOBCTR_PAGE_SIZE);
		if (recommendationDto == null) {
			recommendationDto = new RecommendationDto();
		}
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		recommendationDto.setUserId(userId);
		recommendationList = applyJobService.queryRecommendationList(pageInfo,
				recommendationDto);
		return "viewApplyRecommendation";
	}

	/**
	 * 删除求职意向
	 * 
	 * @return
	 */
	public String deleteApplyJobIntention() {
		String ids = StringUtils.join(applyJobInfoCheckBox, ",");
		applyJobService.deleteApplyJobInfo(ids);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshApplyJobPage();
		return viewApplyJobIntentionList();
	}

	/**
	 * 暂停求职意向
	 * 
	 * @return
	 */
	public String pauseApplyJobIntention() {
		String ids = StringUtils.join(applyJobInfoCheckBox, ",");
		applyJobService.pauseApplyJobInfo(ids);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshApplyJobPage();
		return viewApplyJobIntentionList();
	}

	public String publishApplyJobIntention() {
		String ids = StringUtils.join(applyJobInfoCheckBox, ",");
		applyJobService.publishApplyJobInfo(ids);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshApplyJobPage();
		return viewApplyJobIntentionList();
	}

	/**
	 * 进入增加求职意向页面
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String toAddApplyJobInfo() {
		if (memcachedClient == null) {
			memcachedClient = CacheManager.getInstanceMemcachedClient();
		}
		provinceList = (List<ProvinceDto>) memcachedClient.get("provinceList");
		functionList = (List<ClassMasterDto>) memcachedClient
				.get("competencyList");
		salaryList = (List<ClassMasterDto>) memcachedClient.get("salaryList");
		jobTypeList = (List<ClassMasterDto>) memcachedClient
				.get("jobNatureList");

		// 判断用户是否已经是线下推荐对象
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.APPLYJOBCTR_PAGE_SIZE);
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		RecommendationDto recommendationDto = new RecommendationDto();
		recommendationDto.setUserId(userId);
		List<RecommendationVo> recommendationList = applyJobService
				.queryRecommendationList(pageInfo, recommendationDto);
		if (recommendationList != null && !recommendationList.isEmpty()) {
			request = ServletActionContext.getRequest();
			request.setAttribute("readOnly", ApplicationConstant.COMMON_Y_EN);
		}
		return "toAddApplyJobInfo";
	}

	public String saveApplyJobInfo() {
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		Date currentDate = new Date();
		applyJobInfoDto.setActStatus("A");
		applyJobInfoDto.setLastEditDate(currentDate);
		applyJobInfoDto.setSubmitDate(currentDate);
		applyJobInfoDto.setUserId(userId);

		ApplyJobInfoDto tempDto = new ApplyJobInfoDto();
		tempDto.setUserId(userId);
		tempDto.setExpectedPosition(applyJobInfoDto.getExpectedPosition());
		tempDto.setIsAdvisor(applyJobInfoDto.getIsAdvisor());
		tempDto.setJobTypeCode(applyJobInfoDto.getJobTypeCode());
		tempDto.setFunctionCode(applyJobInfoDto.getFunctionCode());
		int size = applyJobService.queryDuplicatedIntentionCount(tempDto);
		// 求职意向重复
		if (size > 0) {
			actionMessage = "求职意向重复，请重新输入求职信息！";
			return toAddApplyJobInfo();
		}
		
		//判断用户是否已经是线下推荐对象
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(10);
		if(ApplicationConstant.COMMON_Y_EN.equalsIgnoreCase(isApplyRecommendation)){
			RecommendationDto recommendationDto = new RecommendationDto();
			recommendationDto.setUserId(userId);
			List<RecommendationVo> recommendationList = applyJobService
					.queryRecommendationList(pageInfo, recommendationDto);
			
			//用户已经是线下推荐对象
			if (recommendationList != null && !recommendationList.isEmpty()) {
				isApplyRecommendation = null;
			}
		}

		applyJobService.saveApplyJobInfo(applyJobInfoDto, isApplyRecommendation);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshApplyJobPage();
		return "saveApplyJobInfo";
	}

	@SuppressWarnings("unchecked")
	public String toAddRecommendation() {
		if (memcachedClient == null) {
			memcachedClient = CacheManager.getInstanceMemcachedClient();
		}
		provinceList = (List<ProvinceDto>) memcachedClient.get("provinceList");
		functionList = (List<ClassMasterDto>) memcachedClient
				.get("competencyList");
		salaryList = (List<ClassMasterDto>) memcachedClient.get("salaryList");
		jobTypeList = (List<ClassMasterDto>) memcachedClient
				.get("jobNatureList");
		return "toAddRecommendation";
	}

	public String saveAddRecommendation() {
		
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();

		//判断用户是否已经是线下推荐对象
		RecommendationDto dto = new RecommendationDto();
		dto.setUserId(userId);
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(10);
		List<RecommendationVo> recommendationList = applyJobService
				.queryRecommendationList(pageInfo, dto);
		if (recommendationList != null && !recommendationList.isEmpty()) {
			actionMessage = "你已经是线下推荐对象";
			return "backToPreviousWindow";
		}
		
		//判断用户是否具有重复的求职意向
		ApplyJobInfoDto tempDto = new ApplyJobInfoDto();
		tempDto.setUserId(userId);
		tempDto.setExpectedPosition(recommendationDto.getExpectedPosition());
		tempDto.setIsAdvisor(recommendationDto.getIsAdvisor());
		tempDto.setJobTypeCode(recommendationDto.getJobTypeCode());
		tempDto.setFunctionCode(recommendationDto.getFunctionCode());
		int size = applyJobService.queryDuplicatedIntentionCount(tempDto);

		// 求职意向重复
		if (size > 0) {
			isApplyJob = null;
		}
		
		Date currentDate = new Date();
		recommendationDto.setInterviewStatus("0");
		recommendationDto.setLastEditDate(currentDate);
		recommendationDto.setRecommendationType("0");
		recommendationDto.setSubmitDate(currentDate);
		recommendationDto.setUserId(userId);
		recommendationDto.setVerifyStatus("0");
		applyJobService.saveRecommendation(recommendationDto, isApplyJob);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshApplyJobPage();
		return "saveAddRecommendation";
	}

	@SuppressWarnings("unchecked")
	public String toEditRecommendation() {
		if (memcachedClient == null) {
			memcachedClient = CacheManager.getInstanceMemcachedClient();
		}
		request = ServletActionContext.getRequest();
		provinceList = (List<ProvinceDto>) memcachedClient.get("provinceList");
		functionList = (List<ClassMasterDto>) memcachedClient
				.get("competencyList");
		salaryList = (List<ClassMasterDto>) memcachedClient.get("salaryList");
		jobTypeList = (List<ClassMasterDto>) memcachedClient
				.get("jobNatureList");
		Long recommendationId = Long.parseLong(request
				.getParameter("recommendationId"));
		
		recommendationVo = applyJobService
				.getRecommendationById(recommendationId);
		
		if (recommendationVo == null) {
			return "accessDenied";
		}
		
		recommendationDto = recommendationVo.convertToDto();
		
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		if (!recommendationDto.getUserId().equals(loginUserInfo.getId())) {
			return "accessDenied";
		}
		
		cityList = RegionDataUtil.queryCityListByProvinceCode(recommendationDto
				.getProvinceCode());
		areaList = RegionDataUtil.queryAreaListByCityCode(recommendationDto
				.getCityCode());
		return "toEditRecommendation";
	}

	public String saveEditRecommendation() {
		recommendationDto.setLastEditDate(new Date());
		recommendationDto.setVerifyStatus("0");
		applyJobService.updateRecommendation(recommendationDto);
		return "saveEditRecommendation";
	}

	public String deleteRecommendation() {
		request = ServletActionContext.getRequest();
		Long recommendationId = Long.parseLong(request
				.getParameter("recommendationId"));
		applyJobService.deleteRecommendation(recommendationId);
		return viewApplyRecommendation();
	}

	/**
	 * 进入修改求职意向页面
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String toEditApplyJobInfo() {
		request = ServletActionContext.getRequest();
		provinceList = (List<ProvinceDto>) CacheManager
				.getInstanceMemcachedClient().get("provinceList");
		functionList = EssentialDataUtil
				.queryEssentialDataListByParentCode(ApplicationConstant.COMPETENCY);
		salaryList = EssentialDataUtil
				.queryEssentialDataListByParentCode(ApplicationConstant.SALARY);
		jobTypeList = EssentialDataUtil
				.queryEssentialDataListByParentCode(ApplicationConstant.JOB_NATURE);
		Long applyJobInfoId = 0L;
		if (applyJobInfoDto != null)
			applyJobInfoId = applyJobInfoDto.getId();
		else
			applyJobInfoId = Long.parseLong(request
					.getParameter("applyJobInfoId"));
		
		applyJobInfoVo = applyJobService.getApplyJobInfoById(applyJobInfoId);
		
		if (applyJobInfoVo == null) {
			return "accessDenied";
		}
		
		applyJobInfoDto = applyJobInfoVo.convertToDto();
		
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		if (!applyJobInfoDto.getUserId().equals(loginUserInfo.getId())) {
			return "accessDenied";
		}
		
		cityList = RegionDataUtil.queryCityListByProvinceCode(applyJobInfoDto
				.getProvinceCode());
		areaList = RegionDataUtil.queryAreaListByCityCode(applyJobInfoDto
				.getCityCode());
		return "toEditApplyJobInfo";
	}

	public String saveEditApplyJobInfo() {
		applyJobInfoDto.setLastEditDate(new Date());
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		applyJobInfoDto.setUserId(userId);

		int size = applyJobService
				.queryDuplicatedIntentionCount(applyJobInfoDto);
		if (size > 1) {
			actionMessage = "求职意向重复，请重新输入求职信息！";
			return toEditApplyJobInfo();
		}
		if (size == 1) {
			long id = applyJobService.queryDuplicatedIntentionIdList(
					applyJobInfoDto).get(0);
			if (id != applyJobInfoDto.getId()) {
				actionMessage = "求职意向重复，请重新输入求职信息！";
				return toEditApplyJobInfo();
			}
		}

		applyJobService.updateApplyJobInfo(applyJobInfoDto);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshApplyJobPage();

		return "saveEditApplyJobInfo";
	}

	/**
	 * myAppliedJobs 个人用户查看已申请的职位信息
	 */
	public String myAppliedJobs() {
		// 从session中获取登录用户id，查询出此用户已申请的职位信息
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", this.getLoginUserInfo().getId());
		paramMap.put("jobName", jobName);
		paramMap.put("companyName", companyName);
		paramMap.put("jobStatus", status);
		paramMap.put("currentDate", new Date());

		myAppliedJobList = jobInfoService.queryAppliedJobRecordListByUserId(
				paramMap, pageInfo);
		jobStatus = new TreeMap<String, String>();
		jobStatus.put("", ApplicationConstant.WHOLE);
		jobStatus.put("1", ApplicationConstant.NORMAL);
		jobStatus.put("2", ApplicationConstant.EXPIRED);
		jobStatus.put("0", ApplicationConstant.STATUS_SUSPEND);
		return "myAppliedJobs";
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
	 * 获取职位详细信息（单个职位）
	 * 
	 * @return
	 */
	public String lookJobInfoDetail() {
		request = ServletActionContext.getRequest();
		String jobId = request.getParameter("jobId");
		jobInfo = jobInfoService.getJobInfo(Long.parseLong(jobId), null);
		return "lookJobInfoDetail";
	}

	/**
	 * 已申请的职位信息查看
	 */
	public String myAppliedJobInfoDetail(){
		request = ServletActionContext.getRequest();
		String jobId = request.getParameter("jobId");
		jobInfo = jobInfoService.getJobInfo(Long.parseLong(jobId), null);
		return "myAppliedJobInfoDetail";
	}
	
	/**
	 * 删除用户已申请的职位
	 */
	@SuppressWarnings("unchecked")
	public String deleteMyJob() {
		List<String> myJobList = Arrays.asList(myJobs);
		jobInfoService.deleteUserAppliedJobByJobId(myJobList);
		return "deleteMyJob";
	}

	/**
	 * @return the applyJobInfoList
	 */
	public List<ApplyJobInfoVo> getApplyJobInfoList() {
		return applyJobInfoList;
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
	 * @return the applyJobInfoDto
	 */
	public ApplyJobInfoDto getApplyJobInfoDto() {
		return applyJobInfoDto;
	}

	/**
	 * @param applyJobInfoDto
	 *            the applyJobInfoDto to set
	 */
	public void setApplyJobInfoDto(ApplyJobInfoDto applyJobInfoDto) {
		this.applyJobInfoDto = applyJobInfoDto;
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
	 * @return the applyJobInfoCheckBox
	 */
	public String[] getApplyJobInfoCheckBox() {
		return applyJobInfoCheckBox;
	}

	/**
	 * @param applyJobInfoCheckBox
	 *            the applyJobInfoCheckBox to set
	 */
	public void setApplyJobInfoCheckBox(String[] applyJobInfoCheckBox) {
		this.applyJobInfoCheckBox = applyJobInfoCheckBox;
	}

	/**
	 * @return the functionList
	 */
	public List<ClassMasterDto> getFunctionList() {
		return functionList;
	}

	/**
	 * @return the salaryList
	 */
	public List<ClassMasterDto> getSalaryList() {
		return salaryList;
	}

	/**
	 * @return the jobTypeList
	 */
	public List<ClassMasterDto> getJobTypeList() {
		return jobTypeList;
	}

	/**
	 * @return the applyJobInfoVo
	 */
	public ApplyJobInfoVo getApplyJobInfoVo() {
		return applyJobInfoVo;
	}

	/**
	 * @param applyJobInfoVo
	 *            the applyJobInfoVo to set
	 */
	public void setApplyJobInfoVo(ApplyJobInfoVo applyJobInfoVo) {
		this.applyJobInfoVo = applyJobInfoVo;
	}

	public void setJobInfoService(IJobInfoService jobInfoService) {
		this.jobInfoService = jobInfoService;
	}

	public IJobInfoService getJobInfoService() {
		return jobInfoService;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobName() {
		return jobName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public Map<String, String> getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(Map<String, String> jobStatus) {
		this.jobStatus = jobStatus;
	}

	public List<ApplicationJobRecordDto> getMyAppliedJobList() {
		return myAppliedJobList;
	}

	public void setMyAppliedJobList(
			List<ApplicationJobRecordDto> myAppliedJobList) {
		this.myAppliedJobList = myAppliedJobList;
	}

	public void setJobInfo(JobInfoDto jobInfo) {
		this.jobInfo = jobInfo;
	}

	public JobInfoDto getJobInfo() {
		return jobInfo;
	}

	public void setMyJobs(String[] myJobs) {
		this.myJobs = myJobs;
	}

	public String[] getMyJobs() {
		return myJobs;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

	/**
	 * @return the recommendationDto
	 */
	public RecommendationDto getRecommendationDto() {
		return recommendationDto;
	}

	/**
	 * @param recommendationDto
	 *            the recommendationDto to set
	 */
	public void setRecommendationDto(RecommendationDto recommendationDto) {
		this.recommendationDto = recommendationDto;
	}

	/**
	 * @return the recommendationVo
	 */
	public RecommendationVo getRecommendationVo() {
		return recommendationVo;
	}

	/**
	 * @param recommendationVo
	 *            the recommendationVo to set
	 */
	public void setRecommendationVo(RecommendationVo recommendationVo) {
		this.recommendationVo = recommendationVo;
	}

	/**
	 * @return the recommendationList
	 */
	public List<RecommendationVo> getRecommendationList() {
		return recommendationList;
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

	public void setNewJobs(int newJobs) {
		this.newJobs = newJobs;
	}

	public int getNewJobs() {
		return newJobs;
	}

	public void setNewJobList(List<JobInfoDto> newJobList) {
		this.newJobList = newJobList;
	}

	public List<JobInfoDto> getNewJobList() {
		return newJobList;
	}

	public void setJobSearchVo(JobSearchVo jobSearchVo) {
		this.jobSearchVo = jobSearchVo;
	}

	public JobSearchVo getJobSearchVo() {
		return jobSearchVo;
	}

	public void setCertificateService(ICertificateService certificateService) {
		this.certificateService = certificateService;
	}

	public ICertificateService getCertificateService() {
		return certificateService;
	}

	public void setTodayCertNeeds(int todayCertNeeds) {
		this.todayCertNeeds = todayCertNeeds;
	}

	public int getTodayCertNeeds() {
		return todayCertNeeds;
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

	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

	public String getIsApplyJob() {
		return isApplyJob;
	}

	public void setIsApplyJob(String isApplyJob) {
		this.isApplyJob = isApplyJob;
	}

	public String getIsApplyRecommendation() {
		return isApplyRecommendation;
	}

	public void setIsApplyRecommendation(String isApplyRecommendation) {
		this.isApplyRecommendation = isApplyRecommendation;
	}

	public int getNotSeeInvite() {
		return notSeeInvite;
	}

	public void setNotSeeInvite(int notSeeInvite) {
		this.notSeeInvite = notSeeInvite;
	}
	
}
