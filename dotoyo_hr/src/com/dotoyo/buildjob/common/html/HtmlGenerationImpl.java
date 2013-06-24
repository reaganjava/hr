package com.dotoyo.buildjob.common.html;



import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dotoyo.buildjob.applyJobCenter.action.ApplyJobAction;
import com.dotoyo.buildjob.applyJobCenter.service.IApplyJobService;
import com.dotoyo.buildjob.certificateCenter.action.CertificateAction;
import com.dotoyo.buildjob.certificateCenter.service.ICertificateService;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.CitySiteDto;
import com.dotoyo.buildjob.common.dto.HotCompetencysDto;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.common.util.CacheManager;
import com.dotoyo.buildjob.common.util.HtmlGenerationFactory;
import com.dotoyo.buildjob.common.util.PropertiesValue;
import com.dotoyo.buildjob.headhunterCenter.action.HeadhunterCenterAction;
import com.dotoyo.buildjob.headhunterCenter.service.IJobInfoService;
import com.dotoyo.buildjob.innovationSalon.action.SalonAction;
import com.dotoyo.buildjob.innovationSalon.dto.HostUnitDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.service.ISalonService;
import com.dotoyo.buildjob.peopleExcavate.action.PeopleExcavateAction;
import com.dotoyo.buildjob.peopleExcavate.service.IPeopleExcavateService;
import com.dotoyo.buildjob.sys.dto.SysAdDto;
import com.dotoyo.buildjob.sys.service.ISysAdService;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;
/**
 * html 代码 生成器
 * @author wisdy.xiao
 *
 */
