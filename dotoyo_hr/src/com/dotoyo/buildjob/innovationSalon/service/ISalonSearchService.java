package com.dotoyo.buildjob.innovationSalon.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;
import com.dotoyo.buildjob.innovationSalon.vo.SalonSearchVo;

/**
 * 
 * @author Bill xu
 * @dateCreated 2011-01-18
 * @description  salon search service interface
 */
public interface ISalonSearchService {

	/**
	 * 获取沙龙信息列表(分页)
	 */
	public List<SalonInfoDto> querySalonList(PageInfo pageInfo,SalonSearchVo salonSearchVo);
	
	/**
	 * 获取文章信息列表(分页)
	 */
	public List<SalonArticleDto> querySalonArticleList(PageInfo pageInfo,SalonSearchVo salonSearchVo);

	/**
	 * 获取图片(或者视频)信息列表(分页)
	 */
	public List<SalonMediaDto> querySalonMediaList(PageInfo pageInfo,SalonSearchVo salonSearchVo);
	
	
	/**
	 * 获取图片(或者视频)信息列表(分页)By Salon Id
	 */
	public List<SalonMediaDto> querySalonMediaListBySalonId(PageInfo pageInfo,Long salonId,String mediaType);
	public List<SalonMediaDto> querySalonMediaListByIdAndisExcellent(PageInfo pageInfo,Long salonId,String mediaType,String isExcellent);
	
	
	/**
	 * 获取图片(或者视频)信息列表(分页)
	 */
	public List<SalonInfoDto> transSalonInfoList(List<SalonInfoDto> salonList);

	/**
	 * 获取图片(或者视频)详细信息
	 * @param id
	 * @return
	 */
	public SalonMediaDto getSalonMediaById(Long id);
	
	/**
	 * 当天系统发表文章数统计
	 */
	public int getNumberOfNewArticlesStatisticalToDay();
}
