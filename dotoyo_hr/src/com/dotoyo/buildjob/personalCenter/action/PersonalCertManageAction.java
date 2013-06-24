package com.dotoyo.buildjob.personalCenter.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.dotoyo.buildjob.certificateCenter.dto.PersonalCertDto;
import com.dotoyo.buildjob.certificateCenter.service.ICertAccessHistoryService;
import com.dotoyo.buildjob.certificateCenter.service.ICertificateService;
import com.dotoyo.buildjob.certificateCenter.vo.PersonalCertVo;
import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.AreaDto;
import com.dotoyo.buildjob.common.dto.CityDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.common.util.EssentialDataUtil;
import com.dotoyo.buildjob.common.util.RegionDataUtil;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.dotoyo.buildjob.sys.service.ISysOrderService;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-1-26
 * @description
 */
public class PersonalCertManageAction extends BuildJobAction {

	/**
	 *
	 */
	private static final long serialVersionUID = -3872977958158221783L;
	private ICertificateService certificateService;
	private ICertAccessHistoryService certAccessHistoryService;
	private PageInfo pageInfo;
	private List<PersonalCertVo> personalCertList;
	private Map<String, String> personalCertMap;
	private String[] personalCertCheckBox;
	public HttpServletRequest request = null;
	private List<ClassMasterDto> certificateTypeList;// 证书类型列表
	private List<ClassMasterDto> specialFieldList;// 专业列表
	private List<ClassMasterDto> registerStatusList;// 注册状况列表
	private List<ClassMasterDto> companySizeList;// 单位规模
	private PersonalCertVo personalCertVo;
	private PersonalCertDto personalCertDto;
	private List<ClassMasterDto> certList;// 证书列表
	private String actionMessage;
	private ISysOrderService sysOrderService;
	private IUserService userService;

	/**
	 * 加载基础数据
	 * 
	 * @return
	 */
	public String loadEssentialData() {
		certificateTypeList = EssentialDataUtil
				.queryEssentialDataListByParentCode(ApplicationConstant.CERT_TYPE);
		specialFieldList = EssentialDataUtil
				.querySpecializeListLikeCode(ApplicationConstant.SPECIALIZE_TYPE);
		provinceList = RegionDataUtil.queryProvinceList();
		registerStatusList = EssentialDataUtil
				.queryEssentialDataListByParentCode(ApplicationConstant.REGISTER_STATUS);
		companySizeList = EssentialDataUtil
				.queryEssentialDataListByParentCode(ApplicationConstant.COMPANY_SIZE);
		return SUCCESS;
	}