public class HtmlGenerationImpl extends HtmlGeneration{
	protected HtmlGenerationImpl(){
	}
	/**
	 * 刷新顶部和底部页面
	 * @param context
	 */
	public void refreshTopAndBottomPage(){
		// 静态页面路径
		String htmlPath = htmlRoot + File.separator;
		/** 创建顶部页面 **/
		//createHead(htmlPath + "common"+File.separator+"head.html");
		/** 创建底部页面 **/
		//createBottom(htmlPath + "common"+File.separator+"bottom.html");
		/** 创建样式页面**/
		createJsAndCss(htmlPath + "common"+File.separator+"JsAndCss.html");
	}
	/**
	 * 刷新主页面

	 */
	public synchronized void refreshHomePage(){
		// 静态页面路径
		String htmlPath = htmlRoot + File.separator;
		/** 创建首页主页面**/
		createHomePageHtml(htmlPath + "homePage.html");
		/** 创建首页顶部页面（以登陆form为界点）**/
		createHomeHeadHtml(htmlPath + "homeHead.html");
		/** 创建首页底部页面（以登陆form为界点）**/
		createHomeBottomHtml(htmlPath + "homeBottom.html");
	}
	/**
	 * 刷新猎头主页面

	 */
	public synchronized void refreshHeadhunterCenterPage(){
		String htmlPath = htmlRoot + File.separator;
		createHeadhunterCenterIndex(((ISysAdService)tx.getBean("sysAdService")),((IJobInfoService)tx.getBean("jobInfoService")), htmlPath + "headhunterCenter"+File.separator+"headhunterCenterIndex");
	}
	/**
	 * 刷新猎头主页面广告
	 *
	 */
	public synchronized void refreshHeadhunterCenterAdvertPage(){
		String htmlPath = htmlRoot + File.separator;
		createHeadHunterCenterIndexAdvert(((ISysAdService)tx.getBean("sysAdService")),null, htmlPath + "headhunterCenter"+File.separator+"headhunterCenterIndex");
	}
	/**
	 * 刷新人才中心主页面

	 */
	public synchronized void refreshApplyJobPage(){
		String htmlPath = htmlRoot + File.separator;
		createApplyJobHtml((IApplyJobService)(tx.getBean("applyJobService")), htmlPath + "applyJobCenter"+File.separator+"applyJobCenterIndex.html");
	}
	/**
	 * 刷新人才挖掘主页面

	 */
	public synchronized void refreshPeopleExcavatePage(){
		String htmlPath = htmlRoot + File.separator;
		createPeopleExcavateHtml(null,(IPeopleExcavateService)(tx.getBean("peopleExcavateService")), htmlPath + "peopleExcavate"+File.separator+"peopleExcavateIndex");
	}
	/**
	 * 刷新人才挖掘主页面右边广告

	 */
	public synchronized void refreshPeopleExcavateAdvertPage(){
		String htmlPath = htmlRoot + File.separator;
		createPeopleExcavateAdvertHtml((ISysAdService)tx.getBean("sysAdService"),null, htmlPath + "peopleExcavate"+File.separator+"peopleExcavateIndex");
	}
	/**
	 * 刷新猎证中心主页面

	 */
	public synchronized void refreshCertificateCenterPage(){
		String htmlPath = htmlRoot + File.separator;
		createCertificateHtml((ICertificateService)(tx.getBean("certificateService")), htmlPath + "certificateCenter"+File.separator+"certificateCenterIndex.html");
	}
	/**
	 * 刷新创业沙龙主页面

	 */
	public synchronized void refreshSalonPage(){
		String htmlPath = htmlRoot + File.separator;
		createSalonHtml((ISalonService)(tx.getBean("salonService")), htmlPath + "innovationSalon"+File.separator+"salonIndex");
	}
	/**
	 * 刷新往届沙龙部分
	 */
	public void refreshSalonOldPage() {
		String[] app = { "applicationContext*.xml" };
		AbstractApplicationContext tx = new ClassPathXmlApplicationContext(app);
		String htmlPath = htmlRoot + File.separator;
		createSalonOldHtml((ISalonService)(tx.getBean("salonService")), htmlPath + "innovationSalon"+File.separator+"salonOld.html");
	}
	/**
	 * 刷新创业沙龙主页面广告

	 */
	public synchronized void refreshSalonAdvertPage(){
		String htmlPath = htmlRoot + File.separator;
		createSalonAdvertHtml((ISysAdService)tx.getBean("sysAdService"), htmlPath + "innovationSalon"+File.separator+"salonIndex");
	}
	/**
	 * 刷新顶部页面广告
	 */
	public void refreshTopAdvert() {
		String htmlPath = htmlRoot + File.separator;
		createTopAdvertHtml((ISysAdService)tx.getBean("sysAdService"),htmlPath + "common" + File.separator + "TopAd.html");
	}
	/**
	 * 刷新创业沙龙之线下沙龙
	 */
	public void refreshSalonOfflinePage(List<SalonInfoDto> salonlist){
		String htmlPath = htmlRoot + File.separator;
		createSalonOfflineHtml((ISalonService)(tx.getBean("salonService")),  htmlPath + "innovationSalon"+File.separator+"salonIndex",salonlist);

	}
	/**
	 * 刷新创业沙龙之线上沙龙
	 */
	public void refreshSalonOnlinePage(List<SalonInfoDto> salonlist){
		String htmlPath = htmlRoot + File.separator;
		createSalonOnlineHtml((ISalonService)(tx.getBean("salonService")),  htmlPath + "innovationSalon"+File.separator+"salonIndex",salonlist);

	}
	/**
	 * 刷新创业沙龙之经典沙龙
	 */
	public void refreshSalonClassicPage(List<SalonInfoDto> salonlist){
		String htmlPath = htmlRoot + File.separator;
		createSalonClassicHtml((ISalonService)(tx.getBean("salonService")),  htmlPath + "innovationSalon"+File.separator+"salonIndex",salonlist);

	}
	/**
	 * 刷新创业沙龙之经典文章
	 */
	public void refreshSalonClassicArticlePage(List<SalonArticleDto> articlelist){
		String htmlPath = htmlRoot + File.separator;
		createSalonClassicArticleHtml((ISalonService)(tx.getBean("salonService")),  htmlPath + "innovationSalon"+File.separator+"salonIndex",articlelist);

	}
	/**
	 * 刷新创业沙龙之主办单位
	 */
	public void refreshSalonHostUnitPage(List<HostUnitDto> hostlist){
		String htmlPath = htmlRoot + File.separator;
		createSalonHostUnitHtml((ISalonService)(tx.getBean("salonService")),  htmlPath + "innovationSalon"+File.separator+"salonIndex",hostlist);
	}
	/**
	 * create all
	 * @param context
	 */
	public synchronized void createAll(){
		// 静态页面路径
		String htmlPath = htmlRoot + File.separator;
		/** 创建顶部页面 **/
		//createHead(htmlPath + "common"+File.separator+"head.html");

		/** 创建底部页面 **/
		//createBottom(htmlPath + "common"+File.separator+"bottom.html");
		/** 创建样式页面**/
		createJsAndCss(htmlPath + "common"+File.separator+"JsAndCss.html");

		/** 创建首页主页面**/
		//createHomePageHtml(htmlPath + "homePage.html");
		/** 创建首页顶部页面（以登陆form为界点）**/
		createHomeHeadHtml(htmlPath + "homeHead.html");
		/** 创建首页底部页面（以登陆form为界点）**/
		createHomeBottomHtml(htmlPath + "homeBottom.html");

		/** 创建猎头中心主页面**/
		createHeadhunterCenterIndex(null,((IJobInfoService)tx.getBean("jobInfoService")), htmlPath + "headhunterCenter"+File.separator+"headhunterCenterIndex");
		/** 创建猎头中心广告**/
		createHeadHunterCenterIndexAdvert(((ISysAdService)tx.getBean("sysAdService")),null,htmlPath + "headhunterCenter"+File.separator+"headhunterCenterIndex");

		/** 创建人才中心主页面 **/
		createApplyJobHtml((IApplyJobService)(tx.getBean("applyJobService")),  htmlPath + "applyJobCenter"+File.separator+"applyJobCenterIndex.html");

		/** 创建人才挖掘主页面 **/
		createPeopleExcavateHtml((ISysAdService)tx.getBean("sysAdService"),(IPeopleExcavateService)(tx.getBean("peopleExcavateService")),  htmlPath + "peopleExcavate"+File.separator+"peopleExcavateIndex");
		/** 创建人才挖掘主页面右边广告 **/
		createPeopleExcavateAdvertHtml((ISysAdService)tx.getBean("sysAdService"),null, htmlPath + "peopleExcavate"+File.separator+"peopleExcavateIndex");

		/** 创建猎证中心主页面 **/
		createCertificateHtml((ICertificateService)(tx.getBean("certificateService")),  htmlPath + "certificateCenter"+File.separator+"certificateCenterIndex.html");

		/** 创建创业沙龙主页面 **/
		createSalonHtml((ISalonService)(tx.getBean("salonService")),  htmlPath + "innovationSalon"+File.separator+"salonIndex");
		/** 创建创业沙龙主页面广告 **/
		createSalonAdvertHtml((ISysAdService)tx.getBean("sysAdService"), htmlPath + "innovationSalon"+File.separator+"salonIndex");
		/** 创建创业沙龙主页面之线下沙龙 **/
		createSalonOfflineHtml((ISalonService)(tx.getBean("salonService")),  htmlPath + "innovationSalon"+File.separator+"salonIndex",null);
		/** 创建创业沙龙主页面之线上沙龙 **/
		createSalonOnlineHtml((ISalonService)(tx.getBean("salonService")),  htmlPath + "innovationSalon"+File.separator+"salonIndex",null);
		/** 创建创业沙龙主页面之主办单位 **/
		createSalonHostUnitHtml((ISalonService)(tx.getBean("salonService")),  htmlPath + "innovationSalon"+File.separator+"salonIndex",null);
		/** 创建创业沙龙主页面之经典沙龙 **/
		createSalonClassicHtml((ISalonService)(tx.getBean("salonService")),  htmlPath + "innovationSalon"+File.separator+"salonIndex",null);
		/** 创建创业沙龙主页面之文章 **/
		createSalonClassicArticleHtml((ISalonService)(tx.getBean("salonService")),  htmlPath + "innovationSalon"+File.separator+"salonIndex",null);

		/**刷新往届沙龙部分**/
		//createSalonOldHtml((ISalonService)(tx.getBean("salonService")), htmlPath + "innovationSalon"+File.separator+"salonOld.html");

		/** 顶部图片广告 **/
		createTopAdvertHtml((ISysAdService)tx.getBean("sysAdService"),htmlPath + "common" + File.separator + "TopAd.html");
	}
	/**
	 * create top.html
	 * @param context
	 */
	/*
	private void createHead(String htmlPath){
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("rootPath", rootPath);
		HtmlGenerationFactory.getInstance().crateHTML(data,"common"+File.separator+"head.ftl",htmlPath,templateRoot);
	}*/
	/**
	 * create bottom.html
	 * @param context
	 */
	/*
	private void createBottom(String htmlPath){
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("rootPath", rootPath);
		HtmlGenerationFactory.getInstance().crateHTML(data,"common"+File.separator+"bottom.ftl",htmlPath,templateRoot);
	}*/
	/**
	 * create JsAndCss
	 * @param context
	 */

