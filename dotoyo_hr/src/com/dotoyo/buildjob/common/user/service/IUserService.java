package com.dotoyo.buildjob.common.user.service;

import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.paymentonline.PaymentDto;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.vo.SearchPaymentVo;

/**
 * 
 * @author tyler.qu
 * @dateCreated 2010-11-26
 * @description 建筑猎头 用户信息服务接口
 */
public interface IUserService {
	public void login(LoginUserInfoDto userInfo);

	public void addUser(LoginUserInfoDto userInfo);

	/**
	 * 同步用户信息到博站（模拟）
	 */
	public void synUserInfoToBlog(LoginUserInfoDto userInfo);
	
	/**
	 * 加载联系人列表
	 * @param pageInfo
	 * @param receiverId
	 * @return
	 */
	public List<LoginUserInfoDto> queryContactList(PageInfo pageInfo,Long userId);
	
	public int updateUser(Long userId,String property,Object propertyValue);

	public LoginUserInfoDto getUserById(Long id);

	public LoginUserInfoDto getUserByUserName(String userName);

	public LoginUserInfoDto getUserByUserNameAndPassword(String userName,
			String password);

	/* public List<UserInfoDto> getUserByUserName(String userName); */
	public List<LoginUserInfoDto> queryMemberList();

	public void addPaymentRecord(PaymentDto paymentRecord);

	public List<PaymentDto> queryPaymentList();

	public void assignRole();// 设置权限

	public List<LoginUserInfoDto> searchMemberList(String userName);

	public List<PaymentDto> searchPaymentList(SearchPaymentVo searchPv);

	public int deletePaymentRecordById(Long id);

	public int saveConfirmPayment(PaymentDto paymentRecord);

	// 根据用户名(Email)获取用户的详细信息(用户详细信息表)
	public BlogUserInfoDto getUserInfoDetailByUserName(String userName);

	/**
	 * 根据用户名加载用户详细信息
	 * 
	 * @param userName
	 * @return
	 */
	public BlogUserInfoDto loadUserInfoByUserName(String userName);

	/**
	 * 站内信管理：收件箱：加载所有普通用户
	 * 
	 * @param pageInfo
	 * @return
	 */
	public List<LoginUserInfoDto> queryAllCommonLoginUserList(PageInfo pageInfo);

	/**
	 * 根据用户名列表加载用户ID列表
	 * 
	 * @param userNames
	 * @return
	 */
	public List<Long> queryLoginUserIdListByUserNameList(String userNames);
	
	/**
	 *  线下人才库人才加载
	 */
	public List<BlogUserInfoDto> queryLineTalentPool(Map<String,String> paramMap,PageInfo pageInfo);
	
	/**
	 * 当天新增线下推荐人才 数统计
	 */
	public int getNumberOfNewLineRecommendedPersonnel();
	
	/**
	 * 招聘方信息 加载
	 */
	public List<BlogUserInfoDto> queryRecruiterInformation(PageInfo pageInfo,BlogUserInfoDto blogUserInfo);
	
	/**
	 * 招聘管理，收到的申请列表加载
	 */
	public List<BlogUserInfoDto> queryJobApplicationsDetails(PageInfo pageInfo,Map<String,String> paramMap);
	
	/**
	 * 删除职位申请用户
	 */
	public void deleteCandidatesByAppId(String appIds);
	
	/**
	 * 面试邀请
	 */
	public int updateApplicationJobRecordStatus(Map<String,String> paramMap);
}
