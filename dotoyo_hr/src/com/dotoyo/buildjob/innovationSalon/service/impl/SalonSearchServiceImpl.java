package com.dotoyo.buildjob.innovationSalon.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.innovationSalon.dao.ISalonSearchDao;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;
import com.dotoyo.buildjob.innovationSalon.service.ISalonSearchService;
import com.dotoyo.buildjob.innovationSalon.service.ISalonService;
import com.dotoyo.buildjob.innovationSalon.vo.SalonSearchVo;

/**
 * @author Bill xu
 * @dateCreated 2011-01-06
 * @description salon business process
 */
public class SalonSearchServiceImpl implements ISalonSearchService {
	private ISalonSearchDao salonSearchDao;
	private ISalonService   salonService;

	public ISalonSearchDao getSalonSearchDao() {
		return salonSearchDao;
	}

	public void setSalonSearchDao(ISalonSearchDao salonSearchDao) {
		this.salonSearchDao = salonSearchDao;
	}

	public ISalonService getSalonService() {
		return salonService;
	}

	public void setSalonService(ISalonService salonService) {
		this.salonService = salonService;
	}

	public List<SalonInfoDto> querySalonList(PageInfo pageInfo,
			SalonSearchVo salonSearchVo) {
		return this.transSalonInfoList(this.salonSearchDao.querySalonList(pageInfo, salonSearchVo));
	}

	public List<SalonArticleDto> querySalonArticleList(PageInfo pageInfo,
			SalonSearchVo salonSearchVo) {
		return this.setArticleValue2List(this.salonSearchDao.querySalonArticleList(pageInfo, salonSearchVo));
	}

	public List<SalonMediaDto> querySalonMediaList(PageInfo pageInfo,
			SalonSearchVo salonSearchVo) {
		return this.salonSearchDao.querySalonMediaList(pageInfo, salonSearchVo);
	}

	//转换生成的List供给页面显示
	public List<SalonInfoDto> transSalonInfoList(List<SalonInfoDto> salonList) {
		
		ArrayList<SalonInfoDto> newList = new ArrayList<SalonInfoDto>();		
		for(SalonInfoDto salonInfoDto:salonList){
			salonInfoDto.setSalonAttendCount(this.salonService.getSalonAntendCount(salonInfoDto.getId()));
			//沙龙类型
			if(salonInfoDto.getSalonType().equalsIgnoreCase(ApplicationConstant.SALON_TYPE_ONLINE)){
				salonInfoDto.setSalonTypeText(ApplicationConstant.SALON_TYPE_ONLINE_MSG);
			}else{
				salonInfoDto.setSalonTypeText(ApplicationConstant.SALON_TYPE_OFFLINE_MSG);
			}
			//状态
			if(null!=salonInfoDto.getAudiFlag() && salonInfoDto.getAudiFlag().equalsIgnoreCase(ApplicationConstant.STATUS_NOT_PASS)){
				salonInfoDto.setAudiFlag(ApplicationConstant.STATUS_NOT_PASS_MSG);
			}else if(salonInfoDto.getAudiFlag().equalsIgnoreCase(ApplicationConstant.STATUS_PASSED)){
				salonInfoDto.setAudiFlag(ApplicationConstant.STATUS_PASSED_MSG);
			}else{
				salonInfoDto.setAudiFlag(ApplicationConstant.STATUS_PENDING_MSG);	
			}
			//是否经典
			if(null!=salonInfoDto.getIsExcellent()&& salonInfoDto.getIsExcellent().equalsIgnoreCase(ApplicationConstant.SALON_IS_EXCELLENT_YES)){
				salonInfoDto.setIsExcellent(ApplicationConstant.MSG_YES);
			}else{
				salonInfoDto.setIsExcellent(ApplicationConstant.MSG_NO);
			}
						
			newList.add(salonInfoDto);
		}
		return newList;
	}

	public SalonMediaDto getSalonMediaById(Long id) {
		return this.salonSearchDao.getSalonMediaById(id);
	}

	public List<SalonMediaDto> querySalonMediaListBySalonId(PageInfo pageInfo,
			Long salonId,String mediaType) {
		return this.salonSearchDao.querySalonMediaListBySalonId(pageInfo, salonId,mediaType);
	}
	public List<SalonMediaDto> querySalonMediaListByIdAndisExcellent(PageInfo pageInfo,
			Long salonId,String mediaType,String isExcellent) {
		return this.salonSearchDao.querySalonMediaListByIdAndisExcellent(pageInfo, salonId,mediaType,isExcellent);
	}

	 //处理文章列表的值转换，set into list
	private List<SalonArticleDto> setArticleValue2List(List<SalonArticleDto> articleList ){
		List<SalonArticleDto> newList = new ArrayList<SalonArticleDto>();
		for(SalonArticleDto salonArticleDto:articleList){
			//文章状态
		    if(salonArticleDto.getArticleStatus().equalsIgnoreCase(ApplicationConstant.STATUS_PENDING)){
		    	salonArticleDto.setArticleStatus(ApplicationConstant.STATUS_PENDING_MSG);
		    }else if(salonArticleDto.getArticleStatus().equalsIgnoreCase(ApplicationConstant.STATUS_PASSED)){
		    	salonArticleDto.setArticleStatus(ApplicationConstant.STATUS_PASSED_MSG);
		    }else{
		    	salonArticleDto.setArticleStatus(ApplicationConstant.STATUS_NOT_PASS_MSG);
		    }
		    
		   //文章经典
		    if(salonArticleDto.getIsExcellent().equalsIgnoreCase(ApplicationConstant.ARTICLE_IS_EXCELLENT_YES)){
		    	salonArticleDto.setIsExcellent(ApplicationConstant.MSG_YES);
		    }else{
		    	salonArticleDto.setIsExcellent(ApplicationConstant.MSG_NO);
		    }
		    
		    //文章精华
		    if(salonArticleDto.getIscream().equalsIgnoreCase(ApplicationConstant.ARTICLE_IS_CREAM_YES)){
		    	salonArticleDto.setIscream(ApplicationConstant.MSG_YES);
		    }else{
		    	salonArticleDto.setIscream(ApplicationConstant.MSG_NO);
		    }
		    
		    //文章推荐
		    if(salonArticleDto.getIsRecomment().equalsIgnoreCase(ApplicationConstant.ARTICLE_IS_RECOMMENT_YES)){
		    	salonArticleDto.setIsRecomment(ApplicationConstant.MSG_YES);
		    }else{
		    	salonArticleDto.setIsRecomment(ApplicationConstant.MSG_NO);
		    }
		    
			newList.add(salonArticleDto);
		}
		return newList;
	}
	
	/**
	 * 当天系统发表文章数统计
	 */
	public int getNumberOfNewArticlesStatisticalToDay(){
		return salonSearchDao.getNumberOfNewArticlesStatisticalToDay();
	}

}
