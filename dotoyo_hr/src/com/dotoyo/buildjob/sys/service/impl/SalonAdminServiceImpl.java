package com.dotoyo.buildjob.sys.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.innovationSalon.dto.HostUnitDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonHomePageDisplayDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;
import com.dotoyo.buildjob.innovationSalon.vo.SalonSearchVo;
import com.dotoyo.buildjob.sys.dao.ISalonAdminDao;
import com.dotoyo.buildjob.sys.service.ISalonAdminService;

/**
 * @author Bill xu
 * @dateCreated 2011-01-06
 * @description salon business process
 */
public class SalonAdminServiceImpl implements ISalonAdminService {
	private ISalonAdminDao salonAdminDao;

	public ISalonAdminDao getSalonAdminDao() {
		return salonAdminDao;
	}

	public void setSalonAdminDao(ISalonAdminDao salonAdminDao) {
		this.salonAdminDao = salonAdminDao;
	}

	//审核沙龙
	public void updateSalon4Audi(String ids,String autiFlag){
	   this.salonAdminDao.updateSalon4Audi(ids, autiFlag);
	}
	//设置经典沙龙
	public void updateSalon4Excellent(String ids,String isExcellent){
		this.salonAdminDao.updateSalon4Excellent(ids, isExcellent);
	}

	//设置经典沙龙文章
	public void updateSalonArticle4Excellent(String ids,String isExcellent){
		this.salonAdminDao.updateSalonArticle4Excellent(ids, isExcellent);
	}
	//审核文章
	public void updateAudiSalonArticle(String ids,String status){
		this.salonAdminDao.updateAudiSalonArticle(ids, status);
	}
	//设置文章推荐
	public void updateSalonArticle4Recommend(String ids,String isRecommend){
		this.salonAdminDao.updateSalonArticle4Recommend(ids, isRecommend);
	}
	//设置文章精华
	public void updateSalonArticle4Cream(String ids,String isCream){
		this.salonAdminDao.updateSalonArticle4Cream(ids, isCream);
	}

	//审核评论
	public void updateComment4Audi(String ids,String status){
	   this.salonAdminDao.updateAudiComment(ids, status);
	}

	public void updateAudiComment(String ids, String status) {
		 this.salonAdminDao.updateAudiComment(ids, status);
	}

	/**
	 * 获取主办单位的信息列表(分页)
	 */
	public List<HostUnitDto> queryHostUnitList(PageInfo pageInfo) {
		 return this.salonAdminDao.queryHostUnitList(pageInfo);
	}

	public void deleteHostUnit(String ids){
		this.salonAdminDao.deleteHostUnit(ids);
	}
	public void modifyHostUnit(HostUnitDto hostUnitDto){
		this.salonAdminDao.modifyHostUnit(hostUnitDto);
	}
	public void addHostUnit(HostUnitDto hostUnitDto){
		this.salonAdminDao.addHostUnit(hostUnitDto);
	}

	/**
	 * 获取选择的沙龙信息列表
	 */
	public List<SalonInfoDto> querySalonListByIds() {
		 return this.transSalonInfoList(this.salonAdminDao.querySalonListByIds());
	}
	/**
	 * 获取已经设置了的沙龙信息列表
	 * @return
	 */
	public List<SalonInfoDto> querySettedSalonList() {
		 return  this.transSalonInfoList(this.salonAdminDao.querySettedSalonList());
	}

	public void addSettedSalonList(String[] ids, String[] orders) {
		List<Object> settedList = new ArrayList<Object>();
	    int i =0;
		for(String id :ids){
			if(orders[i]!=null&&!orders[i].equals("")){
				SalonHomePageDisplayDto dto = new SalonHomePageDisplayDto();
				dto.setSalonId(Long.parseLong(id));
				dto.setIntOrder(Integer.parseInt(orders[i]));
				settedList.add(dto);
	    	}
			i++;
		}
		this.salonAdminDao.addSettedSalonList(settedList);
	}

	public void updateSettedSalonList(String[] ids, String[] orders) {
		List<Object> settedList = new ArrayList<Object>();
	    int i =0;
		for(String id :ids){
			SalonHomePageDisplayDto dto = new SalonHomePageDisplayDto();
			dto.setId(Long.parseLong(id));
			dto.setIntOrder(Integer.parseInt(orders[i]));
			settedList.add(dto);
			i++;
		}
		this.salonAdminDao.updateSettedSalonList(settedList);
	}

