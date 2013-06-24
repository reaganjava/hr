package com.dotoyo.buildjob.homePage.action;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.dotoyo.buildjob.applyJobCenter.service.IApplyJobService;
import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.CityDto;
import com.dotoyo.buildjob.common.dto.CitySiteDto;
import com.dotoyo.buildjob.common.dto.HotCompetencysDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.common.util.CacheManager;
import com.dotoyo.buildjob.common.util.DateUtil;
import com.dotoyo.buildjob.common.util.EssentialDataUtil;
import com.dotoyo.buildjob.common.util.RegionDataUtil;
import com.dotoyo.buildjob.headhunterCenter.dto.JobInfoDto;
import com.dotoyo.buildjob.headhunterCenter.service.IJobInfoService;
import com.dotoyo.buildjob.headhunterCenter.vo.JobSearchVo;
import com.dotoyo.buildjob.sys.dto.SysAdDto;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

public class HomePageAction extends BuildJobAction {

	private static Logger logger = Logger.getLogger(HomePageAction.class);
	/**
	 *
	 */
	private static final long serialVersionUID = -3492161590654521357L;
	private List<ClassMasterDto> functionList;
	private IJobInfoService jobInfoService;
	private IApplyJobService applyJobService;
	private com.dotoyo.buildjob.sys.service.ISysAdService sysAdService;
	private JobSearchVo jobSearchVo;
	private int expireJobs;
	private int notSeeInvite;
	private String goFrom = "0";
	private List<JobInfoDto> hotCompetencyJobList;
	private List<CitySiteDto> citySiteList;
	private List<JobInfoDto> citySiteCompetencyJobList;
	private List<JobInfoDto> citySiteHotJobList;
	private PageInfo pageInfo;
	private List<JobInfoDto> citySiteHotJobResultList;
	private List<SysAdDto> citySiteHotEnterpriseList;
	private String errorMessage;// 错误信息
	private String fileServerURL;
	private String citySiteImagePath ;
	private SysAdDto topAd;
	private String showAbstract;//是否显示摘要
	
	private String securityCode;//修改密码时使用校验码
	private Md5PasswordEncoder passwordEncoder;

	@SuppressWarnings("unchecked")
	public String init() {
		request = ServletActionContext.getRequest();
		String errorMessageTemp = (String) request.getAttribute("errorMessage");
		if (errorMessageTemp != null && !"".equalsIgnoreCase(errorMessageTemp)) {
			errorMessage = errorMessageTemp;
		}
		if (this.goFrom.equalsIgnoreCase("1")) {
			errorMessage = "请先在这里登陆！";
		}
		if (getLoginUserInfo() == null) {
			return "success_init";
		}
		citySiteList = (List<CitySiteDto>) CacheManager.getInstanceMemcachedClient().get("citySiteList");
		provinceList = (List<ProvinceDto>) CacheManager.getInstanceMemcachedClient().get("provinceList");

		hotCompetencyList = (List<HotCompetencysDto>) CacheManager.getInstanceMemcachedClient().get("competencyList");
		competencyList = (List<ClassMasterDto>) CacheManager.getInstanceMemcachedClient().get("competencyList");
		if (null != this.getLoginUserInfo()) {
			String userType = this.getLoginUserInfo().getUserType();
			if (userType != null && !"".equalsIgnoreCase(userType)) {
				if (Integer.parseInt(this.getLoginUserInfo().getUserType()) == 0) {
					getCountOfNotSeeInvite();
				} else {
					getCountOfUserExpireJobs();
				}
			}
			securityCode=passwordEncoder.encodePassword(String.valueOf(this.getLoginUserInfo().getId()), "JZPT");
		}
		return SUCCESS;
	}

