package com.dotoyo.buildjob.applyJobCenter.action;

import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.dotoyo.buildjob.applyJobCenter.dto.ApplyJobInfoDto;
import com.dotoyo.buildjob.applyJobCenter.dto.RecommendationDto;
import com.dotoyo.buildjob.applyJobCenter.service.IApplyJobService;
import com.dotoyo.buildjob.applyJobCenter.vo.ApplyJobInfoVo;
import com.dotoyo.buildjob.applyJobCenter.vo.RecommendationVo;
import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.HotCityDto;
import com.dotoyo.buildjob.common.dto.InterviewNoticeDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.CacheManager;
import com.dotoyo.buildjob.common.util.RegionDataUtil;
import com.dotoyo.buildjob.peopleExcavate.service.IPeopleExcavateService;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2010-12-2
 * @description
 */
public class ApplyJobAction extends BuildJobAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4062805439679219246L;
	private IApplyJobService applyJobService;

	private String functionName;// 职能
	private String provinceName;// 工作省份
	private String cityCode;// 工作城市编码
	private String cityName;// 工作城市
	private String areaName;// 工作地区
	private String expectedSalary;// 期望薪水
	private String jobType;// 工作类型
	private List<ApplyJobInfoVo> applyJobInfoList;// 求职信息列表
	private List<ApplyJobInfoVo> advisorList;// 顾问列表
	private List<ApplyJobInfoVo> fullTimeList;// 全职列表
	private List<ApplyJobInfoVo> partTimeList;// 兼职列表
	private List<ClassMasterDto> salaryList;// 月薪列表
	private List<ClassMasterDto> jobTypeList;// 工作类型列表
	private List<ClassMasterDto> competencyList;// 职能列表
	private String isApplyRecommendation;// 是否同时申请成为线下推荐对象
	private String isApplyJob;// 是否同时发布线上求职信息
	private ApplyJobInfoDto applyJobInfoDto;
	private RecommendationDto recommendationDto;
	private PageInfo pageInfo;
	private String sendInterviewNoticeStatus;
	private String actionMessage;
	private IPeopleExcavateService peopleExcavateService;
	private int countOFEnterprise;
	private String jobId;

	@SuppressWarnings("unchecked")
	public String init() {
		loadAdrisorList(ApplicationConstant.APPLYJOBCTR_LIST_MAX_RESULT);
		loadFullTimeJobseekerList(ApplicationConstant.APPLYJOBCTR_LIST_MAX_RESULT);
		loadPartTimeJobseekerList(ApplicationConstant.APPLYJOBCTR_LIST_MAX_RESULT);

		// BUG 1546：有时hotCityList为空
		hotCityList = (List<HotCityDto>) CacheManager
				.getInstanceMemcachedClient().get("hotCityList");

		// fix bug.如果列表为空，重新加载hotCityList并写入memcache
		if (hotCityList == null || hotCityList.isEmpty()) {
			hotCityList = RegionDataUtil.queryHotCityList();
			CacheManager.getInstanceMemcachedClient().set("hotCityList",
					hotCityList);
		}
		return "init";
	}

	/**
	 * 人才中心首页初始化
	 * 
	 * @return
	 */
	public String initIndex() {
		countOFEnterprise = peopleExcavateService.getCountOFEnterprise();
		return "init";
	}

	/**
	 * 判断当前登陆用户是否为个人用户
	 * 
	 * @return
	 */
	private boolean verifyPersonalUser() {
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		String userType = loginUserInfo.getUserType();

		// 如果用户类型为空，返回错误
		if (userType == null || "".equalsIgnoreCase(userType)) {
			actionMessage = ApplicationConstant.FUNCTION_LIMITED;
			return false;
		}

		// 如果用户类型为企业用户，返回错误
		else {
			if (ApplicationConstant.USER_TYPE_ENTERPRISE
					.equalsIgnoreCase(userType)) {
				actionMessage = ApplicationConstant.USERTYPE_ERROR_ENTERPRISE;
				return false;
			}
		}
		return true;
	}

	/**
	 * 人才中心：进入求职页面
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String toApplyJob() {
		if (!verifyPersonalUser()) {
			return "closeWindow";
		}
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.APPLYJOBCTR_PAGE_SIZE);
		competencyList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("competencyList");
		provinceList = (List<ProvinceDto>) CacheManager
				.getInstanceMemcachedClient().get("provinceList");
		salaryList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("salaryList");
		jobTypeList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("jobNatureList");

		// 判断用户是否已经是线下推荐对象
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
		return "toApplyJob";
	}

	/**
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String toApplyRecommendation() {
		if (!verifyPersonalUser()) {
			return "closeWindow";
		}
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.APPLYJOBCTR_PAGE_SIZE);
		competencyList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("competencyList");
		provinceList = (List<ProvinceDto>) CacheManager
				.getInstanceMemcachedClient().get("provinceList");
		salaryList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("salaryList");
		jobTypeList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("jobNatureList");

		/*
		 * 获取用户ID
		 */
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		RecommendationDto recommendationDto = new RecommendationDto();
		recommendationDto.setUserId(userId);
		List<RecommendationVo> recommendationList = applyJobService
				.queryRecommendationList(pageInfo, recommendationDto);
		if (recommendationList != null && !recommendationList.isEmpty()) {
			request = ServletActionContext.getRequest();
			String scripts = "<script laguage='JavaScript'> alert('你已经是线下推荐对象！');window.opener=null;window.open('','_self');window.close(); </script>";
			request.setAttribute("failMessage", scripts);
		}

		return "toApplyRecommendation";
	}

	public String submitApplyJobInfo() {
		if (!verifyPersonalUser()) {
			return "closeWindow";
		}
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		applyJobInfoDto.setActStatus("A");
		applyJobInfoDto.setLastEditDate(new Date());
		applyJobInfoDto.setSubmitDate(new Date());
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
			return toApplyJob();
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
		applyJobService
				.saveApplyJobInfo(applyJobInfoDto, isApplyRecommendation);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshApplyJobPage();
		isApplyRecommendation = null;// 重置
		return "submitApplyJobInfo";
	}

	public String sendInterviewNotice() {
		LoginUserInfoDto userInfo = getLoginUserInfo();
		if (userInfo == null) {
			sendInterviewNoticeStatus = ApplicationConstant.COMMON_UNLOGON;
			return "sendInterviewNotice";
		} else {
			String userType = userInfo.getUserType();
			if (userType == null || "".equalsIgnoreCase(userType)) {
				sendInterviewNoticeStatus = "permissionDenied";
				return "sendInterviewNotice";
			} else {
				if (ApplicationConstant.USER_TYPE_PERSONAL
						.equalsIgnoreCase(userType)) {
					sendInterviewNoticeStatus = "userTypeError";
					return "sendInterviewNotice";
				}
			}
		}
		ApplyJobInfoVo applyJobInfoVo = applyJobService.getApplyJobInfoById(new Long(jobId));
		Long receiverId = new Long(applyJobInfoVo.getUserId());
		Long senderId = userInfo.getId();
		Date currentDate = new Date();
		InterviewNoticeDto interviewNoticeDto = new InterviewNoticeDto();
		interviewNoticeDto.setSenderId(senderId);
		interviewNoticeDto.setReceiverId(receiverId);
		interviewNoticeDto.setTitle(ApplicationConstant.INTERVIEW_NOTICE_TITLE);
		interviewNoticeDto
				.setMessage(ApplicationConstant.INTERVIEW_NOTICE_MESSAGE);
		interviewNoticeDto.setNoticeDate(currentDate);
		interviewNoticeDto.setStatus("0");
		interviewNoticeDto.setJobName(applyJobInfoVo.getExpectedPosition());
		if (applyJobService.saveInterviewNotice(interviewNoticeDto, userInfo))
			sendInterviewNoticeStatus = SUCCESS;
		else
			sendInterviewNoticeStatus = "serviceOutOfDate";
		return "sendInterviewNotice";
	}

	public String submitRecommendationInfo() {
		if (!verifyPersonalUser()) {
			return "closeWindow";
		}
		
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();

		//判断用户是否已经是线下推荐对象
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(10);
		RecommendationDto dto = new RecommendationDto();
		dto.setUserId(userId);
		List<RecommendationVo> recommendationList = applyJobService
				.queryRecommendationList(pageInfo, dto);
		if (recommendationList != null && !recommendationList.isEmpty()) {
			actionMessage = "你已经是线下推荐对象";
			return "closeWindow";
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
		recommendationDto.setLastEditDate(currentDate);
		recommendationDto.setRecommendationType("0");
		recommendationDto.setSubmitDate(currentDate);
		recommendationDto.setUserId(userId);
		recommendationDto.setVerifyStatus("0");
		recommendationDto.setInterviewStatus("0");
		applyJobService.saveRecommendation(recommendationDto, isApplyJob);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshApplyJobPage();
		isApplyJob = null;// 重置
		return "submitRecommendationInfo";
	}

	public String moreAdvisor() {
		countOFEnterprise = peopleExcavateService.getCountOFEnterprise();
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.APPLYJOBCTR_PAGE_SIZE);
		ApplyJobInfoDto applyJobInfoDto = new ApplyJobInfoDto();
		applyJobInfoDto.setIsAdvisor(ApplicationConstant.COMMON_Y_EN);
		applyJobInfoDto
				.setActStatus(ApplicationConstant.APPLYJOBCTR_ACTSTATUS_ACTIVE);
		advisorList = applyJobService.queryApplyJobInfoList(pageInfo,
				applyJobInfoDto);
		return "moreAdvisor";
	}

	public String moreFullTimeJobseeker() {
		countOFEnterprise = peopleExcavateService.getCountOFEnterprise();
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.APPLYJOBCTR_PAGE_SIZE);
		ApplyJobInfoDto applyJobInfoDto = new ApplyJobInfoDto();
		applyJobInfoDto.setJobTypeCode(ApplicationConstant.FULL_TIME_WORK);
		applyJobInfoDto
				.setActStatus(ApplicationConstant.APPLYJOBCTR_ACTSTATUS_ACTIVE);
		fullTimeList = applyJobService.queryApplyJobInfoList(pageInfo,
				applyJobInfoDto);
		return "moreFullTimeJobseeker";
	}

	public String morePartTimeJobseeker() {
		countOFEnterprise = peopleExcavateService.getCountOFEnterprise();
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.APPLYJOBCTR_PAGE_SIZE);
		ApplyJobInfoDto applyJobInfoDto = new ApplyJobInfoDto();
		applyJobInfoDto.setJobTypeCode(ApplicationConstant.PART_TIME_WORK);
		applyJobInfoDto
				.setActStatus(ApplicationConstant.APPLYJOBCTR_ACTSTATUS_ACTIVE);
		partTimeList = applyJobService.queryApplyJobInfoList(pageInfo,
				applyJobInfoDto);
		return "morePartTimeJobSeeker";
	}

	public String viewJobseeker4ParticularCity() {
		countOFEnterprise = peopleExcavateService.getCountOFEnterprise();
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.APPLYJOBCTR_PAGE_SIZE);
		request = ServletActionContext.getRequest();
		if (cityCode == null || cityCode == "") {
			cityCode = request.getParameter("cityCode");
		}
		cityName = RegionDataUtil.getCityByCode(cityCode).getName();
		ApplyJobInfoDto applyJobInfoDto = new ApplyJobInfoDto();
		applyJobInfoDto.setCityCode(cityCode);
		applyJobInfoDto
				.setActStatus(ApplicationConstant.APPLYJOBCTR_ACTSTATUS_ACTIVE);
		applyJobInfoList = applyJobService.queryApplyJobInfoList(pageInfo,
				applyJobInfoDto);
		return "viewJobseeker4ParticularCity";
	}

	/**
	 * 求职中心首页初始化时加载顾问列表
	 * 
	 * @param size
	 */
	private void loadAdrisorList(int size) {
		ApplyJobInfoDto advisorDto = new ApplyJobInfoDto();
		advisorDto.setIsAdvisor(ApplicationConstant.COMMON_Y_EN);
		advisorDto
				.setActStatus(ApplicationConstant.APPLYJOBCTR_ACTSTATUS_ACTIVE);
		advisorList = applyJobService.queryApplyJobInfoList(advisorDto,
				ApplicationConstant.APPLYJOBCTR_LIST_MAX_RESULT);
	}

	/**
	 * 求职中心首页初始化时加载全职列表
	 * 
	 * @param size
	 */
	private void loadFullTimeJobseekerList(int size) {
		ApplyJobInfoDto fullTimeDto = new ApplyJobInfoDto();
		fullTimeDto.setJobTypeCode(ApplicationConstant.FULL_TIME_WORK);
		fullTimeDto
				.setActStatus(ApplicationConstant.APPLYJOBCTR_ACTSTATUS_ACTIVE);
		fullTimeList = applyJobService.queryApplyJobInfoList(fullTimeDto, size);
	}

	/**
	 * 求职中心首页初始化时加载兼职列表
	 * 
	 * @param size
	 */
	private void loadPartTimeJobseekerList(int size) {
		ApplyJobInfoDto partTimeDto = new ApplyJobInfoDto();
		partTimeDto.setJobTypeCode(ApplicationConstant.PART_TIME_WORK);
		partTimeDto
				.setActStatus(ApplicationConstant.APPLYJOBCTR_ACTSTATUS_ACTIVE);
		partTimeList = applyJobService.queryApplyJobInfoList(partTimeDto, size);
	}

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getExpectedSalary() {
		return expectedSalary;
	}

	public void setExpectedSalary(String expectedSalary) {
		this.expectedSalary = expectedSalary;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	@JSON(serialize = false)
	public IApplyJobService getApplyJobService() {
		return applyJobService;
	}

	public void setApplyJobService(IApplyJobService applyJobService) {
		this.applyJobService = applyJobService;
	}

	public List<ApplyJobInfoVo> getAdvisorList() {
		return advisorList;
	}

	public List<ApplyJobInfoVo> getFullTimeList() {
		return fullTimeList;
	}

	public List<ApplyJobInfoVo> getPartTimeList() {
		return partTimeList;
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
	 * @return the isApplyRecommendation
	 */
	public String getIsApplyRecommendation() {
		return isApplyRecommendation;
	}

	/**
	 * @param isApplyRecommendation
	 *            the isApplyRecommendation to set
	 */
	public void setIsApplyRecommendation(String isApplyRecommendation) {
		this.isApplyRecommendation = isApplyRecommendation;
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
	 * @return the isApplyJob
	 */
	public String getIsApplyJob() {
		return isApplyJob;
	}

	/**
	 * @param isApplyJob
	 *            the isApplyJob to set
	 */
	public void setIsApplyJob(String isApplyJob) {
		this.isApplyJob = isApplyJob;
	}

	/**
	 * @return the competencyList
	 */
	public List<ClassMasterDto> getCompetencyList() {
		return competencyList;
	}

	/**
	 * @return the applyJobInfoList
	 */
	public List<ApplyJobInfoVo> getApplyJobInfoList() {
		return applyJobInfoList;
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
	 * @return the cityCode
	 */
	public String getCityCode() {
		return cityCode;
	}

	/**
	 * @param cityCode
	 *            the cityCode to set
	 */
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	/**
	 * @return the sendInterviewNoticeStatus
	 */
	public String getSendInterviewNoticeStatus() {
		return sendInterviewNoticeStatus;
	}

	/**
	 * @param sendInterviewNoticeStatus
	 *            the sendInterviewNoticeStatus to set
	 */
	public void setSendInterviewNoticeStatus(String sendInterviewNoticeStatus) {
		this.sendInterviewNoticeStatus = sendInterviewNoticeStatus;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

	public IPeopleExcavateService getPeopleExcavateService() {
		return peopleExcavateService;
	}

	public void setPeopleExcavateService(
			IPeopleExcavateService peopleExcavateService) {
		this.peopleExcavateService = peopleExcavateService;
	}

	public int getCountOFEnterprise() {
		return countOFEnterprise;
	}

	public void setCountOFEnterprise(int countOFEnterprise) {
		this.countOFEnterprise = countOFEnterprise;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	
}
