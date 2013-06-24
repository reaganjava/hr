package com.dotoyo.buildjob.common.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.AssertionImpl;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.danga.MemCached.MemCachedClient;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.AreaDto;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.CityDto;
import com.dotoyo.buildjob.common.dto.HotCityDto;
import com.dotoyo.buildjob.common.dto.HotCompetencysDto;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.common.user.service.impl.UserServiceImpl;
import com.dotoyo.buildjob.common.util.CacheManager;
import com.dotoyo.buildjob.common.util.EssentialDataUtil;
import com.dotoyo.buildjob.common.util.RegionDataUtil;
import com.dotoyo.buildjob.sys.dto.SysAdDto;
import com.dotoyo.buildjob.sys.service.ISysAdService;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-28
 * @description 前台顶层action
 *
 */
public class BuildJobAction extends ActionSupport {
	private static Logger logger = Logger.getLogger(BuildJobAction.class);
	public static AbstractApplicationContext tx = null;
	protected String htmlServer;
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	public List<ClassMasterDto> essentialDataList;// 基础数据

	public HttpServletRequest request = null;
	public List<ClassMasterDto> engineeringConsultantsList;
	public List<ClassMasterDto> specialConstructionWorksList;
	public List<ClassMasterDto> externalServiceProjectList;
	public List<ClassMasterDto> engineeringResearchList;

	protected String competencyMainType;// 职能大类
	protected List<ProvinceDto> provinceList;// 省份
	protected List<HotCityDto> hotCityList;// 热点城市
	protected List<HotCompetencysDto> hotCompetencyList;// 热点职能
	protected List<ClassMasterDto> industrysList;// 行业
	protected List<ClassMasterDto> competencyList;// 职能
	protected List<ClassMasterDto> specializedTypeList; // 专业
	protected List<ClassMasterDto> workingLifeList;// 工作年限
	protected List<ClassMasterDto> educationList;// 学历
	protected List<ClassMasterDto> jobNatureList;// 工作性质
	protected List<ClassMasterDto> langCapaList;// 语言能力
	protected List<ClassMasterDto> masteryList;// 掌握程度
	protected List<ClassMasterDto> computerGradeList;// 计算机等级
	protected List<ClassMasterDto> salaryList;// 月薪
	protected List<ClassMasterDto> ageList;// 年龄

	private List<SysAdDto> imageAdList; // 图片广告
	private List<SysAdDto> textAdList; // 文字广告
	public List<CityDto> cityList;
	public List<AreaDto> areaList;
	public String result = "";

	public LoginUserInfoDto loginUserInfoDto;
	
	private BlogUserInfoDto blogUserInfoDto;
	
	private Map<String, Object> session = null;
	
