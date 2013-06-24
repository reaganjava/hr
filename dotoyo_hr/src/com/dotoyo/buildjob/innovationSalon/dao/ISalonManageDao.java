package com.dotoyo.buildjob.innovationSalon.dao;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.CommentDto;
import com.dotoyo.buildjob.innovationSalon.dto.HostUnitDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonAttendDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;
import com.dotoyo.buildjob.innovationSalon.vo.SalonSearchVo;

/**
 * @author Bill xu
 * @dateCreated 2011-01-25
 * @description salon user manage process
 *
 */
public interface ISalonManageDao {

	/**
	 * 获取沙龙信息列表 by userId(分页)
	 */
	public List<SalonInfoDto> querySalonListByUserId(PageInfo pageInfo,
			Long userId, String salonType);

	/**
	 * 获取所有(分沙龙类型)沙龙信息列表 (分页)
	 */
	public List<SalonInfoDto> querySalonListBySalonType4Media(
			PageInfo pageInfo, String salonType, String mediaType,String userId);

	/**
	 * 获取某沙龙图片(或者视频)信息列表(分页)
	 */
	public List<SalonMediaDto> querySalonMediaListBySalonId(PageInfo pageInfo,
			Long salonId, String mediaType, String status,Long userId);

	/**
	 * 搜索所有(分沙龙类型)沙龙信息列表 (分页)
	 */
	public List<SalonInfoDto> searchSalonListBySalonType4Media(
			PageInfo pageInfo, SalonSearchVo salonSearchVo);

	/**
	 * 获取参与沙龙信息列表 by userId(分页)
	 */
	public List<SalonInfoDto> queryJoinSalonListByUserId(PageInfo pageInfo,
			SalonSearchVo salonSearchVo);

	/**
	 * 获取本人在沙龙发表的观点(文章)信息列表 by userId(分页)
	 */
	public List<SalonArticleDto> querySalonArticelListByUserId(
			PageInfo pageInfo, Long userId, Long salonId);

	/**
	 * 取消参与的沙龙信息
	 */
	public void cancelJoinSalon(String salonIds, Long userId);

	/**
	 * 删除文章
	 */
	public void deleteArticle(String ids);

	/**
	 * 修改文章
	 *
	 * @param ids
	 */
	public void modifyArticle(SalonArticleDto salonArticleDto);

	// get media(picture or video) count by salon
	public Long getMediaCountBySalonId(Long salonId, String mediaType,String userId);

	/**
	 * 删除视频或者图片
	 */
	public void deleteMedia(String ids);

	 /**
	  * 搜索所有(包含文章、图片、视频、沙龙)评论信息列表 (分页)
	 */
	public List<CommentDto> searchAllCommentList(PageInfo pageInfo,SalonSearchVo salonSearchVo);
	/**
	 * 删除评论
	 */
	public void deleteComment(String ids);
	/**
	 * 获取comment的信息
	 * @param id
	 * @return
	 */
	public CommentDto getCommentById(Long id);

	/**
	 * 修改评论
	 */
	public void modifyComment(CommentDto commentDto);
}
