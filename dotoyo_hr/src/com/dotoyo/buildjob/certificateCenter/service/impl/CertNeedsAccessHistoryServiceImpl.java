package com.dotoyo.buildjob.certificateCenter.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.dotoyo.buildjob.certificateCenter.dao.ICertNeedsAccessHistoryDao;
import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsAccessHistoryDto;
import com.dotoyo.buildjob.certificateCenter.service.ICertNeedsAccessHistoryService;
import com.dotoyo.buildjob.certificateCenter.service.ICertificateService;
import com.dotoyo.buildjob.certificateCenter.vo.CertNeedsVo;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.ShortMessageDto;
import com.dotoyo.buildjob.common.service.IShortMessageService;
import com.dotoyo.buildjob.common.user.service.IUserService;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-14
 * @description
 */
public class CertNeedsAccessHistoryServiceImpl implements
		ICertNeedsAccessHistoryService {

	private ICertNeedsAccessHistoryDao certNeedsAccessHistoryDao;
	private ICertificateService certificateService;
	private IShortMessageService shortMessageService;
	private IUserService userService;

	public void saveCertNeedsAccessHistory(
			CertNeedsAccessHistoryDto certNeedsAccessHistoryDto) {
		certNeedsAccessHistoryDao
				.saveCertNeedsAccessHistory(certNeedsAccessHistoryDto);
		CertNeedsVo certNeedsVo = certificateService
				.getCertNeedsById(certNeedsAccessHistoryDto.getCertNeedsId());
		Long receiverId = certNeedsVo.getUserId();
		Long senderId = 0L;
		ShortMessageDto shortMessageDto = new ShortMessageDto();
		shortMessageDto.setReceiverId(receiverId);
		shortMessageDto.setSenderId(senderId);
		shortMessageDto.setReceiveDate(new Date());
		shortMessageDto.setTitle(ApplicationConstant.SYS_SHORTMSG_TITLE);
		shortMessageDto.setType("0");
		shortMessageDto.setStatus(ApplicationConstant.NOTICE_UNREAD);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String accessDateStr = sdf.format(certNeedsAccessHistoryDto
				.getAccessDate());
		String accessUserName = userService.getUserById(
				certNeedsAccessHistoryDto.getAccessUserId()).getUserName();
		String message = "你好，你发布的证书需求信息在" + accessDateStr + "被用户"
				+ accessUserName + "浏览。";
		shortMessageDto.setMessage(message);
		shortMessageService.saveReceiveMsg(shortMessageDto);
	}

	public void deleteCertNeedsAccessHistory(Long id) {
		certNeedsAccessHistoryDao.deleteCertNeedsAccessHistory(id);

	}

	public void deleteCertNeedsAccessHistoryCertNeedsId(String ids) {
		certNeedsAccessHistoryDao.deleteCertNeedsAccessHistoryCertNeedsId(ids);

	}

	public List<CertNeedsAccessHistoryDto> queryCertNeedsAccessHistoryByCertNeedsId(
			Long certNeedsId) {
		return certNeedsAccessHistoryDao
				.queryCertNeedsAccessHistoryByCertNeedsId(certNeedsId);
	}

	public Integer queryCertNeedsAccessHistoryCountByCertNeedsId(
			Long certNeedsId) {
		return certNeedsAccessHistoryDao
				.queryCertNeedsAccessHistoryCountByCertNeedsId(certNeedsId);
	}

	/**
	 * @return the certNeedsAccessHistoryDao
	 */
	public ICertNeedsAccessHistoryDao getCertNeedsAccessHistoryDao() {
		return certNeedsAccessHistoryDao;
	}

	/**
	 * @param certNeedsAccessHistoryDao
	 *            the certNeedsAccessHistoryDao to set
	 */
	public void setCertNeedsAccessHistoryDao(
			ICertNeedsAccessHistoryDao certNeedsAccessHistoryDao) {
		this.certNeedsAccessHistoryDao = certNeedsAccessHistoryDao;
	}

	/**
	 * @return the certificateService
	 */
	public ICertificateService getCertificateService() {
		return certificateService;
	}

	/**
	 * @param certificateService
	 *            the certificateService to set
	 */
	public void setCertificateService(ICertificateService certificateService) {
		this.certificateService = certificateService;
	}

	/**
	 * @return the shortMessageService
	 */
	public IShortMessageService getShortMessageService() {
		return shortMessageService;
	}

	/**
	 * @param shortMessageService
	 *            the shortMessageService to set
	 */
	public void setShortMessageService(IShortMessageService shortMessageService) {
		this.shortMessageService = shortMessageService;
	}

	/**
	 * @return the userService
	 */
	public IUserService getUserService() {
		return userService;
	}

	/**
	 * @param userService
	 *            the userService to set
	 */
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

}
