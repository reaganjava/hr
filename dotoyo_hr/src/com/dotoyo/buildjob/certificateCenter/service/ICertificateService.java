package com.dotoyo.buildjob.certificateCenter.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsDto;
import com.dotoyo.buildjob.certificateCenter.dto.CertVerifyInfoDto;
import com.dotoyo.buildjob.certificateCenter.dto.CollectCertDto;
import com.dotoyo.buildjob.certificateCenter.dto.HotCertDto;
import com.dotoyo.buildjob.certificateCenter.dto.PersonalCertDto;
import com.dotoyo.buildjob.certificateCenter.vo.CertNeedsVo;
import com.dotoyo.buildjob.certificateCenter.vo.CollectCertVo;
import com.dotoyo.buildjob.certificateCenter.vo.HotCertVo;
import com.dotoyo.buildjob.certificateCenter.vo.PersonalCertVo;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2010-11-30
 * @description
 */
public interface ICertificateService {
	/**
	 * 添加个人证书信息
	 * 
	 * @param personalCertDto
	 *            个人证书信息值对象
	 */
	public boolean savePersonalCert(PersonalCertDto personalCertDto,
			LoginUserInfoDto loginUserInfoDto);

	/**
	 * 查看相关证书需求
	 * 
	 * @param pageInfo
	 * @param certNeedsDto
	 * @return
	 */
	public List<CertNeedsVo> queryRelatedCertNeedsList(PageInfo pageInfo,
			CertNeedsDto certNeedsDto);

	/**
	 * 添加证书需求信息
	 * 
	 * @param certNeedsDto
	 *            证书需求信息值对象
	 */
	public boolean saveCertNeeds(CertNeedsDto certNeedsDto,
			LoginUserInfoDto loginUserInfoDto);

	/**
	 * 
	 * 查询重复个人证书条数
	 * 
	 * @param personalCertDto
	 * @return
	 */
	public Integer queryDuplicatedPersonalCertCount(
			PersonalCertDto personalCertDto);

	/**
	 * 查询重复个人证书ID列表
	 * 
	 * @param personalCertDto
	 * @return
	 */
	public List<Long> queryDuplicatedPersonalCertIdList(
			PersonalCertDto personalCertDto);

	/**
	 * 查询重复证书需求ID列表
	 * 
	 * @param certNeedsDto
	 * @return
	 */
	public List<Long> queryDuplicatedCertNeedsIdList(CertNeedsDto certNeedsDto);

	/**
	 * 查询重复证书需求条数
	 * 
	 * @param certNeedsDto
	 * @return
	 */
	public Integer queryDuplicatedCertNeedsCount(CertNeedsDto certNeedsDto);

	/**
	 * 查询个人证书信息列表
	 * 
	 * @return 个人证书信息列表
	 */
	public List<PersonalCertVo> queryPersonalCertList();

	/**
	 * 查询个人证书信息分页列表
	 * 
	 * @param personalCertDto
	 * @return
	 */
	public List<PersonalCertVo> queryPersonalCertPaginatedList(
			PageInfo pageInfo, PersonalCertDto personalCertDto);

	/**
	 * 查询证书需求信息列表
	 * 
	 * @param isIndeed
	 *            是否急需证书
	 * @return 证书需求信息列表
	 */
	public List<CertNeedsVo> queryCertNeedsList(String isIndeed);

	/**
	 * 今日新增证书需求 统计
	 */
	public int getCountOfCertNeedsToday(Date today);

	/**
	 * 查询证书需求信息分页列表
	 * 
	 * @param certNeedsDto
	 * @return
	 */
	public List<CertNeedsVo> queryCertNeedsPaginatedList(PageInfo pageInfo,
			CertNeedsDto certNeedsDto);

	/**
	 * 查询个人证书详细信息
	 * 
	 * @param id
	 *            个人证书信息ID
	 * @return 个人证书信息值对象
	 */
	public PersonalCertVo getPersonalCertById(Long id);

