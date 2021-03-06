package com.dotoyo.buildjob.sys.dao;

import java.util.List;

import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.innovationSalon.dto.HostUnitDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonHomePageDisplayDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.vo.SalonSearchVo;

/**
 * @author Bill xu
 * @dateCreated 2011-02-17
 * @description salon administrator manage  process
 *
 */
public interface ISalonAdminDao {

	/**
	 * 审核沙龙
	 * @param ids
	 * @param autiFlag
	 */
	public void updateSalon4Audi(String ids,String autiFlag);
	/**
	 * 设置经典沙龙
	 * @param ids
	 * @param isExcellent
	 */
	public void updateSalon4Excellent(String ids,String isExcellent);
	/**
	 * 设置经典沙龙文章
	 * @param ids
	 * @param isExcellent
	 */
	public void updateSalonArticle4Excellent(String ids,String isExcellent);

	/**
	 * 审核文章
	 * @param ids
	 * @param status
	 */
	public void updateAudiSalonArticle(String ids,String status);

	/**
	 * 设置文章推荐
	 * @param ids
	 * @param isRecommend
	 */
	public void updateSalonArticle4Recommend(String ids,String isRecommend);
	/**
	 * 设置文章精华
	 * @param ids
	 * @param isCream
	 */
	public void updateSalonArticle4Cream(String ids,String isCream);

	/**
	 * 审核文章
	 * @param ids
	 * @param status
	 */
	public void updateAudiComment(String ids,String status);

	/**
	 * 获取主办单位的信息列表(分页)
	 */
	public List<HostUnitDto> queryHostUnitList(PageInfo pageInfo);
	public void deleteHostUnit(String ids);
	public void modifyHostUnit(HostUnitDto hostUnitDto);
	public void addHostUnit(HostUnitDto hostUnitDto);
	/**
	 * 获取沙龙信息by salon ids
	 * @param ids
	 * @return
	 */
	public List<SalonInfoDto> querySalonListByIds();

	/**
	 * 获取已经设置了的沙龙信息列表
	 * @return
	 */
	public List<SalonInfoDto> querySettedSalonList();

	public void addSettedSalonList(List<Object> settedList);
	public void updateSettedSalonList(List<Object> settedList);
	public void deleteSettedSalon();

	/**
	 * 获取要设置的沙龙信息列表(分页)--沙龙状态是通过的，同时排除已经分配过的
	 */
	public List<SalonInfoDto> searchSalonList4SetHomePage(PageInfo pageInfo,SalonSearchVo salonSearchVo);
	/**
	 * 获取图片或者视频信息for administrator
	 * @param pageInfo
	 * @param salonSearchVo
	 * @return
	 */
	public List<SalonInfoDto> querySalonMediaList4Admin(PageInfo pageInfo,SalonSearchVo salonSearchVo);
	/**
	 * 根据文章ID审核图片或者视频(线上沙龙)
	 * @param ids
	 * @param status
	 */
	public void updateMedia4AudiByArticleId(String ids,String status);
	/**
	 * 删除文章相关视频
	 * @param ids
	 */
	public void deleteMediasByArticleId(String ids);
	/**
	 * 审核图片或者视频
	 * @param ids
	 * @param status
	 */
	public void updateMedia4Audi(String ids,String status);

	/**
	 * 审核图片或者视频 by salon
	 * @param ids
	 * @param status
	 */
	public void audiMediaBySalon(String ids,String mediaType,String status);

	/**
	 * 删除图片或者视频 by salon
	 * @param ids
	 * @param mediaType
	 */
	public void deleteMediaBySalon(String ids,String mediaType);

	public void updateMedia4Excellent(String ids,String isExcellent);
	public int getNoPassMediaCount(String ids);
	//判断所选的ids里面，是否有没有通过审核的
	public int getNoPassArticleCount(String ids);
}
