package com.dotoyo.buildjob.common.quartz;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.dotoyo.buildjob.common.user.service.IUserService;

public class KeepDBConnection extends QuartzJobBean {
	private static final String APPLICATION_CONTEXT_KEY = "applicationContext";
	private static Logger logger = Logger.getLogger(SysJobStatusJob.class);

	public KeepDBConnection() {
	}

	@Override
	protected void executeInternal(JobExecutionContext jobExecutionContext)
			throws JobExecutionException {
		ApplicationContext appCtx = null;
		try {
			appCtx = getApplicationContext(jobExecutionContext);
			IUserService userService = (IUserService) appCtx
					.getBean("userService");
			userService.getUserById(new Long(1));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * Description :初始化spring容器
	 */
	private ApplicationContext getApplicationContext(JobExecutionContext context)
			throws Exception {
		ApplicationContext appCtx = null;
		appCtx = (ApplicationContext) context.getScheduler().getContext()
				.get(APPLICATION_CONTEXT_KEY);

		// 判断初始化是否成功
		if (appCtx == null) {
			logger.info("Spring容器初始化失败");
			throw new JobExecutionException(
					"No application context available in scheduler context for key \""
							+ APPLICATION_CONTEXT_KEY + "\"");
		}
		logger.info("Spring容器初始化成功");
		return appCtx;
	}

}
