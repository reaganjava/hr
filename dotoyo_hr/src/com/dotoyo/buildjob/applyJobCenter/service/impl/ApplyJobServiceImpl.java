package com.dotoyo.buildjob.applyJobCenter.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.applyJobCenter.dao.IApplyJobDao;
import com.dotoyo.buildjob.applyJobCenter.dto.ApplyJobInfoDto;
import com.dotoyo.buildjob.applyJobCenter.dto.RecommendationDto;
import com.dotoyo.buildjob.applyJobCenter.service.IApplyJobService;
import com.dotoyo.buildjob.applyJobCenter.vo.ApplyJobInfoVo;
import com.dotoyo.buildjob.applyJobCenter.vo.RecommendationVo;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.AutoShortMsgConfigDto;
import com.dotoyo.buildjob.common.dto.InterviewNoticeDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ShortMessageDto;
import com.dotoyo.buildjob.common.service.IShortMessageService;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.dotoyo.buildjob.sys.service.ISysOrderService;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2010-12-2
 * @description
 */
public class ApplyJobServiceImpl implements IApplyJobService {

	private IApplyJobDao applyJobDao;
	private ISysOrderService sysOrderService;
	private IShortMessageService shortMessageService;

	public void saveApplyJobInfo(ApplyJobInfoDto applyJobInfoDto,
			String isApplyRecommendation) {
		if (ApplicationConstant.COMMON_Y_EN
				.equalsIgnoreCase(isApplyRecommendation)) {
			applyJobDao.saveRecommendation(applyJobInfoDto
					.getRecommendationDto());
		}
		applyJobDao.saveApplyJobInfo(applyJobInfoDto);

	}

	public List<ApplyJobInfoVo> queryApplyJobInfoList(PageInfo pageInfo,
			ApplyJobInfoDto applyJobInfoDto) {

		return analyzeApplyJobInfoList(applyJobDao.queryApplyJobInfoList(
				pageInfo, applyJobInfoDto));
	}

	public Integer queryApplyJobInfoCount(ApplyJobInfoDto applyJobInfoDto) {
		return applyJobDao.queryApplyJobInfoCount(applyJobInfoDto);
	}

	public List<ApplyJobInfoVo> queryApplyJobInfoList(
			ApplyJobInfoDto applyJobInfoDto, int size) {
		return analyzeApplyJobInfoList(applyJobDao.queryApplyJobInfoList(
				applyJobInfoDto, size));
	}

	public void deleteApplyJobInfo(String applyJobInfoIds) {
		applyJobDao.deleteApplyJobInfo(applyJobInfoIds);
	}

	public void updateApplyJobInfo(ApplyJobInfoDto applyJobInfoDto) {
		applyJobDao.updateApplyJobInfo(applyJobInfoDto);
	}

	public ApplyJobInfoVo getApplyJobInfoById(Long id) {
		return applyJobDao.getApplyJobInfoById(id);
	}

	public void saveRecommendation(RecommendationDto recommendationDto,
			String isApplyJob) {
		if (ApplicationConstant.COMMON_Y_EN.equalsIgnoreCase(isApplyJob)) {
			applyJobDao
					.saveApplyJobInfo(recommendationDto.getApplyJobInfoDto());
		}
		applyJobDao.saveRecommendation(recommendationDto);
	}

	public void deleteRecommendation(Long id) {
		applyJobDao.deleteRecommendation(id);
	}

	public void updateRecommendation(RecommendationDto recommendationDto) {
		applyJobDao.updateRecommendation(recommendationDto);
	}

	public List<RecommendationVo> queryRecommendationList(PageInfo pageInfo,
			RecommendationDto recommendationDto) {
		return applyJobDao.queryRecommendationList(pageInfo, recommendationDto);
	}

	public RecommendationVo getRecommendationById(Long id) {
		return applyJobDao.getRecommendationById(id);
	}

	public boolean saveInterviewNotice(InterviewNoticeDto interviewNoticeDto,
			LoginUserInfoDto loginUserInfo) {

		// 扣除相应服务次数
		SysOrderDto dto = new SysOrderDto();
		dto.setService3Remains(new Long(1));
		boolean result = sysOrderService.verifyAuthority(dto, loginUserInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_RECRUIT_CODE, "3", 1);

		if (result) {
			// 分别在发件箱、收件箱保存站内信
			saveInterviewSendNotice(interviewNoticeDto);
			saveInterviewReceiveNotice(interviewNoticeDto);

			// 如果个人用户设置了自动回复站内信，给企业用户回复站内信息
			Long personalUserId = interviewNoticeDto.getReceiverId();
			AutoShortMsgConfigDto autoShortMsgConfigDto = shortMessageService
					.getAutoShortMsgConfigByUserId(personalUserId);
			if (autoShortMsgConfigDto != null) {
				ShortMessageDto shortMessageDto = new ShortMessageDto();
				shortMessageDto.setSenderId(personalUserId);
				shortMessageDto.setReceiverId(loginUserInfo.getId());
				shortMessageDto.setReceiveDate(new Date());
				shortMessageDto.setTitle(autoShortMsgConfigDto.getTitle());
				shortMessageDto.setType("1");
				shortMessageDto.setStatus(ApplicationConstant.NOTICE_UNREAD);
				shortMessageDto.setMessage(autoShortMsgConfigDto.getMsg());
				shortMessageService.saveReceiveMsg(shortMessageDto);
			}
		}
		return result;
	}

