package com.dotoyo.buildjob.headhunterCenter.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.AutoShortMsgConfigDto;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ShortMessageDto;
import com.dotoyo.buildjob.common.service.IShortMessageService;
import com.dotoyo.buildjob.headhunterCenter.dao.IJobInfoDao;
import com.dotoyo.buildjob.headhunterCenter.dto.ApplicationJobRecordDto;
import com.dotoyo.buildjob.headhunterCenter.dto.JobInfoDto;
import com.dotoyo.buildjob.headhunterCenter.dto.JobadfavoritesDto;
import com.dotoyo.buildjob.headhunterCenter.dto.RecommendedPostsDto;
import com.dotoyo.buildjob.headhunterCenter.service.IJobInfoService;
import com.dotoyo.buildjob.headhunterCenter.vo.JobSearchVo;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-21
 * @description
 * 
 */
public class JobInfoServiceImpl implements IJobInfoService {
	private IJobInfoDao jobInfoDao;
	private IShortMessageService shortMessageService;

	public Long addJobInfo(JobInfoDto job) {
		return jobInfoDao.addJobInfo(job);
	}

	public List<JobInfoDto> searchRecommentEnterpriseList(
			JobSearchVo JobSearchVo) {
		return null;
	}

	public List<JobInfoDto> searchJobForList(JobSearchVo jobSearchVo,
			PageInfo pageInfo) {
		return jobInfoDao.searchJobForList(jobSearchVo, pageInfo);
	}

	public List<JobInfoDto> searchJobForList(JobSearchVo jobSearchVo) {
		return jobInfoDao.searchJobForList(jobSearchVo);
	}

	public List<JobInfoDto> querySpecialtyJobList(int specializedId,
			int jobNature) {
		return null;
	}

	public List<JobInfoDto> queryJobListByIndustryId(String industryId,
			String orderBy, PageInfo pageInfo) {
		return jobInfoDao.queryJobListByIndustryId(industryId, orderBy,
				pageInfo);
	}

	public List<JobInfoDto> queryHotCityJob(String cityCode, String orderBy,
			PageInfo pageInfo) {
		return jobInfoDao.queryHotCityJob(cityCode, orderBy, pageInfo);
	}

	public JobInfoDto getJobInfo(Long jobId, Long userId) {
		return jobInfoDao.getJobInfo(jobId, userId);
	}

	/**
	 * 判断用户是否重复申请某职位
	 */
	public boolean checkUserRepeatApplications(Long userId, Long jobId) {
		return jobInfoDao.checkUserRepeatApplications(userId, jobId);
	}

	public Long addAppliedJobRecord(ApplicationJobRecordDto appJobRecord) {
		sendAutoReplyMessage(appJobRecord);
		return jobInfoDao.addAppliedJobRecord(appJobRecord);
	}

	/**
	 * 如果企业用户设置了自动回复站内信，个人用户在申请职位的时候，将会收到企业用户的自动回复
	 * 
	 * @param appJobRecord
	 */
	private void sendAutoReplyMessage(ApplicationJobRecordDto appJobRecord) {
		Long enterpriseUserId = appJobRecord.getRecruitLtdId();
		Long personalUserId = appJobRecord.getUserId();
		AutoShortMsgConfigDto autoShortMsgConfigDto = shortMessageService
				.getAutoShortMsgConfigByUserId(enterpriseUserId);
		if (autoShortMsgConfigDto != null) {
			ShortMessageDto shortMessageDto = new ShortMessageDto();
			shortMessageDto.setSenderId(enterpriseUserId);
			shortMessageDto.setReceiverId(personalUserId);
			shortMessageDto.setReceiveDate(new Date());
			shortMessageDto.setTitle(autoShortMsgConfigDto.getTitle());
			shortMessageDto.setType("1");
			shortMessageDto.setStatus(ApplicationConstant.NOTICE_UNREAD);
			shortMessageDto.setMessage(autoShortMsgConfigDto.getMsg());
			shortMessageService.saveReceiveMsg(shortMessageDto);
		}
	}

	/**
	 * 批量增加用户申请职位记录
	 */
	public void fastBatchAppliedJob(
			List<ApplicationJobRecordDto> applicationJobRecordList) {
		jobInfoDao.addBatchAppliedJob(applicationJobRecordList);
	}

	/**
	 * 判断用户申请的职位是否对他相关信息有限制，有则不插入到企业收到的申请表中
	 */
	public boolean consumerFilter(Long jobId, String userName, String userAge,
			String workingLife) {
		return jobInfoDao.consumerFilter(jobId, userName, userAge, workingLife);
	}

