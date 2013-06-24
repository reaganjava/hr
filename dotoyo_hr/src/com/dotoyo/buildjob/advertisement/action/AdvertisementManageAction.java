package com.dotoyo.buildjob.advertisement.action;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.util.CacheManager;
import com.dotoyo.buildjob.common.util.DateUtil;
import com.dotoyo.buildjob.common.util.PropertiesValue;
import com.dotoyo.buildjob.sys.dto.SysAdDto;
import com.dotoyo.buildjob.sys.service.ISysAdService;

public class AdvertisementManageAction extends BuildJobAction {
	
	private ISysAdService sysAdService;
	private List<SysAdDto> list001;
	private List<SysAdDto> list002;
	private List<SysAdDto> list003;
	private List<SysAdDto> list004;
	private List<SysAdDto> list005;
	private String uploadFilePath;
	private String dateFormatStr="yyyy-MM-dd HH:mm:ss";
	
	public ISysAdService getSysAdService() {
		return sysAdService;
	}
	public void setSysAdService(ISysAdService sysAdService) {
		this.sysAdService = sysAdService;
	}
	public String getUploadFilePath() {
		return uploadFilePath;
	}
	public void setUploadFilePath(String uploadFilePath) {
		this.uploadFilePath = uploadFilePath;
	}

	public List<SysAdDto> getList001() {
		return list001;
	}

	public void setList001(List<SysAdDto> list001) {
		this.list001 = list001;
	}

	public List<SysAdDto> getList002() {
		return list002;
	}

	public void setList002(List<SysAdDto> list002) {
		this.list002 = list002;
	}

	public List<SysAdDto> getList003() {
		return list003;
	}

	public void setList003(List<SysAdDto> list003) {
		this.list003 = list003;
	}

	public List<SysAdDto> getList004() {
		return list004;
	}

	public void setList004(List<SysAdDto> list004) {
		this.list004 = list004;
	}

	public List<SysAdDto> getList005() {
		return list005;
	}

	public void setList005(List<SysAdDto> list005) {
		this.list005 = list005;
	}

	public String getAdvertisementList(){
		this.uploadFilePath = PropertiesValue
		.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		SysAdDto sysad = new SysAdDto();
		sysad.setCurrentDate(null);
		String serverUrl = (String) CacheManager.getInstanceMemcachedClient().get("fileServerURL");
		sysad.setServerUrl(serverUrl);
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_RECRUIT_001);
		sysad.setLimitNumber(100);
		list001= sysAdService.queryAdForList(sysad);
		for(SysAdDto ad:list001 ){
			replaceImg(ad,ApplicationConstant.DOTOYO_DEFAULT_IMG001);
		}
		
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_RECRUIT_002);
		sysad.setLimitNumber(5);
		list002= sysAdService.queryAdForList(sysad);
		int listsize=list002==null?0:list002.size();

		for(int i=0;i<5;i++){
			if(i>=listsize){
				SysAdDto ad = new SysAdDto();
				ad.setImgName(ApplicationConstant.DOTOYO_DEFAULT_IMG002);
				ad.setTitle(ApplicationConstant.DOTOYO_DEFAULT_TITLE);
				ad.setUrl(ApplicationConstant.DOTOYO_DEFAULT_URL);
				ad.setStartDate(new Date());
				ad.setEndDate(new Date());
				list002.add(ad);
			}else{
				replaceImg(list002.get(i),ApplicationConstant.DOTOYO_DEFAULT_IMG002);
			}
		}

		
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_RECRUIT_003);
		sysad.setLimitNumber(16);
		list003= sysAdService.queryAdForList(sysad);
		for(SysAdDto ad:list003 ){
			replaceImg(ad,ApplicationConstant.DOTOYO_DEFAULT_IMG003);
		}
		
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_RECRUIT_004);
		sysad.setLimitNumber(16);
		list004= sysAdService.queryAdForList(sysad);
		for(SysAdDto ad:list004 ){
			replaceImg(ad,ApplicationConstant.DOTOYO_DEFAULT_IMG004);
		}
		
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_RECRUIT_005);
		sysad.setLimitNumber(20);
		sysad.setCurrentDate(new Date());
		list005= sysAdService.queryAdForList(sysad);

		return "success";
	}
	
	private void replaceImg(SysAdDto ad,String defaultImg){
		try {
			Date startDate = DateUtil.parseToDate(ad.getStartDate(),dateFormatStr);
			Date endDate = DateUtil.parseToDate(ad.getEndDate(),dateFormatStr);
			Date currentDate = DateUtil.parseToDate(new Date(),dateFormatStr);
			if(currentDate.before(startDate) || currentDate.after(endDate)){
				ad.setImgName(defaultImg);
				ad.setTitle(ApplicationConstant.DOTOYO_DEFAULT_TITLE);
				ad.setUrl(ApplicationConstant.DOTOYO_DEFAULT_URL);
			}
		} catch (ParseException e) {
		}
		
	}
}
