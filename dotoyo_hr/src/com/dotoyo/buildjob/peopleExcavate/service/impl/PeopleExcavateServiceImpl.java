package com.dotoyo.buildjob.peopleExcavate.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.peopleExcavate.dao.IPeopleExcavateDao;
import com.dotoyo.buildjob.peopleExcavate.service.IPeopleExcavateService;
import com.dotoyo.buildjob.peopleExcavate.vo.PeopleExcavateVo;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundOfflineSettingDto;
import com.dotoyo.buildjob.sys.dto.SysIncrementTalentsFoundSettingDto;

import edu.emory.mathcs.backport.java.util.Arrays;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-15
 * @description  
 * 
 */
public class PeopleExcavateServiceImpl implements IPeopleExcavateService {
	private IPeopleExcavateDao peopleExcavateDao;

	public void deleteInvitedInterviewingById(Long interviewingRecordId) {
		peopleExcavateDao.deleteInvitedInterviewingById(interviewingRecordId);
	}

	public int getCountOFEnterprise(){
		return peopleExcavateDao.getCountOfEnterprise();
	}

    public int getCountOfPersonnel(){
    	return peopleExcavateDao.getCountOfPersonnel();
    }

	public List<BlogUserInfoDto> getTalentShowStarTOP_N(int n) {
		return peopleExcavateDao.getTalentShowStarTOP_N(n);
	}

	public List<BlogUserInfoDto> queryTalentList(PeopleExcavateVo peopleExcavateVo) {
		return peopleExcavateDao.queryTalentList(peopleExcavateVo);
	}

	public List<BlogUserInfoDto> queryBtiTalentList(PageInfo pageInfo,PeopleExcavateVo peopleExcavateVo) {
		Map<String,Object> paramMap = loadingOfflineSearchField(peopleExcavateVo);
		if("0".equals(paramMap.get("havePurchased"))&&peopleExcavateVo.getExcavate().equals("0")){
			return peopleExcavateDao.queryBtiTalentList(pageInfo,peopleExcavateVo);
		}else if("1".equals(paramMap.get("havePurchased"))){
			return peopleExcavateDao.queryBtiTalentList(pageInfo,(PeopleExcavateVo)paramMap.get("pv"));
		}else{
			return null;
		}
	}
	
	
	public List<BlogUserInfoDto> mathTalent4Enterprise(PageInfo pageInfo,PeopleExcavateVo peopleExcavateVo){
		return peopleExcavateDao.queryBtiTalentList(pageInfo,peopleExcavateVo);
	}
	public List<BlogUserInfoDto> queryBtiTalentList(PeopleExcavateVo peopleExcavateVo) {
		return peopleExcavateDao.queryBtiTalentList(peopleExcavateVo);
	}

	public void setPeopleExcavateDao(IPeopleExcavateDao peopleExcavateDao) {
		this.peopleExcavateDao = peopleExcavateDao;
	}

	public IPeopleExcavateDao getPeopleExcavateDao() {
		return peopleExcavateDao;
	}

