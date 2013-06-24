package com.dotoyo.buildjob.certificateCenter.dao;

import java.util.List;

import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsAccessHistoryDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-14
 * @description
 */
public interface ICertNeedsAccessHistoryDao {

	/**
	 * 增加证书需求信息浏览记录
	 * 
	 * @param certNeedsAccessHistoryDto
	 */
	public void saveCertNeedsAccessHistory(
			CertNeedsAccessHistoryDto certNeedsAccessHistoryDto);

	/**
	 * 删除证书需求信息浏览记录
	 * 
	 * @param id
	 */
	public void deleteCertNeedsAccessHistory(Long id);

	/**
	 * 根据证书需求ID批量删除浏览记录
	 * 
	 * @param ids
	 */
	public void deleteCertNeedsAccessHistoryCertNeedsId(String ids);

	/**
	 * 根据证书需求ID查找证书需求浏览记录
	 * 
	 * @param certNeedsId
	 * @return
	 */
	public List<CertNeedsAccessHistoryDto> queryCertNeedsAccessHistoryByCertNeedsId(
			Long certNeedsId);

	/**
	 * 根据证书需求ID查找证书需求浏览记录条数
	 * 
	 * @param certNeedsId
	 * @return
	 */
	public Integer queryCertNeedsAccessHistoryCountByCertNeedsId(
			Long certNeedsId);

}
