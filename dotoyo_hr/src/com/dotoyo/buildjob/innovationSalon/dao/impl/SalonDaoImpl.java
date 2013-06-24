package com.dotoyo.buildjob.innovationSalon.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.DateUtil;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.innovationSalon.dao.ISalonDao;
import com.dotoyo.buildjob.innovationSalon.dto.CommentDto;
import com.dotoyo.buildjob.innovationSalon.dto.HostUnitDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonAttendDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;

/**
 * @author Bill xu
 * @dateCreated 2011-01-06
 * @description 沙龙逻辑操作接口
 *
 */
public class SalonDaoImpl implements ISalonDao {
	private SqlMapClientTemplate sqlMapClientTemplate;


	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public Long saveSalonInfo(SalonInfoDto salonInfoDto) {
		return(Long)sqlMapClientTemplate.insert("addSalonInfo", salonInfoDto);
	}

	public void updateSalonInfo(SalonInfoDto salonInfoDto) {
		sqlMapClientTemplate.update("updateSalonInfo", salonInfoDto);
	}

	public void deleteSalonInfo(String salonIds) {
		//删除相关的参与者
		sqlMapClientTemplate.delete("delSalonAttendBySalonIds", salonIds);
		//删除相关的文章
		sqlMapClientTemplate.delete("delSalonArticleBySalonIds", salonIds);
		//删除相关图片和视频
		sqlMapClientTemplate.delete("delSalonMediaBySalonIds", salonIds);
		//删除相关的评论
		sqlMapClientTemplate.delete("delCommentBySalonIds", salonIds);
		//沙龙首页设置信息
		sqlMapClientTemplate.delete("delHomeSetInfoBySalonIds", salonIds);
		//删除沙龙
		sqlMapClientTemplate.delete("deleteSalonInfo", salonIds);
	}

	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> querySalonList(int pageSize,String salonType,String isExcellent) {
		Map<String,String> paraMap = new HashMap<String,String>();
		String currentDate = DateUtil.getCurrentDateString("yyyy-MM-dd");
		paraMap.put("salonType", salonType);
		paraMap.put("isExcellent", isExcellent);
		paraMap.put("pendingDate", currentDate);
		return sqlMapClientTemplate.queryForList("querySalonInfoList",paraMap,0,pageSize);
	}
	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> querySalonList4HomePageDisplay(int pageSize,String salonType) {
		return sqlMapClientTemplate.queryForList("querySalonList4HomePageDisplay",salonType,0,pageSize);
	}
	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> querySalonListByType(int pageSize,String salonType) {
		return sqlMapClientTemplate.queryForList("querySalonListByType",salonType,0,pageSize);
	}
	
	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> querySalonListByIds(String salonType,int pageSize){
		return sqlMapClientTemplate.queryForList("querySalonInfoListByIds",salonType,0,pageSize);
	}
	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> queryOldSalonList(int pageSize) {
		String currentDate = DateUtil.getCurrentDateString("yyyy-MM-dd");
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("currentDate", currentDate);
		return sqlMapClientTemplate.queryForList("queryOldSalonInfoList",paraMap,0,pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<HostUnitDto> queryHostUnitList(int pageSize) {
		return sqlMapClientTemplate.queryForList("queryHostUnitList",0,pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<SalonArticleDto> querySalonArticleList(int pageSize,String isExcellent,String articleStatus) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("isExcellent", isExcellent);
		paraMap.put("articleStatus", articleStatus);
		return sqlMapClientTemplate.queryForList("querySalonArticleList",paraMap,0,pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<SalonArticleDto> querySalonArticleListBySalonId(int pageSize,
			Long salonId, String articleStatus) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("salonId", salonId);
		paraMap.put("articleStatus", articleStatus);
		return sqlMapClientTemplate.queryForList("querySalonArticleList",paraMap,0,pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<SalonArticleDto> querySalonArticleListByColumn(int pageSize,Long salonId, String offlineSalonColumn, String articleStatus) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("salonId", salonId);
		paraMap.put("articleStatus", articleStatus);
		paraMap.put("offlineSalonColumn", offlineSalonColumn);
		return sqlMapClientTemplate.queryForList("querySalonArticleListByColumn",paraMap,0,pageSize);
	}



	@SuppressWarnings("unchecked")
	public List<CommentDto> querySalonCommentList(int pageSize, Long subjectId,
			String subjectType, String status) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("subjectId", subjectId);
		paraMap.put("subjectType", subjectType);
		paraMap.put("status", status);
		return sqlMapClientTemplate.queryForList("queryCommentList",paraMap,0,pageSize);
	}


	/**
	 * 获取沙龙评论信息列表(分页)
	 */
	@SuppressWarnings("unchecked")
	public List<CommentDto> querySalonCommentList(PageInfo pageInfo, Long subjectId,
			String subjectType, String status) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("subjectId", subjectId);
		paraMap.put("subjectType", subjectType);
		paraMap.put("status", status);
		if(pageInfo == null){
			return sqlMapClientTemplate.queryForList("queryCommentList",paraMap);
		}else{
			return PagingDataListUtil.getPagingData(pageInfo, "queryCommentCount", "queryCommentList", paraMap);
		}
	}

	@SuppressWarnings("unchecked")
	public List<SalonMediaDto> querySalonMediaList(int pageSize, Long salonId,
			String mediaType, String status) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("salonId", salonId);
		paraMap.put("mediaType", mediaType);
		paraMap.put("status", status);
		return sqlMapClientTemplate.queryForList("querySalonMediaInfoList",paraMap,0,pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<SalonMediaDto> querySalonMediaListBySalonId(Long salonId,
			String mediaType, String status) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("salonId", salonId);
		paraMap.put("mediaType", mediaType);
		paraMap.put("status", status);
		return sqlMapClientTemplate.queryForList("querySalonMediaInfoList",paraMap);
	}

	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> queryHotSalonList(int pageSize, String salonType) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("salonType", salonType);
		return sqlMapClientTemplate.queryForList("queryHotSalonInfoList",paraMap,0,pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<SalonArticleDto> queryHotArticleList(int pageSize) {
		return sqlMapClientTemplate.queryForList("queryHotArticleList",0,pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<LoginUserInfoDto> queryJoinSalonUserList(int pageSize, Long salonId) {
		Map<String,Long> paraMap = new HashMap<String,Long>();
		paraMap.put("salonId", salonId);
		return sqlMapClientTemplate.queryForList("queryJoinSalonUserList",paraMap,0,pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<LoginUserInfoDto> querySalonUserListByPage(PageInfo pageInfo,Long salonId)  {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("salonId", salonId);
		return PagingDataListUtil.getPagingData(pageInfo, "queryJoinSalonUserCount", "queryJoinSalonUserList", paraMap);
	}

	public SalonInfoDto getSalonInfoById(Long id) {
		return (SalonInfoDto) sqlMapClientTemplate.queryForObject("getSalonInfoById", id);
	}

	public void saveCommentInfo(CommentDto commentDto) {
		sqlMapClientTemplate.insert("addCommentInfo", commentDto);
	}

	public void saveMediaInfo(SalonMediaDto salonMediaDto) {
		sqlMapClientTemplate.insert("addSalonMediaInfo", salonMediaDto);
	}

	public void saveSalonAttendInfo(SalonAttendDto salonAttendDto) {
		sqlMapClientTemplate.insert("addAttendInfo", salonAttendDto);
	}
	public int getSalonAttendCount(Long salonId,Long userId) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("salonId", salonId);
		paraMap.put("userId", userId);
		return (Integer) sqlMapClientTemplate.queryForObject("existAttend",paraMap);
	}
	public void saveSalonArticleInfo(SalonArticleDto salonArticleDto) {
		sqlMapClientTemplate.insert("addSalonArticleInfo", salonArticleDto);
	}
	//好评、差评和浏览次数记录
	public void updateSalonForCount(Long salonId,Long  browseCount,Long  reputationCount,Long  schlussgruppeCount) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("id", salonId);
		paraMap.put("browseCount", browseCount);
		paraMap.put("reputationCount", reputationCount);
		paraMap.put("schlussgruppeCount", schlussgruppeCount);
		sqlMapClientTemplate.update("updateSalonForCount", paraMap);
	}

	//获取沙龙参加总人数
	public Long getSalonAntendCount(Long salonId){
		return (Long) sqlMapClientTemplate.queryForObject("getSalonAttendCount", salonId);
	}

	public SalonArticleDto getSalonArticleById(Long id) {
		return (SalonArticleDto) sqlMapClientTemplate.queryForObject("getSalonArticleById", id);
	}
	public SalonArticleDto getSalonArticleByUpId(Long id,Long uid,String salonColumn) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("id", id);
		paraMap.put("salonId", uid);
		paraMap.put("salonColumn", salonColumn);
		return (SalonArticleDto) sqlMapClientTemplate.queryForObject("getSalonArticleByUpId", paraMap);
	}
	public SalonArticleDto getSalonArticleByDownId(Long id,Long salonId,String salonColumn) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("id", id);
		paraMap.put("salonId", salonId);
		paraMap.put("salonColumn", salonColumn);
		return (SalonArticleDto) sqlMapClientTemplate.queryForObject("getSalonArticleByDownId", paraMap);
	}

	//文章好评、差评和浏览次数记录
	public void updateArticleForCount(Long articleId,Long  browseCount,Long  reputationCount,Long  schlussgruppeCount) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("id", articleId);
		paraMap.put("browseCount", browseCount);
		paraMap.put("reputationCount", reputationCount);
		paraMap.put("schlussgruppeCount", schlussgruppeCount);
		sqlMapClientTemplate.update("updateArticleForCount", paraMap);
	}

	@SuppressWarnings("unchecked")
	public List<SalonArticleDto> queryArticleListByAuthor(int pageSize,
			Long author) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("author", author);
		return sqlMapClientTemplate.queryForList("querySalonArticleList",paraMap,0,pageSize);
	}

	public Long getCommentCount(Long subjectId, String subjectType) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("subjectId", subjectId);
		paraMap.put("subjectType", subjectType);
		return (Long) sqlMapClientTemplate.queryForObject("getCommentCount",paraMap);
	}

	public HostUnitDto getHostUnitById(Long id) {
		return (HostUnitDto) sqlMapClientTemplate.queryForObject("getHostUnitById", id);
	}

	@SuppressWarnings("unchecked")
	public List<SalonMediaDto> queryClassMediaList(int pageSize,String mediaType,
			String isExcellent) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("isExcellent", isExcellent);
		paraMap.put("mediaType", mediaType);
		return sqlMapClientTemplate.queryForList("querySalonMediaInfoList",paraMap,0,pageSize);
	}
    //获取某个沙龙媒介(图片或者视频)的数目
	public Long getMediaCountBySalon(Long salonId, String mediaType) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("salonId", salonId);
		paraMap.put("mediaType", mediaType);
		return (Long) sqlMapClientTemplate.queryForObject("getMediaCountBySalon",paraMap);
	}


}
