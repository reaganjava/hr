package com.dotoyo.buildjob.common.html;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.util.PropertiesValue;
import com.dotoyo.buildjob.innovationSalon.dto.HostUnitDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;



public abstract class HtmlGeneration{
	private static Logger logger = Logger
	.getLogger(HtmlGeneration.class);
	// 静态页面根路径
	protected static String htmlRoot;
	// 模板根路径
	protected static String templateRoot;
	//容器配置文件
	protected static String[] app = { "applicationContext*.xml" };
	protected static ApplicationContext tx;
	// 前台根路径
	protected static String rootPath;
	static{
		try{
		htmlRoot = PropertiesValue.getPropertyValue(ApplicationConstant.HTML_ROOT_PATH_DIRECTORY);
		templateRoot = PropertiesValue.getPropertyValue(ApplicationConstant.TEMPLATE_ROOT_PATH_DIRECTORY);
		rootPath = PropertiesValue.getPropertyValue(ApplicationConstant.ROOT_PATH);
		tx = new ClassPathXmlApplicationContext(app);
		}catch(Exception e){
			logger.error(e);
		}
	}

	public static HtmlGeneration getInstance(){
		return Helper.instance;
	}
	private static class Helper{
		protected static HtmlGeneration instance = new HtmlGenerationImpl();
	}
	/**
	 * create all
	 * @param context
	 */
	public abstract void createAll();
	/**
	 * 刷新顶部和底部页面
	 * @param context
	 */
	public abstract void refreshTopAndBottomPage();
	/**
	 * 刷新主页面

	 */
	public abstract void refreshHomePage();
	/**
	 * 刷新猎头主页面

	 */
	public abstract void refreshHeadhunterCenterPage();
	/**
	 * 刷新猎头主页面广告

	 */
	public abstract void refreshHeadhunterCenterAdvertPage();
	/**
	 * 刷新人才中心主页面

	 */
	public abstract void refreshApplyJobPage();
	/**
	 * 刷新人才挖掘主页面
	 */
	public abstract void refreshPeopleExcavatePage();
	/**
	 * 刷新人才挖掘主页面右边广告
	 */
	public abstract void refreshPeopleExcavateAdvertPage();
	/**
	 * 刷新猎证中心主页面

	 */
	public abstract void refreshCertificateCenterPage();
	/**
	 * 刷新创业沙龙主页面
	 */
	public abstract void refreshSalonPage();
	/**
	 * 刷新创业沙龙主页面广告
	 */
	public abstract void refreshSalonAdvertPage();
	/**
	 * 刷新创业沙龙之线下沙龙
	 */
	public abstract void refreshSalonOfflinePage(List<SalonInfoDto> salonlist);
	/**
	 * 刷新创业沙龙之线上沙龙
	 */
	public abstract void refreshSalonOnlinePage(List<SalonInfoDto> salonlist);
	/**
	 * 刷新创业沙龙之经典沙龙
	 */
	public abstract void refreshSalonClassicPage(List<SalonInfoDto> salonlist);
	/**
	 * 刷新创业沙龙之经典文章
	 */
	public abstract void refreshSalonClassicArticlePage(List<SalonArticleDto> article);
	/**
	 * 刷新创业沙龙之主办单位
	 */
	public abstract void refreshSalonHostUnitPage(List<HostUnitDto> hostlist);
	/**
	 * 刷新往届沙龙部分
	 */
	public abstract void refreshSalonOldPage();

	/**
	 * 刷新顶部页面广告
	 */
	public abstract void refreshTopAdvert();

}