	private void createJsAndCss(String htmlPath){
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("rootPath", rootPath);
		HtmlGenerationFactory.getInstance().crateHTML(data,"common"+File.separator+"JsAndCss.ftl",htmlPath,templateRoot);
	}
	private void createHeadHunterCenterIndexAdvert(ISysAdService sysAdService,IJobInfoService jobInfoService, String htmlPath){
		HeadhunterCenterData hc = new HeadhunterCenterData();
		hc.setSysAdService(sysAdService);
		hc.refreshAdvertData();
		HtmlGenerationFactory.getInstance().crateHTML(hc.getAdvertData(),"headhunterCenter"+File.separator+"headhunterCenterIndexAdvert.ftl",htmlPath + "Advert.html",templateRoot);
	}
	/**
	 * create head hunter index.html
	 * @param context
	 */
	private void createHeadhunterCenterIndex(ISysAdService sysAdService,IJobInfoService jobInfoService, String htmlPath){
		HeadhunterCenterData hc = new HeadhunterCenterData();
		hc.setJobInfoService(jobInfoService);
		//hc.setSysAdService(sysAdService);
		hc.refreshData();
		//上部分
		HtmlGenerationFactory.getInstance().crateHTML(hc.getData(),"headhunterCenter"+File.separator+"headhunterCenterIndexTop.ftl",htmlPath + "Top.html",templateRoot);
		//下部分
		HtmlGenerationFactory.getInstance().crateHTML(hc.getData(),"headhunterCenter"+File.separator+"headhunterCenterIndexBottom.ftl",htmlPath + "Bottom.html",templateRoot);
	}
	private class HeadhunterCenterData{
		private HeadhunterCenterAction headhunterCenterAction;
		private HeadhunterCenterData(){
			this.headhunterCenterAction = new HeadhunterCenterAction();
		}
		private void refreshData(){
			headhunterCenterAction.init();
		}
		private void refreshAdvertData(){
			headhunterCenterAction.loadingAds();
		}
		private Map<String,Object> getData(){
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("FUNCTIONAL_CLASSIFICATIO_BUILDER", ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_BUILDER);
			data.put("FUNCTIONAL_CLASSIFICATIO_DATA_PROCESSOR", ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_DATA_PROCESSOR);
			data.put("FUNCTIONAL_CLASSIFICATIO_MATERIALMAN", ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_MATERIALMAN);
			data.put("FUNCTIONAL_CLASSIFICATIO_SAFETY_MAN", ApplicationConstant.FUNCTIONAL_CLASSIFICATIO_SAFETY_MAN);
			//设置list
			data.put("industrysList", headhunterCenterAction.getIndustrysList());
			data.put("provinceList", headhunterCenterAction.getProvinceList());
			data.put("hotCityList", CacheManager.getInstanceMemcachedClient().get("hotCityList"));
			data.put("competencyList", headhunterCenterAction.getCompetencyList());
			data.put("engineeringConsultantsList", headhunterCenterAction.getEngineeringConsultantsList());
			data.put("specialConstructionWorksList", headhunterCenterAction.getSpecialConstructionWorksList());
			data.put("externalServiceProjectList", headhunterCenterAction.getExternalServiceProjectList());
			data.put("engineeringResearchList", headhunterCenterAction.getEngineeringResearchList());
			data.put("oneFullTimeWorksList", headhunterCenterAction.getOneFullTimeWorksList());
			data.put("oneAdviserWorksList", headhunterCenterAction.getOneAdviserWorksList());
			data.put("onePartTimeWorksList", headhunterCenterAction.getOnePartTimeWorksList());
			data.put("twoFullTimeWorksList", headhunterCenterAction.getTwoFullTimeWorksList());
			data.put("twoAdviserWorksList", headhunterCenterAction.getTwoAdviserWorksList());
			data.put("twoPartTimeWorksList", headhunterCenterAction.getTwoPartTimeWorksList());
			data.put("threeFullTimeWorksList", headhunterCenterAction.getThreeFullTimeWorksList());
			data.put("threeAdviserWorksList", headhunterCenterAction.getThreeAdviserWorksList());
			data.put("threePartTimeWorksList", headhunterCenterAction.getThreePartTimeWorksList());///
			data.put("fourFullTimeWorksList", headhunterCenterAction.getFourFullTimeWorksList());
			data.put("fourAdviserWorksList", headhunterCenterAction.getFourAdviserWorksList());
			data.put("fourPartTimeWorksList", headhunterCenterAction.getFourPartTimeWorksList());
			data.put("fileServerURL", CacheManager.getInstanceMemcachedClient().get("fileServerURL"));
			data.put("hotCityImagePath", CacheManager.getInstanceMemcachedClient().get("hotCityImagePath"));
			//设置title
			data.put("title_hangye", "行业：");
			data.put("title_area", "地区：");
			data.put("title_zhineng", "职能：");
			data.put("title_publicposition", "发布职位");
			data.put("title_projectguwen", "工程专业顾问");
			data.put("title_projectchengbao", "工程专业承包");
			data.put("title_projectservice", "工程相关服务");
			data.put("title_projectresearch", "工程科学研究");
			data.put("title_hangyefenlei", "行业分类");
			data.put("title_bottom_1", "工长/施工员");
			data.put("title_bottom_2", "更多");
			data.put("title_bottom_3", "全职");
			data.put("title_bottom_4", "企业博站链接");
			data.put("title_bottom_5", "顾问");
			data.put("title_bottom_6", "兼职");
			data.put("title_bottom_7", "资料员/档案管理员");
			data.put("title_bottom_8", "材料员/采购员/物资管理员");
			data.put("title_bottom_9", "安全/质检员/安全质量工程师");
			return data;
		}
		private Map<String,Object> getAdvertData(){
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("imageAdList", headhunterCenterAction.getImageAdList());
			data.put("textAdList", headhunterCenterAction.getTextAdList());
			data.put("title_bottom_10", "推荐企业");
			data.put("title_bottom_11", "猎头中心介绍频道");
			data.put("fileServerURL", CacheManager.getInstanceMemcachedClient().get("fileServerURL"));
			return data;
		}