	public List<InterviewNoticeDto> queryInterviewReceiveNoticeListByReceiverId(
			PageInfo pageInfo, InterviewNoticeDto interviewNoticeDto) {
		return applyJobDao.queryInterviewReceiveNoticeListByReceiverId(
				pageInfo, interviewNoticeDto);
	}

	public List<InterviewNoticeDto> queryInterviewSendNoticeListBySenderId(
			PageInfo pageInfo, Long senderId) {
		return applyJobDao.queryInterviewSendNoticeListBySenderId(pageInfo,
				senderId);
	}

	public InterviewNoticeDto getInterviewReceiveNoticeById(Long id) {
		InterviewNoticeDto result = applyJobDao
				.getInterviewReceiveNoticeById(id);
		if (result != null) {
			result.setStatus(ApplicationConstant.NOTICE_READ);
			applyJobDao.updateInterviewReceiveNoticeStatus(result);
		}
		return result;
	}

	public InterviewNoticeDto getInterviewSendNoticeById(Long id) {
		InterviewNoticeDto result = applyJobDao.getInterviewSendNoticeById(id);
		return result;
	}

	public void deleteInterviewReceiveNotice(String ids) {
		applyJobDao.deleteInterviewReceiveNotice(ids);
	}

	public void deleteInterviewSendNotice(String ids) {
		applyJobDao.deleteInterviewSendNotice(ids);
	}

	private List<ApplyJobInfoVo> analyzeApplyJobInfoList(
			List<ApplyJobInfoVo> resultList) {
		ApplyJobInfoVo result = new ApplyJobInfoVo();
		for (int i = 0; i < resultList.size(); i++) {
			result = resultList.get(i);
			if (ApplicationConstant.APPLYJOBCTR_YES_EN.equalsIgnoreCase(result
					.getIsAdvisor())) {
				result.setIsAdvisorStr(ApplicationConstant.APPLYJOBCTR_YES_CN);
			} else {
				result.setIsAdvisorStr(ApplicationConstant.APPLYJOBCTR_NO_CN);
			}
		}
		return resultList;
	}

	private void saveInterviewSendNotice(InterviewNoticeDto interviewNoticeDto) {
		applyJobDao.saveInterviewSendNotice(interviewNoticeDto);
	}

	private void saveInterviewReceiveNotice(
			InterviewNoticeDto interviewNoticeDto) {
		applyJobDao.saveInterviewReceiveNotice(interviewNoticeDto);
	}

	public IApplyJobDao getApplyJobDao() {
		return applyJobDao;
	}

	public void setApplyJobDao(IApplyJobDao applyJobDao) {
		this.applyJobDao = applyJobDao;
	}

	/**
	 * 批量邀请面试
	 */
	public void fastBatchApply(List<InterviewNoticeDto> list) {
		applyJobDao.addBatchInterviewApply(list);
	}

	public void pauseApplyJobInfo(String ids) {
		Map<String, String> applyJobInfoMap = new HashMap<String, String>();
		applyJobInfoMap.put("ids", ids);
		applyJobInfoMap.put("actStatus",
				ApplicationConstant.APPLYJOBCTR_ACTSTATUS_INACTIVE);
		applyJobDao.updateApplyJobInfoActiveStatus(applyJobInfoMap);
	}

	public void publishApplyJobInfo(String ids) {
		Map<String, String> applyJobInfoMap = new HashMap<String, String>();
		applyJobInfoMap.put("ids", ids);
		applyJobInfoMap.put("actStatus",
				ApplicationConstant.APPLYJOBCTR_ACTSTATUS_ACTIVE);
		applyJobDao.updateApplyJobInfoActiveStatus(applyJobInfoMap);
	}

	/**
	 * 未查看的面试通知数统计
	 */
	public int getCountOfNotSeeInviteByUserId(Long userId) {
		return applyJobDao.getCountOfNotSeeInviteByUserId(userId);
	}

	/**
	 * 审核线下人才 申请
	 */
	public void updateLineTalentVerifyStatus(Map<String, Object> paramMap) {
		applyJobDao.updateLineTalentVerifyStatus(paramMap);
	}

	/**
	 * 删除线下人才库人才
	 */
	public void deleteLineTalentById(String id) {
		applyJobDao.deleteLineTalentById(id);
	}

	public ISysOrderService getSysOrderService() {
		return sysOrderService;
	}

	public void setSysOrderService(ISysOrderService sysOrderService) {
		this.sysOrderService = sysOrderService;
	}

	public Integer queryDuplicatedIntentionCount(ApplyJobInfoDto applyJobInfoDto) {
		return applyJobDao.queryDuplicatedIntentionCount(applyJobInfoDto);
	}

	public List<Long> queryDuplicatedIntentionIdList(
			ApplyJobInfoDto applyJobInfoDto) {
		return applyJobDao.queryDuplicatedIntentionIdList(applyJobInfoDto);
	}

	public void updateRecommendationInterviewStatus(
			Map<String, String> recommendationMap) {
		applyJobDao.updateRecommendationInterviewStatus(recommendationMap);

	}

	public IShortMessageService getShortMessageService() {
		return shortMessageService;
	}

	public void setShortMessageService(IShortMessageService shortMessageService) {
		this.shortMessageService = shortMessageService;
	}

}
