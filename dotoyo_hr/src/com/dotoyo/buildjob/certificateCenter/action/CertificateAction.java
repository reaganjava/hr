package com.dotoyo.buildjob.certificateCenter.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.danga.MemCached.MemCachedClient;
import com.dotoyo.buildjob.certificateCenter.dto.CertAccessHistoryDto;
import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsAccessHistoryDto;
import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsDto;
import com.dotoyo.buildjob.certificateCenter.dto.CertVerifyInfoDto;
import com.dotoyo.buildjob.certificateCenter.dto.PersonalCertDto;
import com.dotoyo.buildjob.certificateCenter.service.ICertAccessHistoryService;
import com.dotoyo.buildjob.certificateCenter.service.ICertNeedsAccessHistoryService;
import com.dotoyo.buildjob.certificateCenter.service.ICertificateService;
import com.dotoyo.buildjob.certificateCenter.vo.CertNeedsVo;
import com.dotoyo.buildjob.certificateCenter.vo.HotCertVo;
import com.dotoyo.buildjob.certificateCenter.vo.PersonalCertVo;
import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.AreaDto;
import com.dotoyo.buildjob.common.dto.CityDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.CacheManager;
import com.dotoyo.buildjob.common.util.EssentialDataUtil;
import com.dotoyo.buildjob.common.util.RegionDataUtil;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.dotoyo.buildjob.sys.service.ISysOrderService;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

public class CertificateAction extends BuildJobAction {
	/**
	 *
	 */
	private static final long serialVersionUID = -8881833076168625597L;
	private ICertificateService certificateService;
	private ICertAccessHistoryService certAccessHistoryService;
	private ICertNeedsAccessHistoryService certNeedsAccessHistoryService;
	private List<ClassMasterDto> certificateTypeList;// 证书类型列表
	private List<ClassMasterDto> specialFieldList;// 专业列表
	private List<ClassMasterDto> certList;// 证书列表
	private List<ClassMasterDto> zhiyeCertList;// 执业证书列表
	private List<ClassMasterDto> zhichengCertList;// 职称证书列表
	private List<HotCertVo> hotCertList;// 热门证书列表
	private List<ClassMasterDto> registerStatusList;// 注册状况列表
	private List<ClassMasterDto> companySizeList;// 单位规模
	private List<CertNeedsVo> certNeedsIndeedList;// 急需猎证信息列表
	private List<CertNeedsVo> latestCertNeedsList;// 最新需求列表
	private List<PersonalCertVo> latestPersonalCertList;// 最新证书列表
	private CertNeedsDto certNeedsDto;// 证书需求信息
	private CertNeedsVo certNeedsVo;
	private List<CertNeedsVo> certNeedsSearchResult;// 证书需求搜索结果
	private PersonalCertDto personalCertDto;// 个人证书信息
	private PersonalCertVo personalCertVo;
	private List<PersonalCertVo> personalCertSearchResult;// 个人证书搜索结果
	private String authorized;
	private List<CertNeedsVo> certNeedsList;// 证书需求列表
	private List<CertVerifyInfoDto> certVerifyInfoList;// 证书查询验证信息
	private PageInfo pageInfo;
	private Long certNeedsId;
	private Long userId;
	private ISysOrderService sysOrderService;
	private static final String DEFAULT_KEYWORD = "请输入关键字...";
	private String actionMessage;

	/**
	 * 加载基础数据
	 */
	@SuppressWarnings("unchecked")
	public String loadEssentialData() {
		MemCachedClient memcachedClient = CacheManager
				.getInstanceMemcachedClient();
		certificateTypeList = (List<ClassMasterDto>) memcachedClient
				.get("certificateTypeList");
		specialFieldList = (List<ClassMasterDto>) memcachedClient
				.get("specializedTypeList");
		provinceList = (List<ProvinceDto>) memcachedClient.get("provinceList");
		registerStatusList = (List<ClassMasterDto>) memcachedClient
				.get("registerStatusList");
		zhiyeCertList = (List<ClassMasterDto>) memcachedClient
				.get("zhiyeCertList");
		zhichengCertList = (List<ClassMasterDto>) memcachedClient
				.get("zhichengCertList");
		hotCertList = certificateService.queryHotCertList();
		companySizeList = (List<ClassMasterDto>) memcachedClient
				.get("companySizeList");
		return SUCCESS;
	}

