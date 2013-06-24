package com.dotoyo.buildjob.certificateCenter.service;

import java.util.List;

import com.dotoyo.buildjob.certificateCenter.dto.CertAccessHistoryDto;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-1-26
 * @description
 */
public interface ICertAccessHistoryService {
	/**
	 * 增加个人证书浏览记录，同时发送站内信个证书发布人
	 * 
	 * @param certAccessHistoryDto
	 */
	public boolean saveCertAccessHistory(CertAccessHistoryDto certAccessHistoryDto,LoginUserInfoDto loginUserInfoDto);

	/**
	 * 删除个人证书浏览记录
	 * 
	 * @param id
	 */
	public void deleteCertAccessHistory(Long id);

	/**
	 * 根据个人证书ID批量删除证书浏览记录
	 * 
	 * @param ids
	 */
	public void deleteCertAccessHistoryByPersonalCertId(String ids);

	/**
	 * 根据个人证书ID查找证书浏览记录
	 * 
	 * @param certId
	 * @return
	 */
	public List<CertAccessHistoryDto> queryCertAccessHistoryByCertId(Long certId);

	/**
	 * 根据个人证书ID查找证书浏览记录条数
	 * 
	 * @param certId
	 * @return
	 */
	public Integer queryCertAccessHistoryCountByCertId(Long certId);
}
