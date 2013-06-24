package com.dotoyo.buildjob.innovationSalon.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.innovationSalon.dao.ISalonSearchDao;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;
import com.dotoyo.buildjob.innovationSalon.vo.SalonSearchVo;

/**
 * @author Bill xu
 * @dateCreated 2011-01-18
 * @description search business process
 *
 */
public class SalonSearchDaoImpl implements ISalonSearchDao {
	private SqlMapClientTemplate sqlMapClientTemplate;


	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> querySalonList(PageInfo pageInfo,
			SalonSearchVo salonSearchVo) {
		return PagingDataListUtil.getPagingData(pageInfo, "searchSalonInfoListCount", "searchSalonInfoList", salonSearchVo);
	}

	@SuppressWarnings("unchecked")
	public List<SalonArticleDto> querySalonArticleList(PageInfo pageInfo,
			SalonSearchVo salonSearchVo) {
		if(pageInfo == null){
			return sqlMapClientTemplate.queryForList("searchSalonArticleList", salonSearchVo);
		}else{
			return PagingDataListUtil.getPagingData(pageInfo, "searchSalonArticleListCount", "searchSalonArticleList", salonSearchVo);
		}
	}

	@SuppressWarnings("unchecked")
	public List<SalonMediaDto> querySalonMediaList(PageInfo pageInfo,
			SalonSearchVo salonSearchVo) {
		return PagingDataListUtil.getPagingData(pageInfo, "searchSalonMediaInfoListCount", "searchSalonMediaInfoList", salonSearchVo);
	}

	public SalonMediaDto getSalonMediaById(Long id) {
		return (SalonMediaDto) sqlMapClientTemplate.queryForObject("getSalonMediaById", id);
	}

	@SuppressWarnings("unchecked")
	public List<SalonMediaDto> querySalonMediaListBySalonId(PageInfo pageInfo,
			Long salonId,String mediaType) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("salonId", salonId);
		paraMap.put("mediaType", mediaType);

		if(pageInfo == null)
		{
			paraMap.put("status", null);
			return sqlMapClientTemplate.queryForList("querySalonMediaInfoListBySalonId", paraMap);
		}else{
			paraMap.put("status", ApplicationConstant.STATUS_PASSED);
			return PagingDataListUtil.getPagingData(pageInfo, "querySalonMediaInfoListBySalonIdCount", "querySalonMediaInfoListBySalonId", paraMap);
		}
	}
	@SuppressWarnings("unchecked")
	public List<SalonMediaDto> querySalonMediaListByIdAndisExcellent(PageInfo pageInfo,
			Long salonId,String mediaType,String isExcellent) {
		Map<String,Object> paraMap = new HashMap<String,Object>();
		paraMap.put("salonId", salonId);
		paraMap.put("mediaType", mediaType);
		paraMap.put("isExcellent", isExcellent);
			paraMap.put("status", null);
			return sqlMapClientTemplate.queryForList("querySalonMediaInfoListBySalonId", paraMap);

	}
	/**
	 * 当天系统发表文章数统计
	 */
	public int getNumberOfNewArticlesStatisticalToDay(){
		return (Integer) sqlMapClientTemplate.queryForObject("getNumberOfNewArticlesStatisticalToDay", new Date());
	}

}
