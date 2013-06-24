package com.dotoyo.buildjob.common.user.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.paymentonline.PaymentDto;
import com.dotoyo.buildjob.common.user.dao.IUserDao;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.PagingDataListUtil;
import com.dotoyo.buildjob.common.vo.SearchPaymentVo;

/**
 * @author tyler.qu
 * @dateCreated 2011-1-15
 * @description 建筑猎头 用户信息处理接口实现类
 */
public class UserDaoImpl implements IUserDao {
	private SqlMapClientTemplate sqlMapClientTemplate;

	public void addUser(LoginUserInfoDto userInfo) {
		sqlMapClientTemplate.insert("registerUserInfo", userInfo);
	}

	/**
	 * 同步用户信息到博站（模拟）
	 */
	public void synUserInfoToBlog(LoginUserInfoDto userInfo){
		sqlMapClientTemplate.insert("synUserInfoToBlog", userInfo);
	}
	
	// int>=1修改成功（影响行数）
	public int updateUser(Long userId,String property,Object propertyValue) {
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("userId", userId);
		paramMap.put(property, propertyValue);
		return sqlMapClientTemplate.update("updateUser", paramMap);
	}

	public LoginUserInfoDto getUserById(Long id) {
		return (LoginUserInfoDto) sqlMapClientTemplate.queryForObject(
				"getUserById", id);
	}

	public LoginUserInfoDto getUserByUserName(String userName) {
		return (LoginUserInfoDto) sqlMapClientTemplate.queryForObject(
				"getUserByUserName", userName);
	}

	public LoginUserInfoDto getUserByUserNameAndPassword(String userName,
			String password) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("userName", userName);
		paramMap.put("password", password);

		return (LoginUserInfoDto) sqlMapClientTemplate.queryForObject(
				"getUserByUserNameAndPassword", paramMap);
	}

	/*
	 * @SuppressWarnings("unchecked") public List<UserInfoDto>
	 * getUserByUserName(String userName){ return
	 * sqlMapClientTemplate.queryForList("getUserByUserName", userName); }
	 */

	@SuppressWarnings("unchecked")
	public List<LoginUserInfoDto> queryMemberList() {
		return sqlMapClientTemplate.queryForList("queryMemberForList");
	}

	public void addPaymentRecord(PaymentDto paymentRecord) {
		sqlMapClientTemplate.insert("addPaymentRecord", paymentRecord);
	}

	@SuppressWarnings("unchecked")
	public List<PaymentDto> queryPaymentList() {
		return sqlMapClientTemplate.queryForList("queryPaymentForList");
	}

	public void assignRole() {
		// TODO Auto-generated method stub

	}

	// 根据用户名（email）来加载用户信息：1.检测此email是否已经注册
	@SuppressWarnings("unchecked")
	public List<LoginUserInfoDto> searchMemberList(String userName) {
		return sqlMapClientTemplate.queryForList("getUserByUserName", userName);
	}

	@SuppressWarnings("unchecked")
	public List<PaymentDto> searchPaymentList(SearchPaymentVo searchPv) {
		return sqlMapClientTemplate.queryForList("searchPaymentForList",
				searchPv);
	}

	public int deletePaymentRecordById(Long id) {
		return sqlMapClientTemplate.delete("deletePaymentRecordById", id);
	}

	public int saveConfirmPayment(PaymentDto paymentRecord) {
		return sqlMapClientTemplate.update("confirmPayment", paymentRecord);
	}

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	// 根据用户名(Email)获取用户的详细信息(用户详细信息表)
	public BlogUserInfoDto getUserInfoDetailByUserName(String userName) {
		return (BlogUserInfoDto) sqlMapClientTemplate.queryForObject(
				"getUserInfoDetailByUserName", userName);
	}

	/**
	 * 根据用户名加载用户详细信息
	 * 
	 * @param userName
	 * @return
	 */
	public BlogUserInfoDto loadUserInfoByUserName(String userName) {
		return (BlogUserInfoDto) sqlMapClientTemplate.queryForObject(
				"loadUserInfoByUserName", userName);
	}

	@SuppressWarnings("unchecked")
	public List<LoginUserInfoDto> queryAllCommonLoginUserList(PageInfo pageInfo) {
		return PagingDataListUtil.getPagingData(pageInfo,
				"queryAllCommonLoginUserCount", "queryAllCommonLoginUserList",
				null);
	}
	
	@SuppressWarnings("unchecked")
	public List<LoginUserInfoDto> queryContactList(PageInfo pageInfo,Long userId){
		return PagingDataListUtil.getPagingData(pageInfo, "queryContactCount", "queryContactList", userId);
	}

	@SuppressWarnings("unchecked")
	public List<Long> queryLoginUserIdListByUserNameList(String userNames) {
		return sqlMapClientTemplate.queryForList(
				"queryLoginUserIdListByUserNameList", userNames);
	}
	
	/**
	 *  线下人才库人才加载
	 */
	@SuppressWarnings("unchecked")
	public List<BlogUserInfoDto> queryLineTalentPool(Map<String,String> paramMap,PageInfo pageInfo){
		return PagingDataListUtil.getPagingData(pageInfo,"getCountOfLineTalentPool", "loadLineTalentPool",paramMap);
	}
	
	/**
	 * 当天新增线下推荐人才 数统计
	 */
	public int getNumberOfNewLineRecommendedPersonnel(){
		return (Integer) sqlMapClientTemplate.queryForObject("getNumberOfRecommendedTalentToDay", new Date());
	}
	
	/**
	 * 招聘方信息 加载
	 */
	@SuppressWarnings("unchecked")
	public List<BlogUserInfoDto> queryRecruiterInformation(PageInfo pageInfo,BlogUserInfoDto blogUserInfo){
		return PagingDataListUtil.getPagingData(pageInfo, "getCountOfRecruiterInformation", "queryRecruiterInformation", blogUserInfo);
	}
	
	/**
	 * 招聘管理，收到的申请列表加载
	 */
	@SuppressWarnings("unchecked")
	public List<BlogUserInfoDto> queryJobApplicationsDetails(PageInfo pageInfo,Map<String,String> paramMap){
		return PagingDataListUtil.getPagingData(pageInfo, "getCountOfJobApplicationsDetails", "queryJobApplicationsDetails", paramMap);
	}
	
	/**
	 * 删除职位申请用户
	 */
	public void deleteCandidatesByAppId(String appIds){
		sqlMapClientTemplate.delete("deleteCandidatesByAppId", appIds);
	}
	
	/**
	 * 面试邀请
	 */
	public int updateApplicationJobRecordStatus(Map<String,String> paramMap){
		return sqlMapClientTemplate.update("updateApplicationJobRecordStatus", paramMap);
	}
}