	public void deleteSettedSalonList() {
	   this.salonAdminDao.deleteSettedSalon();
	}
	/**
	 * 获取要设置的沙龙信息列表(分页)--沙龙状态是通过的，同时排除已经分配过的
	 */
	public List<SalonInfoDto> searchSalonList4SetHomePage(PageInfo pageInfo,SalonSearchVo salonSearchVo){
		return this.transSalonInfoList(this.salonAdminDao.searchSalonList4SetHomePage(pageInfo, salonSearchVo));
	}
	/**
	 * 获取图片或者视频信息for administrator
	 * @param pageInfo
	 * @param salonSearchVo
	 * @return
	 */
	public List<SalonInfoDto> querySalonMediaList4Admin(PageInfo pageInfo,SalonSearchVo salonSearchVo){
		return this.transSalonInfoList(this.salonAdminDao.querySalonMediaList4Admin(pageInfo, salonSearchVo));
	}

	//转换生成的List供给页面显示
	public List<SalonInfoDto> transSalonInfoList(List<SalonInfoDto> salonList) {

		ArrayList<SalonInfoDto> newList = new ArrayList<SalonInfoDto>();
		for(SalonInfoDto salonInfoDto:salonList){
			//沙龙类型
			if(salonInfoDto.getSalonType().equalsIgnoreCase(ApplicationConstant.SALON_TYPE_ONLINE)){
				salonInfoDto.setSalonTypeText(ApplicationConstant.SALON_TYPE_ONLINE_MSG);
			}else{
				salonInfoDto.setSalonTypeText(ApplicationConstant.SALON_TYPE_OFFLINE_MSG);
			}
			//状态
			if(salonInfoDto.getAudiFlag().equalsIgnoreCase(ApplicationConstant.STATUS_NOT_PASS)){
				salonInfoDto.setAudiFlag(ApplicationConstant.STATUS_NOT_PASS_MSG);
			}else if(salonInfoDto.getAudiFlag().equalsIgnoreCase(ApplicationConstant.STATUS_PASSED)){
				salonInfoDto.setAudiFlag(ApplicationConstant.STATUS_PASSED_MSG);
			}else{
				salonInfoDto.setAudiFlag(ApplicationConstant.STATUS_PENDING_MSG);
			}

			newList.add(salonInfoDto);
		}
		return newList;
  }
	/**
	 * 根据文章ID审核视频和图片(线上沙龙)
	 * @param ids
	 * @param status
	 */
	public void updateMedia4AudiByArticleId(String ids,String status){
		this.salonAdminDao.updateMedia4AudiByArticleId(ids,status);
	}
	/**
	 * 删除文章相关视频
	 * @param ids
	 * @return
	 */
	public void deleteMediasByArticleId(String ids) {
		this.salonAdminDao.deleteMediasByArticleId(ids);
	}
	/**
	 * 审核图片或者视频
	 * @param ids
	 * @param status
	 */
	public void updateMedia4Audi(String ids,String status){
		 this.salonAdminDao.updateMedia4Audi(ids, status);
	}

	public void audiMediaBySalon(String ids, String mediaType, String status) {
		this.salonAdminDao.audiMediaBySalon(ids, mediaType, status);
	}

	public void deleteMediaBySalon(String ids, String mediaType) {
		this.salonAdminDao.deleteMediaBySalon(ids, mediaType);
	}
	//设置经典媒介
	public void updateMedia4Excellent(String ids,String isExcellent){
	   this.salonAdminDao.updateMedia4Excellent(ids, isExcellent);
	}

	public boolean existNotPassedMedia(String ids) {
	   int recordCount = this.salonAdminDao.getNoPassMediaCount(ids);
	   if(recordCount > 0){
		   return true;
	   }else{
		   return false;
	   }
	}
	public boolean existNotPassedArticle(String ids) {
		   int recordCount = this.salonAdminDao.getNoPassArticleCount(ids);
		   if(recordCount > 0){
			   return true;
		   }else{
			   return false;
		   }
		}
}
