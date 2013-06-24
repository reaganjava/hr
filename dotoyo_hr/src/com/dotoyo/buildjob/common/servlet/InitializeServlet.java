package com.dotoyo.buildjob.common.servlet;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.danga.MemCached.MemCachedClient;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.CitySiteDto;
import com.dotoyo.buildjob.common.dto.HotCityDto;
import com.dotoyo.buildjob.common.dto.HotCompetencysDto;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.common.util.EssentialDataUtil;
import com.dotoyo.buildjob.common.util.PropertiesValue;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-22
 * @description
 *
 */
public class InitializeServlet extends HttpServlet{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(InitializeServlet.class);
	private AbstractApplicationContext tx = null;
	private SqlMapClientTemplate sqlMapClientTemplate;
	private MemCachedClient mc;
	/**
	 * 加载系统所需基础数据
	 */
	public void init() throws ServletException {
		String[] app = { "applicationContext*.xml" };
		tx = new ClassPathXmlApplicationContext(app);
		sqlMapClientTemplate = (SqlMapClientTemplate) tx
				.getBean("sqlMapClientTemplate");
		mc = (MemCachedClient) tx.getBean("memcachedClient");
		mc.set("industrysList", loadIndustrys(mc));// 行业
		mc.set("specializedTypeList", loadSpecializedTypeList());// 专业
		mc.set("provinceList", loadProvinceData());// 省份
		mc.set("hotCityList", loadHotCity());// 热点城市
		mc.set("competencyList", loadCompetencys());// 职能
		mc.set("workingLifeList", loadWorkingLife());// 工作年限
		mc.set("educationList", loadEducation());// 学历
		mc.set("jobNatureList", loadJobNature());// 工作性质
		mc.set("langCapaList", loadLangCapa());// 语言能力
		mc.set("masteryList", loadMastery());// 掌握程度
		mc.set("computerGradeList", loadComputerGrade());// 计算机等级
		mc.set("salaryList", loadSalary());// 月薪
		mc.set("hotCompetencyList", loadHotCompetencys());// 热点职能
		mc.set("citySiteList", loadCitySites());// 城市站点
		mc.set("certificateTypeList", loadCertType());// 证书类型
		mc.set("registerStatusList", loadRegisterStatus());// 注册状况
		mc.set("zhiyeCertList", loadZhiyeCert());// 执业证书
		mc.set("zhichengCertList", loadZhichengCert());// 职称证书
		mc.set("companySizeList", loadCompanySize());// 单位规模
		mc.set("ageList", loadAgeList());// 年龄基础数据

		setPropertiesValueToMc();
		//topPic();
	}

	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadCompanySize() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.COMPANY_SIZE);
	}

	/**
	 * 将资源文件中相关信息放入mc中。
	 */
	public void setPropertiesValueToMc(){
		try {
			mc.set("fileServerURL",PropertiesValue.getPropertyValue("fileServerURL"));
			mc.set("hotCityImagePath", PropertiesValue.getPropertyValue("hotCityImagePath"));
			mc.set("citySiteImagePath", PropertiesValue.getPropertyValue("citySiteImagePath"));
		} catch (Exception e) {
			logger.error(e);
		}
	}


	/**
	 * 加载年龄基础数据
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadAgeList(){
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.BASIS_AGE_DATA);
	}

	/**
	 * 加载职称证书
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadZhichengCert() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.ZHICHENG_CERT);
	}

	/**
	 * 加载执业证书
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadZhiyeCert() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.ZHIYE_CERT);
	}

	/**
	 * 加载注册状况
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadRegisterStatus() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.REGISTER_STATUS);
	}

	/**
	 * 加载证书类型
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadCertType() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.CERT_TYPE);
	}

	/**
	 * 加载城市站点
	 */
	@SuppressWarnings("unchecked")
	public List<CitySiteDto> loadCitySites() {
		return sqlMapClientTemplate.queryForList("queryCitySites",
				ApplicationConstant.SHOW_THE_NUMBER_OF_CITY_SITES);
	}

	/**
	 * 加载热点职能加载
	 */
	@SuppressWarnings("unchecked")
	public List<HotCompetencysDto> loadHotCompetencys() {
		return sqlMapClientTemplate.queryForList("queryHotCompetencys",
				ApplicationConstant.NUMBER_OF_HOT_FUNCTIONS_OF_THE_DISPLAY);
	}

	/**
	 * 加载热点招聘城市
	 */
	@SuppressWarnings("unchecked")
	public List<HotCityDto> loadHotCity() {
		return sqlMapClientTemplate.queryForList("queryHotCityList");
	}

	/**
	 * 加载省份数据
	 */
	@SuppressWarnings("unchecked")
	public List<ProvinceDto> loadProvinceData() {
		return sqlMapClientTemplate.queryForList("queryProvinceList");
	}

	/**
	 * 学历要求数据
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadEducation() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.EDUCATION);
	}

	/**
	 * 工作年限
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadWorkingLife() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.WORKINGLIFE);
	}

	/**
	 * 语言能力
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadLangCapa() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.LANG_CAPA);
	}

	/**
	 * 掌握程度
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadMastery() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.MASTERY);
	}

	/**
	 * 计算机能力
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadComputerGrade() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.COMPUTER_GRADE);
	}

	/**
	 * 工作性质
	 *
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadJobNature() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.JOB_NATURE);
	}

	/**
	 * 月薪
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadSalary() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.SALARY);
	}

	/**
	 * 加载职能信息
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadCompetencys() {
		return sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.COMPETENCY);
	}

	/**
	 * 加载行业基础数据,根据参数来加载行业大类、细分等。
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadIndustrys(MemCachedClient mc) {
		List<ClassMasterDto> tList = new ArrayList<ClassMasterDto>();
		List<ClassMasterDto> industrysList = new ArrayList<ClassMasterDto>();

		tList = sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.ENGINEERING_CONSULTANTS);
		for (ClassMasterDto classMasterDto : tList) {
			EssentialDataUtil.getEngineeringConsultantsList().add(classMasterDto);
		}
		mc.add("engineeringConsultantsList", EssentialDataUtil.getEngineeringConsultantsList());

		tList.clear();
		tList = sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.SPECIAL_CONSTRUCTION_WORKS);
		for (ClassMasterDto classMasterDto : tList) {
			EssentialDataUtil.getSpecialConstructionWorksList().add(
					classMasterDto);
		}
		mc.add("specialConstructionWorksList", EssentialDataUtil.getSpecialConstructionWorksList());

		tList.clear();
		tList = sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.EXTERNAL_SERVICE_PROJECT);
		for (ClassMasterDto classMasterDto : tList) {
			EssentialDataUtil.getExternalServiceProjectList().add(
					classMasterDto);
		}
		mc.add("externalServiceProjectList", EssentialDataUtil.getExternalServiceProjectList());

		tList.clear();
		tList = sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentCode",
				ApplicationConstant.ENGINEERING_RESEARCH);
		for (ClassMasterDto classMasterDto : tList) {
			EssentialDataUtil.getEngineeringResearchList().add(classMasterDto);
		}
		mc.add("engineeringResearchList", EssentialDataUtil.getEngineeringResearchList());
		industrysList = sqlMapClientTemplate.queryForList(
				"queryEssentialDataListByParentLikeCode",
				ApplicationConstant.INDUSTRY);
		return industrysList;
	}

	/**
	 * 加载专业数据SPECIALIZE_TYPE
	 */
	@SuppressWarnings("unchecked")
	public List<ClassMasterDto> loadSpecializedTypeList() {
		return sqlMapClientTemplate.queryForList("querySpecializeListLikeCode",
				ApplicationConstant.SPECIALIZE_TYPE);
	}

}
