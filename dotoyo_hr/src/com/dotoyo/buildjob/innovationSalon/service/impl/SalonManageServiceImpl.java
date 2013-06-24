package com.dotoyo.buildjob.innovationSalon.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.innovationSalon.dao.ISalonManageDao;
import com.dotoyo.buildjob.innovationSalon.dto.CommentDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;
import com.dotoyo.buildjob.innovationSalon.service.ISalonManageService;
import com.dotoyo.buildjob.innovationSalon.service.ISalonService;
import com.dotoyo.buildjob.innovationSalon.vo.SalonSearchVo;

/**
 * @author Bill xu
 * @dateCreated 2011-01-25
 * @description salon user manage business process
 */
public class SalonManageServiceImpl implements ISalonManageService {

	private ISalonService   salonService;
	private ISalonManageDao salonManageDao;
	 /**
	  * 获取沙龙信息列表 by userId(分页)
	 */
	public List<SalonInfoDto> querySalonListByUserId(PageInfo pageInfo,
			Long userId, String salonType) {
		return this.setAttendCount2List(salonManageDao.querySalonListByUserId(pageInfo, userId, salonType));
	}
	 /**
	  * 获取所有(分沙龙类型)沙龙信息列表 (分页)
	 */
	public List<SalonInfoDto> querySalonListBySalonType4Media(PageInfo pageInfo,
			String salonType,String mediaType,String userId) {
		return this.setSalonMediaCount2List(salonManageDao.querySalonListBySalonType4Media(pageInfo,salonType,mediaType,userId),mediaType,userId);
	}


	/**
	 * 获取某沙龙图片(或者视频)信息列表(分页)
	 */
	public List<SalonMediaDto> querySalonMediaListBySalonId(PageInfo pageInfo,Long salonId,String mediaType,String status,Long userId){
		return this.setMediaValue2List(this.salonManageDao.querySalonMediaListBySalonId(pageInfo, salonId, mediaType, status,userId));
	}

	 /**
	  * 搜索所有(分沙龙类型)沙龙信息列表 (分页)
	 */
	public List<SalonInfoDto> searchSalonListBySalonType4Media(PageInfo pageInfo,SalonSearchVo salonSearchVo){
		String userId = salonSearchVo.getUserId() != null ? salonSearchVo.getUserId().toString() : null;
		return this.setSalonMediaCount2List(salonManageDao.searchSalonListBySalonType4Media(pageInfo,salonSearchVo),salonSearchVo.getMediaType(),userId);
	}


	 /**
	  * 获取参与沙龙信息列表 by userId(分页)
	 */
	public List<SalonInfoDto> queryJoinSalonListByUserId(PageInfo pageInfo,
			SalonSearchVo salonSearchVO) {
		return this.setAttendCount2List(salonManageDao.queryJoinSalonListByUserId(pageInfo, salonSearchVO));
	}
	 /**
	  * 获取本人在沙龙发表的观点(文章)信息列表 by userId(分页)
	 */
	public List<SalonArticleDto> querySalonArticelListByUserId(PageInfo pageInfo,Long userId,Long salonId) {
		return this.setArticleValue2List(this.salonManageDao.querySalonArticelListByUserId(pageInfo, userId, salonId));
	}

	/**
	    *取消参与的沙龙
	    * @param salonIds
	    * @param userId
	    */
	public void cancelJoinSalon(String salonIds,Long userId) {
		this.salonManageDao.cancelJoinSalon(salonIds,userId);
	}


	/**
	    *删除文章
	    * @param salonIds
	    */
	public void deleteArticle(String ids) {
		this.salonManageDao.deleteArticle(ids);
	}


	/**
	    *删除图片或者视频
	    * @param salonIds
	    */
	public void deleteMedia(String ids) {
		this.salonManageDao.deleteMedia(ids);
	}


	 /**
	  * 搜索所有(包含文章、图片、视频、沙龙)评论信息列表 (分页)
	 */
	public List<CommentDto> searchAllCommentList(PageInfo pageInfo,SalonSearchVo salonSearchVo){
		return setCommentValue2List(this.salonManageDao.searchAllCommentList(pageInfo, salonSearchVo));
	}


	/**
	    *删除评论
	    * @param salonIds
	    */
	public void deleteComment(String ids) {
		this.salonManageDao.deleteComment(ids);
	}


	//获取沙龙参加人数，set into list

