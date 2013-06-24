package com.dotoyo.buildjob.common.quartz;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.headhunterCenter.service.IJobInfoService;


/**
 * @author tyler.qu
 * @dateCreated 2011-3-18
 * @description 职位信息定时 更新
 * 
 */
public class SysJobStatusJob extends QuartzJobBean{

	private static final String APPLICATION_CONTEXT_KEY = "applicationContext";
	private static Logger logger = Logger.getLogger(SysJobStatusJob.class);
    public SysJobStatusJob(){
    }

    /**
     * 更新系统职位状态
     */
    protected void executeInternal(JobExecutionContext jobExecutionContext)
        throws JobExecutionException
    {
        ApplicationContext appCtx = null;
        try {
			appCtx = getApplicationContext(jobExecutionContext);
			IJobInfoService jobInfoService = (IJobInfoService) appCtx.getBean("jobInfoService");
			jobInfoService.scheduledPubJob();// 发布职位
			jobInfoService.scheduledDueJob();// 职位过期
			logger.info("职位状态定时更新 完成");
			HtmlGeneration.getInstance().refreshHeadhunterCenterPage();
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("职位状态定时更新 失败");
		}
    }

    /**
     * Description :初始化spring容器
     */
    private ApplicationContext getApplicationContext(JobExecutionContext context)
        throws Exception{
        ApplicationContext appCtx = null;
        appCtx = (ApplicationContext) context.getScheduler().getContext().get(APPLICATION_CONTEXT_KEY);
        
        // 判断初始化是否成功
        if(appCtx == null){
        	logger.info("Spring容器初始化失败");
            throw new JobExecutionException(
                "No application context available in scheduler context for key \""
                        + APPLICATION_CONTEXT_KEY + "\"");
        }
        logger.info("Spring容器初始化成功");
        return appCtx;
    }
}
