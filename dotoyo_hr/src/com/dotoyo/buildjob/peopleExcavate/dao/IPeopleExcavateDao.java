package com.dotoyo.buildjob.peopleExcavate.dao;

import java.util.List;

import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.peopleExcavate.vo.PeopleExcavateVo;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundOfflineSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundSettingDto;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-13
 * @description  
 * 
 */
public interface IPeopleExcavateDao {
	
	/**
	 * 删除面试邀请
	 */
	public void deleteInvitedInterviewingById(Long id);
	
	/**
	 * 企业个数动态统计
	 */
	public int getCountOfEnterprise();
	
	/**
	 * 用户已购买的线下搜索字段加载
	 */
	public List<SysIncrementTalentsFoundOfflineSettingDto> loadingOfflineSearchField(Long userId);

	
	/**
	 * 人才个数动态展示
	 */
	 public int getCountOfPersonnel();
	
	/**
	 * 人才星级TOP_N(10)展示
	 */
	public List<BlogUserInfoDto> getTalentShowStarTOP_N(int n);
	
	/**
	 * 人才搜索
	 */
	public List<BlogUserInfoDto> queryTalentList(PeopleExcavateVo peopleExcavateVo);

	/**
	 * 线下人才搜索
	 */
	public List<BlogUserInfoDto> queryBtiTalentList(PageInfo pageInfo,PeopleExcavateVo peopleExcavateVo);
	/**
	 * 线下人才搜索
	 */
	public List<BlogUserInfoDto> queryBtiTalentList(PeopleExcavateVo peopleExcavateVo);
	
	/**
	 * 人才搜索
	 */
	public List<BlogUserInfoDto> queryTalentList(PageInfo pageInfo,PeopleExcavateVo peopleExcavateVo);
	
	/**
	 * 用户已购买的搜索字段加载
	 */
	public List<SysIncrementTalentsFoundSettingDto> loadingSearchField(Long userID);
	
	/**
	 * 减减用户搜索次数
	 */
	public void updateUserSearches(Long orderId);
	

}
