package com.dotoyo.buildjob.certificateCenter.dao;

import java.util.List;

import com.dotoyo.buildjob.certificateCenter.dto.CertAccessHistoryDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-1-26
 * @description
 */
public interface ICertAccessHistoryDao {

	/**
	 * 增加个人证书浏览记录
	 * 
	 * @param certAccessHistoryDto
	 */
	public void saveCertAccessHistory(CertAccessHistoryDto certAccessHistoryDto);
	
	/**
	 * 根据个人证书ID和浏览公司ID查找浏览信息
	 * @param certAccessHistoryDto
	 * @return
	 */
	public List<CertAccessHistoryDto> queryCertAccessHistoryListByCertIdAndCompanyId(CertAccessHistoryDto certAccessHistoryDto);

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