		private void setJobInfoService(IJobInfoService jobInfoService) {
			headhunterCenterAction.setJobInfoService(jobInfoService);
		}

		private void setSysAdService(
				com.dotoyo.buildjob.sys.service.ISysAdService sysAdService) {
			headhunterCenterAction.setSysAdService(sysAdService);
		}

	}

	/**
	 * create home page.html
	 * @param context
	 */
	@SuppressWarnings("unchecked")
	private void createHomePageHtml( String htmlPath){
		Map<String,Object> data = new HashMap<String,Object>();
		List<ProvinceDto> provinceList = (List<ProvinceDto>) CacheManager.getInstanceMemcachedClient().get("provinceList");
		List<CitySiteDto> citySiteList = (List<CitySiteDto>) CacheManager.getInstanceMemcachedClient().get("citySiteList");
		List<HotCompetencysDto> hotCompetencyList = (List<HotCompetencysDto>) CacheManager.getInstanceMemcachedClient().get("hotCompetencyList");
	 	List<ClassMasterDto> competencyList = (List<ClassMasterDto>) CacheManager.getInstanceMemcachedClient().get("competencyList");
		data.put("rootPath", rootPath);
		data.put("provinceList", provinceList);
		data.put("citySiteList", citySiteList);
		data.put("hotCompetencyList", hotCompetencyList);
		data.put("competencyList", competencyList);
		HtmlGenerationFactory.getInstance().crateHTML(data,"homePage.ftl",htmlPath,templateRoot);
	}
	/**
	 * 创建首页底部页面（以登陆form为界点）
	 * @param context
	 * @param htmlPath
	 */
	@SuppressWarnings("unchecked")
	private void createHomeBottomHtml( String htmlPath){
		Map<String,Object> data = new HashMap<String,Object>();
		List<ProvinceDto> provinceList = (List<ProvinceDto>) CacheManager.getInstanceMemcachedClient().get("provinceList");
		ProvinceDto pd = new ProvinceDto();
		pd.setCode("");
		pd.setName(ApplicationConstant.CATEGORYINDEX_No_LIMIT);
		provinceList.add(0, pd);

		List<CitySiteDto> citySiteList = (List<CitySiteDto>) CacheManager.getInstanceMemcachedClient().get("citySiteList");
		List<HotCompetencysDto> hotCompetencyList = (List<HotCompetencysDto>) CacheManager.getInstanceMemcachedClient().get("hotCompetencyList");
	 	List<ClassMasterDto> competencyList = (List<ClassMasterDto>) CacheManager.getInstanceMemcachedClient().get("competencyList");
	 	ClassMasterDto cd = new ClassMasterDto();
	 	cd.setCode("");
	 	cd.setName(ApplicationConstant.CATEGORYINDEX_No_LIMIT);
	 	competencyList.add(0, cd);

	 	data.put("rootPath", rootPath);
		data.put("provinceList", provinceList);
		data.put("citySiteList", citySiteList);
		data.put("hotCompetencyList", hotCompetencyList);
		data.put("competencyList", competencyList);
		HtmlGenerationFactory.getInstance().crateHTML(data,"homeBottom.ftl",htmlPath,templateRoot);
	}
	/**
	 * 创建首页顶部页面（以登陆form为界点）
	 * @param context
	 * @param htmlPath
	 */
	private void createHomeHeadHtml( String htmlPath){
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("rootPath", rootPath);
		HtmlGenerationFactory.getInstance().crateHTML(data,"homeHead.ftl",htmlPath,templateRoot);
	}
	/**
	 * create application job html
	 * @param context
	 * @param htmlPath
	 */
	private void createApplyJobHtml(IApplyJobService applyJobService, String htmlPath){
		ApplyJobData app = new ApplyJobData();
		app.setApplyJobService(applyJobService);
		HtmlGenerationFactory.getInstance().crateHTML(app.getData(),"applyJobCenter"+File.separator+"applyJobCenterIndex.ftl",htmlPath,templateRoot);
	}
	private class ApplyJobData{