	public Long addReceiptOfApplicationsForJobs(
			ApplicationJobRecordDto appJobRecord, BlogUserInfoDto blogUser) {
		boolean filter = consumerFilter(appJobRecord.getJobId(),
				blogUser.getUserName(), blogUser.getAge(),
				blogUser.getWorkingLife());
		if (filter) {
			return null;
		} else if (checkUserRepeatApplications(appJobRecord.getUserId(),
				appJobRecord.getJobId())) {
			// 重复申请,更新申请时间
			jobInfoDao.updateApplicationRecord(appJobRecord.getUserId(),
					appJobRecord.getJobId());
			return null;
		}
		return jobInfoDao.addReceiptOfApplicationsForJobs(appJobRecord);
	}

	/**
	 * 指增加企业 用户（个人）职位申请记录
	 */
	public void fastBatchReceiptOfApplicationsForJobs(
			List<ApplicationJobRecordDto> applicationJobRecordList,
			BlogUserInfoDto blogUser) {
		jobInfoDao.addBatchReceiptOfApplicationsForJobs(
				applicationJobRecordList, blogUser);
	}

	public List<ApplicationJobRecordDto> queryAppliedJobRecordListByUserId(
			Map<String, Object> paramMap, PageInfo pageInfo) {
		return jobInfoDao.queryAppliedJobRecordListByUserId(paramMap, pageInfo);
	}

	public void addFavoritedJobRecord(JobadfavoritesDto jobadfavorites) {
		// TODO Auto-generated method stub

	}