	/**
	 * 加载搜索页面基础数据
	 */
	@SuppressWarnings("unchecked")
	private void loadEssentialData4Search() {
		MemCachedClient memcachedClient = CacheManager
				.getInstanceMemcachedClient();
		ClassMasterDto classMasterDto = new ClassMasterDto();
		classMasterDto.setCode("");
		classMasterDto.setParentCode("");
		classMasterDto.setName("不限");

		ProvinceDto provinceDto = new ProvinceDto();
		provinceDto.setCode("");
		provinceDto.setName("不限");
		certificateTypeList = (List<ClassMasterDto>) memcachedClient
				.get("certificateTypeList");
		certificateTypeList.add(0, classMasterDto);
		specialFieldList = (List<ClassMasterDto>) memcachedClient
				.get("specializedTypeList");
		//为专业列表加入“其他”大类
		
		ClassMasterDto category = new ClassMasterDto();
		category.setCode("");
		category.setParentCode("003");
		category.setName("其他");
		specialFieldList.add(category);
		specialFieldList.add(classMasterDto);
		provinceList = (List<ProvinceDto>) memcachedClient.get("provinceList");
		provinceList.add(0, provinceDto);
		registerStatusList = (List<ClassMasterDto>) memcachedClient
				.get("registerStatusList");
		registerStatusList.add(0, classMasterDto);
		zhiyeCertList = (List<ClassMasterDto>) memcachedClient
				.get("zhiyeCertList");
		zhichengCertList = (List<ClassMasterDto>) memcachedClient
				.get("zhichengCertList");
		hotCertList = certificateService.queryHotCertList();
		companySizeList = (List<ClassMasterDto>) memcachedClient
				.get("companySizeList");
		companySizeList.add(0, classMasterDto);
	}

	/**
	 * 加载急需猎证信息
	 */
	private void loadCertNeedsIndeedList() {
		String isIndeed = ApplicationConstant.COMMON_Y_EN;
		certNeedsIndeedList = certificateService.queryCertNeedsList(isIndeed);
	}

	/**
	 * 加载最新需求信息
	 */
	private void loadLastestCertNeedsList() {
		latestCertNeedsList = certificateService.queryCertNeedsList(null);
	}

	/**
	 * 加载最新证书信息
	 */
	private void loadLastestPersonalCertList() {
		latestPersonalCertList = certificateService.queryPersonalCertList();
	}

	public String init() {
		loadEssentialData4Search();
		loadCertNeedsIndeedList();
		loadLastestCertNeedsList();
		loadLastestPersonalCertList();
		return "init";
	}

	/**
	 * 猎证中心首页初始化方法
	 * 
	 * @return
	 */
	public String initIndex() {
		return "init";
	}

	/**
	 * 联动搜索证书信息
	 * 
	 * @return
	 */
	public String searchCert() {
		request = ServletActionContext.getRequest();
		String certTypeCode = request.getParameter("certTypeCode");
		certList = EssentialDataUtil
				.queryEssentialDataListByParentCode(certTypeCode);
		return "searchCert";
	}

