package com.dotoyo.buildjob.peopleExcavate.action;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.danga.MemCached.MemCachedClient;
import com.dotoyo.buildjob.applyJobCenter.service.IApplyJobService;
import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.InterviewNoticeDto;
import com.dotoyo.buildjob.common.dto.OfflineSearchResultDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.common.interceptor.AuthLoginInterceptor;
import com.dotoyo.buildjob.common.service.IOfflineSearchResultService;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.common.util.CacheManager;
import com.dotoyo.buildjob.common.util.DateUtil;
import com.dotoyo.buildjob.peopleExcavate.service.IPeopleExcavateService;
import com.dotoyo.buildjob.peopleExcavate.vo.PeopleExcavateVo;
import com.dotoyo.buildjob.sys.dto.SysAdDto;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.dotoyo.buildjob.sys.service.ISysAdService;
import com.dotoyo.buildjob.sys.service.ISysOrderService;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-13
 * @description
 *
 */
public class PeopleExcavateAction extends BuildJobAction {
	private static Logger logger = Logger.getLogger(PeopleExcavateAction.class);
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private IPeopleExcavateService peopleExcavateService;
	private IApplyJobService applyJobService;
	private ISysOrderService sysOrderService;
	private ISysAdService sysAdService;
	private PeopleExcavateVo peopleExcavateVo;
	private Map<String, String> categoryIndexMap;
	private List<BlogUserInfoDto> talentTopList;
	private List<BlogUserInfoDto> excavateResultList;
	private String actionMessage;// 用户服务验证返回消息
	private String applyStatus;
	private String linkBoStationStatus;// 链接博站状态
	private int countOFEnterprise;
	private int countOFPersonnel;
	private String[] talentCheckBoxed;
	private PageInfo pageInfo;
	private IOfflineSearchResultService offlineSearchResultService;

	private List<ClassMasterDto> lIndustrysList = new ArrayList<ClassMasterDto>();
	private List<ClassMasterDto> lCompetencyList = new ArrayList<ClassMasterDto>();
	private List<ProvinceDto> lProvinceList = new ArrayList<ProvinceDto>();
	private List<ClassMasterDto> lSpecializedTypeList = new ArrayList<ClassMasterDto>();
	private String success = "0";// 0:失败，1:成功
	private SysAdDto peopleExcavateAdDto;
	private List<SysAdDto> peopleExcavateAdList;
	private IUserService userService;
	private int updateDate;
	
	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public List<SysAdDto> getPeopleExcavateAdList() {
		return peopleExcavateAdList;
	}

	public void setPeopleExcavateAdList(List<SysAdDto> peopleExcavateAdList) {
		this.peopleExcavateAdList = peopleExcavateAdList;
	}

	private String fileServerURL;
	private String flag;
	private String showAbstract;// 是否显示摘要

	public String initIndex() {
		enterpriseStatistics();
		personnelStatistics();
		return "init";
	}

