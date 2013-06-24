package com.dotoyo.buildjob.certificateCenter.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.dotoyo.buildjob.certificateCenter.dao.ICertAccessHistoryDao;
import com.dotoyo.buildjob.certificateCenter.dto.CertAccessHistoryDto;
import com.dotoyo.buildjob.certificateCenter.service.ICertAccessHistoryService;
import com.dotoyo.buildjob.certificateCenter.service.ICertificateService;
import com.dotoyo.buildjob.certificateCenter.vo.PersonalCertVo;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.ShortMessageDto;
import com.dotoyo.buildjob.common.service.IShortMessageService;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.dotoyo.buildjob.sys.service.ISysOrderService;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-1-26
 * @description
 */
public class CertAccessHistoryServiceImpl implements ICertAccessHistoryService {

	private ICertAccessHistoryDao certAccessHistoryDao;
	private ICertificateService certificateService;
	private IShortMessageService shortMessageService;
	private IUserService userService;
	private ISysOrderService sysOrderService;

	public boolean saveCertAccessHistory(
			CertAccessHistoryDto certAccessHistoryDto,
			LoginUserInfoDto loginUserInfoDto) {

		SysOrderDto dto = new SysOrderDto();
		dto.setService1Remains(new Long(1));
		LoginUserInfoDto userInfo = loginUserInfoDto;
		if(certAccessHistoryDao.queryCertAccessHistoryListByCertIdAndCompanyId(certAccessHistoryDto).size()>0){
			certAccessHistoryDao.saveCertAccessHistory(certAccessHistoryDto);
			PersonalCertVo personalCertVo = certificateService
					.getPersonalCertById(certAccessHistoryDto
							.getPersonalCertId());
			Long receiverId = personalCertVo.getUserId();
			Long senderId = 0L;
			ShortMessageDto shortMessageDto = new ShortMessageDto();
			shortMessageDto.setReceiverId(receiverId);
			shortMessageDto.setSenderId(senderId);
			shortMessageDto.setReceiveDate(new Date());
			shortMessageDto.setTitle(ApplicationConstant.SYS_SHORTMSG_TITLE);
			shortMessageDto.setType("0");
			shortMessageDto.setStatus(ApplicationConstant.NOTICE_UNREAD);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String accessDateStr = sdf.format(certAccessHistoryDto
					.getAccessDate());
			String accessUserName = userService.getUserById(
					certAccessHistoryDto.getCompanyId()).getUserName();
			String message = "你好，你发布的证书信息在" + accessDateStr + "被用户"
					+ accessUserName + "浏览。";
			shortMessageDto.setMessage(message);
			shortMessageService.saveReceiveMsg(shortMessageDto);
			return true;
		}
		if (sysOrderService.verifyAuthority(dto, userInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_HUNTCARD_CODE, "1", 1)) {

			certAccessHistoryDao.saveCertAccessHistory(certAccessHistoryDto);
			PersonalCertVo personalCertVo = certificateService
					.getPersonalCertById(certAccessHistoryDto
							.getPersonalCertId());
			Long receiverId = personalCertVo.getUserId();
			Long senderId = 0L;
			ShortMessageDto shortMessageDto = new ShortMessageDto();
			shortMessageDto.setReceiverId(receiverId);
			shortMessageDto.setSenderId(senderId);
			shortMessageDto.setReceiveDate(new Date());
			shortMessageDto.setTitle(ApplicationConstant.SYS_SHORTMSG_TITLE);
			shortMessageDto.setType("0");
			shortMessageDto.setStatus(ApplicationConstant.NOTICE_UNREAD);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String accessDateStr = sdf.format(certAccessHistoryDto
					.getAccessDate());
			String accessUserName = userService.getUserById(
					certAccessHistoryDto.getCompanyId()).getUserName();
			String message = "你好，你发布的证书信息在" + accessDateStr + "被用户"
					+ accessUserName + "浏览。";
			shortMessageDto.setMessage(message);
			shortMessageService.saveReceiveMsg(shortMessageDto);
			return true;
		}

		return false;

	}

	public void deleteCertAccessHistory(Long id) {
		certAccessHistoryDao.deleteCertAccessHistory(id);
	}

	public void deleteCertAccessHistoryByPersonalCertId(String ids) {
		certAccessHistoryDao.deleteCertAccessHistoryByPersonalCertId(ids);
	}

	public List<CertAccessHistoryDto> queryCertAccessHistoryByCertId(Long certId) {
		return certAccessHistoryDao.queryCertAccessHistoryByCertId(certId);
	}

	public Integer queryCertAccessHistoryCountByCertId(Long certId) {
		return certAccessHistoryDao.queryCertAccessHistoryCountByCertId(certId);
	}

	/**
	 * @return the certAccessHistoryDao
	 */
	public ICertAccessHistoryDao getCertAccessHistoryDao() {
		return certAccessHistoryDao;
	}

	/**
	 * @param certAccessHistoryDao
	 *            the certAccessHistoryDao to set
	 */
	public void setCertAccessHistoryDao(
			ICertAccessHistoryDao certAccessHistoryDao) {
		this.certAccessHistoryDao = certAccessHistoryDao;
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

	public ISysOrderService getSysOrderService() {
		return sysOrderService;
	}

	public void setSysOrderService(ISysOrderService sysOrderService) {
		this.sysOrderService = sysOrderService;
	}

}