		private ApplyJobAction applyJobAction;
		private ApplyJobData(){

			this.applyJobAction = new ApplyJobAction();
		}
		private Map<String,Object> getData(){
			applyJobAction.init();
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("hotCityList", applyJobAction.getHotCityList());
			data.put("advisorList", applyJobAction.getAdvisorList());
			data.put("fullTimeList", applyJobAction.getFullTimeList());
			data.put("partTimeList", applyJobAction.getPartTimeList());
			data.put("hotCityImagePath", CacheManager.getInstanceMemcachedClient().get("hotCityImagePath"));
			return data;
		}
		private void setApplyJobService(IApplyJobService applyJobService){
			applyJobAction.setApplyJobService(applyJobService);
		}
	}
	/**
	 * create people excavate HTML
	 * @param peopleExcavateService
	 * @param context
	 * @param htmlPath
	 */
	private void createPeopleExcavateHtml(ISysAdService sysAdService,IPeopleExcavateService peopleExcavateService, String htmlPath){
		PeopleExcavateData peo = new PeopleExcavateData();
		peo.setPeopleExcavateService(peopleExcavateService);
		//peo.setSysAdService(sysAdService);
		peo.refreshData();
		//上半部分
		HtmlGenerationFactory.getInstance().crateHTML(peo.getData(),"peopleExcavate"+File.separator+"peopleExcavateIndexTop.ftl",htmlPath + "Top.html",templateRoot);
		//下半部分
		HtmlGenerationFactory.getInstance().crateHTML(peo.getData(),"peopleExcavate"+File.separator+"peopleExcavateIndexBottom.ftl",htmlPath + "Bottom.html",templateRoot);
	}
	/**
	 * create people excavate HTML
	 * @param peopleExcavateService
	 * @param context
	 * @param htmlPath
	 */
	private void createPeopleExcavateAdvertHtml(ISysAdService sysAdService,IPeopleExcavateService peopleExcavateService, String htmlPath){
		PeopleExcavateData peo = new PeopleExcavateData();
		peo.setSysAdService(sysAdService);
		peo.refreshAdvertData();
		//广告部分
		HtmlGenerationFactory.getInstance().crateHTML(peo.getAdvertData(),"peopleExcavate"+File.separator+"peopleExcavateIndexAdvert.ftl",htmlPath + "Advert.html",templateRoot);

	}
	private class PeopleExcavateData{