	/**
	 * 用户已购买的搜索字段加载
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> loadingSearchField(PeopleExcavateVo peopleExcavateVo){
		String inputFields="";
		PeopleExcavateVo pv = new PeopleExcavateVo();
		pv.setOrderBy(peopleExcavateVo.getOrderBy());
		pv.setCompanyName(peopleExcavateVo.getCompanyName());
		Map<String,Object> paramMap = new HashMap<String, Object>();
		List<SysIncrementTalentsFoundSettingDto> searchFieldList = peopleExcavateDao.loadingSearchField(peopleExcavateVo.getUserId());
		if(null!=searchFieldList&&searchFieldList.size()>0){
			if(StringUtils.isNotEmpty(peopleExcavateVo.getIndustryType())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_INDUSTRYTYPE+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getSpecializedType())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_SPECIALIZEDTYPE+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getCompetency())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_COMPETENCY+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getProvinceCode())||
					StringUtils.isNotEmpty(peopleExcavateVo.getCityCode())||
					StringUtils.isNotEmpty(peopleExcavateVo.getAreaCode())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_REGION+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getMetier())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_METIER+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getEducation())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_EDUCATION+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getWorkingLife())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_WORKINGLIFE+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getAge())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_AGE+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getSex())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_SEX+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getLangCapa())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_LANGCAPA+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getMastery())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_MASTERY+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getComputerGrade())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_COMPUTERGRADE+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getIsAdviser())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_ISADVISER+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getJobNature())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_JOBNATURE+",";
			}
			if(peopleExcavateVo.getUserInfoUpdateDate()!=null){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_USERINFOUPDATEDATE+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getCategoryIndex())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_CATEGORYINDEX+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getJobKeyWord())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_KEYWORD;
			}
			String[] fields= inputFields.split(",");
			List<String> fieldsList = Arrays.asList(fields);
			
			List<String> validFieldList = new ArrayList<String>();//有效的字段
			SysIncrementTalentsFoundSettingDto validStalentsDto = new SysIncrementTalentsFoundSettingDto();//与有效字段对应的有效订单
			
			for (SysIncrementTalentsFoundSettingDto stalentsDto : searchFieldList) {
				String[] fa = stalentsDto.getFieldsOfSearch().split(",");
				
				List<String> purchasedFieldList = Arrays.asList(fa);//用户购买的字段
				List<String> inputFieldList = fieldsList;//用户输入的字段
				List<String> tempFieldList = new ArrayList<String>();//临时字段
				
				for(String temp:purchasedFieldList){
					if(inputFieldList.contains(temp)){
						tempFieldList.add(temp);
					}
				}
				if(tempFieldList.size()>validFieldList.size()){
					validFieldList = tempFieldList;
					validStalentsDto = stalentsDto;
				}
				
			}
			if(!validFieldList.isEmpty()){
				dataAssembly(validFieldList,paramMap,peopleExcavateVo,pv);
				if (peopleExcavateVo.getExcavate().equals("1")) {
					peopleExcavateDao.updateUserSearches(validStalentsDto.getId());// 搜索次数--
				}
			}
			paramMap.put("havePurchased", "1");
			paramMap.put("pv", pv);
		}else{
			paramMap.put("havePurchased", "0");
			paramMap.put("pv", pv);
		}
		return paramMap;
	}
	
	/**
	 * 用户已购买的线下搜索字段加载
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> loadingOfflineSearchField(PeopleExcavateVo peopleExcavateVo){
		String inputFields="";
		PeopleExcavateVo pv = new PeopleExcavateVo();
		pv.setOrderBy(peopleExcavateVo.getOrderBy());
		pv.setCompanyName(peopleExcavateVo.getCompanyName());
		Map<String,Object> paramMap = new HashMap<String, Object>();
		List<SysIncrementTalentsFoundOfflineSettingDto> offlineSearchFieldList = peopleExcavateDao.loadingOfflineSearchField(peopleExcavateVo.getUserId());
		if(null!=offlineSearchFieldList&&offlineSearchFieldList.size()>0){
			if(StringUtils.isNotEmpty(peopleExcavateVo.getIndustryType())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_INDUSTRYTYPE+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getSpecializedType())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_SPECIALIZEDTYPE+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getCompetency())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_COMPETENCY+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getProvinceCode())||
					StringUtils.isNotEmpty(peopleExcavateVo.getCityCode())||
					StringUtils.isNotEmpty(peopleExcavateVo.getAreaCode())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_REGION+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getMetier())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_METIER+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getEducation())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_EDUCATION+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getWorkingLife())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_WORKINGLIFE+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getAge())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_AGE+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getSex())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_SEX+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getLangCapa())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_LANGCAPA+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getMastery())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_MASTERY+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getComputerGrade())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_COMPUTERGRADE+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getIsAdviser())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_ISADVISER+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getJobNature())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_JOBNATURE+",";
			}
			if(peopleExcavateVo.getUserInfoUpdateDate()!=null){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_USERINFOUPDATEDATE+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getCategoryIndex())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_CATEGORYINDEX+",";
			}
			if(StringUtils.isNotEmpty(peopleExcavateVo.getJobKeyWord())){
				inputFields+=ApplicationConstant.TALENTS_SEARCH_KEYWORD;
			}
			String[] fields= inputFields.split(",");
			List<String> fieldsList = Arrays.asList(fields);
			
			List<String> validFieldList = new ArrayList<String>();//有效的字段
			SysIncrementTalentsFoundOfflineSettingDto validStalentsDto = new SysIncrementTalentsFoundOfflineSettingDto();//与有效字段对应的有效订单
			
			for (SysIncrementTalentsFoundOfflineSettingDto offlineStalentsDto : offlineSearchFieldList) {
				
				String[] fa = offlineStalentsDto.getFieldsOfSearch().split(",");
				
				List<String> purchasedFieldList = Arrays.asList(fa);//用户购买的字段
				List<String> inputFieldList = fieldsList;//用户输入的字段
				List<String> tempFieldList = new ArrayList<String>();//临时字段
				
				for(String temp:purchasedFieldList){
					if(inputFieldList.contains(temp)){
						tempFieldList.add(temp);
					}
				}
				if(tempFieldList.size()>validFieldList.size()){
					validFieldList = tempFieldList;
					validStalentsDto = offlineStalentsDto;
				}
			}
			if(!validFieldList.isEmpty()){
				dataAssembly(validFieldList,paramMap,peopleExcavateVo,pv);
				if (peopleExcavateVo.getExcavate().equals("1")) {
					peopleExcavateDao.updateUserSearches(validStalentsDto.getId());// 搜索次数--
				}
			}
			paramMap.put("havePurchased", "1");
			paramMap.put("pv", pv);
		}else{
			paramMap.put("havePurchased", "0");
			paramMap.put("pv", pv);
		}
		return paramMap;
	}
	
	/**
	 * 数据组装
	 */
	public void dataAssembly(List<String> rList,Map<String,Object> paramMap,PeopleExcavateVo peopleExcavateVo,PeopleExcavateVo pv){
		for (int i = 0; i < rList.size(); i++) {
			if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_INDUSTRYTYPE)){
				pv.setIndustryType(peopleExcavateVo.getIndustryType());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_SPECIALIZEDTYPE)){
				pv.setSpecializedType(peopleExcavateVo.getSpecializedType());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_COMPETENCY)){
				pv.setCompetency(peopleExcavateVo.getCompetency());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_REGION)){
				pv.setProvinceCode(peopleExcavateVo.getProvinceCode());
				pv.setCityCode(peopleExcavateVo.getCityCode());
				pv.setAreaCode(peopleExcavateVo.getAreaCode());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_METIER)){
				pv.setMetier(peopleExcavateVo.getMetier());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_EDUCATION)){
				pv.setEducation(peopleExcavateVo.getEducation());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_WORKINGLIFE)){
				pv.setWorkingLife(peopleExcavateVo.getWorkingLife());
				pv.setLtWorkingLife(peopleExcavateVo.getLtWorkingLife());
				pv.setGtWorkingLife(peopleExcavateVo.getGtWorkingLife());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_AGE)){
				pv.setAge(peopleExcavateVo.getAge());
				pv.setLtAge(peopleExcavateVo.getLtAge());
				pv.setGtAge(peopleExcavateVo.getGtAge());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_SEX)){
				pv.setSex(peopleExcavateVo.getSex());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_LANGCAPA)){
				pv.setLangCapa(peopleExcavateVo.getLangCapa());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_MASTERY)){
				pv.setMastery(peopleExcavateVo.getMastery());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_COMPUTERGRADE)){
				pv.setComputerGrade(peopleExcavateVo.getComputerGrade());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_ISADVISER)){
				pv.setIsAdviser(peopleExcavateVo.getIsAdviser());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_JOBNATURE)){
				pv.setJobNature(peopleExcavateVo.getJobNature());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_USERINFOUPDATEDATE)){
				pv.setUserInfoUpdateDate(peopleExcavateVo.getUserInfoUpdateDate());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_CATEGORYINDEX)){
				pv.setCategoryIndex(peopleExcavateVo.getCategoryIndex());
			}else if(rList.get(i).equals(ApplicationConstant.TALENTS_SEARCH_KEYWORD)){
				pv.setJobKeyWord(peopleExcavateVo.getJobKeyWord());
			}
		}
	}
	
	/**
	 * 线上人才搜索
	 */
	public List<BlogUserInfoDto> queryTalentList(PageInfo pageInfo,PeopleExcavateVo peopleExcavateVo) {
		Map<String,Object> paramMap = loadingSearchField(peopleExcavateVo);
		if("0".equals(paramMap.get("havePurchased"))&&peopleExcavateVo.getExcavate().equals("0")){
			return peopleExcavateDao.queryTalentList(pageInfo,peopleExcavateVo);
		}else if("1".equals(paramMap.get("havePurchased"))){
			return peopleExcavateDao.queryTalentList(pageInfo,(PeopleExcavateVo)paramMap.get("pv"));
		}else{
			return null;
		}
	}
	
	/**
	 * 人才匹配
	 */
	@SuppressWarnings("unchecked")
	public Map<String,Object> loadingMatchField(PeopleExcavateVo peopleExcavateVo){
		String inputFields="";
		Map<String,Object> paramMap = new HashMap<String, Object>();
		if(StringUtils.isNotEmpty(peopleExcavateVo.getIndustryType())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_INDUSTRYTYPE+",";
			paramMap.put("industryType", peopleExcavateVo.getIndustryType());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getSpecializedType())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_SPECIALIZEDTYPE+",";
			paramMap.put("specializedType", peopleExcavateVo.getSpecializedType());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getCompetency())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_COMPETENCY+",";
			paramMap.put("competency", peopleExcavateVo.getCompetency());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getProvinceCode())||
				StringUtils.isNotEmpty(peopleExcavateVo.getCityCode())||
				StringUtils.isNotEmpty(peopleExcavateVo.getAreaCode())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_REGION+",";
			paramMap.put("provinceCode", peopleExcavateVo.getProvinceCode());
			paramMap.put("cityCode", peopleExcavateVo.getCityCode());
			paramMap.put("areaCode", peopleExcavateVo.getAreaCode());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getMetier())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_METIER+",";
			paramMap.put("metier", peopleExcavateVo.getMetier());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getEducation())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_EDUCATION+",";
			paramMap.put("education", peopleExcavateVo.getEducation());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getWorkingLife())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_WORKINGLIFE+",";
			paramMap.put("workingLife", peopleExcavateVo.getWorkingLife());
			paramMap.put("ltWorkingLife", peopleExcavateVo.getLtWorkingLife());
			paramMap.put("gtWorkingLife", peopleExcavateVo.getGtWorkingLife());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getAge())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_AGE+",";
			paramMap.put("age", peopleExcavateVo.getAge());
			paramMap.put("ltAge", peopleExcavateVo.getLtAge());
			paramMap.put("gtAge", peopleExcavateVo.getGtAge());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getSex())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_SEX+",";
			paramMap.put("sex", peopleExcavateVo.getSex());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getLangCapa())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_LANGCAPA+",";
			paramMap.put("langCapa", peopleExcavateVo.getLangCapa());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getMastery())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_MASTERY+",";
			paramMap.put("mastery", peopleExcavateVo.getMastery());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getComputerGrade())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_COMPUTERGRADE+",";
			paramMap.put("computerGrade", peopleExcavateVo.getComputerGrade());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getIsAdviser())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_ISADVISER+",";
			paramMap.put("isAdviser", peopleExcavateVo.getIsAdviser());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getJobNature())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_JOBNATURE+",";
			paramMap.put("jobNature", peopleExcavateVo.getJobNature());
		}
		if(peopleExcavateVo.getUserInfoUpdateDate()!=null){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_USERINFOUPDATEDATE+",";
			paramMap.put("userInfoUpdateDate", peopleExcavateVo.getUserInfoUpdateDate());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getCategoryIndex())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_CATEGORYINDEX+",";
			paramMap.put("categoryIndex", peopleExcavateVo.getCategoryIndex());
		}
		if(StringUtils.isNotEmpty(peopleExcavateVo.getJobKeyWord())){
			inputFields+=ApplicationConstant.TALENTS_SEARCH_KEYWORD;
			paramMap.put("jobKeyWord", peopleExcavateVo.getJobKeyWord());
		}
		String[] fields= inputFields.split(",");
		List<String> fieldsList = Arrays.asList(fields);
		
		List<SysIncrementTalentsFoundSettingDto> searchFieldList = peopleExcavateDao.loadingSearchField(peopleExcavateVo.getUserId());
		if(null==searchFieldList||searchFieldList.size()==0){
			paramMap.put("havePurchased", "0");
			return paramMap;
		}
		for (SysIncrementTalentsFoundSettingDto stalentsDto : searchFieldList) {
			String[] fa = stalentsDto.getFieldsOfSearch().split(",");
			if(fieldsList.containsAll(Arrays.asList(fa))){
				paramMap.put("havePurchased", "1");
				peopleExcavateDao.updateUserSearches(stalentsDto.getId());// 搜索次数--
				break;
			}
		}
		return paramMap;
	}
}
