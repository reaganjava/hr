package com.dotoyo.buildjob.common.quartz;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.dotoyo.buildjob.common.html.HtmlGeneration;

/**
 * @author tyler.qu
 * @dateCreated 2011-4-1
 * @description 系统页面广告刷新 
 * 
 */
public class RefreshAdvertisingJob extends QuartzJobBean {
	private static Logger logger = Logger.getLogger(SysJobStatusJob.class);
	public RefreshAdvertisingJob() {
	}
	
	@Override
	protected void executeInternal(JobExecutionContext jobExecutionContext)
			throws JobExecutionException {
        try {
			HtmlGeneration.getInstance().createAll();
			logger.info("页面广告更新 完成");
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("页面广告更新 失败");
		}
	}
}
