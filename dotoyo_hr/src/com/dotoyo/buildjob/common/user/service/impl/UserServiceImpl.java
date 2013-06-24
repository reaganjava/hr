package com.dotoyo.buildjob.common.user.service.impl;

import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.paymentonline.PaymentDto;
import com.dotoyo.buildjob.common.user.dao.IUserDao;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.common.vo.SearchPaymentVo;

/**
 * 
 * @author tyler.qu
 * @dateCreated 2010-11-26
 * @description 建筑猎头 用户信息服务接口实现
 */
public class UserServiceImpl implements IUserService {
	private IUserDao userDao;

	public void login(LoginUserInfoDto userInfo) {
		// TODO Auto-generated method stub
	}

	public void addUser(LoginUserInfoDto userInfo) {
		userDao.addUser(userInfo);
	}
	
	/**
	 * 同步用户信息到博站（模拟）
	 */
	public void synUserInfoToBlog(LoginUserInfoDto userInfo){
		userDao.synUserInfoToBlog(userInfo);
	}

	public int updateUser(Long userId,String property,Object propertyValue) {
		return userDao.updateUser(userId,property,propertyValue);
	}

	public LoginUserInfoDto getUserById(Long id) {
		return userDao.getUserById(id);
	}

	public LoginUserInfoDto getUserByUserName(String userName) {
		return userDao.getUserByUserName(userName);
	}

	public LoginUserInfoDto getUserByUserNameAndPassword(String userName,
			String password) {
		return userDao.getUserByUserNameAndPassword(userName, password);
	}

	/*
	 * public List<UserInfoDto> getUserByUserName(String userName){ return
	 * userDao.getUserByUserName(userName); }
	 */

	public List<LoginUserInfoDto> queryMemberList() {
		return userDao.queryMemberList();
	}

	public void addPaymentRecord(PaymentDto paymentRecord) {
		userDao.addPaymentRecord(paymentRecord);
	}

	public List<PaymentDto> queryPaymentList() {
		return userDao.queryPaymentList();
	}

	public void assignRole() {
		// TODO Auto-generated method stub

	}

	public List<LoginUserInfoDto> searchMemberList(String userName) {
		return userDao.searchMemberList(userName);
	}

	public List<PaymentDto> searchPaymentList(SearchPaymentVo searchPv) {
		return userDao.searchPaymentList(searchPv);
	}

	public int deletePaymentRecordById(Long id) {
		return userDao.deletePaymentRecordById(id);
	}

	// 确认支付
	public int saveConfirmPayment(PaymentDto paymentRecord) {
		return userDao.saveConfirmPayment(paymentRecord);
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	public IUserDao getUserDao() {
		return userDao;
	}

	public BlogUserInfoDto getUserInfoDetailByUserName(String userName) {
		return userDao.getUserInfoDetailByUserName(userName);
	}

	/**
	 * 根据用户名加载用户详细信息
	 * 
	 * @param userName
	 * @return
	 */
	public BlogUserInfoDto loadUserInfoByUserName(String userName) {
		return userDao.loadUserInfoByUserName(userName);
	}

	public List<LoginUserInfoDto> queryAllCommonLoginUserList(PageInfo pageInfo) {
		return userDao.queryAllCommonLoginUserList(pageInfo);
	}
	
	/**
	 * 加载联系人列表
	 * @param pageInfo
	 * @param receiverId
	 * @return
	 */
	public List<LoginUserInfoDto> queryContactList(PageInfo pageInfo,Long userId){
		return userDao.queryContactList(pageInfo, userId);
	}

	/**
	 * 根据用户名列表加载用户ID列表
	 * 
	 * @param userNames
	 * @return
	 */
	public List<Long> queryLoginUserIdListByUserNameList(String userNames) {
		return userDao.queryLoginUserIdListByUserNameList(userNames);
	}
	
	/**
	 * 线下人才库人才加载
	 */
	public List<BlogUserInfoDto> queryLineTalentPool(Map<String,String> paramMap,PageInfo pageInfo){
		return userDao.queryLineTalentPool(paramMap, pageInfo);
	}
	
	/**
	 * 当天新增线下推荐人才 数统计
	 */
	public int getNumberOfNewLineRecommendedPersonnel(){
		return userDao.getNumberOfNewLineRecommendedPersonnel();
	}
	
	/**
	 * 招聘方信息 加载
	 */
	public List<BlogUserInfoDto> queryRecruiterInformation(PageInfo pageInfo,BlogUserInfoDto blogUserInfo){
		return userDao.queryRecruiterInformation(pageInfo, blogUserInfo);
	}
	
	/**
	 * 招聘管理，收到的申请列表加载
	 */
	public List<BlogUserInfoDto> queryJobApplicationsDetails(PageInfo pageInfo,Map<String,String> paramMap){
		return userDao.queryJobApplicationsDetails(pageInfo, paramMap);
	}
	
	/**
	 * 删除职位申请用户
	 */
	public void deleteCandidatesByAppId(String appIds){
		userDao.deleteCandidatesByAppId(appIds);
	}
	
	/**
	 * 面试邀请
	 */
	public int updateApplicationJobRecordStatus(Map<String,String> paramMap){
		return userDao.updateApplicationJobRecordStatus(paramMap);
	}
}