		private PeopleExcavateAction peopleExcavateAction;
		private PeopleExcavateData(){

			peopleExcavateAction = new PeopleExcavateAction();
		}
		/** 刷新数据 **/
		private void refreshData(){
			peopleExcavateAction.init();
		}
		private void refreshAdvertData(){
			peopleExcavateAction.loadPeopleExcavateAd();
		}
		/**
		 * 获取数据
		 * @return
		 */
		private Map<String,Object> getData(){
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("industrysList", peopleExcavateAction.getIndustrysList());
			data.put("specializedTypeList", peopleExcavateAction.getSpecializedTypeList());
			data.put("competencyList", peopleExcavateAction.getCompetencyList());
			data.put("provinceList", peopleExcavateAction.getProvinceList());
			data.put("educationList", peopleExcavateAction.getEducationList());
			data.put("workingLifeList", peopleExcavateAction.getWorkingLifeList());
			data.put("langCapaList", peopleExcavateAction.getLangCapaList());
			data.put("masteryList", peopleExcavateAction.getMasteryList());
			data.put("computerGradeList", peopleExcavateAction.getComputerGradeList());
			data.put("jobNatureList", peopleExcavateAction.getJobNatureList());
			data.put("categoryIndexMap", peopleExcavateAction.getCategoryIndexMap());
			data.put("talentTopList", peopleExcavateAction.getTalentTopList());
			data.put("ageList", CacheManager.getInstanceMemcachedClient().get("ageList"));
			data.put("lIndustrysList", peopleExcavateAction.getlIndustrysList());
			data.put("lSpecializedTypeList", peopleExcavateAction.getlSpecializedTypeList());
			data.put("lCompetencyList", peopleExcavateAction.getlCompetencyList());
			data.put("lProvinceList", peopleExcavateAction.getlProvinceList());
			data.put("fileServerURL", peopleExcavateAction.getFileServerURL());
			return data;
		}
		private Map<String,Object> getAdvertData(){
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("fileServerURL", peopleExcavateAction.getFileServerURL());
			data.put("peopleExcavateAdDto", peopleExcavateAction.getPeopleExcavateAdDto());
			data.put("peopleExcavateAdList", peopleExcavateAction.getPeopleExcavateAdList());
			if(peopleExcavateAction.getPeopleExcavateAdList()!=null){
				data.put("peopleExcavateAdListSize", peopleExcavateAction.getPeopleExcavateAdList().size());
			}else{
				data.put("peopleExcavateAdListSize", 0);
			}
			
			
			return data;
		}
		private void setPeopleExcavateService(IPeopleExcavateService peopleExcavateService){
			peopleExcavateAction.setPeopleExcavateService(peopleExcavateService);
		}
		private void setSysAdService(ISysAdService sysAdService){
			peopleExcavateAction.setSysAdService(sysAdService);
		}
	}
	/**
	 * create salon index HTML
	 * @param peopleExcavateService
	 * @param context
	 * @param htmlPath
	 */
	private void createSalonHtml(ISalonService salonService, String htmlPath){
		SalonData peo = new SalonData();
		peo.setSalonService(salonService);
		peo.recreshData();
		//上半部分
		HtmlGenerationFactory.getInstance().crateHTML(peo.getData(),"innovationSalon"+File.separator+"salonIndexTop.ftl",htmlPath + "Top.html",templateRoot);
		//下半部分
		HtmlGenerationFactory.getInstance().crateHTML(peo.getData(),"innovationSalon"+File.separator+"salonIndexBottom.ftl",htmlPath + "Bottom.html",templateRoot);
	}
	/**
	 * create off line salon index HTML
	 * @param peopleExcavateService
	 * @param context
	 * @param htmlPath
	 */
	private void createSalonOfflineHtml(ISalonService salonService, String htmlPath,List<SalonInfoDto> salonlist){
		SalonData peo = new SalonData();
		peo.setSalonService(salonService);
		peo.refreshOfflineData();
		/** check index online salon is changed, if not, return**/
		Map<String,Object> data = peo.getOfflineSalonData();
		if(salonlist == null){
			HtmlGenerationFactory.getInstance().crateHTML(data,"innovationSalon"+File.separator+"salonIndexOffLine.ftl",htmlPath + "OffLine.html",templateRoot);
		}else{
			List<SalonInfoDto> newsalonlist = (List<SalonInfoDto>)data.get("offlineSalonList");
			if(newsalonlist == null) return;
			for(SalonInfoDto dto : newsalonlist){
				for(SalonInfoDto olddto : salonlist){
					if(dto.getId().equals(olddto.getId())){
						HtmlGenerationFactory.getInstance().crateHTML(data,"innovationSalon"+File.separator+"salonIndexOffLine.ftl",htmlPath + "OffLine.html",templateRoot);
						return;
					}
				}
			}
		}


	}
	/**
	 * create on line salon index HTML
	 * @param peopleExcavateService
	 * @param context
	 * @param htmlPath
	 */
	private void createSalonOnlineHtml(ISalonService salonService, String htmlPath,List<SalonInfoDto> salonlist){
		SalonData peo = new SalonData();
		peo.setSalonService(salonService);
		peo.refreshOnlineData();
		/** check index online salon is changed, if not, return**/
		Map<String,Object> data = peo.getOnlineSalonData();
		if(salonlist == null){
			HtmlGenerationFactory.getInstance().crateHTML(data,"innovationSalon"+File.separator+"salonIndexOnline.ftl",htmlPath + "Online.html",templateRoot);
		}else{
			List<SalonInfoDto> newsalonlist = (List<SalonInfoDto>)data.get("onlineSalonList");
			if(newsalonlist == null) return;
			for(SalonInfoDto dto : newsalonlist){
				for(SalonInfoDto olddto : salonlist){
					if(dto.getId().equals(olddto.getId())){
						HtmlGenerationFactory.getInstance().crateHTML(data,"innovationSalon"+File.separator+"salonIndexOnline.ftl",htmlPath + "Online.html",templateRoot);
						return;
					}
				}
			}
		}
	}
	/**
	 * create host unit salon index HTML
	 * @param peopleExcavateService
	 * @param context
	 * @param htmlPath
	 */
	private void createSalonHostUnitHtml(ISalonService salonService, String htmlPath,List<HostUnitDto> hostlist){
		SalonData peo = new SalonData();
		peo.setSalonService(salonService);
		peo.refreshHostUnitData();
		/** check index host unit salon is changed, if not, return**/
		Map<String,Object> data = peo.getHostUnitData();
		if(hostlist == null){
			HtmlGenerationFactory.getInstance().crateHTML(data,"innovationSalon"+File.separator+"salonIndexHostUnit.ftl",htmlPath + "HostUnit.html",templateRoot);
		}else{
			List<HostUnitDto> newhostlist = (List<HostUnitDto>)data.get("hostUnitList");
			if(newhostlist == null) return;
			for(HostUnitDto dto : newhostlist){
				for(HostUnitDto olddto : hostlist){
					if(dto.getId().equals(olddto.getId())){
						HtmlGenerationFactory.getInstance().crateHTML(data,"innovationSalon"+File.separator+"salonIndexHostUnit.ftl",htmlPath + "HostUnit.html",templateRoot);
						return;
					}
				}
			}
		}


	}
	/**
	 * create classic salon index HTML
	 * @param peopleExcavateService
	 * @param context
	 * @param htmlPath
	 */
	private void createSalonClassicHtml(ISalonService salonService, String htmlPath,List<SalonInfoDto> salonlist){
		SalonData peo = new SalonData();
		peo.setSalonService(salonService);
		peo.refreshClassicData();
		/** check index classic salon is changed, if not, return**/
		Map<String,Object> data = peo.getClassicData();
		if(salonlist == null){
			HtmlGenerationFactory.getInstance().crateHTML(data,"innovationSalon"+File.separator+"salonIndexClassic.ftl",htmlPath + "Classic.html",templateRoot);
		}else{
			List<SalonInfoDto> newsalonlist = (List<SalonInfoDto>)data.get("classicSalonList");
			if(newsalonlist == null) return;
			for(SalonInfoDto dto : newsalonlist){
				for(SalonInfoDto olddto : salonlist){
					if(dto.getId().equals(olddto.getId())){
						HtmlGenerationFactory.getInstance().crateHTML(data,"innovationSalon"+File.separator+"salonIndexClassic.ftl",htmlPath + "Classic.html",templateRoot);
						return;
					}
				}
			}
		}


	}
	/**
	 * create classic article salon index HTML
	 * @param peopleExcavateService
	 * @param context
	 * @param htmlPath
	 */
	private void createSalonClassicArticleHtml(ISalonService salonService, String htmlPath,List<SalonArticleDto> articlelist){
		SalonData peo = new SalonData();
		peo.setSalonService(salonService);
		peo.refreshClassicArticleData();
		/** check index classic article salon is changed, if not, return**/
		Map<String,Object> data = peo.getClassicArticleData();
		if(articlelist == null){
			HtmlGenerationFactory.getInstance().crateHTML(data,"innovationSalon"+File.separator+"salonIndexClassicArticle.ftl",htmlPath + "ClassicArticle.html",templateRoot);
		}else{
			List<SalonArticleDto> newarticlelist = (List<SalonArticleDto>)data.get("salonClassicArticleList");
			for(SalonArticleDto dto : articlelist){
				for(SalonArticleDto olddto : newarticlelist){
					if(dto.getId().equals(olddto.getId())){
						HtmlGenerationFactory.getInstance().crateHTML(data,"innovationSalon"+File.separator+"salonIndexClassicArticle.ftl",htmlPath + "ClassicArticle.html",templateRoot);
						return;
					}
				}
			}
		}

	}
	/**
	 * create salon advert HTML
	 * @param peopleExcavateService
	 * @param context
	 * @param htmlPath
	 */
	private void createSalonAdvertHtml(ISysAdService sysAdService, String htmlPath){
		SalonData peo = new SalonData();
		peo.setSysAdService(sysAdService);
		peo.recreshAdvertData();
		HtmlGenerationFactory.getInstance().crateHTML(peo.getAdvertData(),"innovationSalon"+File.separator+"salonIndexAdvert.ftl",htmlPath + "Advert.html",templateRoot);
	}
	private class SalonData{

