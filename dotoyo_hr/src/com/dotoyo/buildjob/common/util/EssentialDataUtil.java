package com.dotoyo.buildjob.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.sys.dto.SysFilterWordDto;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-21
 * @description 加载基础数据
 *
 */
public class EssentialDataUtil {

	private static SqlMapClientTemplate sqlMapClientTemplate;

	/*private static List<ClassMasterDto> industrysList;// 行业
	private static List<ClassMasterDto> competencyList;// 职能
	private static List<ClassMasterDto> specializedTypeList; // 专业
	private static List<ClassMasterDto> workingLifeList;// 工作年限
	private static List<ClassMasterDto> educationList;// 学历
	private static List<ClassMasterDto> jobNatureList;// 工作性质
	private static List<ClassMasterDto> langCapaList;// 语言能力
	private static List<ClassMasterDto> masteryList;// 掌握程度
	private static List<ClassMasterDto> computerGradeList;// 计算机等级
	private static List<ClassMasterDto> salaryList;// 月薪


	private static List<ProvinceDto> provinceList;// 省份
	private static List<HotCityDto> hotCityList;// 热点城市
	private static List<HotCompetencysDto> hotCompetencyList;// 热点职能
	private static List<CitySiteDto> citySiteList;// 城市站点
*/
	public static List<ClassMasterDto> engineeringConsultantsList = new ArrayList<ClassMasterDto>();// 工程专业顾问
	public static List<ClassMasterDto> specialConstructionWorksList = new ArrayList<ClassMasterDto>();;// 工程专业承包
	public static List<ClassMasterDto> externalServiceProjectList = new ArrayList<ClassMasterDto>();;// 工程相关服务
	public static List<ClassMasterDto> engineeringResearchList = new ArrayList<ClassMasterDto>();;// 工程科学研究

	private EssentialDataUtil() {
	}

	/**
	 * 加载专业类型数据
	 */
	@SuppressWarnings("unchecked")
	public static List<ClassMasterDto> querySpecializeListLikeCode(String code) {
		return sqlMapClientTemplate.queryForList("querySpecializeListLikeCode",
				code);
	}

	/**
	 * 根据parentCode加载基础数据。
	 */
	@SuppressWarnings("unchecked")
	public static List<ClassMasterDto> queryEssentialDataListByParentCode(
			String parentCode) {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode", parentCode);
	}

	/**
	 * 根据code加载基础数据
	 * @param code
	 * @return
	 */
	public static ClassMasterDto getEssentialDataBycode(String code) {
		return (ClassMasterDto) sqlMapClientTemplate.queryForObject(
				"getClassMasterByCode", code);
	}

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		EssentialDataUtil.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}
	@SuppressWarnings("unchecked")
	public static List<SysFilterWordDto> getFilterWordsByWord(){
//		Map<String,Object> paraMap = new HashMap<String,Object>();
//		paraMap.put("words", word);
		return sqlMapClientTemplate.queryForList("querySysFilterWordsList", null);
	}
	/*public static void setIndustrysList(List<ClassMasterDto> industrysList) {
		EssentialDataUtil.industrysList = industrysList;
	}

	public static List<ClassMasterDto> getIndustrysList() {
		return industrysList;
	}

	public static void setProvinceList(List<ProvinceDto> provinceList) {
		EssentialDataUtil.provinceList = provinceList;
	}

	public static List<ProvinceDto> getProvinceList() {
		return provinceList;
	}

	public static void setHotCityList(List<HotCityDto> hotCityList) {
		EssentialDataUtil.hotCityList = hotCityList;
	}

	public static List<HotCityDto> getHotCityList() {
		return hotCityList;
	}

	public static void setCompetencyList(List<ClassMasterDto> competencyList) {
		EssentialDataUtil.competencyList = competencyList;
	}

	public static List<ClassMasterDto> getCompetencyList() {
		return competencyList;
	}

	public static List<ClassMasterDto> getSpecializedTypeList() {
		return specializedTypeList;
	}

	public static void setSpecializedTypeList(
			List<ClassMasterDto> specializedTypeList) {
		EssentialDataUtil.specializedTypeList = specializedTypeList;
	}

	public static List<ClassMasterDto> getWorkingLifeList() {
		return workingLifeList;
	}

	public static void setWorkingLifeList(List<ClassMasterDto> workingLifeList) {
		EssentialDataUtil.workingLifeList = workingLifeList;
	}

	public static List<ClassMasterDto> getEducationList() {
		return educationList;
	}

	public static void setEducationList(List<ClassMasterDto> educationList) {
		EssentialDataUtil.educationList = educationList;
	}

	public static List<ClassMasterDto> getJobNatureList() {
		return jobNatureList;
	}

	public static void setJobNatureList(List<ClassMasterDto> jobNatureList) {
		EssentialDataUtil.jobNatureList = jobNatureList;
	}

	public static List<ClassMasterDto> getLangCapaList() {
		return langCapaList;
	}

	public static void setLangCapaList(List<ClassMasterDto> langCapaList) {
		EssentialDataUtil.langCapaList = langCapaList;
	}

	public static List<ClassMasterDto> getMasteryList() {
		return masteryList;
	}

	public static void setMasteryList(List<ClassMasterDto> masteryList) {
		EssentialDataUtil.masteryList = masteryList;
	}

	public static List<ClassMasterDto> getComputerGradeList() {
		return computerGradeList;
	}

	public static void setComputerGradeList(List<ClassMasterDto> computerGradeList) {
		EssentialDataUtil.computerGradeList = computerGradeList;
	}

	public static List<ClassMasterDto> getSalaryList() {
		return salaryList;
	}

	public static void setSalaryList(List<ClassMasterDto> salaryList) {
		EssentialDataUtil.salaryList = salaryList;
	}*/

	public static List<ClassMasterDto> getEngineeringConsultantsList() {
		return engineeringConsultantsList;
	}

	public static void setEngineeringConsultantsList(
			List<ClassMasterDto> engineeringConsultantsList) {
		EssentialDataUtil.engineeringConsultantsList = engineeringConsultantsList;
	}

	public static List<ClassMasterDto> getSpecialConstructionWorksList() {
		return specialConstructionWorksList;
	}

	public static void setSpecialConstructionWorksList(
			List<ClassMasterDto> specialConstructionWorksList) {
		EssentialDataUtil.specialConstructionWorksList = specialConstructionWorksList;
	}

	public static List<ClassMasterDto> getExternalServiceProjectList() {
		return externalServiceProjectList;
	}

	public static void setExternalServiceProjectList(
			List<ClassMasterDto> externalServiceProjectList) {
		EssentialDataUtil.externalServiceProjectList = externalServiceProjectList;
	}

	public static List<ClassMasterDto> getEngineeringResearchList() {
		return engineeringResearchList;
	}

	public static void setEngineeringResearchList(
			List<ClassMasterDto> engineeringResearchList) {
		EssentialDataUtil.engineeringResearchList = engineeringResearchList;
	}

	/*public static void setHotCompetencyList(List<HotCompetencysDto> hotCompetencyList) {
		EssentialDataUtil.hotCompetencyList = hotCompetencyList;
	}

	public static List<HotCompetencysDto> getHotCompetencyList() {
		return hotCompetencyList;
	}

	public static void setCitySiteList(List<CitySiteDto> citySiteList) {
		EssentialDataUtil.citySiteList = citySiteList;
	}

	public static List<CitySiteDto> getCitySiteList() {
		return citySiteList;
	}*/

}
