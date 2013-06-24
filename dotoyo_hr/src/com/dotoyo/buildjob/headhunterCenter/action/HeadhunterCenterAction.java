package com.dotoyo.buildjob.headhunterCenter.action;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.danga.MemCached.MemCachedClient;
import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.HotCityDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.CacheManager;
import com.dotoyo.buildjob.common.util.DateUtil;
import com.dotoyo.buildjob.common.util.EssentialDataUtil;
import com.dotoyo.buildjob.common.util.RegionDataUtil;
import com.dotoyo.buildjob.headhunterCenter.dto.ApplicationJobRecordDto;
import com.dotoyo.buildjob.headhunterCenter.dto.JobInfoDto;
import com.dotoyo.buildjob.headhunterCenter.service.IJobInfoService;
import com.dotoyo.buildjob.headhunterCenter.vo.JobSearchVo;
import com.dotoyo.buildjob.sys.dto.SysAdDto;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.dotoyo.buildjob.sys.service.ISysAdService;
import com.dotoyo.buildjob.sys.service.ISysOrderService;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-21
 * @description
 */
public class HeadhunterCenterAction extends BuildJobAction {

	private static final long serialVersionUID = 1L;
	private IJobInfoService jobInfoService;
	private ISysOrderService sysOrderService;
	private com.dotoyo.buildjob.sys.service.ISysAdService sysAdService;

	private List<JobInfoDto> oneFullTimeWorksList;// 全职
	private List<JobInfoDto> oneAdviserWorksList;// 顾问
	private List<JobInfoDto> onePartTimeWorksList;// 兼职

	private List<JobInfoDto> twoFullTimeWorksList;// 全职
	private List<JobInfoDto> twoAdviserWorksList;// 顾问
	private List<JobInfoDto> twoPartTimeWorksList;// 兼职

	private List<JobInfoDto> threeFullTimeWorksList;// 全职
	private List<JobInfoDto> threeAdviserWorksList;// 顾问
	private List<JobInfoDto> threePartTimeWorksList;// 兼职

	private List<JobInfoDto> fourFullTimeWorksList;// 全职
	private List<JobInfoDto> fourAdviserWorksList;// 顾问
	private List<JobInfoDto> fourPartTimeWorksList;// 兼职
	private String hotCityCode;
	private String industryId;

	private List<JobInfoDto> recruitLtdJobList;
	private JobInfoDto jobInfo;
	private ApplicationJobRecordDto appliedJobRecord;
	private String tabData;

	private JobSearchVo jobSearchVo;
	private List<JobInfoDto> jobResultList;
	private List<JobInfoDto> hotCityJobList;

	HttpServletRequest request;
	private List<JobInfoDto> moreCompetencyJobList;

	private String jobAppliedStatus;// 职位申请 状态
	private String linkBoStationStatus;// 链接博站状态
	private PageInfo pageInfo;
	private String[] jobCheckBoxed;
	private String orderBy;// 排列条件
	private String actionMessage;// 用户服务验证返回消息

	private List<ClassMasterDto> engineeringConsultantsList;
	private List<ClassMasterDto> specialConstructionWorksList;
	private List<ClassMasterDto> externalServiceProjectList;
	private List<ClassMasterDto> engineeringResearchList;
	private String showAbstract;// 是否显示摘要
	private static Logger logger = Logger.getLogger(HeadhunterCenterAction.class);