	@SuppressWarnings("unchecked")
	public String init() {
		MemCachedClient memcachedClient = CacheManager.getInstanceMemcachedClient();
		industrysList = (ArrayList<ClassMasterDto>) memcachedClient
				.get("industrysList");
		lIndustrysList.addAll(industrysList);
		
		ClassMasterDto industryType = new ClassMasterDto();
		industryType.setCode("");
		industryType.setParentCode("001");
		industryType.setName("其他");
		
		ClassMasterDto industrySubType = new ClassMasterDto();
		industrySubType.setCode("");
		industrySubType.setParentCode("");
		industrySubType.setName(ApplicationConstant.NO_LIMITED);
		
		lIndustrysList.add(industryType);
		lIndustrysList.add(industrySubType);

		competencyList = (List<ClassMasterDto>) memcachedClient
				.get("competencyList");
		competencyList.add(0, new ClassMasterDto("",
				ApplicationConstant.NO_LIMITED));
		lCompetencyList.addAll(competencyList);
		competencyList.remove(0);

		provinceList = (List<ProvinceDto>) memcachedClient.get("provinceList");
		provinceList
				.add(0, new ProvinceDto("", ApplicationConstant.NO_LIMITED));
		lProvinceList.addAll(provinceList);
		provinceList.remove(0);

		specializedTypeList = (List<ClassMasterDto>) memcachedClient
				.get("specializedTypeList");
//		specializedTypeList.add(0, new ClassMasterDto("",
//				ApplicationConstant.NO_LIMITED));
		lSpecializedTypeList.addAll(specializedTypeList);
		
		ClassMasterDto category = new ClassMasterDto();
		category.setCode("");
		category.setParentCode("003");
		category.setName("其他");
		lSpecializedTypeList.add(category);
		
		ClassMasterDto classMasterDto = new ClassMasterDto();
		classMasterDto.setCode("");
		classMasterDto.setName(ApplicationConstant.NO_LIMITED);
		classMasterDto.setParentCode("");
		lSpecializedTypeList.add(classMasterDto);
		
//		specializedTypeList.remove(0);

		jobNatureList = (List<ClassMasterDto>) memcachedClient
				.get("jobNatureList");
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

		categoryIndexMap = new TreeMap<String, String>();
		categoryIndexMap.put("", ApplicationConstant.CATEGORYINDEX_No_LIMIT);
		categoryIndexMap.put("1", ApplicationConstant.CATEGORYINDEX_ONE);
		categoryIndexMap.put("2", ApplicationConstant.CATEGORYINDEX_TWO);
		categoryIndexMap.put("3", ApplicationConstant.CATEGORYINDEX_THREE);
		categoryIndexMap.put("4", ApplicationConstant.CATEGORYINDEX_FOUR);
		categoryIndexMap.put("5", ApplicationConstant.CATEGORYINDEX_FIVE);

		talentShowStarTOP_N();
		//loadPeopleExcavateAd();
		
		return "init";
	}


	/**
	 * 邀请面试
	 */
	public String sendInvitedInterviewing() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		LoginUserInfoDto userInfo = (LoginUserInfoDto) session.getAttribute(ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		if(userInfo==null){
			applyStatus=ApplicationConstant.COMMON_UNLOGON;
			return "sendIIMessage";
		}else if (userInfo.getUserType().equals(ApplicationConstant.USER_TYPE_PERSONAL)) {
			applyStatus=ApplicationConstant.COMMON_USER_TYPE_ERROR;
			return "sendIIMessage";
		}

		HttpServletRequest request = ServletActionContext.getRequest();
		String talentId = request.getParameter("talentId");
		Long receiverId = new Long(talentId);
		LoginUserInfoDto lUser = userService.getUserById(new Long(talentId));
		String lUserName = lUser.getUserName();
		BlogUserInfoDto bUser = userService.getUserInfoDetailByUserName(lUserName);
		
		InterviewNoticeDto interviewNoticeDto = new InterviewNoticeDto();
		interviewNoticeDto.setJobName(bUser.getJobName());
		interviewNoticeDto.setSenderId(this.getLoginUserInfo().getId());
		interviewNoticeDto.setReceiverId(receiverId);
		interviewNoticeDto.setTitle(ApplicationConstant.INTERVIEW_NOTICE_TITLE);
		interviewNoticeDto.setMessage(ApplicationConstant.INTERVIEW_NOTICE_MESSAGE);
		interviewNoticeDto.setNoticeDate(new Date());
		interviewNoticeDto.setStatus("0");

		boolean bool = applyJobService.saveInterviewNotice(interviewNoticeDto,userInfo);
		if (bool) {
			applyStatus = SUCCESS;
		}else{
			applyStatus = ERROR;
		}
		return "sendIIMessage";
	}

	/**
	 * 页面广告加载
	 */
	public void loadPeopleExcavateAd(){
		SysAdDto sysad = new SysAdDto();
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_TALENTS_FOUND_001);
		//sysad.setType(ApplicationConstant.AD_TYPE_IMAGE);
		sysad.setCurrentDate(new Date());
		sysad.setLimitNumber(5);
		List<SysAdDto> list= sysAdService.queryAdForList(sysad);
		int listsize=list==null?0:list.size();