	public List<JobadfavoritesDto> queryUserJobadfavorites(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void addRecommendedPosts(RecommendedPostsDto recommendedPosts) {
		// TODO Auto-generated method stub

	}

	public List<RecommendedPostsDto> queryUserReceivableRecommendedPosts(
			Long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void setJobInfoDao(IJobInfoDao jobInfoDao) {
		this.jobInfoDao = jobInfoDao;
	}

	public IJobInfoDao getJobInfoDao() {
		return jobInfoDao;
	}

	public Object addJobInfoTemplate(JobInfoDto jobInfo) {
		return jobInfoDao.addJobInfoTemplate(jobInfo);
	}

	/**
	 * 加载职位模板
	 */
	public List<JobInfoDto> queryJobTemplates(String userId, String tmpName) {
		return jobInfoDao.queryJobTemplates(userId, tmpName);
	}

	/**
	 * 加载职能分类职位信息
	 */
	public List<JobInfoDto> queryCompetencyJobs(String competency,
			String jobNature, String isAdviser, int displayCount) {
		return jobInfoDao.queryCompetencyJobs(competency, jobNature, isAdviser,
				displayCount);
	}

	public List<JobInfoDto> queryRecommentEnterpriseJobList(Long userId,
			Long jobId) {
		return jobInfoDao.queryRecommentEnterpriseJobList(userId, jobId);
	}

	/**
	 * 查询企业发布中的职位
	 */
	public List<JobInfoDto> queryEnterprisePublishingJobs(
			Map<String, Object> paramMap, PageInfo pageInfo) {
		return jobInfoDao.queryEnterprisePublishingJobs(paramMap, pageInfo);
	}

	public List<JobInfoDto> queryMoreCompetencyJobList(
			Map<String, Object> paraMap, PageInfo pageInfo) {
		return jobInfoDao.queryMoreCompetencyJobList(paraMap, pageInfo);
	}

	/**
	 * 删除用户已申请的职位
	 */
	public void deleteUserAppliedJobByJobId(List<String> jobList) {
		jobInfoDao.deleteUserAppliedJobByJobId(jobList);
	}

	/**
	 * 删除企业用户之前发布的职位
	 */
	public void deleteEnterprisePublishedJob(String jobIds) {
		jobInfoDao.deleteEnterprisePublishedJob(jobIds);
	}

	/**
	 * 更新职位状态、延长职位发布时间
	 */
	public void updatePublishedJob(String statementName,
			Map<String, Object> paramMap) {
		jobInfoDao.updatePublishedJob(statementName, paramMap);
	}

	/**
	 * 检索企业用户已发布的职位 以备修改
	 */
	public JobInfoDto loadEJobInfo(Long jobId, Long userId) {
		return jobInfoDao.loadEJobInfo(jobId, userId);
	}

	/**
	 * 修改企业已发布的职位信息
	 */
	public int updatePublishedJob(JobInfoDto jobInfo) {
		int result =  jobInfoDao.updatePublishedJob(jobInfo);
		return result;
	}

	/**
	 * 今日新增用户 期望职位个数统计
	 */
	public int getCountOfNewJobsByUserExpectedPosition(Long userId) {
		return jobInfoDao.getCountOfNewJobsByUserExpectedPosition(userId);
	}

	/**
	 * 今日新增用户 期望职位列表加载
	 */
	public List<JobInfoDto> queryNewJobsByUserExpectedPosition(
			PageInfo pageInfo, Long userId) {
		return jobInfoDao.queryNewJobsByUserExpectedPosition(pageInfo, userId);
	}

	/**
	 * 企业即将到期的职位数统计
	 */
	public int getCountOfUserExpireJobs(Map<String, Object> paramMap) {
		return jobInfoDao.getCountOfUserExpireJobs(paramMap);
	}

	/**
	 * 首页职位搜索
	 */
	public List<JobInfoDto> queryJobListFromHomePage(JobSearchVo jobSearchVo,
			PageInfo pageInfo) {
		return jobInfoDao.queryJobListFromHomePage(jobSearchVo, pageInfo);
	}

	/**
	 * 热门职能-职位搜索
	 */
	public List<JobInfoDto> queryHotCompetencyJobs(JobSearchVo jobSearchVo,
			PageInfo pageInfo) {
		return jobInfoDao.queryHotCompetencyJobs(jobSearchVo, pageInfo);
	}

	/**
	 * 城市站点-职能分类 职位搜索
	 */
	public List<JobInfoDto> queryCitySiteCompetencyJobs(
			JobSearchVo jobSearchVo, PageInfo pageInfo) {
		return jobInfoDao.queryCitySiteCompetencyJobs(jobSearchVo, pageInfo);
	}

	/**
	 * 增加职位点击次数。
	 */
	public void addJobClicks(Map<String, String> paramMap) {
		jobInfoDao.addJobClicks(paramMap);
	}

	/**
	 * 城市站点 热门职位检索
	 */
	public List<JobInfoDto> queryCitySiteHotJobs(String cityCode,
			int releaseTimes, int clicks, Date currentDate) {
		return jobInfoDao.queryCitySiteHotJobs(cityCode, releaseTimes, clicks,
				currentDate);
	}

	/**
	 * 城市站点 热门职位列表加载
	 */
	public List<JobInfoDto> queryCitySiteHotJobListByJobName(
			JobSearchVo jobSearchVo, PageInfo pageInfo) {
		return jobInfoDao.queryCitySiteHotJobListByJobName(jobSearchVo,
				pageInfo);
	}

	/**
	 * 系统职位信息加载
	 */
	public List<JobInfoDto> querySysJobInformation(JobSearchVo jobSearchVo,
			PageInfo pageInfo) {
		return jobInfoDao.querySysJobInformation(jobSearchVo, pageInfo);
	}

	/**
	 * 新增发布招聘职位数统计
	 */
	public int releasedNumberOfThePostsToDay() {
		return jobInfoDao.releasedNumberOfThePostsToDay();
	}

	/**
	 * 招聘管理 收到的申请数据加载
	 */
	public List<JobInfoDto> queryApplicationsReceiveds(JobSearchVo jobSearchVo,
			PageInfo pageInfo) {
		return jobInfoDao.queryApplicationsReceiveds(jobSearchVo, pageInfo);
	}

	/**
	 * 数据统计 招聘应聘人数统计
	 */
	public List<JobSearchVo> queryJobApplicantsStatistics(Date jobIssuetDate,
			Date jobExpiryDate, PageInfo pageInfo) {
		return jobInfoDao.queryJobApplicantsStatistics(jobIssuetDate,
				jobExpiryDate, pageInfo);
	}

	/**
	 * 用户近三个月收到的申请数统计
	 */
	public int queryApplicationsReceivedsOfTrimester(Long userId, Date trimester) {
		return jobInfoDao.queryApplicationsReceivedsOfTrimester(userId,
				trimester);
	}
	
	/**
	 * 用户今日收到的申请数统计
	 */
	public int queryApplicationsReceivedsOfToday(Long userId) {
		return jobInfoDao.queryApplicationsReceivedsOfToday(userId);
	}
	
	

	/**
	 * 企业正在招聘的 职位数统计
	 */
	public int cAreRecruitingStatisticsTheNumOfPosts(Long userId) {
		return jobInfoDao.cAreRecruitingStatisticsTheNumOfPosts(userId);
	}

	public IShortMessageService getShortMessageService() {
		return shortMessageService;
	}

	public void setShortMessageService(IShortMessageService shortMessageService) {
		this.shortMessageService = shortMessageService;
	}

	/**
	 * 更新职位状态-职位发布（定时调度）
	 */
	public void scheduledPubJob() {
		jobInfoDao.scheduledPubJob();
	}

	/**
	 * 更新职位状态-职位过期（定时调度）
	 */
	public void scheduledDueJob() {
		jobInfoDao.scheduledDueJob();
	}

	/**
	 * 加载所选暂停职位
	 */
	public List<JobInfoDto> loadSelectedSuspendJobs(String jobIds) {
		return jobInfoDao.loadSelectedSuspendJobs(jobIds);
	}

	public List<JobInfoDto> searchMatchJobList(JobSearchVo jobSearchVo,
			PageInfo pageInfo) {
		return jobInfoDao.searchMatchJobList(jobSearchVo, pageInfo);
	}

	/**
	 * 批量删除收到的职位申请记录
	 * 
	 * @param ids
	 */
	public void deleteReveiveApplyRecord(String ids) {
		jobInfoDao.deleteReveiveApplyRecord(ids);
	}
}
