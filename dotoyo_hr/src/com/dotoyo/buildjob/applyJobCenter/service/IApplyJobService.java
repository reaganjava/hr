package com.dotoyo.buildjob.applyJobCenter.service;

import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.applyJobCenter.dto.ApplyJobInfoDto;
import com.dotoyo.buildjob.applyJobCenter.dto.RecommendationDto;
import com.dotoyo.buildjob.applyJobCenter.vo.ApplyJobInfoVo;
import com.dotoyo.buildjob.applyJobCenter.vo.RecommendationVo;
import com.dotoyo.buildjob.common.dto.InterviewNoticeDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2010-12-2
 * @description
 */
public interface IApplyJobService {

	/**
	 * 保存线上求职信息
	 * 
	 * @param applyJobInfoDto
	 *            线上求职信息值对象
	 * @param isApplyRecommendation
	 *            是否同时成为线下推荐对象
	 */
	public void saveApplyJobInfo(ApplyJobInfoDto applyJobInfoDto,
			String isApplyRecommendation);

	/**
	 * 查询重复的求职记录ID列表
	 * 
	 * @param applyJobInfoDto
	 * @return
	 */
	public List<Long> queryDuplicatedIntentionIdList(
			ApplyJobInfoDto applyJobInfoDto);

	/**
	 * 查询在线求职信息列表
	 * 
	 * @param applyJobInfoDto
	 *            在线求职信息值对象
	 * @return 在线求职信息列表
	 */
	public List<ApplyJobInfoVo> queryApplyJobInfoList(PageInfo pageInfo,
			ApplyJobInfoDto applyJobInfoDto);

	/**
	 * 查选在线求职信息列表大小
	 * 
	 * @param applyJobInfoDto
	 * @return
	 */
	public Integer queryApplyJobInfoCount(ApplyJobInfoDto applyJobInfoDto);

	/**
	 * 查询重复的求职记录条数
	 * 
	 * @param applyJobInfoDto
	 * @return
	 */
	public Integer queryDuplicatedIntentionCount(ApplyJobInfoDto applyJobInfoDto);

	/**
	 * 查询指定大小求职信息列表
	 * 
	 * @param applyJobInfoDto
	 * @param size
	 * @return
	 */
	public List<ApplyJobInfoVo> queryApplyJobInfoList(
			ApplyJobInfoDto applyJobInfoDto, int size);

	/**
	 * 批量删除在线求职信息
	 * 
	 * @param applyJobInfoId
	 */
	public void deleteApplyJobInfo(String applyJobInfoIds);

	/**
	 * 更新在线求职信息
	 * 
	 * @param applyJobInfoDto
	 *            在线求职信息值对象
	 */
	public void updateApplyJobInfo(ApplyJobInfoDto applyJobInfoDto);

	/**
	 * 查询在线求职信息详细内容
	 * 
	 * @param id
	 *            在线求职信息ID
	 * @return 在线求职信息值对象
	 */
	public ApplyJobInfoVo getApplyJobInfoById(Long id);

	/**
	 * 保存线下推荐对象申请信息
	 * 
	 * @param recommendationDto
	 *            线下推荐对象信息值对象
	 * @param isApplyJob
	 *            是否同时发布在线求职信息
	 */
	public void saveRecommendation(RecommendationDto recommendationDto,
			String isApplyJob);

	/**
	 * 删除线下推荐对象信息
	 * 
	 * @param id
	 *            线下推荐对象信息ID
	 */
	public void deleteRecommendation(Long id);

	/**
	 * 更新线下推荐对象信息
	 * 
	 * @param recommendationDto
	 *            线下推荐对象信息值对象
	 */
	public void updateRecommendation(RecommendationDto recommendationDto);

	/**
	 * 查询线下推荐对象信息列表
	 * 
	 * @param recommendationDto
	 *            线下推荐对象信息值对象
	 * @return 线下推荐对象信息列表
	 */
	public List<RecommendationVo> queryRecommendationList(PageInfo pageInfo,
			RecommendationDto recommendationDto);

	/**
	 * 查询线下推荐对象信息详细内容
	 * 
	 * @param id
	 *            线下推荐对象信息ID
	 * @return 线下推荐对象信息值对象
	 */
	public RecommendationVo getRecommendationById(Long id);

	/**
	 * 添加面试通知信息
	 * 
	 * @param interviewNoticeDto
	 *            面试通知信息值对象
	 */
	public boolean saveInterviewNotice(InterviewNoticeDto interviewNoticeDto,
			LoginUserInfoDto loginUserInfo);

	/**
	 * 查看已接收面试信息
	 * 
	 * @param receiverId
	 * @return
	 */
	public List<InterviewNoticeDto> queryInterviewReceiveNoticeListByReceiverId(
			PageInfo pageInfo, InterviewNoticeDto interviewNoticeDto);

	/**
	 * 查看已发送面试信息
	 * 
	 * @param pageInfo
	 * @param senderId
	 * @return
	 */
	public List<InterviewNoticeDto> queryInterviewSendNoticeListBySenderId(
			PageInfo pageInfo, Long senderId);

	/**
	 * 查看已接收面试通知详细信息
	 * 
	 * @param id
	 * @return
	 */
	public InterviewNoticeDto getInterviewReceiveNoticeById(Long id);

	/**
	 * 查看已发送面试通知详细信息
	 * 
	 * @param id
	 * @return
	 */
	public InterviewNoticeDto getInterviewSendNoticeById(Long id);

	/**
	 * 批量删除接收面试通知信息
	 * 
	 * @param ids
	 */
	public void deleteInterviewReceiveNotice(String ids);

	/**
	 * 批量删除发送面试通知信息
	 * 
	 * @param ids
	 */
	public void deleteInterviewSendNotice(String ids);

	/**
	 * 批量邀请面试
	 */
	public void fastBatchApply(List<InterviewNoticeDto> list);

	/**
	 * 暂停求职信息
	 * 
	 * @param applyJobInfoId
	 */
	public void pauseApplyJobInfo(String ids);

	/**
	 * 重新发布求职信息
	 * 
	 * @param applyJobInfoId
	 */
	public void publishApplyJobInfo(String ids);

	/**
	 * 未查看的面试通知数统计
	 */
	public int getCountOfNotSeeInviteByUserId(Long userId);

	/**
	 * 审核线下人才 申请
	 */
	public void updateLineTalentVerifyStatus(Map<String, Object> paramMap);

	/**
	 * 删除线下人才库人才
	 */
	public void deleteLineTalentById(String id);

	/**
	 * 更新推荐对象面试状态
	 * 
	 * @param recommendationMap
	 */
	public void updateRecommendationInterviewStatus(
			Map<String, String> recommendationMap);
}
