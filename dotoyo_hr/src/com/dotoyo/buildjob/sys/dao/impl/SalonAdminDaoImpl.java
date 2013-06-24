package com.dotoyo.buildjob.sys.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.IbatisBatchOperation;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.innovationSalon.dto.HostUnitDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonHomePageDisplayDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.vo.SalonSearchVo;
import com.dotoyo.buildjob.sys.dao.ISalonAdminDao;

/**
 * @author Bill xu
 * @dateCreated 2011-02-16
 * @description 沙龙管理操作接口
 *
 */
public class SalonAdminDaoImpl implements ISalonAdminDao {
	private SqlMapClientTemplate sqlMapClientTemplate;


	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	//审核沙龙
	public void updateSalon4Audi(String ids,String audiFlag) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		paraMap.put("audiFlag", audiFlag);
		sqlMapClientTemplate.update("autiSalon", paraMap);
	}

	//设置经典沙龙
	public void updateSalon4Excellent(String ids,String isExcellent) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		paraMap.put("isExcellent", isExcellent);
		sqlMapClientTemplate.update("setExcellentSalon", paraMap);
	}

	//设置经典沙龙文章
	public void updateSalonArticle4Excellent(String ids,String isExcellent) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		paraMap.put("isExcellent", isExcellent);
		sqlMapClientTemplate.update("setExcellentSalonArticle", paraMap);
	}

	//审核文章
	public void updateAudiSalonArticle(String ids,String status) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		paraMap.put("status", status);
		sqlMapClientTemplate.update("audiSalonArticle", paraMap);
	}

	//设置文章推荐
	public void updateSalonArticle4Recommend(String ids,String isRecommend) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		paraMap.put("isRecommend", isRecommend);
		sqlMapClientTemplate.update("setRecommendSalonArticle", paraMap);
	}

	//设置文章精华
	public void updateSalonArticle4Cream(String ids,String isCream) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		paraMap.put("isCream", isCream);
		sqlMapClientTemplate.update("setCreamSalonArticle", paraMap);
	}
	//审核文章
	public void updateAudiComment(String ids,String status) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		paraMap.put("status", status);
		sqlMapClientTemplate.update("audiComment", paraMap);
	}

	/**
	 * 获取主办单位的信息列表(分页)
	 */
	@SuppressWarnings("unchecked")
	public List<HostUnitDto> queryHostUnitList(PageInfo pageInfo){
		return PagingDataListUtil.getPagingData(pageInfo, "queryAllHostUnitListCount", "queryAllHostUnitList",null);
	}


	public void deleteHostUnit(String ids) {
		sqlMapClientTemplate.delete("deleteHostUnitInfo", ids);
	}

	public void modifyHostUnit(HostUnitDto hostUnitDto) {
		sqlMapClientTemplate.update("modifyHostUnitInfo", hostUnitDto);
	}
	public void addHostUnit(HostUnitDto hostUnitDto) {
		sqlMapClientTemplate.insert("addHostUnitInfo", hostUnitDto);
	}

	/**
	 * 获取沙龙信息by salon ids
	 * @param ids
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> querySalonListByIds(){
		return sqlMapClientTemplate.queryForList("querySalonInfoListByIds");
	}

	/**
	 * 获取已经设置了的沙龙信息列表
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> querySettedSalonList(){
		return sqlMapClientTemplate.queryForList("querySettedSalonList");
	}

	public void addSettedSalonList(List<Object> settedList){
		IbatisBatchOperation.batchInsert("addSalonHomePageDisplay", settedList);
	}

	public void updateSettedSalonList(List<Object> settedList){
		IbatisBatchOperation.batchUpdate("updateSalonHomePageDisplay", settedList);
	}

	public void deleteSettedSalon(){
		this.sqlMapClientTemplate.delete("deleteSalonHomePageSettingInfo");
	}


	/**
	 * 获取要设置的沙龙信息列表(分页)--沙龙状态是通过的，同时排除已经分配过的
	 */
	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> searchSalonList4SetHomePage(PageInfo pageInfo,SalonSearchVo salonSearchVo){
		return PagingDataListUtil.getPagingData(pageInfo, "searchSalonList4SetHomePageCount", "searchSalonList4SetHomePage", salonSearchVo);
	}

	@SuppressWarnings("unchecked")
	public List<SalonInfoDto> querySalonMediaList4Admin(PageInfo pageInfo,SalonSearchVo salonSearchVo) {
		return PagingDataListUtil.getPagingData(pageInfo, "querySalonMediaList4AdminCount", "querySalonMediaList4Admin", salonSearchVo);
	}
	//根据文章ID审核图片或者视频(线上沙龙)
	public void updateMedia4AudiByArticleId(String ids,String status) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		paraMap.put("status", status);
		sqlMapClientTemplate.update("autiMediaByArticleId", paraMap);
	}
	/**
	 * 删除文章相关视频或者图片(线上沙龙)
	 */
	public void deleteMediasByArticleId(String ids){
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		sqlMapClientTemplate.delete("deleteMediaByArticleId", paraMap);
	}
	//审核图片或者视频
	public void updateMedia4Audi(String ids,String status) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		paraMap.put("status", status);
		sqlMapClientTemplate.update("autiMedia", paraMap);
	}

	public void audiMediaBySalon(String ids, String mediaType, String status) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		paraMap.put("mediaType", mediaType);
		paraMap.put("status", status);
		sqlMapClientTemplate.update("autiMediaBySalon", paraMap);
	}

	public void deleteMediaBySalon(String ids, String mediaType) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		paraMap.put("mediaType", mediaType);
		sqlMapClientTemplate.delete("deleteMediaBySalon", paraMap);
	}
	//设置经典沙龙
	public void updateMedia4Excellent(String ids, String isExcellent) {
			Map<String,String> paraMap = new HashMap<String,String>();
			paraMap.put("ids", ids);
			paraMap.put("isExcellent", isExcellent);
			sqlMapClientTemplate.update("setExcellentMedia", paraMap);
	}

	public int getNoPassMediaCount(String ids) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		return (Integer) sqlMapClientTemplate.queryForObject("getNoPassMediaCount",paraMap);
	}
	//判断所选的ids里面，是否有没有通过审核的
	public int getNoPassArticleCount(String ids) {
		Map<String,String> paraMap = new HashMap<String,String>();
		paraMap.put("ids", ids);
		return (Integer) sqlMapClientTemplate.queryForObject("getNoPassArticleCount",paraMap);
	}
}