	/**
	 * 网站顶部图片
	 */
	public void topPic() {
		SysAdDto sysad = new SysAdDto();
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_HOMEPAGE_TOP);
		sysad.setType(ApplicationConstant.AD_TYPE_IMAGE);
		sysad.setLimitNumber(1);
		List<SysAdDto> list = getSysAdService().queryAdForList(sysad);
		if (null != list && list.size() > 0) {
			topAd = list.get(0);
		}
	}

	/**
	 * 未查看的面试通知数
	 */
	public void getCountOfNotSeeInvite() {
		notSeeInvite = applyJobService.getCountOfNotSeeInviteByUserId(this
				.getLoginUserInfo().getId());
	}

	/**
	 * 即将到期职位数字展示
	 *
	 * @return
	 */
	public void getCountOfUserExpireJobs() {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", this.getLoginUserInfo().getId());
		paramMap.put("status", ApplicationConstant.PUBLISHING);
		paramMap.put("currentDate", DateUtil.getCurrentDateString("yyyy-MM-dd"));
		expireJobs = getJobInfoService().getCountOfUserExpireJobs(paramMap);
	}

	/**
	 * 招聘地区（城市站点）企业、职位信息检索
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String citySiteJobs() {
		citySiteHotJobList = jobInfoService.queryCitySiteHotJobs(
				jobSearchVo.getCityCode(),
				ApplicationConstant.CITY_SITE_RELEASE_TIMES,
				ApplicationConstant.CITY_SITE_CLICKS,
				jobSearchVo.getCurrentDate());
		// 页面广告加载
		loadingAds();
		// 热门企业
		loadCitySiteHotEnterprises();
		ClassMasterDto cm = new ClassMasterDto("",
				ApplicationConstant.NO_LIMITED);
		citySiteList = (List<CitySiteDto>) CacheManager
				.getInstanceMemcachedClient().get("citySiteList");
		industrysList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("industrysList");
		
		ClassMasterDto industryType = new ClassMasterDto();
		industryType.setCode("");
		industryType.setParentCode("001");
		industryType.setName("其他");
		
		industrysList.add(industryType);
		industrysList.add(cm);
		competencyList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("competencyList");
		competencyList.add(0, cm);
		provinceList = (List<ProvinceDto>) CacheManager
				.getInstanceMemcachedClient().get("provinceList");
		provinceList
				.add(0, new ProvinceDto("", ApplicationConstant.NO_LIMITED));
		hotCompetencyList = (List<HotCompetencysDto>) CacheManager
				.getInstanceMemcachedClient().get("hotCompetencyList");
		citySiteImagePath = (String) CacheManager.getInstanceMemcachedClient().get("citySiteImagePath");
		
		CityDto cityDto = RegionDataUtil.getCityByCode(jobSearchVo.getCityCode());
		if (cityDto != null) {
			String cityName = cityDto.getName();
			jobSearchVo.setCityName(cityName);

			ProvinceDto provinceDto = RegionDataUtil.getProvinceByCode(cityDto
					.getProvinceCode());
			jobSearchVo.setProvinceCode(provinceDto.getCode());
			jobSearchVo.setProvinceName(provinceDto.getName());
		}
		return "citySiteJobs";
	}

	/**
	 * 页面广告加载
	 */
	public void loadingAds() {
		SysAdDto sysad = new SysAdDto();
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_HOMEPAGE_CITYPAGE_001);
		sysad.setLimitNumber(ApplicationConstant.NUMBER_OF_AD_IMPRESSIONS_ONE);
		sysad.setType(ApplicationConstant.AD_TYPE_IMAGE_AND_FLASH);
		sysad.setCity(jobSearchVo.getCityCode());
		sysad.setCurrentDate(null);
		List<SysAdDto> list = getSysAdService().queryAdForList(sysad);
		for(SysAdDto ad:list ){
			replaceImg(ad);
		}
		setImageAdList(list);
		
		
		// 文字广告
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_HOMEPAGE_CITYPAGE_001);
		sysad.setType(ApplicationConstant.AD_TYPE_TEXT);
		sysad.setLimitNumber(ApplicationConstant.NUMBER_OF_AD_IMPRESSIONS_TWO);
		sysad.setCity(jobSearchVo.getCityCode());
		sysad.setCurrentDate(new Date());
		setTextAdList(getSysAdService().queryAdForList(sysad));
		fileServerURL = (String) CacheManager.getInstanceMemcachedClient().get("fileServerURL");
	}
	private String dateFormatStr="yyyy-MM-dd HH:mm:ss";
	private void replaceImg(SysAdDto ad){
		try {
			Date startDate = DateUtil.parseToDate(ad.getStartDate(),dateFormatStr);
			Date endDate = DateUtil.parseToDate(ad.getEndDate(),dateFormatStr);
			Date currentDate = DateUtil.parseToDate(new Date(),dateFormatStr);
			if(currentDate.before(startDate) || currentDate.after(endDate)){
				ad.setImgName(ApplicationConstant.DOTOYO_DEFAULT_IMG006);
				ad.setTitle(ApplicationConstant.DOTOYO_DEFAULT_TITLE);
				ad.setUrl(ApplicationConstant.DOTOYO_DEFAULT_URL);
			}
		} catch (ParseException e) {
		}
		
	}
	/**
	 * 热门职能-职位检索
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String hotCompetencyJobs() {
		if (this.getPageInfo() == null) {
			this.setPageInfo(new PageInfo());
		}
		if (null == jobSearchVo) {
			jobSearchVo = new JobSearchVo();
			jobSearchVo.setOrderBy("orderByJobIssuetDate");// 默认按用户资料更改时间降序
		} else if (null == jobSearchVo.getOrderBy()
				|| jobSearchVo.getOrderBy().equals("")) {
			jobSearchVo.setOrderBy("orderByJobIssuetDate");// 默认按用户资料更改时间降序
		}
		this.getPageInfo().setPageSize(
				ApplicationConstant.NUMBER_OF_EXCAVATE_TALENT_SHOW);

		hotCompetencyJobList = jobInfoService.queryCitySiteCompetencyJobs(jobSearchVo, pageInfo);

		ClassMasterDto cm = new ClassMasterDto("",ApplicationConstant.NO_LIMITED);
		industrysList = (List<ClassMasterDto>) CacheManager.getInstanceMemcachedClient().get("industrysList");
		
		ClassMasterDto industryType = new ClassMasterDto();
		industryType.setCode("");
		industryType.setParentCode("001");
		industryType.setName("其他");
		
		industrysList.add(industryType);
		industrysList.add(cm);
		competencyList = (List<ClassMasterDto>) CacheManager.getInstanceMemcachedClient().get("competencyList");

		competencyList.add(0, cm);
		provinceList = (List<ProvinceDto>) CacheManager
				.getInstanceMemcachedClient().get("provinceList");
		provinceList
				.add(0, new ProvinceDto("", ApplicationConstant.NO_LIMITED));
		specializedTypeList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("specializedTypeList");
		
		ClassMasterDto category = new ClassMasterDto();
		category.setCode("");
		category.setParentCode("003");
		category.setName("其他");
		specializedTypeList.add(category);
		cm.setParentCode("");
		specializedTypeList.add(cm);
		jobNatureList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("jobNatureList");
		jobNatureList.add(0, cm);
		workingLifeList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("workingLifeList");
		educationList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("educationList");

		if (jobSearchVo == null) {
			jobSearchVo = new JobSearchVo();
		}
		String competencyName = EssentialDataUtil.getEssentialDataBycode(
				jobSearchVo.getCompetency()).getName();
		jobSearchVo.setCompetencyName(competencyName);
		
		CityDto cityDto = RegionDataUtil.getCityByCode(jobSearchVo.getCityCode());
		if (cityDto != null) {
			String cityName = cityDto.getName();
			jobSearchVo.setCityName(cityName);
			
			ProvinceDto provinceDto =RegionDataUtil.getProvinceByCode(cityDto.getProvinceCode());
			jobSearchVo.setProvinceCode(provinceDto.getCode());
			jobSearchVo.setProvinceName(provinceDto.getName());
		}
		return "hotCompetencyJobs";
	}

	/**
	 * 热门城市 企业加载
	 */
	public void loadCitySiteHotEnterprises() {
		SysAdDto sysad = new SysAdDto();
		sysad.setType(ApplicationConstant.AD_TYPE_TEXT);
		sysad.setCity(jobSearchVo.getCityCode());
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_HOMEPAGE_CITYPAGE_002);
		sysad.setLimitNumber(ApplicationConstant.NUMBER_OF_AD_CITYSITE_ENTERPRISE);
		sysad.setCurrentDate(new Date());
		citySiteHotEnterpriseList = sysAdService
				.queryCitySiteHotEnterprises(sysad);
	}

	/**
	 * 城市站点-职能分类 职位搜索
	 */
	/*
	 * public String citySiteCompetencyJobs(){ citySiteCompetencyJobList =
	 * jobInfoService.queryCitySiteCompetencyJobs(jobSearchVo); return
	 * "citySiteCompetencyJobs"; }
	 */

	/**
	 * 城市站点 热门职位加载
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String loadCitySiteHotJobs() {
		if (this.getPageInfo() == null) {
			this.setPageInfo(new PageInfo());
		}

		if (null == jobSearchVo) {
			jobSearchVo = new JobSearchVo();
			jobSearchVo.setOrderBy("orderByJobIssuetDate");// 默认按用户资料更改时间降序
		} else if (null == jobSearchVo.getOrderBy()
				|| jobSearchVo.getOrderBy().equals("")) {
			jobSearchVo.setOrderBy("orderByJobIssuetDate");// 默认按用户资料更改时间降序
		}
		this.getPageInfo().setPageSize(
				ApplicationConstant.NUMBER_OF_EXCAVATE_TALENT_SHOW);
		citySiteHotJobResultList = jobInfoService.queryCitySiteHotJobListByJobName(jobSearchVo, getPageInfo());

		ClassMasterDto cm = new ClassMasterDto("",ApplicationConstant.NO_LIMITED);
		industrysList = (List<ClassMasterDto>) CacheManager.getInstanceMemcachedClient().get("industrysList");
		
		ClassMasterDto industryType = new ClassMasterDto();
		industryType.setCode("");
		industryType.setParentCode("001");
		industryType.setName("其他");
		industrysList.add(industryType);
		
		industrysList.add(cm);
		competencyList = (List<ClassMasterDto>) CacheManager.getInstanceMemcachedClient().get("competencyList");
		competencyList.add(0, cm);
		provinceList = (List<ProvinceDto>) CacheManager
				.getInstanceMemcachedClient().get("provinceList");
		provinceList
				.add(0, new ProvinceDto("", ApplicationConstant.NO_LIMITED));
		specializedTypeList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("specializedTypeList");
		
		ClassMasterDto category = new ClassMasterDto();
		category.setCode("");
		category.setParentCode("003");
		category.setName("其他");
		specializedTypeList.add(category);
		cm.setParentCode("");
		specializedTypeList.add(cm);
		jobNatureList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("jobNatureList");
		jobNatureList.add(0, cm);
		workingLifeList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("workingLifeList");
		educationList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("educationList");
		
		CityDto cityDto = RegionDataUtil.getCityByCode(jobSearchVo.getCityCode());
		if(cityDto!=null){
			String cityName = cityDto.getName();
			jobSearchVo.setCityName(cityName);
			
			ProvinceDto provinceDto =RegionDataUtil.getProvinceByCode(cityDto.getProvinceCode());
			jobSearchVo.setProvinceCode(provinceDto.getCode());
			jobSearchVo.setProvinceName(provinceDto.getName());
		}
		return "loadCitySiteHotJobs";
	}

	public String toUserRegister() {
		return "toUserRegister";
	}

	/**
	 * @return the functionList
	 */
	public List<ClassMasterDto> getFunctionList() {
		return functionList;
	}

	public void setExpireJobs(int expireJobs) {
		this.expireJobs = expireJobs;
	}

	public int getExpireJobs() {
		return expireJobs;
	}

	public String getGoFrom() {
		return goFrom;
	}

	public void setGoFrom(String goFrom) {
		this.goFrom = goFrom;
	}

	public void setJobInfoService(IJobInfoService jobInfoService) {
		this.jobInfoService = jobInfoService;
	}

	public IJobInfoService getJobInfoService() {
		return jobInfoService;
	}

	public void setNotSeeInvite(int notSeeInvite) {
		this.notSeeInvite = notSeeInvite;
	}

	public int getNotSeeInvite() {
		return notSeeInvite;
	}

	public void setApplyJobService(IApplyJobService applyJobService) {
		this.applyJobService = applyJobService;
	}

	public IApplyJobService getApplyJobService() {
		return applyJobService;
	}

	public void setJobSearchVo(JobSearchVo jobSearchVo) {
		this.jobSearchVo = jobSearchVo;
	}

	public JobSearchVo getJobSearchVo() {
		return jobSearchVo;
	}

	public void setHotCompetencyJobList(List<JobInfoDto> hotCompetencyJobList) {
		this.hotCompetencyJobList = hotCompetencyJobList;
	}

	public List<JobInfoDto> getHotCompetencyJobList() {
		return hotCompetencyJobList;
	}

	public void setCitySiteList(List<CitySiteDto> citySiteList) {
		this.citySiteList = citySiteList;
	}

	public List<CitySiteDto> getCitySiteList() {
		return citySiteList;
	}

	public void setCitySiteCompetencyJobList(
			List<JobInfoDto> citySiteCompetencyJobList) {
		this.citySiteCompetencyJobList = citySiteCompetencyJobList;
	}

	public List<JobInfoDto> getCitySiteCompetencyJobList() {
		return citySiteCompetencyJobList;
	}

	public void setCitySiteHotJobList(List<JobInfoDto> citySiteHotJobList) {
		this.citySiteHotJobList = citySiteHotJobList;
	}

	public List<JobInfoDto> getCitySiteHotJobList() {
		return citySiteHotJobList;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setCitySiteHotJobResultList(
			List<JobInfoDto> citySiteHotJobResultList) {
		this.citySiteHotJobResultList = citySiteHotJobResultList;
	}

	public List<JobInfoDto> getCitySiteHotJobResultList() {
		return citySiteHotJobResultList;
	}

	public void setSysAdService(
			com.dotoyo.buildjob.sys.service.ISysAdService sysAdService) {
		this.sysAdService = sysAdService;
	}

	public com.dotoyo.buildjob.sys.service.ISysAdService getSysAdService() {
		return sysAdService;
	}

	public void setCitySiteHotEnterpriseList(
			List<SysAdDto> citySiteHotEnterpriseList) {
		this.citySiteHotEnterpriseList = citySiteHotEnterpriseList;
	}

	public List<SysAdDto> getCitySiteHotEnterpriseList() {
		return citySiteHotEnterpriseList;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public void setFileServerURL(String fileServerURL) {
		this.fileServerURL = fileServerURL;
	}

	public String getFileServerURL() {
		return fileServerURL;
	}

	public void setTopAd(SysAdDto topAd) {
		this.topAd = topAd;
	}

	public SysAdDto getTopAd() {
		return topAd;
	}

	public void setCitySiteImagePath(String citySiteImagePath) {
		this.citySiteImagePath = citySiteImagePath;
	}

	public String getCitySiteImagePath() {
		return citySiteImagePath;
	}

	public String getShowAbstract() {
		return showAbstract;
	}

	public void setShowAbstract(String showAbstract) {
		this.showAbstract = showAbstract;
	}

	/**
	 * @return the securityCode
	 */
	public String getSecurityCode() {
		return securityCode;
	}

	/**
	 * @param securityCode the securityCode to set
	 */
	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

	/**
	 * @return the passwordEncoder
	 */
	public Md5PasswordEncoder getPasswordEncoder() {
		return passwordEncoder;
	}

	/**
	 * @param passwordEncoder the passwordEncoder to set
	 */
	public void setPasswordEncoder(Md5PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}
	
}
