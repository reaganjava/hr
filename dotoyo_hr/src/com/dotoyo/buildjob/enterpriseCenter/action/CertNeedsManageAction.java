package com.dotoyo.buildjob.enterpriseCenter.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.dotoyo.buildjob.certificateCenter.dto.CertNeedsDto;
import com.dotoyo.buildjob.certificateCenter.service.ICertificateService;
import com.dotoyo.buildjob.certificateCenter.vo.CertNeedsVo;
import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.AreaDto;
import com.dotoyo.buildjob.common.dto.CityDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.DateUtil;
import com.dotoyo.buildjob.common.util.EssentialDataUtil;
import com.dotoyo.buildjob.common.util.RegionDataUtil;
import com.dotoyo.buildjob.sys.dto.SysOrderDto;
import com.dotoyo.buildjob.sys.service.ISysOrderService;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 * 
 * @author arthas.zou
 * @dateCreated 2011-2-12
 * @description
 */
public class CertNeedsManageAction extends BuildJobAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5408929881453657651L;
	private ICertificateService certificateService;
	private PageInfo pageInfo;
	private List<CertNeedsVo> certNeedsList;
	private String[] certNeedsCheckBox;
	private List<ClassMasterDto> certificateTypeList;// 证书类型列表
	private List<ClassMasterDto> specialFieldList;// 专业列表
	private List<ClassMasterDto> registerStatusList;// 注册状况列表
	private List<ClassMasterDto> companySizeList;// 单位规模
	private CertNeedsDto certNeedsDto;
	private CertNeedsVo certNeedsVo;
	private List<ClassMasterDto> certList;// 证书列表
	private Map<String, String> certNeedsMap;
	private String from;// 请求来源
	private String actionMessage;
	private ISysOrderService sysOrderService;
	private String previousURL;// 前一url
	private String currentDate;//当前日期
	private String extendationDate;// 延长日期

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
	 * 查看发布中的证书需求列表
	 * 
	 * @return
	 */
	public String viewSubmitedCertNeedsList() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.ENTERPRISECENTER_CERTNEEDS_LIST_SIZE);
		Long userId = this.getLoginUserInfo().getId();
		if (certNeedsMap == null) {
			certNeedsMap = new HashMap<String, String>();
		}
		String certNeedsStatus = certNeedsMap.get("certNeedsStatus");
		if (certNeedsStatus == null || "".equalsIgnoreCase(certNeedsStatus)) {
			certNeedsMap.put("certNeedsStatus", "0");
		}
		certNeedsMap.put("userId", userId.toString());
		certNeedsList = certificateService
				.searchCertNeedsList4EnterpriseCenter(pageInfo, certNeedsMap);
		return "viewSubmitedCertNeedsList";
	}

	public String viewExpiredCertNeedsList() {
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.ENTERPRISECENTER_CERTNEEDS_LIST_SIZE);
		Long userId = this.getLoginUserInfo().getId();
		if (certNeedsMap == null) {
			certNeedsMap = new HashMap<String, String>();
		}
		certNeedsMap.put("userId", userId.toString());
		certNeedsMap
				.put("certNeedsType", ApplicationConstant.EXPIRED_CERTNEEDS);
		certNeedsMap.put("currentDate",
				DateUtil.getCurrentDateString("yyyy-MM-dd"));
		certNeedsList = certificateService
				.searchCertNeedsList4EnterpriseCenter(pageInfo, certNeedsMap);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		currentDate = sdf.format(new Date());
		extendationDate = sdf.format(getDateAfter(new Date(), 7));
		return "viewExpiredCertNeedsList";
	}

	/**
	 * 查看暂停的证书需求列表
	 * 
	 * @return
	 */
	public String viewPausedCertNeedsList() {
		loadEssentialData();
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.ENTERPRISECENTER_CERTNEEDS_LIST_SIZE);
		if (cityList == null) {
			cityList = new ArrayList<CityDto>();
		}
		if (areaList == null) {
			areaList = new ArrayList<AreaDto>();
		}
		if (certNeedsMap == null) {
			certNeedsMap = new HashMap<String, String>();
		}
		String provinceCode = certNeedsMap.get("provinceCode");
		if (provinceCode != null) {
			cityList = RegionDataUtil.queryCityListByProvinceCode(provinceCode);
		}
		String cityCode = certNeedsMap.get("cityCode");
		if (cityCode != null) {
			areaList = RegionDataUtil.queryAreaListByCityCode(cityCode);
		}
		Long userId = this.getLoginUserInfo().getId();
		certNeedsMap.put("userId", userId.toString());
		certNeedsMap.put("certNeedsStatus", "2");
		certNeedsList = certificateService
				.searchCertNeedsList4EnterpriseCenter(pageInfo, certNeedsMap);
		return "viewPausedCertNeedsList";
	}

	public String viewExpiringCertNeedsList() {
		loadEssentialData();
		if (pageInfo == null) {
			pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(ApplicationConstant.ENTERPRISECENTER_CERTNEEDS_LIST_SIZE);
		if (certNeedsMap == null) {
			certNeedsMap = new HashMap<String, String>();
		}
		Long userId = this.getLoginUserInfo().getId();
		certNeedsMap.put("userId", userId.toString());
		certNeedsMap.put("certNeedsType",
				ApplicationConstant.EXPIRING_CERTNEEDS);
		certNeedsMap.put("currentDate",
				DateUtil.getCurrentDateString("yyyy-MM-dd"));
		String certNeedsStatus = certNeedsMap.get("certNeedsStatus");
		if (certNeedsStatus == null || "".equalsIgnoreCase(certNeedsStatus)) {
			certNeedsMap.put("certNeedsStatus", "0,2");
		}
		certNeedsList = certificateService
				.searchCertNeedsList4EnterpriseCenter(pageInfo, certNeedsMap);
		Date currentDate = new Date(); // 新建一个日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 格式化日期
		extendationDate = sdf.format(getDateAfter(currentDate, 7));
		return "viewExpiringCertNeedsList";
	}

	/**
	 * 得到几天后的时间
	 */

	private Date getDateAfter(Date d, int day) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) + day);
		return now.getTime();
	}

	/**
	 * 修改证书需求状态
	 * 
	 * @return
	 */
	public String editCertNeedsStatus() {
		request = ServletActionContext.getRequest();
		String certNeedsStatus = request.getParameter("certNeedsStatus");
		String certNeedsIds = StringUtils.join(certNeedsCheckBox, ",");
		Map<String, Object> certNeedsMap = new HashMap<String, Object>();
		certNeedsMap.put("ids", certNeedsIds);
		certNeedsMap.put("certNeedsStatus", certNeedsStatus);
		certNeedsMap.put("lastEditDate", new Date());
		certificateService.editCertNeedsStatus(certNeedsMap);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshCertificateCenterPage();
		if ("SubmitedCertNeeds".equalsIgnoreCase(from)) {
			return viewSubmitedCertNeedsList();
		}
		if ("PausedCertNeeds".equalsIgnoreCase(from)) {
			return viewPausedCertNeedsList();
		}
		if ("ExpiringCertNeeds".equalsIgnoreCase(from)) {
			return viewExpiringCertNeedsList();
		}
		return viewSubmitedCertNeedsList();
	}

	/**
	 * 批量删除证书需求信息
	 * 
	 * @return
	 */
	public String deleteCertNeeds() {
		String certNeedsIds = StringUtils.join(certNeedsCheckBox, ",");
		certificateService.deleteCertNeeds(certNeedsIds);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshCertificateCenterPage();
		return "deleteCertNeedsFrom" + from;
	}

	/**
	 * 进入证书需求修改页面
	 * 
	 * @return
	 */
	public String toEditCertNeeds() {
		loadEssentialData();
		request = ServletActionContext.getRequest();
		Long certNeedsId = 0L;
		if (certNeedsDto != null)
			certNeedsId = certNeedsDto.getId();
		if (request.getParameter("certNeedsId") != null)
			certNeedsId = Long.parseLong(request.getParameter("certNeedsId"));
		String from = request.getParameter("from");
		request.setAttribute("from", from);
		certNeedsVo = certificateService.getCertNeedsById(certNeedsId);
		
		if (certNeedsVo == null) {
			return "accessDenied";
		}

		certNeedsDto = certNeedsVo.convertToDto();

		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		if (!certNeedsDto.getUserId().equals(loginUserInfo.getId())) {
			return "accessDenied";
		}
		
		certList = EssentialDataUtil
				.queryEssentialDataListByParentCode(certNeedsDto
						.getCertTypeCode());
		cityList = RegionDataUtil.queryCityListByProvinceCode(certNeedsDto
				.getProvinceCode());
		areaList = RegionDataUtil.queryAreaListByCityCode(certNeedsDto
				.getCityCode());
		return "toEditCertNeeds";
	}

	/**
	 * 进入增加证书需求页面
	 * 
	 * @return
	 */
	public String toAddCertNeeds() {
		SysOrderDto dto = new SysOrderDto();
		dto.setService2Remains(new Long(1));
		LoginUserInfoDto userInfo = getLoginUserInfo();

		if (sysOrderService.verifyAuthority(dto, userInfo,
				ApplicationConstant.SERVICE_ITEM_NAME_HUNTCARD_CODE, "2", 0)) {
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
			return "serviceExpiredReturn";
		}
	}

	public String saveAddCertNeeds() {
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
			return toAddCertNeeds();
		}

		// 判断服务是否已到期
		LoginUserInfoDto userInfo = getLoginUserInfo();
		boolean result = certificateService.saveCertNeeds(certNeedsDto,
				userInfo);
		if (result) {
			HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
			htmlGeneration.refreshCertificateCenterPage();
			return "saveAddCertNeeds";
		} else {
			return "serviceExpiredReturn";
		}
	}

	/**
	 * 保存修改证书需求信息
	 * 
	 * @return
	 */
	public String saveEditCertNeeds() {
		certNeedsDto.setLastEditDate(new Date());
		LoginUserInfoDto loginUserInfo = this.getLoginUserInfo();
		Long userId = loginUserInfo.getId();
		certNeedsDto.setUserId(userId);

		int size = certificateService
				.queryDuplicatedCertNeedsCount(certNeedsDto);
		if (size > 1) {
			actionMessage = "证书需求信息重复，请重新输入证书需求信息！";
			return toEditCertNeeds();
		}
		if (size == 1) {
			Long id = certificateService.queryDuplicatedCertNeedsIdList(
					certNeedsDto).get(0);
			if (certNeedsDto.getId() != id.longValue()) {
				actionMessage = "证书需求信息重复，请重新输入证书需求信息！";
				return toEditCertNeeds();
			}
		}

		certificateService.updateCertNeeds(certNeedsDto);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshCertificateCenterPage();
		return "saveEditCertNeedsFrom" + from;
	}

	/**
	 * 查看证书需求详细信息
	 * 
	 * @return
	 */
	public String viewCertNeedsDetail() {
		request = ServletActionContext.getRequest();
		request.setAttribute("readOnly", ApplicationConstant.COMMON_Y_EN);
		return toEditCertNeeds();
	}

	/**
	 * 延长证书需求发布时间
	 * 
	 * @return
	 */
	public String extendsExpDate() {
		String ids = StringUtils.join(certNeedsCheckBox, ",");
		if (certNeedsMap == null) {
			certNeedsMap = new HashMap<String, String>();
		}
		certNeedsMap.put("ids", ids);
		certificateService.extendsExpDate(certNeedsMap);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshCertificateCenterPage();

		// 清除页面带过来的多余的搜索条件s
		certNeedsMap.remove("expDate");

		return viewExpiringCertNeedsList();
	}

	public String republishCertNeeds() {
		String ids = StringUtils.join(certNeedsCheckBox, ",");
		if (certNeedsMap == null) {
			certNeedsMap = new HashMap<String, String>();
		}
		certNeedsMap.put("ids", ids);
		certificateService.republishCertNeeds(certNeedsMap);
		HtmlGeneration htmlGeneration = HtmlGeneration.getInstance();
		htmlGeneration.refreshCertificateCenterPage();

		// 清除页面带过来的多余的搜索条件
		certNeedsMap.remove("effDate");
		certNeedsMap.remove("expDate");

		return viewExpiredCertNeedsList();
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
	 * @return the certNeedsList
	 */
	public List<CertNeedsVo> getCertNeedsList() {
		return certNeedsList;
	}

	/**
	 * @return the certNeedsCheckBox
	 */
	public String[] getCertNeedsCheckBox() {
		return certNeedsCheckBox;
	}

	/**
	 * @param certNeedsCheckBox
	 *            the certNeedsCheckBox to set
	 */
	public void setCertNeedsCheckBox(String[] certNeedsCheckBox) {
		this.certNeedsCheckBox = certNeedsCheckBox;
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
	 * @return the certNeedsDto
	 */
	public CertNeedsDto getCertNeedsDto() {
		return certNeedsDto;
	}

	/**
	 * @param certNeedsDto
	 *            the certNeedsDto to set
	 */
	public void setCertNeedsDto(CertNeedsDto certNeedsDto) {
		this.certNeedsDto = certNeedsDto;
	}

	/**
	 * @return the certNeedsVo
	 */
	public CertNeedsVo getCertNeedsVo() {
		return certNeedsVo;
	}

	/**
	 * @param certNeedsVo
	 *            the certNeedsVo to set
	 */
	public void setCertNeedsVo(CertNeedsVo certNeedsVo) {
		this.certNeedsVo = certNeedsVo;
	}

	/**
	 * @return the certList
	 */
	public List<ClassMasterDto> getCertList() {
		return certList;
	}

	/**
	 * @return the certNeedsMap
	 */
	public Map<String, String> getCertNeedsMap() {
		return certNeedsMap;
	}

	/**
	 * @param certNeedsMap
	 *            the certNeedsMap to set
	 */
	public void setCertNeedsMap(Map<String, String> certNeedsMap) {
		this.certNeedsMap = certNeedsMap;
	}

	/**
	 * @return the from
	 */
	public String getFrom() {
		return from;
	}

	/**
	 * @param from
	 *            the from to set
	 */
	public void setFrom(String from) {
		this.from = from;
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

	public String getPreviousURL() {
		return previousURL;
	}

	public void setPreviousURL(String previousURL) {
		this.previousURL = previousURL;
	}

	public String getExtendationDate() {
		return extendationDate;
	}

	public void setExtendationDate(String extendationDate) {
		this.extendationDate = extendationDate;
	}

	public String getCurrentDate() {
		return currentDate;
	}

	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}
	
}