	@SuppressWarnings("unchecked")
	public HeadhunterCenterAction() {
		MemCachedClient memcachedClient = CacheManager
				.getInstanceMemcachedClient();
		industrysList = (List<ClassMasterDto>) memcachedClient
				.get("industrysList");
		competencyList = (List<ClassMasterDto>) memcachedClient
				.get("competencyList");
		provinceList = (List<ProvinceDto>) memcachedClient.get("provinceList");
		specializedTypeList = (List<ClassMasterDto>) memcachedClient
				.get("specializedTypeList");
		;
		jobNatureList = (List<ClassMasterDto>) memcachedClient
				.get("jobNatureList");
		;
		salaryList = (List<ClassMasterDto>) memcachedClient.get("salaryList");
		workingLifeList = (List<ClassMasterDto>) memcachedClient
				.get("workingLifeList");
		educationList = (List<ClassMasterDto>) memcachedClient
				.get("educationList");
		langCapaList = (List<ClassMasterDto>) memcachedClient
				.get("langCapaList");
		masteryList = (List<ClassMasterDto>) memcachedClient.get("masteryList");
		computerGradeList = (List<ClassMasterDto>) memcachedClient
				.get("computerGradeList");
	}

	public String initIndex() {
		return "init";
	}

	/**
	 * 猎头中心首页初始化
	 */
	@SuppressWarnings("unchecked")
	public String init() {
		MemCachedClient memcachedClient = CacheManager
				.getInstanceMemcachedClient();
		hotCityList = (List<HotCityDto>) CacheManager
				.getInstanceMemcachedClient().get("hotCityList");
		loadCompetencyJobs();
		engineeringConsultantsList = (List<ClassMasterDto>) memcachedClient
				.get("engineeringConsultantsList");
		specialConstructionWorksList = (List<ClassMasterDto>) memcachedClient
				.get("specialConstructionWorksList");
		externalServiceProjectList = (List<ClassMasterDto>) memcachedClient
				.get("externalServiceProjectList");
		engineeringResearchList = (List<ClassMasterDto>) memcachedClient
				.get("engineeringResearchList");
		// 页面广告加载
		// loadingAds();
		addNoLimitedToList();
		return "init";
	}

	/**
	 * 页面广告加载
	 */
	public void loadingAds() {
		SysAdDto sysad = new SysAdDto();
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_HUNTHEAD_001);
		sysad.setLimitNumber(ApplicationConstant.NUMBER_OF_AD_IMPRESSIONS_ONE);
		sysad.setCurrentDate(null);
		sysad.setType(ApplicationConstant.AD_TYPE_IMAGE_AND_FLASH);
		List<SysAdDto> list = getSysAdService().queryAdForList(sysad);
		for(SysAdDto ad:list ){
			replaceImg(ad);
		}
		setImageAdList(list);