		private SalonAction salonAction;
		private SalonData(){

			salonAction = new SalonAction();
		}

		private void setSysAdService(ISysAdService sysAdService){
			salonAction.setSysAdService(sysAdService);
		}
		/** 刷新数据 **/
		private void recreshData(){
			salonAction.init();
		}
		private void recreshAdvertData(){
			salonAction.loadSalonAd();
		}
		public void refreshOfflineData(){
			salonAction.loadSalonOffLine();
		}
		public void refreshOnlineData(){
			salonAction.loadSalonOnline();
		}
		public void refreshHostUnitData(){
			salonAction.loadSalonHostUnit();
		}
		public void refreshClassicData(){
			salonAction.loadSalonClassic();
		}
		public void refreshClassicArticleData(){
			salonAction.loadSalonClassicArticle();
		}
		/**
		 * 获取数据
		 * @return
		 */
		private Map<String,Object> getData(){
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("searchTitleList", salonAction.getSearchTitleList());
			data.put("uploadFilePath", salonAction.getUploadFilePath());
			data.put("title_1", "沙龙主题：");
			data.put("title_2", "起止时间：");
			data.put("title_3", "搜索内容：");
			data.put("title_4", "发起沙龙");
			data.put("title_5", "往届沙龙");
			data.put("title_6", "更多");
			return data;
		}
		public Map<String,Object> getClassicArticleData(){
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("uploadFilePath", salonAction.getUploadFilePath());
			data.put("ARTICLE_IS_EXCELLENT_YES", ApplicationConstant.ARTICLE_IS_EXCELLENT_YES);
			data.put("salonClassicArticleList", salonAction.getSalonClassicArticleList());
			data.put("title_1", "经典文章");
			data.put("title_2", "更多");
			data.put("title_3", "作者：");
			data.put("title_4", "人气：");
			data.put("title_5", "人");
			data.put("title_6", "回应：");
			data.put("title_7", "次");
			return data;
		}
		public Map<String,Object> getClassicData(){
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("uploadFilePath", salonAction.getUploadFilePath());
			data.put("SALON_IS_EXCELLENT_YES", ApplicationConstant.SALON_IS_EXCELLENT_YES);
			data.put("classicSalonList", salonAction.getClassicSalonList());
			data.put("title_1", "经典沙龙");
			data.put("title_2", "更多");
			return data;
		}
		public Map<String,Object> getHostUnitData(){
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("uploadFilePath", salonAction.getUploadFilePath());
			data.put("hostUnitList", salonAction.getHostUnitList());
			data.put("title_1", "主办单位");
			data.put("title_2", "更多");

			return data;
		}
		private Map<String,Object> getOfflineSalonData(){
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("uploadFilePath", salonAction.getUploadFilePath());
			data.put("firstOfflineSalonInfoDto", salonAction.getFirstOfflineSalonInfoDto());
			data.put("offlineSalonList", salonAction.getOfflineSalonList());
			data.put("SALON_TYPE_OFFLINE", ApplicationConstant.SALON_TYPE_OFFLINE);
			data.put("title_1", "线下沙龙");
			data.put("title_2", "更多");
			data.put("title_3", "发起者：");
			data.put("title_4", "参加总人数：");
			data.put("title_5", "开始日期：");
			data.put("title_6", "截止日期：");
			return data;
		}
		private Map<String,Object> getOnlineSalonData(){
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("uploadFilePath", salonAction.getUploadFilePath());
			data.put("firstOnlineSalonInfoDto", salonAction.getFirstOnlineSalonInfoDto());
			data.put("onlineSalonList", salonAction.getOnlineSalonList());
			data.put("SALON_TYPE_ONLINE", ApplicationConstant.SALON_TYPE_ONLINE);
			data.put("title_1", "线上沙龙");
			data.put("title_2", "更多");
			data.put("title_3", "发起者：");
			data.put("title_4", "参加总人数：");
			data.put("title_5", "开始日期：");
			data.put("title_6", "截止日期：");
			return data;
		}
		private Map<String,Object> getAdvertData(){
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("salonAdDto", salonAction.getSalonAdDto());
			data.put("salonAdList", salonAction.getSalonAdList());
			if(salonAction.getSalonAdList()!=null){
				data.put("salonAdListSize", salonAction.getSalonAdList().size());
			}else{
				data.put("salonAdListSize", 0);
			}
			data.put("fileServerURL", CacheManager.getInstanceMemcachedClient().get("fileServerURL"));
			return data;
		}
		private void setSalonService(ISalonService salonService){
			salonAction.setSalonService(salonService);
		}
	}

