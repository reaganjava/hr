package com.dotoyo.buildjob.headhunterCenter.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.headhunterCenter.dto.ApplicationJobRecordDto;
import com.dotoyo.buildjob.headhunterCenter.dto.JobInfoDto;
import com.dotoyo.buildjob.headhunterCenter.dto.JobadfavoritesDto;
import com.dotoyo.buildjob.headhunterCenter.dto.RecommendedPostsDto;
import com.dotoyo.buildjob.headhunterCenter.vo.JobSearchVo;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-21
 * @description 猎头中心数据操作接口
 * 
 */
public interface IJobInfoDao {
	/**
	 * 增加职位信息
	 * 
	 * @param job
	 */
	public Long addJobInfo(JobInfoDto job);

	/**
	 * 企业搜索
	 * 
	 * @return
	 */
	public List<JobInfoDto> searchRecommentEnterpriseList(
			JobSearchVo JobSearchVo);

	/**
	 * 查看线下推荐对象匹配职位信息
	 * 
	 * @param jobSearchVo
	 * @param pageInfo
	 * @return
	 */
	public List<JobInfoDto> searchMatchJobList(JobSearchVo jobSearchVo,
			PageInfo pageInfo);

	/**
	 * 职位搜索
	 * 
	 * @param searchJobVo
	 * @return
	 */
	public List<JobInfoDto> searchJobForList(JobSearchVo jobSearchVo,
			PageInfo pageInfo);

	public List<JobInfoDto> searchJobForList(JobSearchVo jobSearchVo);

	/**
	 * 专业职位搜索 jobNature 全职、顾问、兼职
	 * 
	 * @return
	 */
	public List<JobInfoDto> querySpecialtyJobList(int specializedId,
			int jobNature);

	/**
	 * 查询指定行业职位列表 industryId 工程专业顾问、工程专业承包
	 * 
	 * @return
	 */
	public List<JobInfoDto> queryJobListByIndustryId(String industryId,
			String orderBy, PageInfo pageInfo);

	/**
	 * 热点城市职位搜索
	 * 
	 * @return
	 */
	public List<JobInfoDto> queryHotCityJob(String cityCode, String orderBy,
			PageInfo pageInfo);

	/**
	 * 职位信息展示
	 * 
	 * @param id
	 * @return
	 */
	public JobInfoDto getJobInfo(Long jobId, Long userId);

	/**
	 * 增加用户申请职位记录
	 */
	public Long addAppliedJobRecord(ApplicationJobRecordDto appJobRecord);

	/**
	 * 批量增加用户申请职位记录
	 */
	public void addBatchAppliedJob(
			final List<ApplicationJobRecordDto> applicationJobRecordList);

	/**
	 * 判断用户申请的职位是否对他相关信息有限制，有则不插入到企业收到的申请表中
	 */
	public boolean consumerFilter(Long jobId, String userName, String userAge,
			String workingLife);

	/**
	 * 企业收到用户（个人）职位申请
	 */
	public Long addReceiptOfApplicationsForJobs(
			ApplicationJobRecordDto appJobRecord);

	/**
	 * 批量增加企业 用户（个人）职位申请记录
	 */
	public void addBatchReceiptOfApplicationsForJobs(
			final List<ApplicationJobRecordDto> applicationJobRecordList,
			BlogUserInfoDto blogUser);

	/**
	 * 查询用户职位申请记录
	 * 
	 * @param id
	 * @return
	 */
	public List<ApplicationJobRecordDto> queryAppliedJobRecordListByUserId(
			Map<String, Object> paramMap, PageInfo pageInfo);

	/**
	 * 增加用户职位收藏记录
	 * 
	 */
	public void addFavoritedJobRecord(JobadfavoritesDto jobadfavorites);

	/**
	 * 查询用户职位收藏夹
	 * 
	 * @return
	 */
	public List<JobadfavoritesDto> queryUserJobadfavorites(Long userId);

	/**
	 * 向朋友推荐职位
	 * 
	 * @return
	 */
	public void addRecommendedPosts(RecommendedPostsDto recommendedPosts);

	/**
	 * 朋友推荐的职位
	 * 
	 * @return
	 */
	public List<RecommendedPostsDto> queryUserReceivableRecommendedPosts(
			Long userId);

	/**
	 * 增加职位模板
	 * 
	 * @param jobInfo
	 * @return
	 */
	public Object addJobInfoTemplate(JobInfoDto jobInfo);

	/**
	 * 加载职位模板
	 */
	public List<JobInfoDto> queryJobTemplates(String userId, String tmpName);

	/**
	 * 加载职能分类职位信息
	 */
	public List<JobInfoDto> queryCompetencyJobs(String competency,
			String jobNature, String isAdviser, int displayCount);