	private List<SalonInfoDto> setAttendCount2List(List<SalonInfoDto> salonInfoList ){
		List<SalonInfoDto> newList = new ArrayList<SalonInfoDto>();
		for(SalonInfoDto salonInfoDto:salonInfoList){
			salonInfoDto.setSalonAttendCount(this.salonService.getSalonAntendCount(salonInfoDto.getId()));
			newList.add(salonInfoDto);
		}
		return newList;
	}
	//获取视频或者图片总数，set into list
	private List<SalonInfoDto> setSalonMediaCount2List(List<SalonInfoDto> salonInfoList,String mediaType,String userId){

		List<SalonInfoDto> newList = new ArrayList<SalonInfoDto>();
		for(SalonInfoDto salonInfoDto:salonInfoList){
			salonInfoDto.setSalonMediaCount(this.salonManageDao.getMediaCountBySalonId(salonInfoDto.getId(), mediaType,userId));
			//沙龙状态
			if(salonInfoDto.getAudiFlag().equalsIgnoreCase(ApplicationConstant.STATUS_NOT_PASS)){
				salonInfoDto.setAudiFlag(ApplicationConstant.STATUS_NOT_PASS_MSG);
			}else if(salonInfoDto.getAudiFlag().equalsIgnoreCase(ApplicationConstant.STATUS_PASSED)){
				salonInfoDto.setAudiFlag(ApplicationConstant.STATUS_PASSED_MSG);
			}else{
				salonInfoDto.setAudiFlag(ApplicationConstant.STATUS_PENDING_MSG);
			}
			newList.add(salonInfoDto);
		}
		return newList;
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


	 //处理评论列表的值转换，set into list
	private List<CommentDto> setCommentValue2List(List<CommentDto> commenList ){
		List<CommentDto> newList = new ArrayList<CommentDto>();
		for(CommentDto commentDto:commenList){
			//评论状态
		    if(commentDto.getStatus().equalsIgnoreCase(ApplicationConstant.STATUS_PENDING)){
		    	commentDto.setStatus(ApplicationConstant.STATUS_PENDING_MSG);
		    }else if(commentDto.getStatus().equalsIgnoreCase(ApplicationConstant.STATUS_PASSED)){
		    	commentDto.setStatus(ApplicationConstant.STATUS_PASSED_MSG);
		    }else{
		    	commentDto.setStatus(ApplicationConstant.STATUS_NOT_PASS_MSG);
		    }

		    //评论的类型
		    if(commentDto.getSubjectType().equalsIgnoreCase(ApplicationConstant.COMMENT_SUBJECT_TYPE_ARTICLE)){
		    	commentDto.setSubjectType("文章");
		    }else if(commentDto.getSubjectType().equalsIgnoreCase(ApplicationConstant.COMMENT_SUBJECT_TYPE_SALON)){
		    	commentDto.setSubjectType("沙龙");
		    }else if(commentDto.getSubjectType().equalsIgnoreCase(ApplicationConstant.COMMENT_SUBJECT_TYPE_PICTURE)){
		    	commentDto.setSubjectType("图片");
		    }else{
		    	commentDto.setSubjectType("视频");
		    }


			newList.add(commentDto);
		}
		return newList;
	}

	 //处理图片或者视频值转换，set into list
	private List<SalonMediaDto> setMediaValue2List(List<SalonMediaDto> mediaList ){
		List<SalonMediaDto> newList = new ArrayList<SalonMediaDto>();
		for(SalonMediaDto salonMediaDto:mediaList){
			//媒介状态
		    if(salonMediaDto.getStatus().equalsIgnoreCase(ApplicationConstant.STATUS_PENDING)){
		    	salonMediaDto.setStatus(ApplicationConstant.STATUS_PENDING_MSG);
		    }else if(salonMediaDto.getStatus().equalsIgnoreCase(ApplicationConstant.STATUS_PASSED)){
		    	salonMediaDto.setStatus(ApplicationConstant.STATUS_PASSED_MSG);
		    }else{
		    	salonMediaDto.setStatus(ApplicationConstant.STATUS_NOT_PASS_MSG);
		    }
		    if(salonMediaDto.getIsExcellent().equalsIgnoreCase(ApplicationConstant.MEDIA_IS_EXCELLENT_YES)){
		    	salonMediaDto.IsExcellent(ApplicationConstant.MSG_YES);
		     }else{
		    	salonMediaDto.IsExcellent(ApplicationConstant.MSG_NO);
		    }
			newList.add(salonMediaDto);
		}
		return newList;
	}

	public ISalonService getSalonService() {
		return salonService;
	}

	public void setSalonService(ISalonService salonService) {
		this.salonService = salonService;
	}

	public ISalonManageDao getSalonManageDao() {
		return salonManageDao;
	}

	public void setSalonManageDao(ISalonManageDao salonManageDao) {
		this.salonManageDao = salonManageDao;
	}
	public void modifyArticle(SalonArticleDto salonArticleDto) {
		salonArticleDto.setSubmitDate(new Date());
	  this.salonManageDao.modifyArticle(salonArticleDto);
	}

	public CommentDto getCommentById(Long id) {
		return this.salonManageDao.getCommentById(id);
	}
	public void modifyComment(CommentDto commentDto) {
	   commentDto.setSubmitDate(new Date());
	   this.salonManageDao.modifyComment(commentDto);
	}

}