		for(int i=0;i<5;i++){
			if(i>=listsize){
				SysAdDto ad = new SysAdDto();
				ad.setImgName(ApplicationConstant.DOTOYO_DEFAULT_IMG007);
				ad.setTitle(ApplicationConstant.DOTOYO_DEFAULT_TITLE);
				ad.setUrl(ApplicationConstant.DOTOYO_DEFAULT_URL);
				ad.setStartDate(new Date());
				ad.setEndDate(new Date());
				list.add(ad);
			}else{
				replaceImg(list.get(i),ApplicationConstant.DOTOYO_DEFAULT_IMG007);
			}
		}

//		if(null!=list&&list.size()>0){
//			peopleExcavateAdDto = list.get(0);
//		}
		setPeopleExcavateAdList(list);
		
		fileServerURL = (String) CacheManager.getInstanceMemcachedClient().get("fileServerURL");
	}
	private String dateFormatStr="yyyy-MM-dd HH:mm:ss";
	private void replaceImg(SysAdDto ad,String defaultImg){
		try {
			Date startDate = DateUtil.parseToDate(ad.getStartDate(),dateFormatStr);
			Date endDate = DateUtil.parseToDate(ad.getEndDate(),dateFormatStr);
			Date currentDate = DateUtil.parseToDate(new Date(),dateFormatStr);
			if(currentDate.before(startDate) || currentDate.after(endDate)){
				ad.setImgName(defaultImg);
				ad.setTitle(ApplicationConstant.DOTOYO_DEFAULT_TITLE);
				ad.setUrl(ApplicationConstant.DOTOYO_DEFAULT_URL);
			}
		} catch (ParseException e) {
		}
		
	}

	/**
	 * 快速批量邀请面试
	 */
	public String fastBatchApply() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		LoginUserInfoDto userInfo = (LoginUserInfoDto) session.getAttribute(ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		if(userInfo==null){
			applyStatus=ApplicationConstant.COMMON_UNLOGON;
			return "fastBatchApply";
		}else if (userInfo.getUserType().equals(ApplicationConstant.USER_TYPE_PERSONAL)) {
			applyStatus=ApplicationConstant.COMMON_USER_TYPE_ERROR;
			return "fastBatchApply";
		}

		List<InterviewNoticeDto> talentList = new ArrayList<InterviewNoticeDto>();
		SysOrderDto dto = new SysOrderDto();
		dto.setService3Remains(new Long(3));
		if (sysOrderService.getAvailableServiceTimes(dto, userInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE,
				ApplicationConstant.SERVICE_3_REMAINS) < talentCheckBoxed.length) {
			applyStatus = String.valueOf(talentCheckBoxed.length);
			return "fastBatchApply";
		}
		if (null != talentCheckBoxed && talentCheckBoxed.length > 0) {
			for (int i = 0; i < talentCheckBoxed.length; i++) {
				InterviewNoticeDto interviewNoticeDto = new InterviewNoticeDto();
				interviewNoticeDto.setSenderId(this.getLoginUserInfo().getId());
				interviewNoticeDto.setReceiverId(Long
						.parseLong(talentCheckBoxed[i]));
				
				LoginUserInfoDto lUser = userService.getUserById(new Long(talentCheckBoxed[i]));
				String lUserName = lUser.getUserName();
				BlogUserInfoDto bUser = userService.getUserInfoDetailByUserName(lUserName);
				interviewNoticeDto.setJobName(bUser.getJobName());
				interviewNoticeDto
						.setTitle(ApplicationConstant.INTERVIEW_NOTICE_TITLE);
				interviewNoticeDto
						.setMessage(ApplicationConstant.INTERVIEW_NOTICE_MESSAGE);
				interviewNoticeDto.setNoticeDate(new Date());
				interviewNoticeDto.setStatus("0");
				talentList.add(interviewNoticeDto);
			}
		}

		sysOrderService.batchVerifyAuthority(dto, userInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE,
				ApplicationConstant.SERVICE_3_REMAINS, talentCheckBoxed.length);
		applyJobService.fastBatchApply(talentList);
		applyStatus = SUCCESS;
		return "fastBatchApply";
	}

	/**
	 * 查看用户博站
	 *
	 * @return
	 */
	public String linkBoStation() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		LoginUserInfoDto userInfo = (LoginUserInfoDto) session.getAttribute(ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		if(userInfo==null){
			linkBoStationStatus=ApplicationConstant.COMMON_UNLOGON;
			return "fastBatchApply";
		}else if (!getLoginUserInfo().getUserType().equals(ApplicationConstant.USER_TYPE_PERSONAL)) {
			SysOrderDto dto = new SysOrderDto();
			dto.setService2Remains(new Long(2));
			if (sysOrderService.verifyAuthority(dto, userInfo,
					ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE,
					ApplicationConstant.SERVICE_2_REMAINS, 1)) {
				linkBoStationStatus = SUCCESS;
				return "linkBoStation";
			}
		}
		return "linkBoStation";
	}

	/**
	 * 企业个数动态统计
	 */
	public void enterpriseStatistics() {
		countOFEnterprise = peopleExcavateService.getCountOFEnterprise();
	}

	/**
	 * 人才个数动态展示
	 */
	public void personnelStatistics() {
		countOFPersonnel = peopleExcavateService.getCountOfPersonnel();
	}

	/**
	 * 人才星级TOP_N(10)展示
	 */
	public void talentShowStarTOP_N() {
		talentTopList = peopleExcavateService
				.getTalentShowStarTOP_N(ApplicationConstant.NUMBER_OF_STAR_TALENT_SHOW);
	}

	/**
	 * 人才搜索
	 */
	public String talentSearch() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		LoginUserInfoDto userInfo = (LoginUserInfoDto) session.getAttribute(ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		if(userInfo==null){
			return "logonPage";
		}
		if (userInfo.getUserType()
				.equals(ApplicationConstant.USER_TYPE_PERSONAL)) {
			actionMessage = ApplicationConstant.USERTYPE_ERROR_PERSONAL;
			return "backToPreviousWindow";
		}
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(ApplicationConstant.NUMBER_OF_EXCAVATE_TALENT_SHOW);
		if (null == peopleExcavateVo.getOrderBy()|| peopleExcavateVo.getOrderBy().equals("")) {
			peopleExcavateVo.setOrderBy("userInfoUpdateDate");// 默认按用户资料更改时间降序
		}
		peopleExcavateVo.setCompanyName(this.getLoginUserInfo().getCompanyName());
		if(null!=flag&&flag.equals(ServletActionContext.getRequest().getSession().getAttribute("flag"))){
    		ServletActionContext.getRequest().getSession().setAttribute("flag","");
    		
    		if (peopleExcavateVo.getAge() != null
    				&& !peopleExcavateVo.getAge().equals("")) {
    			String[] a = peopleExcavateVo.getAge().split("-");
    			peopleExcavateVo.setLtAge(a[0]);
    			peopleExcavateVo.setGtAge(a[1]);
    		}
    		if (peopleExcavateVo.getWorkingLife() != null
    				&& !peopleExcavateVo.getWorkingLife().equals("")) {
    			String[] w = peopleExcavateVo.getWorkingLife().split("-");
    			peopleExcavateVo.setLtWorkingLife(w[0]);
    			peopleExcavateVo.setGtWorkingLife(w[1]);
    		}
    		peopleExcavateVo.setUserId(this.getLoginUserInfo().getId());
    	}else{// 重复提交
    		peopleExcavateVo.setExcavate("0");
    	}
		
		//计算人才更新日期
		if(updateDate != 0){
			Date currentDate = new Date();
			Date userUpdateDate = this.getDateBefore(currentDate, updateDate);
			peopleExcavateVo.setUserInfoUpdateDate(userUpdateDate);	
		}
		
		excavateResultList = peopleExcavateService.queryTalentList(pageInfo,peopleExcavateVo);
		if(excavateResultList==null){// 你暂未购买此服务，不能进行些操作!
			actionMessage = ApplicationConstant.SERVICE_ERROR_MESSAGE;
			return "backToPreviousWindow";
		}
		return "talentSearch";
	}

	/**
	 * 线下人才搜索
	 */
	public String btiTalentSearch() {
		if (this.getLoginUserInfo().getUserType()
				.equals(ApplicationConstant.USER_TYPE_PERSONAL)) {
			actionMessage = ApplicationConstant.USERTYPE_ERROR_PERSONAL;
			return "backToPreviousWindow";
		}
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(ApplicationConstant.NUMBER_OF_EXCAVATE_TALENT_SHOW);
		if (null == peopleExcavateVo.getOrderBy()
				|| peopleExcavateVo.getOrderBy().equals("")) {
			peopleExcavateVo.setOrderBy("userInfoUpdateDate");// 默认按用户资料更改时间降序
		}
		peopleExcavateVo.setCompanyName(this.getLoginUserInfo().getCompanyName());
		if(null!=flag&&flag.equals(ServletActionContext.getRequest().getSession().getAttribute("flag"))){
    		ServletActionContext.getRequest().getSession().setAttribute("flag","");
			if (peopleExcavateVo.getAge() != null&& !peopleExcavateVo.getAge().equals("")) {
				String[] a = peopleExcavateVo.getAge().split("-");
				peopleExcavateVo.setLtAge(a[0]);
				peopleExcavateVo.setGtAge(a[1]);
			}
			if (peopleExcavateVo.getWorkingLife() != null
					&& !peopleExcavateVo.getWorkingLife().equals("")) {
				String[] w = peopleExcavateVo.getWorkingLife().split("-");
				peopleExcavateVo.setLtWorkingLife(w[0]);
				peopleExcavateVo.setGtWorkingLife(w[1]);
			}
			
			peopleExcavateVo.setUserId(this.getLoginUserInfo().getId());
		}else{// 重复提交
    		peopleExcavateVo.setExcavate("0");
    	}
		
		//计算人才更新日期
		if(updateDate != 0){
			Date currentDate = new Date();
			Date userUpdateDate = this.getDateBefore(currentDate, updateDate);
			peopleExcavateVo.setUserInfoUpdateDate(userUpdateDate);
		}
		
		excavateResultList = peopleExcavateService.queryBtiTalentList(pageInfo,peopleExcavateVo);
		if(excavateResultList==null){// 你暂未购买此服务，不能进行些操作!
			actionMessage = ApplicationConstant.SERVICE_ERROR_MESSAGE;
			return "backToPreviousWindow";
		}
		
		//不为重复提交时，加入搜索记录
		if(!"0".equalsIgnoreCase(peopleExcavateVo.getExcavate())){
			OfflineSearchResultDto offlineSearchResultDto = new OfflineSearchResultDto(peopleExcavateVo);
			LoginUserInfoDto loginUserInfo = getLoginUserInfo();
			offlineSearchResultDto.setUserId(loginUserInfo.getId());
			offlineSearchResultDto.setUserName(loginUserInfo.getUserName());
			offlineSearchResultDto.setUserInfoUpdateDate(updateDate);
			offlineSearchResultService.saveOfflineSearchResult(offlineSearchResultDto);
		}
		return "btiTalentSearch";
	}
	
	/**
	 * 得到几天前的时间
	 */

	private Date getDateBefore(Date d, int day) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) - day);
		return now.getTime();
	}

	public void setPeopleExcavateService(
			IPeopleExcavateService peopleExcavateService) {
		this.peopleExcavateService = peopleExcavateService;
	}

	@JSON(serialize = false)
	public IPeopleExcavateService getPeopleExcavateService() {
		return peopleExcavateService;
	}

	public void setApplyJobService(IApplyJobService applyJobService) {
		this.applyJobService = applyJobService;
	}

	@JSON(serialize = false)
	public IApplyJobService getApplyJobService() {
		return applyJobService;
	}

	public void setPeopleExcavateVo(PeopleExcavateVo peopleExcavateVo) {
		this.peopleExcavateVo = peopleExcavateVo;
	}

	public PeopleExcavateVo getPeopleExcavateVo() {
		return peopleExcavateVo;
	}

	public Map<String, String> getCategoryIndexMap() {
		return categoryIndexMap;
	}

	public void setCountOFEnterprise(int countOFEnterprise) {
		this.countOFEnterprise = countOFEnterprise;
	}

	public int getCountOFEnterprise() {
		return countOFEnterprise;
	}

	public void setCountOFPersonnel(int countOFPersonnel) {
		this.countOFPersonnel = countOFPersonnel;
	}

	public int getCountOFPersonnel() {
		return countOFPersonnel;
	}

	public void setTalentTopList(List<BlogUserInfoDto> talentTopList) {
		this.talentTopList = talentTopList;
	}

	public List<BlogUserInfoDto> getTalentTopList() {
		return talentTopList;
	}

	public void setExcavateResultList(List<BlogUserInfoDto> excavateResultList) {
		this.excavateResultList = excavateResultList;
	}

	public List<BlogUserInfoDto> getExcavateResultList() {
		return excavateResultList;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public void setTalentCheckBoxed(String[] talentCheckBoxed) {
		this.talentCheckBoxed = talentCheckBoxed;
	}

	public String[] getTalentCheckBoxed() {
		return talentCheckBoxed;
	}

	/**
	 * @return the offlineSearchResultService
	 */
	public IOfflineSearchResultService getOfflineSearchResultService() {
		return offlineSearchResultService;
	}

	/**
	 * @param offlineSearchResultService
	 *            the offlineSearchResultService to set
	 */
	public void setOfflineSearchResultService(
			IOfflineSearchResultService offlineSearchResultService) {
		this.offlineSearchResultService = offlineSearchResultService;
	}

	public void setlIndustrysList(List<ClassMasterDto> lIndustrysList) {
		this.lIndustrysList = lIndustrysList;
	}

	public List<ClassMasterDto> getlIndustrysList() {
		return lIndustrysList;
	}

	public void setlCompetencyList(List<ClassMasterDto> lCompetencyList) {
		this.lCompetencyList = lCompetencyList;
	}

	public List<ClassMasterDto> getlCompetencyList() {
		return lCompetencyList;
	}

	public void setlProvinceList(List<ProvinceDto> lProvinceList) {
		this.lProvinceList = lProvinceList;
	}

	public List<ProvinceDto> getlProvinceList() {
		return lProvinceList;
	}

	public void setlSpecializedTypeList(
			List<ClassMasterDto> lSpecializedTypeList) {
		this.lSpecializedTypeList = lSpecializedTypeList;
	}

	public List<ClassMasterDto> getlSpecializedTypeList() {
		return lSpecializedTypeList;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setSysOrderService(ISysOrderService sysOrderService) {
		this.sysOrderService = sysOrderService;
	}

	public ISysOrderService getSysOrderService() {
		return sysOrderService;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getSuccess() {
		return success;
	}

	public void setSysAdService(ISysAdService sysAdService) {
		this.sysAdService = sysAdService;
	}

	public ISysAdService getSysAdService() {
		return sysAdService;
	}

	public void setPeopleExcavateAdDto(SysAdDto peopleExcavateAdDto) {
		this.peopleExcavateAdDto = peopleExcavateAdDto;
	}

	public SysAdDto getPeopleExcavateAdDto() {
		return peopleExcavateAdDto;
	}

	public void setFileServerURL(String fileServerURL) {
		this.fileServerURL = fileServerURL;
	}

	public String getFileServerURL() {
		return fileServerURL;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setLinkBoStationStatus(String linkBoStationStatus) {
		this.linkBoStationStatus = linkBoStationStatus;
	}

	public String getLinkBoStationStatus() {
		return linkBoStationStatus;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getFlag() {
		return flag;
	}

	public String getShowAbstract() {
		return showAbstract;
	}

	public void setShowAbstract(String showAbstract) {
		this.showAbstract = showAbstract;
	}

	public int getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(int updateDate) {
		this.updateDate = updateDate;
	}
	

}