	/**
	 * 查询证书需求详细信息
	 * 
	 * @param id
	 *            证书需求信息ID
	 * @return 证书需求信息值对象
	 */
	public CertNeedsVo getCertNeedsById(Long id);

	/**
	 * 删除证书需求信息
	 * 
	 * @param ids
	 *            证书需求信息ID
	 */
	public void deleteCertNeeds(String ids);

	/**
	 * 更新证书需求信息
	 * 
	 * @param certNeedsDto
	 *            证书需求信息值对象
	 */
	public void updateCertNeeds(CertNeedsDto certNeedsDto);

	/**
	 * 删除个人证书信息
	 * 
	 * @param ids
	 *            个人证书信息ID列表
	 */
	public void deletePersonalCert(String ids);

	/**
	 * 更新个人证书信息
	 * 
	 * @param personalCertDto
	 *            个人证书信息值对象
	 */
	public void updatePersonalCert(PersonalCertDto personalCertDto);

	/**
	 * 添加证书搜藏信息
	 * 
	 * @param collectCertDto
	 *            证书收藏信息值对象
	 */
	public void saveCollectCert(CollectCertDto collectCertDto);

	/**
	 * 删除证书搜藏信息
	 * 
	 * @param id
	 *            证书收藏信息ID
	 */
	public void deleteCollectCert(Long id);

	/**
	 * 更新证书搜藏信息
	 * 
	 * @param collectCertDto
	 *            证书收藏信息值对象
	 */
	public void updateCollectCert(CollectCertDto collectCertDto);

	/**
	 * @param collectorID
	 *            证书收藏者ID
	 * @return 证书收藏信息值对象
	 */
	public List<CollectCertVo> queryCollectCertList(Long collectorID);

	/**
	 * @param id
	 *            证书收藏信息ID
	 * @return 证书收藏信息值对象
	 */
	public CollectCertVo getCollectCertById(Long id);

	/**
	 * @param hotCertDto
	 */
	public void saveHotCert(HotCertDto hotCertDto);

	/**
	 * @param id
	 */
	public void deleteHotCert(Long id);

	/**
	 * @return
	 */
	public List<HotCertVo> queryHotCertList();

	/**
	 * 查询证书验证信息
	 * 
	 * @return
	 */
	public List<CertVerifyInfoDto> queryCertVerifyInfoList();

	/**
	 * 个人用户后台查询个人证书提交信息
	 * 
	 * @param pageInfo
	 * @param personalCertMap
	 * @return
	 */
	public List<PersonalCertVo> searchCertList4PersonalCenter(
			PageInfo pageInfo, Map<String, String> personalCertMap);

	/**
	 * 企业用户后台查询证书需求信息
	 * 
	 * @param pageInfo
	 * @param certNeedsMap
	 * @return
	 */
	public List<CertNeedsVo> searchCertNeedsList4EnterpriseCenter(
			PageInfo pageInfo, Map<String, String> certNeedsMap);

	/**
	 * 企业用户后台查询证书需求信息数目
	 * 
	 * @param certNeedsMap
	 * @return
	 */
	public Integer searchCertNeedsCount4EnterpriseCenter(
			Map<String, String> certNeedsMap);

	/**
	 * 个人用户后台修改证书挂靠状态
	 * 
	 * @param personalCertMap
	 */
	public void editCertAttachStatus(Map<String, Object> personalCertMap);

	/**
	 * 企业用户后台修改证书需求状态
	 * 
	 * @param certNeedsMap
	 */
	public void editCertNeedsStatus(Map<String, Object> certNeedsMap);

	/**
	 * 延长证书需求发布时间
	 * 
	 * @param certNeedsMap
	 */
	public void extendsExpDate(Map<String, String> certNeedsMap);

	/**
	 * 重新发布证书需求
	 * 
	 * @param certNeedsMap
	 */
	public void republishCertNeeds(Map<String, String> certNeedsMap);
}
