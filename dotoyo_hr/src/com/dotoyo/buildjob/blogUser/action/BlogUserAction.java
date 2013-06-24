package com.dotoyo.buildjob.blogUser.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.dotoyo.buildjob.blogUser.service.IBlogUserService;
import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.AreaDto;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.CityDto;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.CacheManager;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

public class BlogUserAction extends BuildJobAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 259996488958459461L;
	private BlogUserInfoDto blogUserInfoDto;
	private IBlogUserService blogUserService;
	private List<ClassMasterDto> industrysList;// 行业列表
	private List<ClassMasterDto> specializedTypeList;// 专业列表
	private List<ProvinceDto> provinceList;// 省份列表
	private List<CityDto> cityList;// 城市列表
	private List<AreaDto> areaList;// 省份列表
	private List<ClassMasterDto> competencyList;// 职能列表
	private List<ClassMasterDto> educationList;// 学历列表
	private List<ClassMasterDto> jobNatureList;// 工作性质列表
	private List<ClassMasterDto> langCapaList;// 语言能力列表
	private List<ClassMasterDto> masteryList;// 掌握程度列表
	private List<ClassMasterDto> computerGradeList;// 计算机等级列表
	private List<ClassMasterDto> workingLifeList;// 工作年限列表

	@SuppressWarnings("unchecked")
	public String toCompleteBlogUserInfo() {

		industrysList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("industrysList");
		specializedTypeList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("specializedTypeList");
		provinceList = (List<ProvinceDto>) CacheManager
				.getInstanceMemcachedClient().get("provinceList");
		cityList = new ArrayList<CityDto>();
		areaList = new ArrayList<AreaDto>();
		competencyList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("competencyList");
		educationList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("educationList");
		jobNatureList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("jobNatureList");
		langCapaList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("langCapaList");
		masteryList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("masteryList");
		computerGradeList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("computerGradeList");
		workingLifeList = (List<ClassMasterDto>) CacheManager
				.getInstanceMemcachedClient().get("workingLifeList");

		CacheManager.getInstanceMemcachedClient().get("hotCityList");
		return "toCompleteBlogUserInfo";
	}

	public String saveUpdateBlogUserInfo() {
		blogUserInfoDto.setUserName(this.getLoginUserInfo().getUserName());
		blogUserInfoDto.setUserInfoUpdateDate(new Date());
		blogUserService.updateBlogUserInfo(blogUserInfoDto);

		// 更新session中用户信息
		request = ServletActionContext.getRequest();
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		loginUserInfo.setUserType(blogUserInfoDto.getUserType());
		request.getSession().setAttribute(
				ApplicationConstant.SESSION_PARAMETER_USER_INFO, loginUserInfo);
		return "saveUpdateBlogUserInfo";
	}

	public BlogUserInfoDto getBlogUserInfoDto() {
		return blogUserInfoDto;
	}

	public void setBlogUserInfoDto(BlogUserInfoDto blogUserInfoDto) {
		this.blogUserInfoDto = blogUserInfoDto;
	}

	public IBlogUserService getBlogUserService() {
		return blogUserService;
	}

	public void setBlogUserService(IBlogUserService blogUserService) {
		this.blogUserService = blogUserService;
	}

	public List<ClassMasterDto> getIndustrysList() {
		return industrysList;
	}

	public void setIndustrysList(List<ClassMasterDto> industrysList) {
		this.industrysList = industrysList;
	}

	public List<ClassMasterDto> getSpecializedTypeList() {
		return specializedTypeList;
	}

	public void setSpecializedTypeList(List<ClassMasterDto> specializedTypeList) {
		this.specializedTypeList = specializedTypeList;
	}

	public List<ProvinceDto> getProvinceList() {
		return provinceList;
	}

	public void setProvinceList(List<ProvinceDto> provinceList) {
		this.provinceList = provinceList;
	}

	public List<CityDto> getCityList() {
		return cityList;
	}

	public void setCityList(List<CityDto> cityList) {
		this.cityList = cityList;
	}

	public List<AreaDto> getAreaList() {
		return areaList;
	}

	public void setAreaList(List<AreaDto> areaList) {
		this.areaList = areaList;
	}

	public List<ClassMasterDto> getCompetencyList() {
		return competencyList;
	}

	public void setCompetencyList(List<ClassMasterDto> competencyList) {
		this.competencyList = competencyList;
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

	public List<ClassMasterDto> getWorkingLifeList() {
		return workingLifeList;
	}

	public void setWorkingLifeList(List<ClassMasterDto> workingLifeList) {
		this.workingLifeList = workingLifeList;
	}

}
