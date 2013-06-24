package com.dotoyo.buildjob.peopleExcavate.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.peopleExcavate.dao.IPeopleExcavateDao;
import com.dotoyo.buildjob.peopleExcavate.vo.PeopleExcavateVo;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundOfflineSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundSettingDto;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-15
 * @description  
 * 
 */
public class PeopleExcavateDaoImpl implements IPeopleExcavateDao {

	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void deleteInvitedInterviewingById(Long interviewingRecordId) {
		sqlMapClientTemplate.delete("deleteInvitedInterviewingById", interviewingRecordId);
	}

	public int getCountOfEnterprise() {
		return (Integer) sqlMapClientTemplate.queryForObject("getCountOfEnterprise");
	}

	public int getCountOfPersonnel() {
		return (Integer) sqlMapClientTemplate.queryForObject("getCountOfPersonnel");
	}

	@SuppressWarnings("unchecked")
	public List<BlogUserInfoDto> getTalentShowStarTOP_N(int n) {
		return sqlMapClientTemplate.queryForList("getTalentShowStarTOP_N", n);
	}

	@SuppressWarnings("unchecked")
	public List<BlogUserInfoDto> queryTalentList(PeopleExcavateVo peopleExcavateVo) {
		return sqlMapClientTemplate.queryForList("peopleExcavate", peopleExcavateVo);
	}

	@SuppressWarnings("unchecked")
	public List<BlogUserInfoDto> queryBtiTalentList(PageInfo pageInfo,PeopleExcavateVo peopleExcavateVo) {
		return PagingDataListUtil.getPagingData(pageInfo, "queryTalentCountOfBti", "btiPeopleExcavate", peopleExcavateVo);	
	}
	@SuppressWarnings("unchecked")
	public List<BlogUserInfoDto> queryBtiTalentList(PeopleExcavateVo peopleExcavateVo) {
		return sqlMapClientTemplate.queryForList("btiPeopleExcavate",peopleExcavateVo);
	}

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	@SuppressWarnings("unchecked")
	public List<BlogUserInfoDto> queryTalentList(PageInfo pageInfo,PeopleExcavateVo pv) {
		return PagingDataListUtil.getPagingData(pageInfo, "queryTalentCount", "peopleExcavate", pv);
	}

	/**
	 * 用户已购买的搜索字段加载
	 */
	@SuppressWarnings("unchecked")
	public List<SysIncrementTalentsFoundSettingDto> loadingSearchField(Long userId){
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("userId", userId);
		paramMap.put("currentDate", new Date());
		return sqlMapClientTemplate.queryForList("loadingSearchField", paramMap);
	}
	
	/**
	 * 用户已购买的线下搜索字段加载
	 */
	@SuppressWarnings("unchecked")
	public List<SysIncrementTalentsFoundOfflineSettingDto> loadingOfflineSearchField(Long userId){
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("userId", userId);
		paramMap.put("currentDate", new Date());
		return sqlMapClientTemplate.queryForList("loadingOfflineSearchField", paramMap);
	}
	
	/**
	 * 减减用户搜索次数
	 */
	public void updateUserSearches(Long orderId){
		sqlMapClientTemplate.update("updateUserSearches", orderId);
	}
}