	/**
	 * 进入个人证书提交页面
	 * 
	 * @return
	 */
	public String toSubmitCert() {

		// 判断用户是否具有可用服务
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
			return "serviceExpiredReturn";
		}
	}

	/**
	 * 查看已提交证书
	 * 
	 * @return
	 */
	public String viewSubmitedCert() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.PERSONALCENTER_SUBMITEDCERT_LIST_SIZE);
		PersonalCertDto personalCertDto = new PersonalCertDto();
		/**
		 * 获取当前用户ID
		 */
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		personalCertDto.setUserId(userId);
		personalCertList = certificateService.queryPersonalCertPaginatedList(
				pageInfo, personalCertDto);
		return "viewSubmitedCert";
	}

	/**
	 * 搜索已提交个人证书
	 * 
	 * @return
	 */
	public String searchSubmitedCert() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.PERSONALCENTER_SUBMITEDCERT_LIST_SIZE);
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		String userId = loginUserInfo.getId().toString();
		if (personalCertMap == null) {
			personalCertMap = new HashMap<String, String>();
		}
		personalCertMap.put("userId", userId);
		personalCertList = certificateService.searchCertList4PersonalCenter(
				pageInfo, personalCertMap);
		return "searchSubmitedCert";
	}

	/**
	 * 修改证书挂靠状态
	 * 
	 * @return
	 */
	public String editCertAttachStatus() {
		request = ServletActionContext.getRequest();
		String certStatus = request.getParameter("certStatus");
		String personalCertIds = StringUtils.join(personalCertCheckBox, ",");
		Map<String, Object> personalCertMap = new HashMap<String, Object>();
		personalCertMap.put("ids", personalCertIds);
		personalCertMap.put("certStatus", certStatus);
		personalCertMap.put("lastEditDate", new Date());
		certificateService.editCertAttachStatus(personalCertMap);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshCertificateCenterPage();
		return this.searchSubmitedCert();
	}

	/**
	 * 删除个人证书
	 * 
	 * @return
	 */
	public String deletePersonalCert() {
		String personalCertIds = StringUtils.join(personalCertCheckBox, ",");
		certificateService.deletePersonalCert(personalCertIds);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshCertificateCenterPage();
		return "deletePersonalCert";
	}

	/**
	 * 进入修改个人证书页面
	 * 
	 * @return
	 */
	public String toEditPersonalCert() {
		loadEssentialData();
		request = ServletActionContext.getRequest();

		Long personalCertId = 0L;
		if (personalCertDto != null) {
			personalCertId = personalCertDto.getId();
		} else {
			personalCertId = Long.parseLong(request
					.getParameter("personalCertId"));
		}
		
		personalCertVo = certificateService.getPersonalCertById(personalCertId);
		
		if (personalCertVo == null) {
			return "accessDenied";
		}
		
		personalCertDto = personalCertVo.convertToDto();
		
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		if (!personalCertDto.getUserId().equals(loginUserInfo.getId())) {
			return "accessDenied";
		}
		
		certList = EssentialDataUtil
				.queryEssentialDataListByParentCode(personalCertDto
						.getCertTypeCode());
		cityList = RegionDataUtil.queryCityListByProvinceCode(personalCertDto
				.getProvinceCode());
		areaList = RegionDataUtil.queryAreaListByCityCode(personalCertDto
				.getCityCode());
		return "toEditPersonalCert";
	}

	/**
	 * 查看个人证书详细信息
	 * 
	 * @return
	 */
	public String viewPersonalCertDetail() {
		request = ServletActionContext.getRequest();
		request.setAttribute("readOnly", ApplicationConstant.COMMON_Y_EN);
		return toEditPersonalCert();
	}

	/**
	 * 保存个人证书信息
	 * 
	 * @return
	 */
	public String saveAddPersonalCert() {
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
		LoginUserInfoDto userInfo = this.getLoginUserInfo();
		boolean result = certificateService.savePersonalCert(personalCertDto,
				userInfo);
		if (result) {
			HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
			htmlGeneration.refreshCertificateCenterPage();
			return "saveAddPersonalCert";
		} else {
			return "serviceExpiredReturn";
		}
	}

	/**
	 * 保存修改个人证书信息
	 * 
	 * @return
	 */
	public String saveEditPersonalCert() {
		personalCertDto.setLastEditDate(new Date());
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		personalCertDto.setUserId(userId);

		int size = certificateService
				.queryDuplicatedPersonalCertCount(personalCertDto);
		if (size > 1) {
			actionMessage = "个人证书信息重复，请重新输入证书信息！";
			return toEditPersonalCert();
		}
		if (size == 1) {
			long id = certificateService.queryDuplicatedPersonalCertIdList(
					personalCertDto).get(0);
			if (id != personalCertDto.getId()) {
				actionMessage = "个人证书信息重复，请重新输入证书信息！";
				return toEditPersonalCert();
			}
		}

		certificateService.updatePersonalCert(personalCertDto);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshCertificateCenterPage();
		return "saveEditPersonalCert";
	}

	/**
	 * 获得个人积分信息
	 * 
	 * @return
	 */
	public String viewPersonPoint() {
		LoginUserInfoDto loginUserInfo = getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		LoginUserInfoDto newDto = userService.getUserById(userId);
		loginUserInfo.setPoint(newDto.getPoint());
		ServletActionContext.getRequest().getSession().setAttribute(ApplicationConstant.SESSION_PARAMETER_USER_INFO, loginUserInfo);
		getLoginUserInfo();
		return "personPoint";
	}

	/**
	 * @return the certificateService
	 */
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
	 * @return the personalCertList
	 */
	public List<PersonalCertVo> getPersonalCertList() {
		return personalCertList;
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
	 * @return the personalCertMap
	 */
	public Map<String, String> getPersonalCertMap() {
		return personalCertMap;
	}

	/**
	 * @param personalCertMap
	 *            the personalCertMap to set
	 */
	public void setPersonalCertMap(Map<String, String> personalCertMap) {
		this.personalCertMap = personalCertMap;
	}

	/**
	 * @return the personalCertCheckBox
	 */
	public String[] getPersonalCertCheckBox() {
		return personalCertCheckBox;
	}

	/**
	 * @param personalCertCheckBox
	 *            the personalCertCheckBox to set
	 */
	public void setPersonalCertCheckBox(String[] personalCertCheckBox) {
		this.personalCertCheckBox = personalCertCheckBox;
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
	 * @return the registerStatusList
	 */
	public List<ClassMasterDto> getRegisterStatusList() {
		return registerStatusList;
	}

	/**
	 * @return the companySizeList
	 */
	public List<ClassMasterDto> getCompanySizeList() {
		return companySizeList;
	}

	/**
	 * @return the personalCertVo
	 */
	public PersonalCertVo getPersonalCertVo() {
		return personalCertVo;
	}

	/**
	 * @param personalCertVo
	 *            the personalCertVo to set
	 */
	public void setPersonalCertVo(PersonalCertVo personalCertVo) {
		this.personalCertVo = personalCertVo;
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
	 * @return the certList
	 */
	public List<ClassMasterDto> getCertList() {
		return certList;
	}

	public String getActionMessage() {
		return actionMessage;
	}

	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}

	public ISysOrderService getSysOrderService() {
		return sysOrderService;
	}

	public void setSysOrderService(ISysOrderService sysOrderService) {
		this.sysOrderService = sysOrderService;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
}