	/**
	 * 查询用户（企业用户－公司）已发布的职位（没有过期的）
	 */
	public List<JobInfoDto> queryRecommentEnterpriseJobList(Long userId,
			Long jobId);

	/**
	 * 查询企业发布中的职位
	 */
	public List<JobInfoDto> queryEnterprisePublishingJobs(
			Map<String, Object> paramMap, PageInfo pageInfo);

	/**
	 * 查询更多职能（职位）信息
	 */
	public List<JobInfoDto> queryMoreCompetencyJobList(
			Map<String, Object> paraMap, PageInfo pageInfo);

	/**
	 * 删除用户已申请的职位
	 */
	public void deleteUserAppliedJobByJobId(List<String> jobList);

	/**
	 * 删除企业用户之前发布的职位
	 */
	public void deleteEnterprisePublishedJob(String jobIds);

	/**
	 * 更新职位状态、延长职位发布时间
	 */
	public void updatePublishedJob(String statementName,
			Map<String, Object> paramMap);

	/**
	 * 检索企业用户已发布的职位 以备修改
	 */
	public JobInfoDto loadEJobInfo(Long jobId, Long userId);

	/**
	 * 修改企业已发布的职位信息
	 */
	public int updatePublishedJob(JobInfoDto jobInfo);

	/**
	 * 今日新增用户 期望职位个数统计
	 */
	public int getCountOfNewJobsByUserExpectedPosition(Long userId);

	/**
	 * 今日新增用户 期望职位列表加载
	 */
	public List<JobInfoDto> queryNewJobsByUserExpectedPosition(
			PageInfo pageInfo, Long userId);

	/**
	 * 企业即将到期的职位数统计
	 */
	public int getCountOfUserExpireJobs(Map<String, Object> paramMap);

	/**
	 * 首页职位搜索
	 */
	public List<JobInfoDto> queryJobListFromHomePage(JobSearchVo jobSearchVo,
			PageInfo pageInfo);

	/**
	 * 热门职能-职位搜索
	 */
	public List<JobInfoDto> queryHotCompetencyJobs(JobSearchVo jobSearchVo,
			PageInfo pageInfo);

	/**
	 * 城市站点-职能分类 职位搜索
	 */
	public List<JobInfoDto> queryCitySiteCompetencyJobs(
			JobSearchVo jobSearchVo, PageInfo pageInfo);

	/**
	 * 增加职位点击次数。
	 */
	public void addJobClicks(Map<String, String> paramMap);

	/**
	 * 城市站点 热门职位检索
	 */
	public List<JobInfoDto> queryCitySiteHotJobs(String cityCode,
			int releaseTimes, int clicks, Date currentDate);

	/**
	 * 城市站点 热门职位列表加载
	 */
	public List<JobInfoDto> queryCitySiteHotJobListByJobName(
			JobSearchVo jobSearchVo, PageInfo pageInfo);

	/**
	 * 系统职位信息加载
	 */
	public List<JobInfoDto> querySysJobInformation(JobSearchVo jobSearchVo,
			PageInfo pageInfo);

	/**
	 * 新增发布招聘职位数统计
	 */
	public int releasedNumberOfThePostsToDay();

	/**
	 * 招聘管理 收到的申请数据加载
	 */
	public List<JobInfoDto> queryApplicationsReceiveds(JobSearchVo jobSearchVo,
			PageInfo pageInfo);

	/**
	 * 判断用户是否重复申请某职位
	 */
	public boolean checkUserRepeatApplications(Long userId, Long jobId);

	/**
	 * 修改用户申请记录 职位申请时间
	 */
	public void updateApplicationRecord(Long userId, Long jobId);

	/**
	 * 数据统计 招聘应聘人数统计
	 */
	public List<JobSearchVo> queryJobApplicantsStatistics(Date jobIssuetDate,
			Date jobExpiryDate, PageInfo pageInfo);

	/**
	 * 用户近三个月收到的申请数统计
	 */
	public int queryApplicationsReceivedsOfTrimester(Long userId, Date trimester);
	
	/**
	 * 用户今日收到的申请数统计
	 */
	public int queryApplicationsReceivedsOfToday(Long userId);

	/**
	 * 企业正在招聘的 职位数统计
	 */
	public int cAreRecruitingStatisticsTheNumOfPosts(Long userId);

	/**
	 * 更新职位状态-职位发布（定时调度）
	 */
	public void scheduledPubJob();

	/**
	 * 更新职位状态-职位过期（定时调度）
	 */
	public void scheduledDueJob();

	/**
	 * 加载所选暂停职位
	 */
	public List<JobInfoDto> loadSelectedSuspendJobs(String jobIds);

	/**
	 * 批量删除收到的职位申请记录
	 * 
	 * @param ids
	 */
	public void deleteReveiveApplyRecord(String ids);
}
