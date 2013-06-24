package com.dotoyo.buildjob.innovationSalon.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.CommentDto;
import com.dotoyo.buildjob.innovationSalon.dto.HostUnitDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonAttendDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;

/**
 * 
 * @author Bill xu
 * @dateCreated 2011-01-06
 * @description  salon service interface
 */
public interface ISalonService {

	public void addSalon(SalonInfoDto salonInfoDto);
	public void updateSalon(SalonInfoDto salonInfoDto);
	public void deleteSalon(String ids);
	public List<SalonInfoDto> querySalonList(int pageSize,String salonType,String isExcellent);
	public List<SalonInfoDto> queryOldSalonList(int pageSize);
	public List<HostUnitDto> queryHostUnitList(int pageSize);
	public List<SalonArticleDto> querySalonArticleList(int pageSize,String isExcellent,String articleStatus);

	/**
	 * 获取某沙龙文章信息列表
	 */
	public List<SalonArticleDto> querySalonArticleListBySalonId(int pageSize,Long salonId,String articleStatus);
		
	/**
	 * 获取沙龙评论信息列表
	 */
	public List<CommentDto> querySalonCommentList(int pageSize,Long subjectId,String subjectType,String status);
	
	/**
	 * 获取沙龙评论信息列表(分页)
	 */
	public List<CommentDto> querySalonCommentList(PageInfo pageInfo,Long subjectId,String subjectType,String status);
	
	
	/**
	 * 获取某沙龙图片(或者视频)信息列表
	 */
	public List<SalonMediaDto> querySalonMediaList(int pageSize,Long salonId,String mediaType,String status);
	
	/**
	 * 获取某沙龙图片(或者视频)信息列表(所有)
	 */
	public List<SalonMediaDto> querySalonMediaListBySalonId(Long salonId,String mediaType,String status);
	
	

	/**
	 * 获取热门沙龙信息列表
	 */
	public List<SalonInfoDto> queryHotSalonList(int pageSize,String salonType);
	
	/**
	 * 获取沙龙参加者信息列表
	 */
	public List<LoginUserInfoDto> queryJoinSalonUserList(int pageSize,Long salonId);
	/**
	 *  获取已经参加沙龙的用户列表
	 * @param pageInfo
	 * @param salonId
	 * @return
	 */
	public List<LoginUserInfoDto> querySalonUserListByPage(PageInfo pageInfo,Long salonId);
	
	/**
	 * 获取沙龙信息 by id
	 * @param id
	 * @return
	 */
	public SalonInfoDto getSalonInfoById(Long id);
	
	/**
	 * 保存评论信息
	 */
	public void saveCommentInfo(CommentDto commentDto);
		
	 /**
	  *  保存图片(或者视频)信息
	  * @param salonMediaDto
	  */
	 
	public void saveMediaInfo(SalonMediaDto salonMediaDto);
	
	
	 /**
	  * 保存沙龙报名信息
	  * @param salonAttendDto
	  */
	 
	public void saveSalonAttendInfo(SalonAttendDto salonAttendDto);
	
	
	 /**
	  *  保存沙龙文章信息
	  * @param salonArticleDto
	  */
	
	public void saveSalonArticleInfo(SalonArticleDto salonArticleDto);
	
	/**
	 * 好评、差评和浏览次数记录
	 * @param salonId
	 * @param browseCount
	 * @param reputationCount
	 * @param schlussgruppeCount
	 */
	public void updateSalonForCount(Long salonId,Long  browseCount,Long  reputationCount,Long  schlussgruppeCount);
	
	/**
	 * 获取沙龙参加总人数
	 * @param salonId
	 * @return
	 */
	public Long getSalonAntendCount(Long salonId);
	
	/**
	 * 获取文章信息By Id
	 * @param id
	 * @return
	 */
	public SalonArticleDto getSalonArticleById(Long id);
	
	/**
	 * 文章好评、差评和浏览次数记录
	 * @param articleId
	 * @param browseCount
	 * @param reputationCount
	 * @param schlussgruppeCount
	 */
	public void updateArticleForCount(Long articleId,Long  browseCount,Long  reputationCount,Long  schlussgruppeCount);
	
	/**
	 * 热门文章列表
	 * @param pageSize
	 * @return
	 */
	public List<SalonArticleDto> queryHotArticleList(int pageSize); 
	/**
	 * 获取某个作者的文章列表
	 * @param pageSize
	 * @param author
	 * @return
	 */
	public List<SalonArticleDto> queryArticleListByAuthor(int pageSize,Long author); 
	
	/**
	 * get salon or article or picture or video comment count
	 * @param subjectId
	 * @param subjectType
	 * @return
	 */
	public Long getCommentCount(Long subjectId,String subjectType);
	
	/**
	 * 获取线下沙龙某沙龙某栏目下的一篇文章
	 */
	public SalonArticleDto querySalonArticleListByColumn(Long salonId,String offlineSalonColumn,String articleStatus);
	
	
	 /**
	  *  保存图片(或者视频)信息列表
	  * @param salonMediaDto
	  */
	 
	public void saveMediaInfo(SalonMediaDto salonMediaDto,List<SalonMediaDto>uploadFiles);
	
	/**
	 * 获取主办单位信息 by id
	 * @param id
	 * @return
	 */
	public HostUnitDto getHostUnitById(Long id);
	
	/**
	 * 沙龙首页显示的沙龙
	 * @param pageSize
	 * @param salonType
	 * @return
	 */
	public List<SalonInfoDto> querySalonList4HomePageDisplay(int pageSize,String salonType);
	public List<SalonInfoDto> querySalonListByType(int pageSize,String salonType);
	
	
	public List<SalonMediaDto> queryClassMediaList(int pageSize,String mediaType,String isExcellent);
	//获取沙龙具有媒介(图片或者视频)总数
	public Long getMediaCountBySalon(Long salonId,String mediaType);
	
	//根据判断用户是否已经参加了某沙龙
	public boolean existSalonAttend(Long salonId,Long userId);
	public SalonArticleDto getSalonArticleByUpId(Long id,Long uid,String salonColumn);
	public SalonArticleDto getSalonArticleByDownId(Long id,Long uid,String salonColumn);
}
