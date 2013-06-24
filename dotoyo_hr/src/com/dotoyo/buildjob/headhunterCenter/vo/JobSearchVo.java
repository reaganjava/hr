package com.dotoyo.buildjob.headhunterCenter.vo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.headhunterCenter.dto.JobInfoDto;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-21
 * @description 职位搜索值对象
 *
 */
public class JobSearchVo extends JobInfoDto implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String keyWord;
	private String searchType;//查询类型（职位、企业）
	private String advancedSearch;// 是否打开"高级搜索"
	private String orderBy;// 排序类型
	private Date currentDate = new Date(); // 系统当前日期
	private String dateHorizon;// 首页搜索日期段
	private String dateHorizonName;// 首页搜索日期段
	private int employ;// 应聘人数
	private String isNew;//是否新增职位
	private String applyJobQueryType;//申请记录查询类型：0：今日新增职位申请，1：最近3个月职位申请

	public JobSearchVo() {
	}

	public String getJobName() {
		return jobName == null ? "" : jobName.trim();
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getKeyWord() {
		return keyWord == null ? "" : keyWord.trim();
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord.equals(ApplicationConstant.ENTER_KEYWORDS)?"":keyWord.trim();
	}

	@Override
	public String toString() {
    	try {
    	    return BeanUtils.describe(this).toString();
    	} catch (Exception e) {
    	    Logger.getLogger(this.getClass()).error(ApplicationConstant.ERROR_CONVERTING_OBJECT_TO_STRING, e);
    	}
    	    return super.toString();
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyName() {
		return companyName == null ? "" : companyName.trim();
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchType() {
		return searchType == null ? "" : searchType.trim();
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setCurrentDate(Date currentDate) {
		this.currentDate = currentDate;
	}


	public Date getCurrentDate() {
		return currentDate;
	}

	public void setDateHorizon(String dateHorizon) {
		this.dateHorizon = dateHorizon;
	}

	public String getDateHorizon() {
		return dateHorizon;
	}

	public void setEmploy(int employ) {
		this.employ = employ;
	}

	public int getEmploy() {
		return employ;
	}

	public void setDateHorizonName(String dateHorizonName) {
		this.dateHorizonName = dateHorizonName;
	}

	public String getDateHorizonName() {
		return dateHorizonName;
	}

	public void setAdvancedSearch(String advancedSearch) {
		this.advancedSearch = advancedSearch;
	}

	public String getAdvancedSearch() {
		return advancedSearch;
	}

	public String getIsNew() {
		return isNew;
	}

	public void setIsNew(String isNew) {
		this.isNew = isNew;
	}

	public String getApplyJobQueryType() {
		return applyJobQueryType;
	}

	public void setApplyJobQueryType(String applyJobQueryType) {
		this.applyJobQueryType = applyJobQueryType;
	}
	

}
