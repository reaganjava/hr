package com.dotoyo.buildjob.innovationSalon.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.innovationSalon.dao.ISalonManageDao;
import com.dotoyo.buildjob.innovationSalon.dto.CommentDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;
import com.dotoyo.buildjob.innovationSalon.vo.SalonSearchVo;

/**
 * @author Bill xu
 * @dateCreated 2011-01-06
 * @description 沙龙逻辑操作接口
 *
 */
public class SalonManageDaoImpl implements ISalonManageDao {
	private SqlMapClientTemplate sqlMapClientTemplate;


	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> querySalonListByUserId(PageInfo pageInfo,
			Long userId, String salonType) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("userId", userId);
		paraMap.put("salonType", salonType);
		return PagingDataListUtil.getPagingData(pageInfo, "querySalonListByUserIdCount", "querySalonListByUserId", paraMap);

	}
	/**
	 * 获取参与沙龙信息列表 by userId(分页)
	*/
	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> queryJoinSalonListByUserId(PageInfo pageInfo,
			SalonSearchVo salonSearchVo) {

		return PagingDataListUtil.getPagingData(pageInfo, "queryJoinSalonListByUserIdCount", "queryJoinSalonListByUserId", salonSearchVo);

	}

	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> querySalonListBySalonType4Media(PageInfo pageInfo,

			String salonType,String mediaType,String userId) {

		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("salonType", salonType);
		paraMap.put("mediaType", mediaType);
		paraMap.put("userId", userId);
		return PagingDataListUtil.getPagingData(pageInfo, "querySalonListBySalonType4MediaCount", "querySalonListBySalonType4Media", paraMap);
	}

	/**
	 * 获取某沙龙图片(或者视频)信息列表(分页)
	 */
	@SuppressWarnings("unchecked")
	public List<SalonMediaDto> querySalonMediaListBySalonId(PageInfo pageInfo,Long salonId,String mediaType,String status,Long userId){
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("salonId", salonId);
		paraMap.put("mediaType", mediaType);
		paraMap.put("status", status);
		paraMap.put("userId", userId);
		return PagingDataListUtil.getPagingData(pageInfo, "querySalonMediaInfoListBySalonIdCount", "querySalonMediaInfoListBySalonId", paraMap);
	}


	 /**
	  * 搜索所有(分沙龙类型)沙龙信息列表 (分页)
	 */
	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> searchSalonListBySalonType4Media(PageInfo pageInfo,SalonSearchVo salonSearchVo){
		return PagingDataListUtil.getPagingData(pageInfo, "searchSalonListBySalonType4MediaCount", "searchSalonListBySalonType4Media", salonSearchVo);
	}

	/**
	* 获取本人在沙龙发表的观点(文章)信息列表 by userId(分页)
	*/
	@SuppressWarnings("unchecked")
	public List<SalonArticleDto> querySalonArticelListByUserId(PageInfo pageInfo,
			Long userId, Long salonId) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("userId", userId);
		paraMap.put("salonId", salonId);
		return PagingDataListUtil.getPagingData(pageInfo, "querySalonArticleListByUserIdCount", "querySalonArticleListByUserId", paraMap);

	}

	public void cancelJoinSalon(String salonIds,Long userId) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("ids", salonIds);
		paraMap.put("userId", userId);
		sqlMapClientTemplate.delete("deleteSalonAttendInfo", paraMap);
	}

	public void deleteArticle(String ids) {
		sqlMapClientTemplate.delete("deleteArticle", ids);
	}

	public void modifyArticle(SalonArticleDto salonArticleDto) {
		sqlMapClientTemplate.update("modifyArticle", salonArticleDto);
	}

	public void deleteMedia(String ids) {
		sqlMapClientTemplate.delete("deleteMedia", ids);
	}

	//获取视频或者视频总数by salon
	public Long getMediaCountBySalonId(Long salonId,String mediaType,String userId){
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("salonId", salonId);
		paraMap.put("mediaType", mediaType);
		paraMap.put("userId", userId);
		return (Long) sqlMapClientTemplate.queryForObject("getMediaCountBySalonId", paraMap);
	}

	 /**
	  * 搜索所有(包含文章、图片、视频、沙龙)评论信息列表 (分页)
	 */
	@SuppressWarnings("unchecked")
	public List<CommentDto> searchAllCommentList(PageInfo pageInfo,SalonSearchVo salonSearchVo){
		return PagingDataListUtil.getPagingData(pageInfo, "queryAllCommentListCount", "queryAllCommentList", salonSearchVo);
	}
	//删除评论
	public void deleteComment(String ids) {
		sqlMapClientTemplate.delete("deleteComment", ids);
	}

	public CommentDto getCommentById(Long id) {
		return (CommentDto) sqlMapClientTemplate.queryForObject("getCommentById", id);
	}

	//修改评论
	public void modifyComment(CommentDto commentDto) {
		sqlMapClientTemplate.update("modifyComment", commentDto);
	}
}
