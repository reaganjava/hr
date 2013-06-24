package com.dotoyo.buildjob.peopleExcavate.service;

import java.util.List;

import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.peopleExcavate.vo.PeopleExcavateVo;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-13
 * @description  
 * 
 */
public interface IPeopleExcavateService {
	
	/**
	 * 删除面试邀请
	 */
	public void deleteInvitedInterviewingById(Long id);
	
	/**
	 * 企业个数动态统计
	 */
	public int getCountOFEnterprise();
	
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
	 * 人才搜索
	 */
	public List<BlogUserInfoDto> queryTalentList(PageInfo pageInfo,PeopleExcavateVo peopleExcavateVo);

	/**
	 * 线下人才搜索
	 */
	public List<BlogUserInfoDto> queryBtiTalentList(PageInfo pageInfo,PeopleExcavateVo peopleExcavateVo);
	/**
	 * 线下人才搜索
	 */
	public List<BlogUserInfoDto> queryBtiTalentList(PeopleExcavateVo peopleExcavateVo);
	
	/**
	 * 企业线下人才匹配
	 * @param pageInfo
	 * @param peopleExcavateVo
	 * @return
	 */
	public List<BlogUserInfoDto> mathTalent4Enterprise(PageInfo pageInfo,PeopleExcavateVo peopleExcavateVo);
}