		// 文字广告
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_HUNTHEAD_001);
		sysad.setType(ApplicationConstant.AD_TYPE_TEXT);
		sysad.setLimitNumber(ApplicationConstant.NUMBER_OF_AD_IMPRESSIONS_TWO);
		sysad.setCurrentDate(new Date());
		setTextAdList(sysAdService.queryAdForList(sysad));
	}
	private String dateFormatStr="yyyy-MM-dd HH:mm:ss";
	private void replaceImg(SysAdDto ad){
		try {
			Date startDate = DateUtil.parseToDate(ad.getStartDate(),dateFormatStr);
			Date endDate = DateUtil.parseToDate(ad.getEndDate(),dateFormatStr);
			Date currentDate = DateUtil.parseToDate(new Date(),dateFormatStr);
			if(currentDate.before(startDate) || currentDate.after(endDate)){
				ad.setImgName(ApplicationConstant.DOTOYO_DEFAULT_IMG005);
				ad.setTitle(ApplicationConstant.DOTOYO_DEFAULT_TITLE);
				ad.setUrl(ApplicationConstant.DOTOYO_DEFAULT_URL);
			}
		} catch (ParseException e) {
		}
		
	}
	/**
	 * 加载职能分类职位信息（全职）
	 */
	private void loadCompetencyJobs() {
		oneFullTimeWorksList = jobInfoService.queryCompetencyJobs(
				ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_BUILDER,
				ApplicationConstant.FULL_TIME_WORK, null,
				ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT);
		oneAdviserWorksList = jobInfoService.queryCompetencyJobs(
				ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_BUILDER, null,
				"1", ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT);
		setOnePartTimeWorksList(jobInfoService.queryCompetencyJobs(
				ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_BUILDER,
				ApplicationConstant.PART_TIME_WORK, null,
				ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT));

		setTwoFullTimeWorksList(jobInfoService.queryCompetencyJobs(
				ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_DATA_PROCESSOR,
				ApplicationConstant.FULL_TIME_WORK, null,
				ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT));
		setTwoAdviserWorksList(jobInfoService.queryCompetencyJobs(
				ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_DATA_PROCESSOR,
				null, "1", ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT));
		setTwoPartTimeWorksList(jobInfoService.queryCompetencyJobs(
				ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_DATA_PROCESSOR,
				ApplicationConstant.PART_TIME_WORK, null,
				ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT));

		setThreeFullTimeWorksList(jobInfoService.queryCompetencyJobs(
				ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_MATERIALMAN,
				ApplicationConstant.FULL_TIME_WORK, null,
				ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT));
		setThreeAdviserWorksList(jobInfoService.queryCompetencyJobs(
				ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_MATERIALMAN, null,
				"1", ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT));
		setThreePartTimeWorksList(jobInfoService.queryCompetencyJobs(
				ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_MATERIALMAN,
				ApplicationConstant.PART_TIME_WORK, null,
				ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT));

		setFourFullTimeWorksList(jobInfoService.queryCompetencyJobs(
				ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_SAFETY_MAN,
				ApplicationConstant.FULL_TIME_WORK, null,
				ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT));
		setFourAdviserWorksList(jobInfoService.queryCompetencyJobs(
				ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_SAFETY_MAN, null,
				"1", ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT));
		setFourPartTimeWorksList(jobInfoService.queryCompetencyJobs(
				ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_SAFETY_MAN,
				ApplicationConstant.PART_TIME_WORK, null,
				ApplicationConstant.WATER_SUPERVISION_DISPLAY_COUNT));
	}

	/**
	 * 点击发布职位
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String publishedPosts() {
		ageList = (List<ClassMasterDto>) CacheManager.getInstanceMemcachedClient().get("ageList");
		String userType = this.getLoginUserInfo().getUserType();
		if (ApplicationConstant.USER_TYPE_PERSONAL.equalsIgnoreCase(userType)) {	// 判断用户是否是企业用户
			actionMessage = ApplicationConstant.USERTYPE_ERROR_PERSONAL;
			return "closeWindow";
		}else if (userType == null || "".equalsIgnoreCase(userType)) {// 判断用户博站资料是否完善
			actionMessage = ApplicationConstant.FUNCTION_LIMITED;
			return "closeWindow";
		}

		SysOrderDto dto = new SysOrderDto();
		dto.setService1Remains(new Long(1));
		LoginUserInfoDto userInfo = getLoginUserInfo();
		if(sysOrderService.getAvailableServiceTimes(dto, userInfo,ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE,ApplicationConstant.SERVICE_1_REMAINS)==0){
			actionMessage = ApplicationConstant.SERVICE_ERROR_MESSAGE;
			return "closeWindow";
		}
		return "publishedPosts";
	}

	/**
	 * 搜索(职位、企业、高级)
	 */
	public String searchJob() {
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);
		if (null == jobSearchVo) {
			jobSearchVo = new JobSearchVo();
			jobSearchVo.setOrderBy("orderByJobIssuetDate");// 默认按用户资料更改时间降序
		} else if (null == jobSearchVo.getOrderBy()
				|| jobSearchVo.getOrderBy().equals("")) {
			jobSearchVo.setOrderBy("orderByJobIssuetDate");// 默认按用户资料更改时间降序
		}
		jobResultList = jobInfoService.searchJobForList(jobSearchVo, pageInfo);
		addNoLimitedToList();
		return "searchJobResult";
	}

	/**
	 * 首页职位搜索
	 */
	public String homePageJobSearch() {
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);
		if (null == jobSearchVo) {
			jobSearchVo = new JobSearchVo();
			jobSearchVo.setOrderBy("orderByJobIssuetDate");// 默认按用户资料更改时间降序
		} else if (null == jobSearchVo.getOrderBy()
				|| jobSearchVo.getOrderBy().equals("")) {
			jobSearchVo.setOrderBy("orderByJobIssuetDate");// 默认按用户资料更改时间降序
		}
		jobResultList = jobInfoService.queryJobListFromHomePage(jobSearchVo,
				pageInfo);
		addNoLimitedToList();
		return "homePageJobSearchResult";
	}

	/**
	 * 职位发布
	 *
	 * @return
	 */
	public String releaseJob() {
		// 新增职位信息
		jobInfo.setUserId(getLoginUserInfo().getId());
		if (DateUtil.dateComparison(new Date(), jobInfo.getJobIssuetDate())
				.equals(ApplicationConstant.DATE_COMPARISON_STATUS_SAME)) {
			jobInfo.setStatus(ApplicationConstant.PUBLISHING);
		} else {
			jobInfo.setStatus(ApplicationConstant.SUSPEND);
		}
		jobInfo.setLastUpdateTime(new Date());

		SysOrderDto dto = new SysOrderDto();
		dto.setService1Remains(new Long(1));
		LoginUserInfoDto userInfo = getLoginUserInfo();
		if (sysOrderService.verifyAuthority(dto, userInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE,
				ApplicationConstant.SERVICE_1_REMAINS, 1)) {
			if (jobInfoService.addJobInfo(jobInfo) != 0) {
				HtmlGeneration.getInstance().refreshHeadhunterCenterPage();
				return "releaseSuccess";
			}
		} else {
			actionMessage = ApplicationConstant.SERVICE_ERROR_MESSAGE;
			return "closeWindow";
		}
		return "releaseSuccess";
	}

	/**
	 * 获取行业职位信息（行业分类）
	 */
	public String queryIndustryJob() {
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		if (orderBy == null) {
			orderBy = "orderByJobIssuetDate";
		}
		this.pageInfo
				.setPageSize(ApplicationConstant.NUMBER_OF_EXCAVATE_TALENT_SHOW);
		jobResultList = jobInfoService.queryJobListByIndustryId(industryId,
				orderBy, pageInfo);
		addNoLimitedToList();
		if (jobSearchVo == null) {
			jobSearchVo = new JobSearchVo();
		}
		jobSearchVo.setIndustryType(industryId);
		String industryName = EssentialDataUtil.getEssentialDataBycode(
				industryId).getName();

		jobSearchVo.setIndustryName(industryName);
		return "industryJobList";
	}

	/**
	 * 获取热点城市职位信息
	 */
	public String queryHotCityJobs() {
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		if (orderBy == null) {
			orderBy = "orderByJobIssuetDate";
		}
		jobResultList = jobInfoService.queryHotCityJob(hotCityCode, orderBy,
				pageInfo);
		addNoLimitedToList();
		if (jobSearchVo == null) {
			jobSearchVo = new JobSearchVo();
		}
		String cityName = RegionDataUtil.getCityByCode(hotCityCode).getName();
		jobSearchVo.setCityCode(hotCityCode);
		jobSearchVo.setCityName(cityName);
		String provinceCode = RegionDataUtil.getCityByCode(hotCityCode)
				.getProvinceCode();
		String provinceName = RegionDataUtil.getProvinceByCode(provinceCode)
				.getName();
		jobSearchVo.setProvinceCode(provinceCode);
		jobSearchVo.setProvinceName(provinceName);

		return "hotCityJobList";
	}

	/**
	 * 职能分类（大类）更多职位信息
	 */
	public String getMoreCompetencyJobs() {
		request = ServletActionContext.getRequest();
		if (null != request.getParameter("competency")) {
			competencyMainType = request.getParameter("competency");
		}

		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(ApplicationConstant.SHOW_THE_NUMBER_OF_POSTS);

		if (null == orderBy || orderBy.equals("")) {
			orderBy = "orderByJobIssuetDate";// 默认按用户资料更改时间降序
		}
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("competency", competencyMainType);
		paraMap.put("currentDate", new Date());
		paraMap.put("orderBy", orderBy);
		jobResultList = jobInfoService.queryMoreCompetencyJobList(paraMap,
				pageInfo);
		addNoLimitedToList();
		if (jobSearchVo == null) {
			jobSearchVo = new JobSearchVo();
		}
		jobSearchVo.setCompetency(competencyMainType);
		String competencyName = EssentialDataUtil.getEssentialDataBycode(competencyMainType).getName();
		jobSearchVo.setCompetencyName(competencyName);


		return "competencyJobList";
	}

	public void addNoLimitedToList() {
		ClassMasterDto cm = new ClassMasterDto("",ApplicationConstant.NO_LIMITED);
		if(null!=industrysList){
			ClassMasterDto category = new ClassMasterDto();
			category.setCode("");
			category.setParentCode("001");
			category.setName("其他");
			industrysList.add(category);
			
			cm.setParentCode("");
			industrysList.add(cm);
		}
		if(null!=competencyList){
			competencyList.add(0, cm);
		}
		if(null!=provinceList){
			provinceList.add(0, new ProvinceDto("", ApplicationConstant.NO_LIMITED));
		}
		if(null!=specializedTypeList){
			ClassMasterDto category = new ClassMasterDto();
			category.setCode("");
			category.setParentCode("003");
			category.setName("其他");
			specializedTypeList.add(category);
			cm.setParentCode("");
			specializedTypeList.add(cm);
		}
		if(null!=jobNatureList){
			jobNatureList.add(0, cm);
		}
	}

	/**
	 * 获取职位详细信息(同时加载该职位发布企业)
	 *
	 * @return
	 */
	public String getJobInfoDetail() {
		request = ServletActionContext.getRequest();
		String jobId = request.getParameter("jobId");
		String userId = request.getParameter("userId");

		jobInfo = jobInfoService.getJobInfo(Long.parseLong(jobId),
				Long.parseLong(userId));
		// 增加职位点击次数
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("userId", userId);
		paramMap.put("jobId", jobId);
		jobInfoService.addJobClicks(paramMap);
		// 企业发布的其它职位
		recruitLtdJobList = jobInfoService.queryRecommentEnterpriseJobList(
				Long.parseLong(userId), Long.parseLong(jobId));
		return "jobInfoDetail";
	}

	/**
	 * 查看企业博站
	 *
	 * @return
	 */
	public String linkBoStation() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		LoginUserInfoDto userInfo = (LoginUserInfoDto) session.getAttribute(ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		if(userInfo==null){
			linkBoStationStatus=ApplicationConstant.COMMON_UNLOGON;
			return "linkBoStation";
		}else if (!userInfo.getUserType().equals(ApplicationConstant.USER_TYPE_PERSONAL)) {
			SysOrderDto dto = new SysOrderDto();
			dto.setService2Remains(new Long(2));
			if (sysOrderService.verifyAuthority(dto, userInfo,
					ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE,
					ApplicationConstant.SERVICE_2_REMAINS, 1)) {
				linkBoStationStatus = SUCCESS;
				return "linkBoStation";
			}
			linkBoStationStatus=ERROR;
		}
		return "linkBoStation";
	}

	public String appliedJob() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		LoginUserInfoDto userInfo = (LoginUserInfoDto) session.getAttribute(ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		if(userInfo==null){
			jobAppliedStatus=ApplicationConstant.COMMON_UNLOGON;
			return "appliedJob";
		}else if (userInfo.getUserType().equals(ApplicationConstant.USER_TYPE_ENTERPRISE)) {
			jobAppliedStatus=ApplicationConstant.COMMON_USER_TYPE_ERROR;
			return "appliedJob";
		}
		request = ServletActionContext.getRequest();
		String jobId = request.getParameter("jobId");
		String recruitLtdId = request.getParameter("userId");// 这里的用户ID是发布职位的公司的ID

		appliedJobRecord = new ApplicationJobRecordDto();
		appliedJobRecord.setUserId(userInfo.getId());
		appliedJobRecord.setJobId(Long.parseLong(jobId));
		appliedJobRecord.setRecruitLtdId(Long.parseLong(recruitLtdId));
		appliedJobRecord.setStatus(ApplicationConstant.NO_LOOK_OVER);

		jobInfoService.addAppliedJobRecord(appliedJobRecord);
		jobInfoService.addReceiptOfApplicationsForJobs(appliedJobRecord,
				userInfo);
		jobAppliedStatus=SUCCESS;
		return "appliedJob";
	}

	/**
	 * 快速批量申请
	 *
	 * @return
	 */
	public String fastBatchAppliedJob() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		LoginUserInfoDto userInfo = (LoginUserInfoDto) session.getAttribute(ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		if(userInfo==null){
			jobAppliedStatus=ApplicationConstant.COMMON_UNLOGON;
			return "fastBatchAppliedJob";
		}else if (userInfo.getUserType().equals(ApplicationConstant.USER_TYPE_ENTERPRISE)) {
			jobAppliedStatus=ApplicationConstant.COMMON_USER_TYPE_ERROR;
			return "fastBatchAppliedJob";
		}
		List<ApplicationJobRecordDto> applicationJobRecordList = new ArrayList<ApplicationJobRecordDto>();
		if (null != jobCheckBoxed && jobCheckBoxed.length > 0) {
			for (int i = 0; i < jobCheckBoxed.length; i++) {
				appliedJobRecord = new ApplicationJobRecordDto();
				appliedJobRecord.setUserId(userInfo.getId());
				String[] tArray = jobCheckBoxed[i].split("-");// 拆分出jobId,RecruitLtdId
				appliedJobRecord.setJobId(Long.parseLong(tArray[0]));
				appliedJobRecord.setRecruitLtdId(Long.parseLong(tArray[1]));
				appliedJobRecord.setStatus(ApplicationConstant.NO_LOOK_OVER);
				applicationJobRecordList.add(appliedJobRecord);
			}
		}

		jobInfoService.fastBatchAppliedJob(applicationJobRecordList);
		try{
			logger.info("##################快速批量申请职位开始##################");
			
			logger.info("applicationJobRecordList是否为空："+(applicationJobRecordList==null));
			if(applicationJobRecordList!=null){
				logger.info("applicationJobRecordList大小为："+applicationJobRecordList.size());
			}
			logger.info("userInfo是否为空："+(userInfo==null));
			if(userInfo!=null){
				logger.info("userId = "+userInfo.getId()+" userName = "+userInfo.getUserName());
			}
			jobInfoService.fastBatchReceiptOfApplicationsForJobs(applicationJobRecordList, userInfo);
			logger.info("##################快速批量申请职位成功##################");
		}catch(Exception e){
			logger.error("###############快速批量申请职位出现异常：##################"+e);
			String stackMessage = "";
			for(int i=0;i<e.getStackTrace().length;i++){
				stackMessage = stackMessage + e.getStackTrace()[i].toString()+"\n";
			}
			logger.error(stackMessage);
		}
		jobAppliedStatus=SUCCESS;
		return "fastBatchAppliedJob";
	}

	public String queryAppliedJobRecordList() {
		return null;
	}

	public void setJobInfoService(IJobInfoService jobInfoService) {
		this.jobInfoService = jobInfoService;
	}

	@JSON(serialize = false)
	public IJobInfoService getJobInfoService() {
		return jobInfoService;
	}

	public List<JobInfoDto> getOneFullTimeWorksList() {
		return oneFullTimeWorksList;
	}

	public void setTabData(String tabData) {
		this.tabData = tabData;
	}

	public String getTabData() {
		return tabData;
	}

	public void setJobInfo(JobInfoDto jobInfo) {
		this.jobInfo = jobInfo;
	}

	public JobInfoDto getJobInfo() {
		return jobInfo;
	}

	public void setAppliedJobRecord(ApplicationJobRecordDto appliedJobRecord) {
		this.appliedJobRecord = appliedJobRecord;
	}

	public ApplicationJobRecordDto getAppliedJobRecord() {
		return appliedJobRecord;
	}

	public void setRecruitLtdJobList(List<JobInfoDto> recruitLtdJobList) {
		this.recruitLtdJobList = recruitLtdJobList;
	}

	public List<JobInfoDto> getRecruitLtdJobList() {
		return recruitLtdJobList;
	}

	public void setOneAdviserWorksList(List<JobInfoDto> oneAdviserWorksList) {
		this.oneAdviserWorksList = oneAdviserWorksList;
	}

	public List<JobInfoDto> getOneAdviserWorksList() {
		return oneAdviserWorksList;
	}

	public void setOnePartTimeWorksList(List<JobInfoDto> onePartTimeWorksList) {
		this.onePartTimeWorksList = onePartTimeWorksList;
	}

	public List<JobInfoDto> getOnePartTimeWorksList() {
		return onePartTimeWorksList;
	}

	public void setTwoFullTimeWorksList(List<JobInfoDto> twoFullTimeWorksList) {
		this.twoFullTimeWorksList = twoFullTimeWorksList;
	}

	public List<JobInfoDto> getTwoFullTimeWorksList() {
		return twoFullTimeWorksList;
	}

	public void setTwoAdviserWorksList(List<JobInfoDto> twoAdviserWorksList) {
		this.twoAdviserWorksList = twoAdviserWorksList;
	}

	public List<JobInfoDto> getTwoAdviserWorksList() {
		return twoAdviserWorksList;
	}

	public void setTwoPartTimeWorksList(List<JobInfoDto> twoPartTimeWorksList) {
		this.twoPartTimeWorksList = twoPartTimeWorksList;
	}

	public List<JobInfoDto> getTwoPartTimeWorksList() {
		return twoPartTimeWorksList;
	}

	public void setThreeFullTimeWorksList(
			List<JobInfoDto> threeFullTimeWorksList) {
		this.threeFullTimeWorksList = threeFullTimeWorksList;
	}

	public List<JobInfoDto> getThreeFullTimeWorksList() {
		return threeFullTimeWorksList;
	}

	public void setThreeAdviserWorksList(List<JobInfoDto> threeAdviserWorksList) {
		this.threeAdviserWorksList = threeAdviserWorksList;
	}

	public List<JobInfoDto> getThreeAdviserWorksList() {
		return threeAdviserWorksList;
	}

	public void setThreePartTimeWorksList(
			List<JobInfoDto> threePartTimeWorksList) {
		this.threePartTimeWorksList = threePartTimeWorksList;
	}

	public List<JobInfoDto> getThreePartTimeWorksList() {
		return threePartTimeWorksList;
	}

	public void setFourFullTimeWorksList(List<JobInfoDto> fourFullTimeWorksList) {
		this.fourFullTimeWorksList = fourFullTimeWorksList;
	}

	public List<JobInfoDto> getFourFullTimeWorksList() {
		return fourFullTimeWorksList;
	}

	public void setFourAdviserWorksList(List<JobInfoDto> fourAdviserWorksList) {
		this.fourAdviserWorksList = fourAdviserWorksList;
	}

	public List<JobInfoDto> getFourAdviserWorksList() {
		return fourAdviserWorksList;
	}

	public void setFourPartTimeWorksList(List<JobInfoDto> fourPartTimeWorksList) {
		this.fourPartTimeWorksList = fourPartTimeWorksList;
	}

	public List<JobInfoDto> getFourPartTimeWorksList() {
		return fourPartTimeWorksList;
	}

	public void setJobSearchVo(JobSearchVo jobSearchVo) {
		this.jobSearchVo = jobSearchVo;
	}

	public JobSearchVo getJobSearchVo() {
		return jobSearchVo;
	}

	public void setJobResultList(List<JobInfoDto> jobResultList) {
		this.jobResultList = jobResultList;
	}

	public List<JobInfoDto> getJobResultList() {
		return jobResultList;
	}

	public void setOneFullTimeWorksList(List<JobInfoDto> oneFullTimeWorksList) {
		this.oneFullTimeWorksList = oneFullTimeWorksList;
	}

	public void setHotCityJobList(List<JobInfoDto> hotCityJobList) {
		this.hotCityJobList = hotCityJobList;
	}

	public List<JobInfoDto> getHotCityJobList() {
		return hotCityJobList;
	}

	public void setMoreCompetencyJobList(List<JobInfoDto> moreCompetencyJobList) {
		this.moreCompetencyJobList = moreCompetencyJobList;
	}

	public List<JobInfoDto> getMoreCompetencyJobList() {
		return moreCompetencyJobList;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public String[] getJobCheckBoxed() {
		return jobCheckBoxed;
	}

	public void setJobCheckBoxed(String[] jobCheckBoxed) {
		this.jobCheckBoxed = jobCheckBoxed;
	}

	public void setEngineeringConsultantsList(
			List<ClassMasterDto> engineeringConsultantsList) {
		this.engineeringConsultantsList = engineeringConsultantsList;
	}

	public List<ClassMasterDto> getEngineeringConsultantsList() {
		return engineeringConsultantsList;
	}

	public void setSpecialConstructionWorksList(
			List<ClassMasterDto> specialConstructionWorksList) {
		this.specialConstructionWorksList = specialConstructionWorksList;
	}

	public List<ClassMasterDto> getSpecialConstructionWorksList() {
		return specialConstructionWorksList;
	}

	public void setExternalServiceProjectList(
			List<ClassMasterDto> externalServiceProjectList) {
		this.externalServiceProjectList = externalServiceProjectList;
	}

	public List<ClassMasterDto> getExternalServiceProjectList() {
		return externalServiceProjectList;
	}

	public void setEngineeringResearchList(
			List<ClassMasterDto> engineeringResearchList) {
		this.engineeringResearchList = engineeringResearchList;
	}

	public List<ClassMasterDto> getEngineeringResearchList() {
		return engineeringResearchList;
	}

	public void setHotCityCode(String hotCityCode) {
		this.hotCityCode = hotCityCode;
	}

	public String getHotCityCode() {
		return hotCityCode;
	}

	public void setIndustryId(String industryId) {
		this.industryId = industryId;
	}

	public String getIndustryId() {
		return industryId;
	}

	public void setSysAdService(
			com.dotoyo.buildjob.sys.service.ISysAdService sysAdService) {
		this.sysAdService = sysAdService;
	}

	public ISysAdService getSysAdService() {
		return sysAdService;
	}

	public void setSysOrderService(ISysOrderService sysOrderService) {
		this.sysOrderService = sysOrderService;
	}

	public ISysOrderService getSysOrderService() {
		return sysOrderService;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setJobAppliedStatus(String jobAppliedStatus) {
		this.jobAppliedStatus = jobAppliedStatus;
	}

	public String getJobAppliedStatus() {
		return jobAppliedStatus;
	}

	public void setLinkBoStationStatus(String linkBoStationStatus) {
		this.linkBoStationStatus = linkBoStationStatus;
	}

	public String getLinkBoStationStatus() {
		return linkBoStationStatus;
	}

	public String getShowAbstract() {
		return showAbstract;
	}

	public void setShowAbstract(String showAbstract) {
		this.showAbstract = showAbstract;
	}
	
}