	public BuildJobAction(){
	}
	/**
	 * 加载省下城市数据
	 * @return
	 */
	public String loadCityData() {
		request = ServletActionContext.getRequest();
		String provinceCode = request.getParameter("provinceCode");
		cityList = RegionDataUtil.queryCityListByProvinceCode(provinceCode);

		JsonConfig arg1 = new JsonConfig();
		JSONArray jsonList = JSONArray.fromObject(cityList, arg1);
		result = jsonList.toString();
		return SUCCESS;
	}
	
	
	//for ajax.加载掌握程度数据
	@SuppressWarnings("unchecked")
	public String loadMastery(){
		MemCachedClient memcachedClient = CacheManager
		.getInstanceMemcachedClient();
		request = ServletActionContext.getRequest();
		String langCapaCode = request.getParameter("langCapaCode");
		
		if (langCapaCode == null || "".equalsIgnoreCase(langCapaCode)) {
			masteryList = new ArrayList<ClassMasterDto>();
		}
		
		else if ("0".equalsIgnoreCase(langCapaCode)) {
			masteryList = new ArrayList<ClassMasterDto>();
			masteryList.add(((List<ClassMasterDto>) memcachedClient.get("masteryList")).get(0));
		}
		
		else{
			masteryList = (List<ClassMasterDto>) memcachedClient.get("masteryList");
		}

//		JsonConfig arg1 = new JsonConfig();
//		JSONArray jsonList = JSONArray.fromObject(masteryList, arg1);
//		result = jsonList.toString();
		return SUCCESS;
	}
	/**
	 * 网站顶部图片
	 */
	public void refreshTopAd(){
		if(tx == null){
			String[] app = { "applicationContext*.xml" };
			tx = new ClassPathXmlApplicationContext(app);
		}

		ActionContext context = ActionContext.getContext();
		Map<String,Object> application = context.getApplication();
		SysAdDto sysad = new SysAdDto();
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_HOMEPAGE_TOP);
		sysad.setType(ApplicationConstant.AD_TYPE_IMAGE);
		sysad.setLimitNumber(1);
		List<SysAdDto> list= ((ISysAdService) tx.getBean("sysAdService")).queryAdForList(sysad);
		if(null!=list&&list.size()>0){
			if(application.containsKey("topAd")){
				application.remove("topAd");
			}
			application.put("topAd", list.get(0));
		}

	}


	/**
	 * 加载城市中市区数据
	 */
	public String loadArea() {
		request = ServletActionContext.getRequest();
		String cityCode = request.getParameter("cityCode");
		areaList = RegionDataUtil.queryAreaListByCityCode(cityCode);

		JsonConfig arg1 = new JsonConfig();
		JSONArray jsonList = JSONArray.fromObject(areaList, arg1);
		result = jsonList.toString();
		return SUCCESS;
	}

	/**
	 * 加载界面所需基础数据
	 */
	@SuppressWarnings("unchecked")
	public String loadEssentialData(){
		JsonConfig arg1 = new JsonConfig();
		request = ServletActionContext.getRequest();
		String dataType = request.getParameter("dataType");
		if(dataType.equals(ApplicationConstant.INDUSTRY)){//加载行业基础数据
			essentialDataList = (List<ClassMasterDto>) CacheManager.getInstanceMemcachedClient().get("industrysList");
		}else if(dataType.equals(ApplicationConstant.SPECIALIZE_TYPE)){
			essentialDataList = EssentialDataUtil.querySpecializeListLikeCode(dataType);
		}else{
			essentialDataList = EssentialDataUtil.queryEssentialDataListByParentCode(dataType);
		}

		JSONArray jsonList = JSONArray.fromObject(essentialDataList, arg1);
		result = jsonList.toString();
		return SUCCESS;
	}

	/**
	 * 2011-02-09
	 *从session获取用户信息
	 * @return
	 */
	public  LoginUserInfoDto getLoginUserInfo(){
		ActionContext ctx = ServletActionContext.getContext();
		HttpServletRequest request = ServletActionContext.getRequest();
		/*获取单点登录服务器传递过来的用户信息*/
		AttributePrincipal principal = (AttributePrincipal) request.getUserPrincipal();
		// _const_cas_assertion_是CAS中存放登录用户名的session标志
        /*Object object = request.getSession().getAttribute("_const_cas_assertion_");
        String userAccount="";
        if (principal == null && object != null) {
        	AttributePrincipal Aprincipal=((AssertionImpl) object).getPrincipal();
            String loginName = Aprincipal.getName();
            System.out.println("当前登录用户：" + loginName);
            
            Map<String, Object> attributes = Aprincipal.getAttributes();
 			if (attributes.size() > 0) {
 				userAccount = (String) attributes.get("userAccount");
 			}
 			
 			loginUserInfoDto = CasLogon(userAccount);
			this.loginUserInfoDto=(LoginUserInfoDto) ctx.getSession().put(ApplicationConstant.SESSION_PARAMETER_USER_INFO,loginUserInfoDto);
			return loginUserInfoDto;
        }*/
		this.loginUserInfoDto=(LoginUserInfoDto) ctx.getSession().get(ApplicationConstant.SESSION_PARAMETER_USER_INFO);
		return this.loginUserInfoDto;
  	}
	
	public LoginUserInfoDto CasLogon(String userName){
		ServletContext ctx = ServletActionContext.getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(ctx);
		IUserService userService = (IUserService) context.getBean("userService");
		loginUserInfoDto = userService.getUserByUserName(userName);
		if (loginUserInfoDto == null) {
			loginUserInfoDto = new LoginUserInfoDto();
			loginUserInfoDto.setUserName(userName);
			return null;
		} else {
			// 判断用户是否已停用
			String status = loginUserInfoDto.getStatus();
			if ("0".equalsIgnoreCase(status)) {
				request.setAttribute("errorMessage", "用户已停用，请联系管理员！");
				loginUserInfoDto = new LoginUserInfoDto();
				loginUserInfoDto.setUserName(userName);
				return null;
			}
			// 获取用户的详细信息 Bill xu 2011-02-09
			this.blogUserInfoDto = userService.getUserInfoDetailByUserName(userName);

			if (this.blogUserInfoDto != null) {
				loginUserInfoDto.setUserType(this.blogUserInfoDto.getUserType());
				loginUserInfoDto.setCompanyName(blogUserInfoDto.getCompanyName());
				loginUserInfoDto.setAge(blogUserInfoDto.getAge());
				loginUserInfoDto.setWorkingLife(blogUserInfoDto.getWorkingLife());
				String userType = loginUserInfoDto.getUserType();
				if (userType == null || userType == "") {
					return loginUserInfoDto;
				}
			} else {// 博站用户信息为空，同步错误
				// 跳到提示页（？？）
				return loginUserInfoDto;
			}
			
			return loginUserInfoDto;
			
		}
	}

	public List<CityDto> getCityList() {
		return cityList;
	}

	public List<AreaDto> getAreaList() {
		return areaList;
	}

	public String getResult() {
		return result;
	}

	public LoginUserInfoDto getLoginUserInfoDto() {
		return loginUserInfoDto;
	}

	public void setLoginUserInfoDto(LoginUserInfoDto loginUserInfoDto) {
		this.loginUserInfoDto = loginUserInfoDto;
	}

	public List<ClassMasterDto> getEssentialDataList() {
		return essentialDataList;
	}

	public void setEssentialDataList(List<ClassMasterDto> essentialDataList) {
		this.essentialDataList = essentialDataList;
	}

	public List<ClassMasterDto> getEngineeringConsultantsList() {
		return engineeringConsultantsList;
	}

	public void setEngineeringConsultantsList(
			List<ClassMasterDto> engineeringConsultantsList) {
		this.engineeringConsultantsList = engineeringConsultantsList;
	}

	public List<ClassMasterDto> getSpecialConstructionWorksList() {
		return specialConstructionWorksList;
	}

	public void setSpecialConstructionWorksList(
			List<ClassMasterDto> specialConstructionWorksList) {
		this.specialConstructionWorksList = specialConstructionWorksList;
	}

	public List<ClassMasterDto> getExternalServiceProjectList() {
		return externalServiceProjectList;
	}

	public void setExternalServiceProjectList(
			List<ClassMasterDto> externalServiceProjectList) {
		this.externalServiceProjectList = externalServiceProjectList;
	}

	public List<ClassMasterDto> getEngineeringResearchList() {
		return engineeringResearchList;
	}

	public void setEngineeringResearchList(
			List<ClassMasterDto> engineeringResearchList) {
		this.engineeringResearchList = engineeringResearchList;
	}

	public String getCompetencyMainType() {
		return competencyMainType;
	}

	public void setCompetencyMainType(String competencyMainType) {
		this.competencyMainType = competencyMainType;
	}

	public List<ProvinceDto> getProvinceList() {
		return provinceList;
	}

	public void setProvinceList(List<ProvinceDto> provinceList) {
		this.provinceList = provinceList;
	}

	public List<HotCityDto> getHotCityList() {
		return hotCityList;
	}

	public void setHotCityList(List<HotCityDto> hotCityList) {
		this.hotCityList = hotCityList;
	}

	public List<ClassMasterDto> getIndustrysList() {
		return industrysList;
	}

	public void setIndustrysList(List<ClassMasterDto> industrysList) {
		this.industrysList = industrysList;
	}

	public List<ClassMasterDto> getCompetencyList() {
		return competencyList;
	}

	public void setCompetencyList(List<ClassMasterDto> competencyList) {
		this.competencyList = competencyList;
	}

	public List<ClassMasterDto> getSpecializedTypeList() {
		return specializedTypeList;
	}

	public void setSpecializedTypeList(List<ClassMasterDto> specializedTypeList) {
		this.specializedTypeList = specializedTypeList;
	}

	public List<ClassMasterDto> getWorkingLifeList() {
		return workingLifeList;
	}

	public void setWorkingLifeList(List<ClassMasterDto> workingLifeList) {
		this.workingLifeList = workingLifeList;
	}

	public List<ClassMasterDto> getEducationList() {
		return educationList;
	}

	public void setEducationList(List<ClassMasterDto> educationList) {
		this.educationList = educationList;
	}

	public List<ClassMasterDto> getJobNatureList() {
		return jobNatureList;
	}

	public void setJobNatureList(List<ClassMasterDto> jobNatureList) {
		this.jobNatureList = jobNatureList;
	}

	public List<ClassMasterDto> getLangCapaList() {
		return langCapaList;
	}

	public void setLangCapaList(List<ClassMasterDto> langCapaList) {
		this.langCapaList = langCapaList;
	}

	public List<ClassMasterDto> getMasteryList() {
		return masteryList;
	}

	public void setMasteryList(List<ClassMasterDto> masteryList) {
		this.masteryList = masteryList;
	}

	public List<ClassMasterDto> getComputerGradeList() {
		return computerGradeList;
	}

	public void setComputerGradeList(List<ClassMasterDto> computerGradeList) {
		this.computerGradeList = computerGradeList;
	}

	public List<ClassMasterDto> getSalaryList() {
		return salaryList;
	}

	public void setSalaryList(List<ClassMasterDto> salaryList) {
		this.salaryList = salaryList;
	}

	public void setCityList(List<CityDto> cityList) {
		this.cityList = cityList;
	}

	public void setAreaList(List<AreaDto> areaList) {
		this.areaList = areaList;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public void setHotCompetencyList(List<HotCompetencysDto> hotCompetencyList) {
		this.hotCompetencyList = hotCompetencyList;
	}

	public List<HotCompetencysDto> getHotCompetencyList() {
		return hotCompetencyList;
	}

	public void setImageAdList(List<SysAdDto> imageAdList) {
		this.imageAdList = imageAdList;
	}

	public List<SysAdDto> getImageAdList() {
		return imageAdList;
	}

	public void setTextAdList(List<SysAdDto> textAdList) {
		this.textAdList = textAdList;
	}

	public List<SysAdDto> getTextAdList() {
		return textAdList;
	}
	public String getHtmlServer() {
		return htmlServer;
	}
	public void setHtmlServer(String htmlServer) {
		this.htmlServer = htmlServer;
	}
	public void setAgeList(List<ClassMasterDto> ageList) {
		this.ageList = ageList;
	}
	public List<ClassMasterDto> getAgeList() {
		return ageList;
	}
	/**
	 * @return the blogUserInfoDto
	 */
	public BlogUserInfoDto getBlogUserInfoDto() {
		return blogUserInfoDto;
	}
	/**
	 * @param blogUserInfoDto the blogUserInfoDto to set
	 */
	public void setBlogUserInfoDto(BlogUserInfoDto blogUserInfoDto) {
		this.blogUserInfoDto = blogUserInfoDto;
	}
	/**
	 * @return the session
	 */
	public Map<String, Object> getSession() {
		return session;
	}
	/**
	 * @param session the session to set
	 */
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}




}