	/**
	 * create salon index HTML
	 * @param peopleExcavateService
	 * @param context
	 * @param htmlPath
	 */
	private void createCertificateHtml(ICertificateService certificateService, String htmlPath){
		CertificateData peo = new CertificateData();
		peo.setCertificateService(certificateService);
		peo.recreshData();
		HtmlGenerationFactory.getInstance().crateHTML(peo.getData(),"certificateCenter"+File.separator+"certificateCenterIndex.ftl",htmlPath,templateRoot);
	}
	private class CertificateData{
		private CertificateAction certificateAction;
		private CertificateData(){

			certificateAction = new CertificateAction();
		}
		/** 刷新数据 **/
		private void recreshData(){
			certificateAction.init();
		}
		/**
		 * 获取数据
		 * @return
		 */
		private Map<String,Object> getData(){
			Map<String,Object> data = new HashMap<String,Object>();
			data.put("rootPath", rootPath);
			data.put("certificateTypeList", certificateAction.getCertificateTypeList());
			data.put("specialFieldList", certificateAction.getSpecialFieldList());
			data.put("provinceList", certificateAction.getProvinceList());
			data.put("registerStatusList", certificateAction.getRegisterStatusList());
			data.put("companySizeList", certificateAction.getCompanySizeList());
			data.put("zhiyeCertList", certificateAction.getZhiyeCertList());
			data.put("zhichengCertList", certificateAction.getZhichengCertList());
			data.put("hotCertList", certificateAction.getHotCertList());
			data.put("certNeedsIndeedList", certificateAction.getCertNeedsIndeedList());
			data.put("latestCertNeedsList", certificateAction.getLatestCertNeedsList());
			data.put("latestPersonalCertList", certificateAction.getLatestPersonalCertList());
			data.put("title_1", "个人证书提交");
			data.put("title_2", "企业登记证书需求");

			data.put("title_3", "证书搜索");
			data.put("title_4", "证书类型：");
			data.put("title_5", "请选择证书类型");
			data.put("title_6", "请选择专业职能");
			data.put("title_7", "专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：");
			data.put("title_8", "证书名称：");
			data.put("title_9", "请选择证书名称");
			data.put("title_10", "地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区：");
			data.put("title_11", "省份");
			data.put("title_12", "城市");
			data.put("title_13", "城区");
			data.put("title_14", "注册状况：");
			data.put("title_15", "请选择注册类型");
			data.put("title_16", "关&nbsp;&nbsp;键&nbsp;&nbsp;字：");
			data.put("title_17", "请输入关键字...");
			data.put("title_18", "证书需求搜索");
			data.put("title_19", "单位规模：");
			data.put("title_20", "请选择单位规模");
			data.put("title_21", "证书中心查询");
			data.put("title_22", "证书中心");
			data.put("title_23", "执业证书");
			data.put("title_24", "职称证书");
			data.put("title_25", "热门证书");
			data.put("title_26", "急需猎证信息");
			data.put("title_27", "更多");
			data.put("title_28", "证书名称");
			data.put("title_29", "挂证地区");
			data.put("title_30", "需求数量");
			data.put("title_31", "最新需求");
			data.put("title_32", "编号");
			data.put("title_33", "证书类型");
			data.put("title_34", "数量");
			data.put("title_35", "发布时间");
			data.put("title_36", "最新证书");
			data.put("title_37", "不限");

			return data;
		}
		private void setCertificateService(ICertificateService certificateService){
			certificateAction.setCertificateService(certificateService);
		}
	}

	private void createSalonOldHtml(ISalonService salonService, String htmlPath){
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("rootPath", rootPath);
		List<SalonInfoDto> oldSalonList = salonService.queryOldSalonList(ApplicationConstant.SALON_HOME_OLD_SIZE);
		SalonInfoDto firstOldSalonInfoDto = null;
		if(oldSalonList!=null && oldSalonList.size()>0){
		   firstOldSalonInfoDto = oldSalonList.get(0);
		   oldSalonList.remove(0);
		}
		data.put("oldSalonList", oldSalonList);
		data.put("firstOldSalonInfoDto", firstOldSalonInfoDto);
		data.put("uploadFilePath", PropertiesValue.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH));

		HtmlGenerationFactory.getInstance().crateHTML(data,"innovationSalon"+File.separator+"salonOld.ftl",htmlPath,templateRoot);
	}

	private void createTopAdvertHtml(ISysAdService sysAdService, String htmlPath){
		Map<String,Object> data = new HashMap<String,Object>();
		SysAdDto sysad = new SysAdDto();
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_HOMEPAGE_TOP);
		sysad.setCurrentDate(new Date());
		sysad.setLimitNumber(1);
		List<SysAdDto> list= ((ISysAdService) tx.getBean("sysAdService")).queryAdForList(sysad);
		if(null!=list&&list.size()>0){
			data.put("url", list.get(0).getUrl());
			data.put("imgName", list.get(0).getImgName());
			data.put("title", list.get(0).getTitle());
		}else{
			data.put("url", "");
			data.put("imgName", "");
			data.put("title", "");
		}
		data.put("rootPath", rootPath);
		data.put("fileServerURL", CacheManager.getInstanceMemcachedClient().get("fileServerURL"));

		HtmlGenerationFactory.getInstance().crateHTML(data,"common"+File.separator+"TopAd.ftl",htmlPath,templateRoot);
	}

}
