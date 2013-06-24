package com.dotoyo.buildjob.enterpriseCenter.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.danga.MemCached.MemCachedClient;
import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.AreaDto;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.CityDto;
import com.dotoyo.buildjob.common.dto.OfflineSearchResultDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.common.service.IOfflineSearchResultService;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.CacheManager;
import com.dotoyo.buildjob.common.util.RegionDataUtil;
import com.dotoyo.buildjob.peopleExcavate.service.IPeopleExcavateService;
import com.dotoyo.buildjob.peopleExcavate.vo.PeopleExcavateVo;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-3-3
 * @description
 */
public class OfflineSearchResultAction extends BuildJobAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1636109370178237108L;
	private OfflineSearchResultDto offlineSearchResultDto;
	private List<OfflineSearchResultDto> offlineSearchResultList;
	private IOfflineSearchResultService offlineSearchResultService;
	private PageInfo pageInfo;
	private String[] searchResultCheckBox;
	private Map<String, String> categoryIndexMap;
	private List<CityDto> cityList;
	private List<AreaDto> areaList;
	private PeopleExcavateVo peopleExcavateVo;
	private IPeopleExcavateService peopleExcavateService;
	private List<BlogUserInfoDto> excavateResultList;
	private String actionMessage;
	private String flag;
	private int updateDate;

	/**
	 * 查看当前登陆企业用户的线下人才搜索记录
	 * 
	 * @return
	 */
	public String viewSearchResult4CurrentUser() {

		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.LIST_VIEW_SIZE);
		if (offlineSearchResultDto == null) {
			offlineSearchResultDto = new OfflineSearchResultDto();
		}
		offlineSearchResultDto.setUserId(userId);
		offlineSearchResultList = offlineSearchResultService
				.queryOfflineSearchResultList(pageInfo, offlineSearchResultDto);
		return "viewSearchResult4CurrentUser";
	}

	@SuppressWarnings("unchecked")
	private void init4AddSearchResult() {
		ageList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("ageList");
		if (cityList == null) {
			cityList = new ArrayList<CityDto>();
		}
		if (areaList == null) {
			areaList = new ArrayList<AreaDto>();
		}
		MemCachedClient memcachedClient = CacheManager
				.getInstanceMemcachedClient();
		industrysList = (List<ClassMasterDto>) memcachedClient
				.get("industrysList");
		//为后台页面清除列表中的行业分类信息
		if (industrysList != null) {
			for (int i = 0; i < industrysList.size(); i++) {
				if(industrysList.get(i).getParentCode().equalsIgnoreCase("001")){
					industrysList.remove(i);
				}
			}
		}
		competencyList = (List<ClassMasterDto>) memcachedClient
				.get("competencyList");
		provinceList = (List<ProvinceDto>) memcachedClient.get("provinceList");
		specializedTypeList = (List<ClassMasterDto>) memcachedClient
				.get("specializedTypeList");
		//为后台页面清除列表中的专业分类信息
		if (specializedTypeList != null) {
			for (int i = 0; i < specializedTypeList.size(); i++) {
				if(specializedTypeList.get(i).getParentCode().equalsIgnoreCase("003")){
					specializedTypeList.remove(i);
				}
			}
		}
		
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
		categoryIndexMap.put("1", ApplicationConstant.CATEGORYINDEX_ONE);
		categoryIndexMap.put("2", ApplicationConstant.CATEGORYINDEX_TWO);
		categoryIndexMap.put("3", ApplicationConstant.CATEGORYINDEX_THREE);
		categoryIndexMap.put("4", ApplicationConstant.CATEGORYINDEX_FOUR);
		categoryIndexMap.put("5", ApplicationConstant.CATEGORYINDEX_FIVE);
	}

	public String deleteSearchResult() {
		String ids = StringUtils.join(searchResultCheckBox, ",");
		offlineSearchResultService.deleteOfflineSearchResult(ids);
		return viewSearchResult4CurrentUser();
	}

	@SuppressWarnings("unchecked")
	public String toEditSearchResult() {
		ageList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("ageList");
		offlineSearchResultDto = offlineSearchResultService
				.getOfflineSearchResultById(offlineSearchResultDto.getId());
		peopleExcavateVo = new PeopleExcavateVo(offlineSearchResultDto);
		updateDate = offlineSearchResultDto.getUserInfoUpdateDate();
		cityList = RegionDataUtil
				.queryCityListByProvinceCode(offlineSearchResultDto
						.getProvinceCode());
		areaList = RegionDataUtil
				.queryAreaListByCityCode(offlineSearchResultDto.getCityCode());
		init4AddSearchResult();
		request = ServletActionContext.getRequest();
		request.setAttribute("readOnly", "N");
		return "toEditSearchResult";
	}

	@SuppressWarnings("unchecked")
	public String toViewSearchResult() {
		ageList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("ageList");
		offlineSearchResultDto = offlineSearchResultService
				.getOfflineSearchResultById(offlineSearchResultDto.getId());
		peopleExcavateVo = new PeopleExcavateVo(offlineSearchResultDto);
		updateDate = offlineSearchResultDto.getUserInfoUpdateDate();
		cityList = RegionDataUtil
				.queryCityListByProvinceCode(offlineSearchResultDto
						.getProvinceCode());
		areaList = RegionDataUtil
				.queryAreaListByCityCode(offlineSearchResultDto.getCityCode());
		init4AddSearchResult();
		toEditSearchResult();
		request.setAttribute("readOnly", "Y");
		return "toViewSearchResult";
	}

	public String toAddSearchResult() {
		init4AddSearchResult();
		return "toAddSearchResult";
	}

	public String saveAddSearchResult() {
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

	public String saveEditSearchResult() {
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo
				.setPageSize(ApplicationConstant.NUMBER_OF_EXCAVATE_TALENT_SHOW);
		if (null == peopleExcavateVo.getOrderBy()
				|| peopleExcavateVo.getOrderBy().equals("")) {
			peopleExcavateVo.setOrderBy("userInfoUpdateDate");// 默认按用户资料更改时间降序
		}
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
		
		//不要删除，展示线下人才挖掘结果
		//excavateResultList = peopleExcavateService.queryBtiTalentList(pageInfo,
		//		peopleExcavateVo);
		//计算人才更新日期
		if(updateDate != 0){
			Date currentDate = new Date();
			Date userUpdateDate = this.getDateBefore(currentDate, updateDate);
			peopleExcavateVo.setUserInfoUpdateDate(userUpdateDate);	
		}
		
		Long id = offlineSearchResultDto.getId();
		offlineSearchResultDto = new OfflineSearchResultDto(peopleExcavateVo);
		offlineSearchResultDto.setId(id);
		offlineSearchResultDto.setUserInfoUpdateDate(updateDate);
		offlineSearchResultService
				.updateOfflineSearchResult(offlineSearchResultDto);
		return "saveEditSearchResult";
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

	/**
	 * @return the offlineSearchResultDto
	 */
	public OfflineSearchResultDto getOfflineSearchResultDto() {
		return offlineSearchResultDto;
	}

	/**
	 * @param offlineSearchResultDto
	 *            the offlineSearchResultDto to set
	 */
	public void setOfflineSearchResultDto(
			OfflineSearchResultDto offlineSearchResultDto) {
		this.offlineSearchResultDto = offlineSearchResultDto;
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

	/**
	 * @return the offlineSearchResultList
	 */
	public List<OfflineSearchResultDto> getOfflineSearchResultList() {
		return offlineSearchResultList;
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
	 * @return the searchResultCheckBox
	 */
	public String[] getSearchResultCheckBox() {
		return searchResultCheckBox;
	}

	/**
	 * @param searchResultCheckBox
	 *            the searchResultCheckBox to set
	 */
	public void setSearchResultCheckBox(String[] searchResultCheckBox) {
		this.searchResultCheckBox = searchResultCheckBox;
	}

	/**
	 * @return the categoryIndexMap
	 */
	public Map<String, String> getCategoryIndexMap() {
		return categoryIndexMap;
	}

	/**
	 * @param categoryIndexMap
	 *            the categoryIndexMap to set
	 */
	public void setCategoryIndexMap(Map<String, String> categoryIndexMap) {
		this.categoryIndexMap = categoryIndexMap;
	}

	/**
	 * @return the cityList
	 */
	public List<CityDto> getCityList() {
		return cityList;
	}

	/**
	 * @return the areaList
	 */
	public List<AreaDto> getAreaList() {
		return areaList;
	}

	/**
	 * @return the peopleExcavateVo
	 */
	public PeopleExcavateVo getPeopleExcavateVo() {
		return peopleExcavateVo;
	}

	/**
	 * @param peopleExcavateVo
	 *            the peopleExcavateVo to set
	 */
	public void setPeopleExcavateVo(PeopleExcavateVo peopleExcavateVo) {
		this.peopleExcavateVo = peopleExcavateVo;
	}

	/**
	 * @return the peopleExcavateService
	 */
	public IPeopleExcavateService getPeopleExcavateService() {
		return peopleExcavateService;
	}

	/**
	 * @param peopleExcavateService
	 *            the peopleExcavateService to set
	 */
	public void setPeopleExcavateService(
			IPeopleExcavateService peopleExcavateService) {
		this.peopleExcavateService = peopleExcavateService;
	}

	/**
	 * @return the excavateResultList
	 */
	public List<BlogUserInfoDto> getExcavateResultList() {
		return excavateResultList;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public int getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(int updateDate) {
		this.updateDate = updateDate;
	}
	
}
