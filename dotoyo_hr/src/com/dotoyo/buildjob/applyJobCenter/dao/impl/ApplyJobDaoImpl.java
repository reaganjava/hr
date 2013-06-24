package com.dotoyo.buildjob.applyJobCenter.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.applyJobCenter.dao.IApplyJobDao;
import com.dotoyo.buildjob.applyJobCenter.dto.ApplyJobInfoDto;
import com.dotoyo.buildjob.applyJobCenter.dto.RecommendationDto;
import com.dotoyo.buildjob.applyJobCenter.vo.ApplyJobInfoVo;
import com.dotoyo.buildjob.applyJobCenter.vo.RecommendationVo;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.InterviewNoticeDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.ibatis.sqlmap.client.SqlMapExecutor;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2010-12-2
 * @description
 */
public class ApplyJobDaoImpl implements IApplyJobDao {

	private SqlMapClientTemplate sqlMapClientTemplate;

	public void saveApplyJobInfo(ApplyJobInfoDto applyJobInfoDto) {

		sqlMapClientTemplate.insert("saveApplyJobInfo", applyJobInfoDto);

	}

	@SuppressWarnings("unchecked")
	public List<ApplyJobInfoVo> queryApplyJobInfoList(PageInfo pageInfo,
			ApplyJobInfoDto applyJobInfoDto) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryApplyJobInfoCount", "queryApplyJobInfoList",
				applyJobInfoDto);
	}

	public Integer queryApplyJobInfoCount(ApplyJobInfoDto applyJobInfoDto) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"queryApplyJobInfoCount", applyJobInfoDto);
	}

	public Integer queryDuplicatedIntentionCount(ApplyJobInfoDto applyJobInfoDto) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"queryDuplicatedIntentionCount", applyJobInfoDto);
	}

	@SuppressWarnings("unchecked")
	public List<ApplyJobInfoVo> queryApplyJobInfoList(
			ApplyJobInfoDto applyJobInfoDto, int size) {

		return sqlMapClientTemplate.queryForList("queryApplyJobInfoList",
				applyJobInfoDto, 0, size);
	}

	public void deleteApplyJobInfo(String ids) {
		sqlMapClientTemplate.delete("deleteApplyJobInfo", ids);
	}

	public void updateApplyJobInfo(ApplyJobInfoDto applyJobInfoDto) {
		sqlMapClientTemplate.update("updateApplyJobInfo", applyJobInfoDto);
	}

	public void updateApplyJobInfoActiveStatus(
			Map<String, String> applyJobInfoMap) {
		sqlMapClientTemplate.update("updateApplyJobInfoActiveStatus",
				applyJobInfoMap);
	}

	public ApplyJobInfoVo getApplyJobInfoById(Long id) {
		return (ApplyJobInfoVo) sqlMapClientTemplate.queryForObject(
				"getApplyJobInfoById", id);
	}

	public void saveRecommendation(RecommendationDto recommendationDto) {
		sqlMapClientTemplate.insert("saveRecommendation", recommendationDto);
	}

	public void deleteRecommendation(Long id) {
		sqlMapClientTemplate.delete("deleteRecommendation", id);
	}

	public void updateRecommendation(RecommendationDto recommendationDto) {
		sqlMapClientTemplate.update("updateRecommendation", recommendationDto);
	}

	@SuppressWarnings("unchecked")
	public List<RecommendationVo> queryRecommendationList(PageInfo pageInfo,
			RecommendationDto recommendationDto) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryRecommendationCount", "queryRecommendationList",
				recommendationDto);
	}

	public RecommendationVo getRecommendationById(Long id) {
		return (RecommendationVo) sqlMapClientTemplate.queryForObject(
				"getRecommendationById", id);
	}

	public void saveInterviewSendNotice(InterviewNoticeDto interviewNoticeDto) {
		sqlMapClientTemplate.insert("saveInterviewSendNotice",
				interviewNoticeDto);
	}

	public void saveInterviewReceiveNotice(InterviewNoticeDto interviewNoticeDto) {
		sqlMapClientTemplate.insert("saveInterviewReceiveNotice",
				interviewNoticeDto);
	}

	@SuppressWarnings("unchecked")
	public List<InterviewNoticeDto> queryInterviewReceiveNoticeListByReceiverId(
			PageInfo pageInfo, InterviewNoticeDto interviewNoticeDto) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryInterviewReceiveNoticeCountByReceiverId",
				"queryInterviewReceiveNoticeListByReceiverId", interviewNoticeDto);
	}

	@SuppressWarnings("unchecked")
	public List<InterviewNoticeDto> queryInterviewSendNoticeListBySenderId(
			PageInfo pageInfo, Long senderId) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryInterviewSendNoticeCountBySenderId",
				"queryInterviewSendNoticeListBySenderId", senderId);
	}

	public InterviewNoticeDto getInterviewReceiveNoticeById(Long id) {
		return (InterviewNoticeDto) sqlMapClientTemplate.queryForObject(
				"getInterviewReceiveNoticeById", id);
	}

	public InterviewNoticeDto getInterviewSendNoticeById(Long id) {
		return (InterviewNoticeDto) sqlMapClientTemplate.queryForObject(
				"getInterviewSendNoticeById", id);
	}

	public void deleteInterviewReceiveNotice(String ids) {
		sqlMapClientTemplate.delete("deleteInterviewReceiveNotice", ids);
	}

	public void deleteInterviewSendNotice(String ids) {
		sqlMapClientTemplate.delete("deleteInterviewSendNotice", ids);
	}

	public void updateInterviewReceiveNoticeStatus(
			InterviewNoticeDto interviewNoticeDto) {
		sqlMapClientTemplate.update("updateInterviewReceiveNoticeStatus",
				interviewNoticeDto);
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	/**
	 * 批量邀请面试
	 */
	public void addBatchInterviewApply(final List<InterviewNoticeDto> list) {
		try {
			if (list != null) {
				sqlMapClientTemplate.execute(new SqlMapClientCallback() {
					public Object doInSqlMapClient(SqlMapExecutor executor)
							throws SQLException {
						executor.startBatch();
						for (int i = 0, n = list.size(); i < n; i++) {
							executor.insert("saveInterviewSendNotice",
									list.get(i));
							executor.insert("saveInterviewReceiveNotice",
									list.get(i));
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
	 * 未查看的面试通知数统计
	 */
	public int getCountOfNotSeeInviteByUserId(Long userId) {
		return (Integer) sqlMapClientTemplate.queryForObject(
				"getCountOfNotSeeInvite", userId);
	}

	/**
	 * 审核线下人才 申请
	 */
	public void updateLineTalentVerifyStatus(Map<String, Object> paramMap) {
		sqlMapClientTemplate.update("examineAndVerify", paramMap);
	}

	/**
	 * 删除线下人才库人才
	 */
	public void deleteLineTalentById(String id) {
		sqlMapClientTemplate.delete("delLineTalent", id);
	}

	@SuppressWarnings("unchecked")
	public List<Long> queryDuplicatedIntentionIdList(
			ApplyJobInfoDto applyJobInfoDto) {
		return sqlMapClientTemplate.queryForList(
				"queryDuplicatedIntentionIdList", applyJobInfoDto);
	}

	public void updateRecommendationInterviewStatus(
			Map<String, String> recommendationMap) {
		sqlMapClientTemplate.update("updateRecommendationInterviewStatus",
				recommendationMap);
	}
}
