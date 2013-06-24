package com.dotoyo.buildjob.headhunterCenter.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.AutoShortMsgConfigDto;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ShortMessageDto;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.headhunterCenter.dao.IJobInfoDao;
import com.dotoyo.buildjob.headhunterCenter.dto.ApplicationJobRecordDto;
import com.dotoyo.buildjob.headhunterCenter.dto.JobInfoDto;
import com.dotoyo.buildjob.headhunterCenter.dto.JobadfavoritesDto;
import com.dotoyo.buildjob.headhunterCenter.dto.RecommendedPostsDto;
import com.dotoyo.buildjob.headhunterCenter.vo.JobSearchVo;
import com.ibatis.sqlmap.client.SqlMapExecutor;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-21
 * @description 猎头中心逻辑操作接口
 * 
 */
public class JobInfoDaoImpl implements IJobInfoDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	private static Logger logger = Logger.getLogger(JobInfoDaoImpl.class);
	
	public Long addJobInfo(JobInfoDto job) {
		return (Long) sqlMapClientTemplate.insert("addJobInfo", job);
	}

	public List<JobInfoDto> searchRecommentEnterpriseList(
			JobSearchVo JobSearchVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<JobInfoDto> searchJobForList(JobSearchVo jobSearchVo,
			PageInfo pageInfo) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"getCountOfSearchJobForList", "searchJobForList", jobSearchVo);
	}

	@SuppressWarnings("unchecked")
	public List<JobInfoDto> searchMatchJobList(JobSearchVo jobSearchVo,
			PageInfo pageInfo) {
		if (pageInfo == null) {
			return sqlMapClientTemplate.queryForList("searchMatchJobList",
					jobSearchVo);
		} else {
			return PagingDataListUtil.getPagingData(pageInfo,
					"searchMatchJobCount", "searchMatchJobList", jobSearchVo);
		}
	}

	@SuppressWarnings("unchecked")
	public List<JobInfoDto> searchJobForList(JobSearchVo jobSearchVo) {
		return sqlMapClientTemplate.queryForList("searchJobForList",
				jobSearchVo);
	}

	public List<JobInfoDto> querySpecialtyJobList(int specializedId,
			int jobNature) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryJobListByIndustryId(String industryId,
			String orderBy, PageInfo pageInfo) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("industryId", industryId);
		paraMap.put("orderBy", orderBy);
		paraMap.put("currentDate", new Date());
		return PagingDataListUtil.getPagingData(pageInfo, "getCountOfJobList",
				"queryJobList", paraMap);
	}

	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryHotCityJob(String cityCode, String orderBy,
			PageInfo pageInfo) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("cityCode", cityCode);
		paraMap.put("orderBy", orderBy);
		paraMap.put("currentDate", new Date());
		return PagingDataListUtil.getPagingData(pageInfo, "getCountOfJobList",
				"queryJobList", paraMap);
	}

	public JobInfoDto getJobInfo(Long jobId, Long userId) {
		Map<String, Long> paraMap = new HashMap<String, Long>();
		paraMap.put("jobId", jobId);
		paraMap.put("userId", userId);
		return (JobInfoDto) sqlMapClientTemplate.queryForObject("getJobInfo",
				paraMap);
	}

	public Long addAppliedJobRecord(ApplicationJobRecordDto appJobRecord) {
		return (Long) sqlMapClientTemplate.insert("addAppliedJobRecord",
				appJobRecord);
	}

	public void addBatchAppliedJob(
			final List<ApplicationJobRecordDto> applicationJobRecordList) {
		try {
			if (applicationJobRecordList != null) {
				sqlMapClientTemplate.execute(new SqlMapClientCallback() {
					public Object doInSqlMapClient(SqlMapExecutor executor)
							throws SQLException {
						executor.startBatch();
						for (int i = 0, n = applicationJobRecordList.size(); i < n; i++) {
							executor.insert("addAppliedJobRecord",
									applicationJobRecordList.get(i));
							ApplicationJobRecordDto appJobRecord = applicationJobRecordList
									.get(i);
							Long enterpriseUserId = appJobRecord
									.getRecruitLtdId();
							Long personalUserId = appJobRecord.getUserId();
							AutoShortMsgConfigDto autoShortMsgConfigDto = (AutoShortMsgConfigDto) sqlMapClientTemplate
									.queryForObject(
											"getAutoShortMsgConfigByUserId",
											enterpriseUserId);
							if (autoShortMsgConfigDto != null) {
								ShortMessageDto shortMessageDto = new ShortMessageDto();
								shortMessageDto.setSenderId(enterpriseUserId);
								shortMessageDto.setReceiverId(personalUserId);
								shortMessageDto.setReceiveDate(new Date());
								shortMessageDto.setTitle(autoShortMsgConfigDto
										.getTitle());
								shortMessageDto.setType("1");
								shortMessageDto
										.setStatus(ApplicationConstant.NOTICE_UNREAD);
								shortMessageDto
										.setMessage(autoShortMsgConfigDto
												.getMsg());
								executor.insert("saveReceiveMsg",
										shortMessageDto);
							}
						}
						executor.executeBatch();
						return null;
					}
				});
			}
		} catch (Exception e) {

		}
	}

	/**
	 * 判断用户申请的职位是否对他相关信息有限制，有则不插入到企业收到的申请表中
	 */
	public boolean consumerFilter(Long jobId, String userName, String userAge,
			String workingLife) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("jobId", jobId);
		paramMap.put("userName", userName);
		JobInfoDto jobInfoDto = (JobInfoDto)sqlMapClientTemplate.queryForObject("consumerFilter",paramMap);
		
		String sql="jobInfo.id="+jobId+" AND userInfo.userName ='"+userName+"' AND ((jobInfo.filterIndustryType IS NOT NULL AND jobInfo.filterIndustryType!='' AND jobInfo.filterIndustryType = userInfo.industryType )"+
		" OR ( jobInfo.filterJobNature IS NOT NULL AND  jobInfo.filterJobNature!='' AND  jobInfo.filterJobNature = userInfo.jobNature  )"
        +" OR (jobInfo.filterEducation IS NOT NULL AND jobInfo.filterEducation!='' AND jobInfo.filterEducation > userInfo.education  ) "
        +" OR (jobInfo.filterMetier!='' AND jobInfo.filterMetier  IS NOT NULL  AND jobInfo.filterMetier = userInfo.metier  ) "
        +" OR  (jobInfo.filterSpecializedType IS NOT NULL AND jobInfo.filterSpecializedType!='' AND jobInfo.filterSpecializedType = userInfo.specializedType) ";
		if(StringUtils.isNotEmpty(jobInfoDto.getFiltergtAge())&&StringUtils.isNotEmpty(jobInfoDto.getFilterltAge())){
			if(Integer.parseInt(jobInfoDto.getFiltergtAge())>Integer.parseInt(jobInfoDto.getFilterltAge())){
				sql+=" or (jobInfo.filtergtAge<="+userAge+" or jobInfo.filterltAge>="+userAge+")";
			}else{
				sql+=" or (jobInfo.filtergtAge<="+userAge+" and jobInfo.filterltAge>="+userAge+")";
			}
		}else if(StringUtils.isNotEmpty(jobInfoDto.getFiltergtAge())&&StringUtils.isEmpty(jobInfoDto.getFilterltAge())){
			sql+=" or (jobInfo.filtergtAge<="+userAge+")";
		}else if(StringUtils.isEmpty(jobInfoDto.getFiltergtAge())&&StringUtils.isNotEmpty(jobInfoDto.getFilterltAge())){
			sql+=" or (jobInfo.filterltAge>="+userAge+")";
		}
		
		if(StringUtils.isNotEmpty(jobInfoDto.getFiltergtWorkingLife())&&StringUtils.isNotEmpty(jobInfoDto.getFilterltWorkingLife())){
			if(Integer.parseInt(jobInfoDto.getFiltergtWorkingLife())>Integer.parseInt(jobInfoDto.getFilterltWorkingLife())){
				sql+=" or (jobInfo.filtergtWorkingLife<="+workingLife+" or jobInfo.filterltWorkingLife>="+workingLife+")";
			}else{
				sql+=" or (jobInfo.filtergtWorkingLife<="+workingLife+" and jobInfo.filterltWorkingLife>="+workingLife+")";
			}
		}else if(StringUtils.isNotEmpty(jobInfoDto.getFiltergtWorkingLife())&&StringUtils.isEmpty(jobInfoDto.getFilterltWorkingLife())){
			sql+=" or (jobInfo.filtergtWorkingLife<="+workingLife+")";
		}else if(StringUtils.isEmpty(jobInfoDto.getFiltergtWorkingLife())&&StringUtils.isNotEmpty(jobInfoDto.getFilterltWorkingLife())){
			sql+=" or (jobInfo.filterltWorkingLife>="+workingLife+")";
		}
		
		if(StringUtils.isNotEmpty(jobInfoDto.getFilterSex())&&!"2".equals(jobInfoDto.getFilterSex())){
			sql+=" or (userInfo.sex="+jobInfoDto.getFilterSex()+")";
		}
		sql+=")";
		
		if ((Integer)sqlMapClientTemplate.queryForObject("consumerFilterWhere",sql) > 0) {
			return true;
		}
		return false;
	}

	public Long addReceiptOfApplicationsForJobs(
			ApplicationJobRecordDto appJobRecord) {
		return (Long) sqlMapClientTemplate.insert(
				"addReceiptOfApplicationsForJobs", appJobRecord);
	}

	public void addBatchReceiptOfApplicationsForJobs(
			final List<ApplicationJobRecordDto> applicationJobRecordList,
			final BlogUserInfoDto blogUser) {
		try {
			if (applicationJobRecordList != null) {
				sqlMapClientTemplate.execute(new SqlMapClientCallback() {
					public Object doInSqlMapClient(SqlMapExecutor executor)
							throws SQLException {
						executor.startBatch();
						for (int i = 0, n = applicationJobRecordList.size(); i < n; i++) {
							if (consumerFilter(applicationJobRecordList.get(i)
									.getJobId(), blogUser.getUserName(),
									blogUser.getAge(), blogUser
											.getWorkingLife())) {
								logger.info("第"+(i+1)+"条申请被屏蔽，职位ID为："+applicationJobRecordList.get(i)
										.getJobId());
								continue;
							} else if (checkUserRepeatApplications(
									applicationJobRecordList.get(i).getUserId(),
									applicationJobRecordList.get(i).getJobId())) {
								Map<String, Object> paramMap = new HashMap<String, Object>();
								paramMap.put("userId", applicationJobRecordList
										.get(i).getUserId());
								paramMap.put("jobId", applicationJobRecordList
										.get(i).getJobId());
								paramMap.put("currentDate", new Date());
								executor.update("updateApplicationRecord",
										paramMap);
							} else {
								executor.insert(
										"addReceiptOfApplicationsForJobs",
										applicationJobRecordList.get(i));
							}
						}
						executor.executeBatch();
						return null;
					}
				});
			}
		} catch (Exception e) {

		}
	}

	@SuppressWarnings("unchecked")
	public List<ApplicationJobRecordDto> queryAppliedJobRecordListByUserId(
			Map<String, Object> paramMap, PageInfo pageInfo) {
		return PagingDataListUtil
				.getPagingData(pageInfo, "getCountOfMyAppliedJobList",
						"queryMyAppliedJobList", paramMap);
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

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public Object addJobInfoTemplate(JobInfoDto jobInfo) {
		return sqlMapClientTemplate.insert("addJobInfoTemplate", jobInfo);
	}

	/**
	 * 加载职位模板
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryJobTemplates(String userId, String tmpName) {
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("userId", userId);
		paraMap.put("tmpName", tmpName);
		return sqlMapClientTemplate.queryForList("queryJobTemplateList",
				paraMap);
	}

	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryCompetencyJobs(String competency,
			String jobNature, String isAdviser, int displayCount) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("competency", competency);
		paraMap.put("jobNature", jobNature);
		paraMap.put("isAdviser", isAdviser);
		paraMap.put("currentDate", new Date());
		return sqlMapClientTemplate.queryForList("queryCompetencyJobs",
				paraMap, 0, displayCount);
	}

	/**
	 * 查询用户（企业用户－公司）已发布的职位（没有过期的）
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryRecommentEnterpriseJobList(Long userId,
			Long jobId) {
		Map<Object, Object> paraMap = new HashMap<Object, Object>();
		paraMap.put("userId", userId);
		paraMap.put("jobId", jobId);
		paraMap.put("currentDate", new Date());
		return sqlMapClientTemplate.queryForList(
				"queryRecommentEnterpriseJobList", paraMap);
	}

	/**
	 * 查询企业发布中的职位
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryEnterprisePublishingJobs(
			Map<String, Object> paramMap, PageInfo pageInfo) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"getCountOfEnterprisePublishingJobs",
				"queryJobListOfEnterprisePublishingJobs", paramMap);
	}

	/**
	 * 查询更多职能（职位）信息
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryMoreCompetencyJobList(
			Map<String, Object> paraMap, PageInfo pageInfo) {
		return PagingDataListUtil.getPagingData(pageInfo, "getCountOfJobList",
				"queryJobList", paraMap);
	}

	/**
	 * 删除用户已申请的职位
	 */
	public void deleteUserAppliedJobByJobId(final List<String> jobList) {
		try {
			if (jobList != null) {
				this.getSqlMapClientTemplate().execute(
						new SqlMapClientCallback() {
							public Object doInSqlMapClient(
									SqlMapExecutor executor)
									throws SQLException {
								executor.startBatch();
								for (int i = 0, n = jobList.size(); i < n; i++) {
									executor.delete(
											"deleteUserAppliedJobByJobId",
											jobList.get(i));
								}
								executor.executeBatch();
								return null;
							}
						});
			}
		} catch (Exception e) {

		}
	}

	/**
	 * 删除企业用户之前发布的职位
	 */
	public void deleteEnterprisePublishedJob(String jobIds) {
		sqlMapClientTemplate.delete("deleteEnterprisePublishedJob", jobIds);
	}

	/**
	 * 更新职位状态、延长职位发布时间
	 */
	public void updatePublishedJob(String statementName,
			Map<String, Object> paramMap) {
		sqlMapClientTemplate.update(statementName, paramMap);
	}

	public JobInfoDto loadEJobInfo(Long jobId, Long userId) {
		Map<String, Long> paraMap = new HashMap<String, Long>();
		paraMap.put("jobId", jobId);
		paraMap.put("userId", userId);
		return (JobInfoDto) sqlMapClientTemplate.queryForObject("loadEJobInfo",
				paraMap);
	}

	/**
	 * 修改企业已发布的职位信息
	 */
	public int updatePublishedJob(JobInfoDto jobInfo) {
		return sqlMapClientTemplate.update("updatePublishedJob", jobInfo);
	}

	/**
	 * 今日新增用户 期望职位个数统计
	 */
	public int getCountOfNewJobsByUserExpectedPosition(Long userId) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("currentDate", new Date());
		paraMap.put("userId", userId);
		return (Integer) sqlMapClientTemplate.queryForObject(
				"getCountOfNewJobsByUserExpectedPosition", paraMap);
	}

	/**
	 * 今日新增用户 期望职位列表加载
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryNewJobsByUserExpectedPosition(
			PageInfo pageInfo, Long userId) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("currentDate", new Date());
		paraMap.put("userId", userId);
		return PagingDataListUtil.getPagingData(pageInfo,
				"getCountOfNewJobsByUserExpectedPosition",
				"queryNewJobsByUserExpectedPosition", paraMap);
	}

	/**
	 * 企业即将到期的职位数统计
	 */
	public int getCountOfUserExpireJobs(Map<String, Object> paramMap) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"getCountOfUserExpireJobs", paramMap);
	}

	/**
	 * 首页职位搜索
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryJobListFromHomePage(JobSearchVo jobSearchVo,
			PageInfo pageInfo) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"getCountOfHomePageJobSearch", "queryJobListFromHomePage",
				jobSearchVo);
	}

	/**
	 * 热门职能-职位搜索
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryHotCompetencyJobs(JobSearchVo jobSearchVo,
			PageInfo pageInfo) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("competency", jobSearchVo.getCompetency());
		return PagingDataListUtil.getPagingData(pageInfo, "getCountOfJobList",
				"queryJobList", paraMap);
	}

	/**
	 * 城市站点-职能分类 职位搜索
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryCitySiteCompetencyJobs(
			JobSearchVo jobSearchVo, PageInfo pageInfo) {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("cityCode", jobSearchVo.getCityCode());
		paraMap.put("competency", jobSearchVo.getCompetency());
		paraMap.put("orderBy", jobSearchVo.getOrderBy());
		return PagingDataListUtil.getPagingData(pageInfo, "getCountOfJobList",
				"queryJobList", paraMap);
	}

	/**
	 * 增加职位点击次数。
	 */
	public void addJobClicks(Map<String, String> paramMap) {
		sqlMapClientTemplate.update("addJobClicks", paramMap);
	}

	/**
	 * 城市站点 热门职位检索
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryCitySiteHotJobs(String cityCode,
			int releaseTimes, int clicks, Date currentDate) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cityCode", cityCode);
		paramMap.put("releaseTimes", releaseTimes);
		paramMap.put("clicks", clicks);
		paramMap.put("currentDate", currentDate);
		return sqlMapClientTemplate.queryForList("queryCitySiteHotJobs",
				paramMap);
	}

	/**
	 * 城市站点 热门职位列表加载
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryCitySiteHotJobListByJobName(
			JobSearchVo jobSearchVo, PageInfo pageInfo) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"getCountOfCitySiteHotJobListByJobName",
				"queryCitySiteHotJobListByJobName", jobSearchVo);
	}

	/**
	 * 系统职位信息加载
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> querySysJobInformation(JobSearchVo jobSearchVo,
			PageInfo pageInfo) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"getCountOfSysJobInformation", "loadJobInformation",
				jobSearchVo);
	}

	/**
	 * 新增发布招聘职位数统计
	 */
	public int releasedNumberOfThePostsToDay() {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"releasedNumberOfThePostsToDay", new Date());
	}

	/**
	 * 招聘管理 收到的申请数据加载
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> queryApplicationsReceiveds(JobSearchVo jobSearchVo,
			PageInfo pageInfo) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"getCountOfApplicationsReceiveds",
				"queryApplicationsReceiveds", jobSearchVo);
	}

	/**
	 * 判断用户是否重复申请某职位
	 */
	public boolean checkUserRepeatApplications(Long userId, Long jobId) {
		Map<String, Long> paramMap = new HashMap<String, Long>();
		paramMap.put("userId", userId);
		paramMap.put("jobId", jobId);
		int n = (Integer) sqlMapClientTemplate.queryForObject(
				"checkUserRepeatApplications", paramMap);
		if (n > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 修改用户申请记录 职位申请时间
	 */
	public void updateApplicationRecord(Long userId, Long jobId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", userId);
		paramMap.put("jobId", jobId);
		paramMap.put("currentDate", new Date());
		sqlMapClientTemplate.update("updateApplicationRecord", paramMap);
	}

	/**
	 * 数据统计 招聘应聘人数统计
	 */
	@SuppressWarnings("unchecked")
	public List<JobSearchVo> queryJobApplicantsStatistics(Date jobIssuetDate,
			Date jobExpiryDate, PageInfo pageInfo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("jobIssuetDate", jobIssuetDate);
		paramMap.put("jobExpiryDate", jobExpiryDate);
		if (null != pageInfo) {
			return PagingDataListUtil.getPagingData(pageInfo,
					"getCountOfJobApplicantsStatistics",
					"jobApplicantsStatistics", paramMap);
		}
		return sqlMapClientTemplate.queryForList("jobApplicantsStatistics",
				paramMap);
	}

	/**
	 * 用户近三个月收到的申请数统计
	 */
	public int queryApplicationsReceivedsOfTrimester(Long userId, Date trimester) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", userId);
		paramMap.put("trimester", trimester);
		return (Integer) sqlMapClientTemplate.queryForObject(
				"getCountOfApplicationsReceivedsInTrimester", paramMap);
	}
	
	/**
	 * 用户今日收到的申请数统计
	 */
	public int queryApplicationsReceivedsOfToday(Long userId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userId", userId);
		return (Integer) sqlMapClientTemplate.queryForObject(
				"getCountOfApplicationsReceivedsToday", paramMap);
	}

	/**
	 * 企业正在招聘的 职位数统计
	 */
	public int cAreRecruitingStatisticsTheNumOfPosts(Long userId) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"cAreRecruitingStatisticsTheNumOfPosts", userId);
	}

	/**
	 * 更新职位状态-职位发布（定时调度）
	 */
	public void scheduledPubJob() {
		sqlMapClientTemplate.update("scheduledPubJob", new Date());
	}

	/**
	 * 更新职位状态-职位过期（定时调度）
	 */
	public void scheduledDueJob() {
		sqlMapClientTemplate.update("scheduledDueJob", new Date());
	}

	/**
	 * 加载所选暂停职位
	 */
	@SuppressWarnings("unchecked")
	public List<JobInfoDto> loadSelectedSuspendJobs(String jobIds) {
		return sqlMapClientTemplate.queryForList("loadSelectedSuspendJobs",
				jobIds);
	}

	public void deleteReveiveApplyRecord(String ids) {
		sqlMapClientTemplate.delete("deleteReveiveApplyRecord", ids);
	}
}