	/**
	 * 搜索证书需求信息
	 * 
	 * @return
	 */
	public String searchCertNeeds() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.CERTCTR_PAGE_SIZE);
		loadEssentialData4Search();
		if (certNeedsDto == null) {
			certNeedsDto = new CertNeedsDto();
		}
		if (certNeedsVo == null) {
			certNeedsVo = new CertNeedsVo();
		}
		if (certNeedsVo.getCertType() == null) {
			certNeedsVo.setCertType(new ClassMasterDto());
		}
		if (certNeedsVo.getCert() == null) {
			certNeedsVo.setCert(new ClassMasterDto());
		}
		if (certNeedsVo.getSpecialField() == null) {
			certNeedsVo.setSpecialField(new ClassMasterDto());
		}
		if (certNeedsVo.getCompanySize() == null) {
			certNeedsVo.setCompanySize(new ClassMasterDto());
		}
		if (certNeedsVo.getRegisterStatus() == null) {
			certNeedsVo.setRegisterStatus(new ClassMasterDto());
		}
		if (certNeedsVo.getProvince() == null) {
			certNeedsVo.setProvince(new ProvinceDto());
		}
		if (certNeedsVo.getCity() == null) {
			certNeedsVo.setCity(new CityDto());
		}
		if (certNeedsVo.getArea() == null) {
			certNeedsVo.setArea(new AreaDto());
		}
		certNeedsDto.setCertNeedsStatus("0");
		Date currentDate = new Date();
		certNeedsDto.setEffDate(currentDate);
		certNeedsDto.setExpDate(currentDate);
		if (DEFAULT_KEYWORD.equalsIgnoreCase(certNeedsDto.getDescp())) {
			certNeedsDto.setDescp("");
		}
		certNeedsSearchResult = certificateService.queryCertNeedsPaginatedList(
				pageInfo, certNeedsDto);

		// 获得页面保存的联动数据
		String provinceCode = certNeedsDto.getProvinceCode();
		if (provinceCode != null && !"".equalsIgnoreCase(provinceCode)) {
			cityList = RegionDataUtil.queryCityListByProvinceCode(provinceCode);
			CityDto cityDto = new CityDto();
			cityDto.setCode("");
			cityDto.setName("不限");
			cityList.add(0, cityDto);
		}

		String cityCode = certNeedsDto.getCityCode();
		if (cityCode != null && !"".equalsIgnoreCase(cityCode)) {
			areaList = RegionDataUtil.queryAreaListByCityCode(cityCode);
			AreaDto areaDto = new AreaDto();
			areaDto.setCode("");
			areaDto.setName("不限");
			areaList.add(0, areaDto);
		}

		String certTypeCode = certNeedsDto.getCertTypeCode();
		if (certTypeCode != null && !"".equalsIgnoreCase(certTypeCode)) {
			certList = EssentialDataUtil
					.queryEssentialDataListByParentCode(certTypeCode);
			ClassMasterDto classMasterDto = new ClassMasterDto();
			classMasterDto.setCode("");
			classMasterDto.setName("不限");
			certList.add(0, classMasterDto);
		}
		return "searchCertNeeds";
	}

	/**
	 * 搜索个人证书信息
	 * 
	 * @return
	 */
	public String searchPersonalCert() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.CERTCTR_PAGE_SIZE);
		loadEssentialData4Search();
		if (personalCertDto == null) {
			personalCertDto = new PersonalCertDto();
		}
		if (personalCertVo == null) {
			personalCertVo = new PersonalCertVo();
		}
		if (personalCertVo.getRegisterStatus() == null) {
			personalCertVo.setRegisterStatus(new ClassMasterDto());
		}
		if (personalCertVo.getProvince() == null) {
			personalCertVo.setProvince(new ProvinceDto());
		}
		if (personalCertVo.getCity() == null) {
			personalCertVo.setCity(new CityDto());
		}
		if (personalCertVo.getArea() == null) {
			personalCertVo.setArea(new AreaDto());
		}
		if (personalCertVo.getCert() == null) {
			personalCertVo.setCert(new ClassMasterDto());
		}
		if (personalCertVo.getCertType() == null) {
			personalCertVo.setCertType(new ClassMasterDto());
		}
		if (personalCertVo.getSpecialField() == null) {
			personalCertVo.setSpecialField(new ClassMasterDto());
		}
		personalCertDto
				.setCertStatus(ApplicationConstant.PERSONAL_CERT_NOT_ATTACHED);
		if (DEFAULT_KEYWORD.equalsIgnoreCase(personalCertDto.getDescp())) {
			personalCertDto.setDescp("");
		}
		personalCertSearchResult = certificateService
				.queryPersonalCertPaginatedList(pageInfo, personalCertDto);

		// 获得页面保存的联动数据
		String provinceCode = personalCertDto.getProvinceCode();
		if (provinceCode != null && !"".equalsIgnoreCase(provinceCode)) {
			cityList = RegionDataUtil.queryCityListByProvinceCode(provinceCode);
			CityDto cityDto = new CityDto();
			cityDto.setCode("");
			cityDto.setName("不限");
			cityList.add(0, cityDto);
		}

		String cityCode = personalCertDto.getCityCode();
		if (cityCode != null && !"".equalsIgnoreCase(cityCode)) {
			areaList = RegionDataUtil.queryAreaListByCityCode(cityCode);
			AreaDto areaDto = new AreaDto();
			areaDto.setCode("");
			areaDto.setName("不限");
			areaList.add(0, areaDto);
		}

		String certTypeCode = personalCertDto.getCertTypeCode();
		if (certTypeCode != null && !"".equalsIgnoreCase(certTypeCode)) {
			certList = EssentialDataUtil
					.queryEssentialDataListByParentCode(certTypeCode);
			ClassMasterDto classMasterDto = new ClassMasterDto();
			classMasterDto.setCode("");
			classMasterDto.setName("不限");
			certList.add(0, classMasterDto);
		}

		return "searchPersonalCert";
	}

	/**
	 * 查看特定证书下个人证书信息
	 * 
	 * @return
	 */
	public String viewParticularCert() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.CERTCTR_PAGE_SIZE);
		loadEssentialData4Search();
		if (personalCertDto == null) {
			personalCertDto = new PersonalCertDto();
		}
		if (personalCertVo == null) {
			personalCertVo = new PersonalCertVo();
		}
		if (personalCertVo.getRegisterStatus() == null) {
			personalCertVo.setRegisterStatus(new ClassMasterDto());
		}
		if (personalCertVo.getProvince() == null) {
			personalCertVo.setProvince(new ProvinceDto());
		}
		if (personalCertVo.getCity() == null) {
			personalCertVo.setCity(new CityDto());
		}
		if (personalCertVo.getArea() == null) {
			personalCertVo.setArea(new AreaDto());
		}
		if (personalCertVo.getCert() == null) {
			personalCertVo.setCert(new ClassMasterDto());
		}
		if (personalCertVo.getCertType() == null) {
			personalCertVo.setCertType(new ClassMasterDto());
		}
		if (personalCertVo.getSpecialField() == null) {
			personalCertVo.setSpecialField(new ClassMasterDto());
		}
		request = ServletActionContext.getRequest();
		String certCode = request.getParameter("certCode");
		String certName = EssentialDataUtil.getEssentialDataBycode(certCode)
				.getName();
		String certTypeCode = EssentialDataUtil
				.getEssentialDataBycode(certCode).getParentCode();
		String certTypeName = EssentialDataUtil.getEssentialDataBycode(
				certTypeCode).getName();
		personalCertDto.setCertTypeCode(certTypeCode);
		personalCertDto.setCertCode(certCode);
		personalCertVo.getCertType().setName(certTypeName);
		personalCertVo.getCert().setName(certName);
		personalCertDto
				.setCertStatus(ApplicationConstant.PERSONAL_CERT_NOT_ATTACHED);
		personalCertSearchResult = certificateService
				.queryPersonalCertPaginatedList(pageInfo, personalCertDto);
		// 获得页面保存的联动数据
		String provinceCode = personalCertDto.getProvinceCode();
		if (provinceCode != null && !"".equalsIgnoreCase(provinceCode)) {
			cityList = RegionDataUtil.queryCityListByProvinceCode(provinceCode);
			CityDto cityDto = new CityDto();
			cityDto.setCode("");
			cityDto.setName("不限");
			cityList.add(0, cityDto);
		}

		String cityCode = personalCertDto.getCityCode();
		if (cityCode != null && !"".equalsIgnoreCase(cityCode)) {
			areaList = RegionDataUtil.queryAreaListByCityCode(cityCode);
			AreaDto areaDto = new AreaDto();
			areaDto.setCode("");
			areaDto.setName("不限");
			areaList.add(0, areaDto);
		}

		certTypeCode = personalCertDto.getCertTypeCode();
		if (certTypeCode != null && !"".equalsIgnoreCase(certTypeCode)) {
			certList = EssentialDataUtil
					.queryEssentialDataListByParentCode(certTypeCode);
			ClassMasterDto classMasterDto = new ClassMasterDto();
			classMasterDto.setCode("");
			classMasterDto.setName("不限");
			certList.add(0, classMasterDto);
		}
		return "searchPersonalCert";
	}

	/**
	 * 查看个人证书详细信息
	 * 
	 * @return
	 */
	public String viewPersonalCertDetail() {
		request = ServletActionContext.getRequest();
		String idStr = request.getParameter("id");
		Long id = new Long(idStr);
		personalCertVo = certificateService.getPersonalCertById(id);
		return "viewPersonalCertDetail";
	}

	/**
	 * 查看证书需求详细信息
	 * 
	 * @return
	 */
	public String viewCertNeedsDetail() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.CERTCTR_PAGE_SIZE);
		request = ServletActionContext.getRequest();
		if (certNeedsId == null || certNeedsId == 0L) {
			certNeedsId = new Long(request.getParameter("certNeedsId"));
		}
		if (userId == null || userId == 0L) {
			userId = new Long(request.getParameter("userId"));
		}
		certNeedsVo = certificateService.getCertNeedsById(certNeedsId);
		CertNeedsDto certNeedsDto = new CertNeedsDto();
		certNeedsDto.setUserId(userId);
		certNeedsDto.setId(certNeedsId);

		// 搜索相关证书需求
		certNeedsList = certificateService.queryRelatedCertNeedsList(pageInfo,
				certNeedsDto);
		return "viewCertNeedsDetail";
	}

	/**
	 * 更多急需证书信息
	 * 
	 * @return
	 */
	public String moreCertNeedsIndeed() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.CERTCTR_PAGE_SIZE);
		CertNeedsDto certNeedsDto = new CertNeedsDto();
		certNeedsDto.setIsIndeed(ApplicationConstant.COMMON_Y_EN);
		certNeedsDto.setCertNeedsStatus("0");
		Date currentDate = new Date();
		certNeedsDto.setEffDate(currentDate);
		certNeedsDto.setExpDate(currentDate);
		certNeedsIndeedList = certificateService.queryCertNeedsPaginatedList(
				pageInfo, certNeedsDto);
		return "certNeedsIndeed";
	}

	/**
	 * 更多证书需求信息
	 * 
	 * @return
	 */
	public String moreCertNeeds() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.CERTCTR_PAGE_SIZE);
		CertNeedsDto certNeedsDto = new CertNeedsDto();
		certNeedsDto.setCertNeedsStatus("0");
		Date currentDate = new Date();
		certNeedsDto.setEffDate(currentDate);
		certNeedsDto.setExpDate(currentDate);
		certNeedsIndeedList = certificateService.queryCertNeedsPaginatedList(
				pageInfo, certNeedsDto);
		return "certNeeds";
	}

	/**
	 * 更多个人证书信息
	 * 
	 * @return
	 */
	public String morePersonalCert() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.CERTCTR_PAGE_SIZE);
		PersonalCertDto personalCertDto = new PersonalCertDto();
		personalCertDto
				.setCertStatus(ApplicationConstant.PERSONAL_CERT_NOT_ATTACHED);
		personalCertSearchResult = certificateService
				.queryPersonalCertPaginatedList(pageInfo, personalCertDto);
		return "personalCert";
	}

	/**
	 * 进入个人证书提交页面
	 * 
	 * @return
	 */
	public String toSubmitCert() {
		if (!verifyPersonalUser()) {
			return "closeWindow";
		}
		SysOrderDto dto = new SysOrderDto();
		dto.setService1Remains(new Long(1));
		LoginUserInfoDto userInfo = getLoginUserInfo();
		if (sysOrderService.verifyAuthority(dto, userInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_HANGCARD_CODE, "1", 0)) {
			loadEssentialData();
			if (certList == null) {
				certList = new ArrayList<ClassMasterDto>();
			}
			if (cityList == null) {
				cityList = new ArrayList<CityDto>();
			}
			if (areaList == null) {
				areaList = new ArrayList<AreaDto>();
			}
			return "toSubmitCert";
		} else {
			actionMessage = ApplicationConstant.SERVICE_ERROR_MESSAGE;
			return "closeWindow";
		}
	}

	/**
	 * 判断当前登陆用户是否为个人用户
	 * 
	 * @return
	 */
	private boolean verifyPersonalUser() {
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		String userType = loginUserInfo.getUserType();

		// 如果用户类型为空，返回错误
		if (userType == null || "".equalsIgnoreCase(userType)) {
			actionMessage = ApplicationConstant.FUNCTION_LIMITED;
			return false;
		}

		// 如果用户类型为企业用户，返回错误
		else {
			if (ApplicationConstant.USER_TYPE_ENTERPRISE
					.equalsIgnoreCase(userType)) {
				actionMessage = ApplicationConstant.USERTYPE_ERROR_ENTERPRISE;
				return false;
			}
		}
		return true;
	}

	/**
	 * 保存个人证书信息
	 * 
	 * @return
	 */
	public String submitCert() {
		if (!verifyPersonalUser()) {
			return "closeWindow";
		}
		Long userId = getLoginUserInfo().getId();
		personalCertDto.setUserId(userId);
		Date currentDate = new Date();
		personalCertDto.setLastEditDate(currentDate);
		personalCertDto.setSubmitDate(currentDate);
		personalCertDto.setCertStatus("0");

		int size = certificateService
				.queryDuplicatedPersonalCertCount(personalCertDto);
		if (size > 0) {
			actionMessage = "个人证书信息重复，请重新输入证书信息！";
			return toSubmitCert();
		}

		LoginUserInfoDto userInfo = getLoginUserInfo();
		boolean result = certificateService.savePersonalCert(personalCertDto,
				userInfo);
		if (result) {
			HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
			htmlGeneration.refreshCertificateCenterPage();
			return "submitCert";
		} else {
			return "serviceExpiredClose";
		}
	}

	/**
	 * 判断当前登陆用户是否为企业用户
	 * 
	 * @return
	 */
	private boolean verifyEnterpriseUser() {
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		String userType = loginUserInfo.getUserType();

		// 如果用户类型为空，返回错误
		if (userType == null || "".equalsIgnoreCase(userType)) {
			actionMessage = ApplicationConstant.FUNCTION_LIMITED;
			return false;
		}

		// 如果用户类型为个人用户，返回错误
		else {
			if (ApplicationConstant.USER_TYPE_PERSONAL
					.equalsIgnoreCase(userType)) {
				actionMessage = ApplicationConstant.USERTYPE_ERROR_PERSONAL;
				return false;
			}
		}
		return true;
	}

	/**
	 * 企业用户进入提交证书需求界面
	 * 
	 * @return
	 */
	public String toSubmitCertNeeds() {
		SysOrderDto dto = new SysOrderDto();
		dto.setService2Remains(new Long(1));
		LoginUserInfoDto userInfo = getLoginUserInfo();

		// 如果当前用户为个人用户，则返回错误页面
		if (!verifyEnterpriseUser()) {
			return "closeWindow";
		}

		else {
			if (sysOrderService
					.verifyAuthority(
							dto,
							userInfo,
							ApplicationConstant.SERVICE_ITEM_NAME_HUNTCARD_CODE,
							"2", 0)) {
				loadEssentialData();
				if (certList == null) {
					certList = new ArrayList<ClassMasterDto>();
				}
				if (cityList == null) {
					cityList = new ArrayList<CityDto>();
				}
				if (areaList == null) {
					areaList = new ArrayList<AreaDto>();
				}
				return "toSubmitCertNeeds";
			} else {
				actionMessage = ApplicationConstant.SERVICE_ERROR_MESSAGE;
				return "closeWindow";
			}
		}

	}

	/**
	 * 保存证书需求信息
	 * 
	 * @return
	 */
	public String submitCertNeeds() {
		if (!verifyEnterpriseUser()) {
			return "closeWindow";
		}
		Long userId = getLoginUserInfo().getId();
		Date currentDate = new Date();
		certNeedsDto.setCertNeedsStatus("0");
		certNeedsDto.setIsIndeed("N");
		certNeedsDto.setSubmitDate(currentDate);
		certNeedsDto.setLastEditDate(currentDate);
		certNeedsDto.setUserId(userId);

		int size = certificateService
				.queryDuplicatedCertNeedsCount(certNeedsDto);
		if (size > 0) {
			actionMessage = "证书需求信息重复，请重新输入证书需求信息！";
			return toSubmitCertNeeds();
		}

		// 判断服务是否已到期
		LoginUserInfoDto userInfo = getLoginUserInfo();
		boolean result = certificateService.saveCertNeeds(certNeedsDto,
				userInfo);
		if (result) {
			HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
			htmlGeneration.refreshCertificateCenterPage();
			return "submitCertNeeds";
		} else {
			return "serviceExpiredClose";
		}
	}

	/**
	 * 查看证书需求信息联系方式
	 * 
	 * @return
	 */
	public String viewCertNeedsContact() {
		// 判断用户是否登陆
		LoginUserInfoDto userInfo = getLoginUserInfo();
		if (userInfo == null) {
			authorized = ApplicationConstant.COMMON_UNLOGON;
			return "toViewContact";
		}
		String userType = userInfo.getUserType();

		// 判断用户是否完善博站资料
		if (userType == null || "".equalsIgnoreCase(userType)) {
			authorized = "permissionDenied";
			return "toViewContact";
		}

		// 判断当前用户是否是个人用户
		if (ApplicationConstant.USER_TYPE_ENTERPRISE.equalsIgnoreCase(userType)) {
			authorized = "userTypeError";
			return "toViewContact";
		}

		// 保存证书需求浏览记录
		request = ServletActionContext.getRequest();
		Long certNeedsId = Long.parseLong(request.getParameter("certNeedsId"));
		CertNeedsAccessHistoryDto certNeedsAccessHistoryDto = new CertNeedsAccessHistoryDto();
		certNeedsAccessHistoryDto.setCertNeedsId(certNeedsId);
		certNeedsAccessHistoryDto.setAccessUserId(userInfo.getId());
		certNeedsAccessHistoryDto.setAccessDate(new Date());
		certNeedsAccessHistoryService
				.saveCertNeedsAccessHistory(certNeedsAccessHistoryDto);
		authorized = ApplicationConstant.COMMON_Y_EN;
		return "toViewContact";
	}

	/**
	 * 查看个人证书信息联系方式
	 * 
	 * @return
	 */
	public String viewPersonalCertContact() {
		// 判断用户是否登陆
		LoginUserInfoDto userInfo = getLoginUserInfo();
		if (userInfo == null) {
			authorized = ApplicationConstant.COMMON_UNLOGON;
			return "toViewContact";
		}

		String userType = userInfo.getUserType();
		// 判断用户是否完善博站资料
		if (userType == null || "".equalsIgnoreCase(userType)) {
			authorized = "permissionDenied";
			return "toViewContact";
		}

		// 判断当前用户是否企业用户
		if (ApplicationConstant.USER_TYPE_PERSONAL.equalsIgnoreCase(userType)) {
			authorized = "userTypeError";
			return "toViewContact";
		}

		// 保存个人证书浏览记录
		request = ServletActionContext.getRequest();
		Long personalCertId = Long.parseLong(request
				.getParameter("personalCertId"));
		CertAccessHistoryDto certAccessHistoryDto = new CertAccessHistoryDto();
		certAccessHistoryDto.setCompanyId(userInfo.getId());
		certAccessHistoryDto.setPersonalCertId(personalCertId);
		certAccessHistoryDto.setAccessDate(new Date());
		// 判断当前用户是否具有可用服务
		boolean result = certAccessHistoryService.saveCertAccessHistory(
				certAccessHistoryDto, userInfo);
		if (result) {

			authorized = ApplicationConstant.COMMON_Y_EN;// 判断权限成功
		} else {
			authorized = "serviceOutOfDate";
		}

		return "toViewContact";
	}

	/**
	 * 进入证书查询验证中心
	 * 
	 * @return
	 */
	public String verifyCert() {
		certVerifyInfoList = certificateService.queryCertVerifyInfoList();
		return "verifyCert";
	}

	/**
	 * @return the certNeedsIndeedList
	 */
	public List<CertNeedsVo> getCertNeedsIndeedList() {
		return certNeedsIndeedList;
	}

	/**
	 * @return the latestCertNeedsList
	 */
	public List<CertNeedsVo> getLatestCertNeedsList() {
		return latestCertNeedsList;
	}

	/**
	 * @return the latestPersonalCertList
	 */
	public List<PersonalCertVo> getLatestPersonalCertList() {
		return latestPersonalCertList;
	}

	/**
	 * @return the companySizeList
	 */
	public List<ClassMasterDto> getCompanySizeList() {
		return companySizeList;
	}

	/**
	 * @return the hotCertList
	 */
	public List<HotCertVo> getHotCertList() {
		return hotCertList;
	}

	/**
	 * @return the zhiyeCertList
	 */
	public List<ClassMasterDto> getZhiyeCertList() {
		return zhiyeCertList;
	}

	/**
	 * @return the zhichengCertList
	 */
	public List<ClassMasterDto> getZhichengCertList() {
		return zhichengCertList;
	}

	/**
	 * @return the registerStatusList
	 */
	public List<ClassMasterDto> getRegisterStatusList() {
		return registerStatusList;
	}

	/**
	 * @return the certList
	 */
	public List<ClassMasterDto> getCertList() {
		return certList;
	}

	/**
	 * @return the certificateService
	 */
	@JSON(serialize = false)
	public ICertificateService getCertificateService() {
		return certificateService;
	}

	/**
	 * @param certificateService
	 *            the certificateService to set
	 */
	public void setCertificateService(ICertificateService certificateService) {
		this.certificateService = certificateService;
	}

	/**
	 * @return the certificateTypeList
	 */
	public List<ClassMasterDto> getCertificateTypeList() {
		return certificateTypeList;
	}

	/**
	 * @return the specialFieldList
	 */
	public List<ClassMasterDto> getSpecialFieldList() {
		return specialFieldList;
	}

	/**
	 * @param certNeedsDto
	 *            the certNeedsDto to set
	 */
	public void setCertNeedsDto(CertNeedsDto certNeedsDto) {
		this.certNeedsDto = certNeedsDto;
	}

	/**
	 * @return the certNeedsDto
	 */
	public CertNeedsDto getCertNeedsDto() {
		return certNeedsDto;
	}

	/**
	 * @return the certNeedsSearchResult
	 */
	public List<CertNeedsVo> getCertNeedsSearchResult() {
		return certNeedsSearchResult;
	}

	/**
	 * @return the personalCertDto
	 */
	public PersonalCertDto getPersonalCertDto() {
		return personalCertDto;
	}

	/**
	 * @param personalCertDto
	 *            the personalCertDto to set
	 */
	public void setPersonalCertDto(PersonalCertDto personalCertDto) {
		this.personalCertDto = personalCertDto;
	}

	/**
	 * @return the personalCertSearchResult
	 */
	public List<PersonalCertVo> getPersonalCertSearchResult() {
		return personalCertSearchResult;
	}

	/**
	 * @param certNeedsVo
	 *            the certNeedsVo to set
	 */
	public void setCertNeedsVo(CertNeedsVo certNeedsVo) {
		this.certNeedsVo = certNeedsVo;
	}

	/**
	 * @return the certNeedsVo
	 */
	public CertNeedsVo getCertNeedsVo() {
		return certNeedsVo;
	}

	/**
	 * @return the personalCertVo
	 */
	public PersonalCertVo getPersonalCertVo() {
		return personalCertVo;
	}

	public void setPersonalCertVo(PersonalCertVo personalCertVo) {
		this.personalCertVo = personalCertVo;
	}

	/**
	 * @return the authorized
	 */
	public String getAuthorized() {
		return authorized;
	}

	/**
	 * @return the certNeedsList
	 */
	public List<CertNeedsVo> getCertNeedsList() {
		return certNeedsList;
	}

	/**
	 * @return the certVerifyInfoList
	 */
	public List<CertVerifyInfoDto> getCertVerifyInfoList() {
		return certVerifyInfoList;
	}

	/**
	 * @return the pageInfo
	 */
	public PageInfo getPageInfo() {
		return pageInfo;
	}

	/**
	 * @param pageInfo
	 *            the pageInfo to set
	 */
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	/**
	 * @return the certNeedsId
	 */
	public Long getCertNeedsId() {
		return certNeedsId;
	}

	/**
	 * @param certNeedsId
	 *            the certNeedsId to set
	 */
	public void setCertNeedsId(Long certNeedsId) {
		this.certNeedsId = certNeedsId;
	}

	/**
	 * @return the userId
	 */
	public Long getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}

	/**
	 * @return the certAccessHistoryService
	 */
	public ICertAccessHistoryService getCertAccessHistoryService() {
		return certAccessHistoryService;
	}

	/**
	 * @param certAccessHistoryService
	 *            the certAccessHistoryService to set
	 */
	public void setCertAccessHistoryService(
			ICertAccessHistoryService certAccessHistoryService) {
		this.certAccessHistoryService = certAccessHistoryService;
	}

	/**
	 * @return the certNeedsAccessHistoryService
	 */
	public ICertNeedsAccessHistoryService getCertNeedsAccessHistoryService() {
		return certNeedsAccessHistoryService;
	}

	/**
	 * @param certNeedsAccessHistoryService
	 *            the certNeedsAccessHistoryService to set
	 */
	public void setCertNeedsAccessHistoryService(
			ICertNeedsAccessHistoryService certNeedsAccessHistoryService) {
		this.certNeedsAccessHistoryService = certNeedsAccessHistoryService;
	}

	public ISysOrderService getSysOrderService() {
		return sysOrderService;
	}

	public void setSysOrderService(ISysOrderService sysOrderService) {
		this.sysOrderService = sysOrderService;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

}
