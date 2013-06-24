package com.dotoyo.buildjob.innovationSalon.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.common.util.StringUtil;
import com.dotoyo.buildjob.innovationSalon.dao.ISalonDao;
import com.dotoyo.buildjob.innovationSalon.dto.CommentDto;
import com.dotoyo.buildjob.innovationSalon.dto.HostUnitDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonAttendDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;
import com.dotoyo.buildjob.innovationSalon.service.ISalonService;
import com.dotoyo.buildjob.sys.service.ISysPointService;
import com.dotoyo.buildjob.systemManage.dto.SysParameterDto;
import com.dotoyo.buildjob.systemManage.service.ISysParameterService;

/**
 * @author Bill xu
 * @dateCreated 2011-01-06
 * @description salon business process
 */
public class SalonServiceImpl implements ISalonService {
	private ISalonDao salonDao;
	private ISysPointService sysPointService;
	private ISysParameterService sysParameterService;
	private IUserService userService;


	public void addSalon(SalonInfoDto salonInfoDto) {
		Long salonId = this.salonDao.saveSalonInfo(salonInfoDto);
		//把沙龙发起人加到参与者队列中
		SalonAttendDto salonAttendDto = new SalonAttendDto();
		salonAttendDto.setSalonId(salonId);
		salonAttendDto.setUserId(salonInfoDto.getCompere());
		salonAttendDto.setJoinDate(new Date());
		this.salonDao.saveSalonAttendInfo(salonAttendDto);
	}

	public void updateSalon(SalonInfoDto salonInfoDto) {
		this.salonDao.updateSalonInfo(salonInfoDto);
	}

	public void deleteSalon(String ids) {
		this.salonDao.deleteSalonInfo(ids);
	}

	public ISalonDao getSalonDao() {
		return salonDao;
	}

	public void setSalonDao(ISalonDao salonDao) {
		this.salonDao = salonDao;
	}

	public ISysPointService getSysPointService() {
		return sysPointService;
	}

	public void setSysPointService(ISysPointService sysPointService) {
		this.sysPointService = sysPointService;
	}

	public ISysParameterService getSysParameterService() {
		return sysParameterService;
	}

	public void setSysParameterService(ISysParameterService sysParameterService) {
		this.sysParameterService = sysParameterService;
	}

	public List<SalonInfoDto> querySalonList(int pageSize, String salonType,
			String isExcellent) {
		return this.salonDao.querySalonList(pageSize, salonType, isExcellent);
	}

	public List<SalonInfoDto> queryOldSalonList(int pageSize) {
		return this.salonDao.queryOldSalonList(pageSize);
	}

	public List<HostUnitDto> queryHostUnitList(int pageSize) {
		return this.salonDao.queryHostUnitList(pageSize);
	}

	public List<SalonArticleDto> querySalonArticleList(int pageSize,
			String isExcellent, String articleStatus) {
		return this.setCommentCount2List(this.salonDao.querySalonArticleList(
				pageSize, isExcellent, articleStatus),
				ApplicationConstant.COMMENT_SUBJECT_TYPE_ARTICLE);
	}

	public List<SalonArticleDto> querySalonArticleListBySalonId(int pageSize,
			Long salonId, String articleStatus) {
		return this.setCommentCount2List(this.salonDao
				.querySalonArticleListBySalonId(pageSize, salonId,
						articleStatus),
				ApplicationConstant.COMMENT_SUBJECT_TYPE_ARTICLE);
	}

	public List<CommentDto> querySalonCommentList(int pageSize, Long subjectId,
			String subjectType, String status) {
		return this.salonDao.querySalonCommentList(pageSize, subjectId,
				subjectType, status);
	}

	public List<CommentDto> querySalonCommentList(PageInfo pageInfo, Long subjectId,
			String subjectType, String status) {
		return this.salonDao.querySalonCommentList(pageInfo, subjectId,
				subjectType, status);
	}

	public List<SalonMediaDto> querySalonMediaList(int pageSize, Long salonId,
			String mediaType, String status) {
		return this.salonDao.querySalonMediaList(pageSize, salonId, mediaType,
				status);
	}

	public List<SalonMediaDto> querySalonMediaListBySalonId(Long salonId,
			String mediaType, String status) {
		return this.salonDao.querySalonMediaListBySalonId(salonId, mediaType,
				status);
	}

	public List<SalonInfoDto> queryHotSalonList(int pageSize, String salonType) {
		return this.salonDao.queryHotSalonList(pageSize, salonType);
	}

	public List<LoginUserInfoDto> queryJoinSalonUserList(int pageSize, Long salonId) {
		return this.salonDao.queryJoinSalonUserList(pageSize, salonId);
	}

	public List<LoginUserInfoDto> querySalonUserListByPage(PageInfo pageInfo,Long salonId) {
		return this.salonDao.querySalonUserListByPage(pageInfo, salonId);
	}

	public SalonInfoDto getSalonInfoById(Long id) {
		return this.salonDao.getSalonInfoById(id);
	}

	/**
	 * 保存评论
	 */
	public void saveCommentInfo(CommentDto commentDto) {
		commentDto.setSubmitDate(new Date());
		commentDto.setStatus(ApplicationConstant.STATUS_PENDING);//所有的评论都需要审核才可以在前台看到
		this.salonDao.saveCommentInfo(commentDto);
		//增加用户积分，审核通过后增加
//		Long point = this.sysPointService.getPointValueByCode(ApplicationConstant.POINT_COMMENT);
//		Long userId = commentDto.getAuthor();
//		this.sysPointService.updateUserPoint(userId, point);
	}

	/**
	 * 保存沙龙图片或者视频
	 */
	public void saveMediaInfo(SalonMediaDto salonMediaDto) {
		String mediaStatus = ApplicationConstant.STATUS_PASSED;
		if(!"1".equals(salonMediaDto.getSalonType())){
			SysParameterDto sysParameterDto;
			//判断上传的图片或者视频是否需要审核，确定初始上传的图片或者视频状态
			if(salonMediaDto.getMediaType().equalsIgnoreCase(ApplicationConstant.MEDIA_TYPE_PICTURE)){//图片
				sysParameterDto = this.sysParameterService.getSysParameterDtoBycode(ApplicationConstant.MEDIA_AUDI_FLAG_PICTURE_CODE);
				if(sysParameterDto!=null && sysParameterDto.getSysValue().equalsIgnoreCase(ApplicationConstant.MEDIA_AUDI_FLAG_NEED)){
					mediaStatus = ApplicationConstant.STATUS_PENDING;
				}
			}else{//视频
				sysParameterDto = this.sysParameterService.getSysParameterDtoBycode(ApplicationConstant.MEDIA_AUDI_FLAG_VIDEO_CODE);
				if(sysParameterDto!=null&&sysParameterDto.getSysValue().equalsIgnoreCase(ApplicationConstant.MEDIA_AUDI_FLAG_NEED)){
					mediaStatus = ApplicationConstant.STATUS_PENDING;
				}
			}
			
					salonMediaDto.setStatus(mediaStatus);
		}
		this.salonDao.saveMediaInfo(salonMediaDto);
		if(salonMediaDto.getMediaType().equalsIgnoreCase(ApplicationConstant.MEDIA_TYPE_PICTURE)){
			//不需要审核的直接加分
			if(mediaStatus.equals(ApplicationConstant.STATUS_PASSED)){
				String mediaTypeCode = ApplicationConstant.POINT_UPLOADING_PICTURE;
				//需增加的积分值
				Long point = this.sysPointService.getPointValueByCode(mediaTypeCode);
				Long userId = salonMediaDto.getAuthor();
				LoginUserInfoDto tmp = userService.getUserById(userId);
				//用户已有积分值
				Long oldPoint = tmp.getPoint();
				//用户能增加的积分值
				Long respoint = StringUtil.newInstance().getAddPoint(oldPoint, point);
				this.sysPointService.updateUserPoint(userId, respoint);
			}
		}else{
			//不需要审核的直接加分
			if(mediaStatus.equals(ApplicationConstant.STATUS_PASSED)){
				String mediaTypeCode = ApplicationConstant.POINT_UPLOADING_VIDEO;
				//需增加的积分值
				Long point = this.sysPointService.getPointValueByCode(mediaTypeCode);
				Long userId = salonMediaDto.getAuthor();
				LoginUserInfoDto tmp = userService.getUserById(userId);
				//用户已有积分值
				Long oldPoint = tmp.getPoint();
				//用户能增加的积分值
				Long respoint = StringUtil.newInstance().getAddPoint(oldPoint, point);
				this.sysPointService.updateUserPoint(userId, respoint);
			}
		}
	}

	/**
	 * 保存沙龙参加信息
	 */
	public void saveSalonAttendInfo(SalonAttendDto salonAttendDto) {
		salonAttendDto.setJoinDate(new Date());
		this.salonDao.saveSalonAttendInfo(salonAttendDto);
	}

	/**
	 * 保存沙龙文章
	 */
	public void saveSalonArticleInfo(SalonArticleDto salonArticleDto) {
		salonArticleDto.setSubmitDate(new Date());
		salonArticleDto.setArticleStatus(ApplicationConstant.STATUS_PENDING);//文章初始状态
		this.salonDao.saveSalonArticleInfo(salonArticleDto);
        //增加用户积分,审核时增加加分
//		Long point = this.sysPointService.getPointValueByCode(ApplicationConstant.POINT_UPLOADING_ARTICLE);
//		Long userId = salonArticleDto.getAuthor();
//		this.sysPointService.updateUserPoint(userId, point);
		String pictureName = salonArticleDto.getPictureName();
		String videoName = salonArticleDto.getVideoName();

		SalonMediaDto salonMediaDto = new SalonMediaDto();

		//把跟文章一起上传的图片和视频保存到Media table
		if ((pictureName != null && !pictureName.equalsIgnoreCase(""))
				|| (videoName != null && !videoName.equalsIgnoreCase(""))) {

			salonMediaDto.setSalonId(salonArticleDto.getSalonId());
			salonMediaDto.setAuthor(salonArticleDto.getAuthor());
			salonMediaDto.setSubmitDate(new Date());
			//与文章一起上传的图片或者视频，其主题为文章的主题
			salonMediaDto.setSubject(salonArticleDto.getSubject());

			if(salonArticleDto.getSalonType().equalsIgnoreCase(ApplicationConstant.SALON_TYPE_ONLINE)){//线上沙龙图片和视频根文章一起审核
			   salonMediaDto.setStatus(ApplicationConstant.STATUS_PENDING);
			}else{//线下沙龙图片和视频需要审核
			   salonMediaDto.setStatus(ApplicationConstant.STATUS_PENDING);
			}
		}
		// set picture to media table
//		if (pictureName != null && !pictureName.equalsIgnoreCase("")) {
//			salonMediaDto.setMediaType(ApplicationConstant.MEDIA_TYPE_PICTURE);
//			salonMediaDto.setMediaName(pictureName);
//			this.salonDao.saveMediaInfo(salonMediaDto);
//		}

		// set video to media table
		if (videoName != null && !videoName.equalsIgnoreCase("")) {
			salonMediaDto.setMediaType(ApplicationConstant.MEDIA_TYPE_VIDEO);
			salonMediaDto.setMediaName(videoName);
			if (pictureName != null && !pictureName.equalsIgnoreCase("")) {
				salonMediaDto.setVideoCoverPic(pictureName);
			}
			this.salonDao.saveMediaInfo(salonMediaDto);
		}

	}

	/**
	 * 更新沙龙访问、好评、差评次数
	 */
	public void updateSalonForCount(Long salonId, Long browseCount,
			Long reputationCount, Long schlussgruppeCount) {
		this.salonDao.updateSalonForCount(salonId, browseCount,
				reputationCount, schlussgruppeCount);
	}

	/**
	 * 获取沙龙参加总人数
	 */
	public Long getSalonAntendCount(Long salonId) {
		return this.salonDao.getSalonAntendCount(salonId);
	}

	/**
	 * 获取文章详情
	 */
	public SalonArticleDto getSalonArticleById(Long id) {
		return this.salonDao.getSalonArticleById(id);
	}
	public SalonArticleDto getSalonArticleByUpId(Long id,Long uid,String salonColumn) {
		return this.salonDao.getSalonArticleByUpId(id,uid,salonColumn);
	}
	public SalonArticleDto getSalonArticleByDownId(Long id,Long uid,String salonColumn) {
		return this.salonDao.getSalonArticleByDownId(id,uid,salonColumn);
	}

	/**
	 * 更新文章访问、好评、差评次数
	 */
	public void updateArticleForCount(Long articleId, Long browseCount,
			Long reputationCount, Long schlussgruppeCount) {
		this.salonDao.updateArticleForCount(articleId, browseCount,
				reputationCount, schlussgruppeCount);
	}

	/**
	 * 获取热门文章
	 */
	public List<SalonArticleDto> queryHotArticleList(int pageSize) {
		return this.salonDao.queryHotArticleList(pageSize);
	}

	/**
	 * 获取作者发表的相关文章
	 */
	public List<SalonArticleDto> queryArticleListByAuthor(int pageSize,
			Long author) {
		return this.salonDao.queryArticleListByAuthor(pageSize, author);
	}

	/**
	 * 获取某文章、沙龙、图片等评论的数量
	 */
	public Long getCommentCount(Long subjectId, String subjectType) {
		return this.salonDao.getCommentCount(subjectId, subjectType);
	}

	/**
	 * set the comment count into List
	 *
	 * @param articleList
	 * @param subjectType
	 * @return
	 */

	private List<SalonArticleDto> setCommentCount2List(
			List<SalonArticleDto> articleList, String subjectType) {
		ArrayList<SalonArticleDto> tempDtoList = new ArrayList<SalonArticleDto>();
		SalonArticleDto tempDto = new SalonArticleDto();
		if (articleList != null && articleList.size() > 0) {
			for (int i = 0; i < articleList.size(); i++) {
				tempDto = articleList.get(i);
				//回应次数
				tempDto.setCommentCount(this.getCommentCount(tempDto.getId(),
						subjectType));
				tempDtoList.add(tempDto);
			}
		}
		return tempDtoList;
	}

	public SalonArticleDto querySalonArticleListByColumn(Long salonId,
			String offlineSalonColumn, String articleStatus) {
		SalonArticleDto returnDto = null;
		List<SalonArticleDto> tempList = this.salonDao.querySalonArticleListByColumn(1, salonId, offlineSalonColumn, articleStatus);
		if(tempList!=null && tempList.size()>0){
			returnDto = tempList.get(0);
		}
		return returnDto;
	}
/**
 * 批量保存上传文件列表
 */
	public void saveMediaInfo(SalonMediaDto salonMediaDto,
			List<SalonMediaDto> uploadFiles) {
		//salonMediaDto.setStatus(ApplicationConstant.STATUS_PASSED);
		salonMediaDto.setSubmitDate(new Date());

		for(SalonMediaDto fileInfoDto:uploadFiles){
			salonMediaDto.setMediaName(fileInfoDto.getMediaName());
			salonMediaDto.setSubject(fileInfoDto.getSubject());
			salonMediaDto.setVideoCoverPic(fileInfoDto.getVideoCoverPic());
			this.saveMediaInfo(salonMediaDto);
		}

		//增加用户积分,通过审核后加分
//		String mediaTypeCode="";
//		if(salonMediaDto.getMediaType().equalsIgnoreCase(ApplicationConstant.MEDIA_TYPE_PICTURE)){
//			mediaTypeCode = ApplicationConstant.POINT_UPLOADING_PICTURE;
//	    }else{
//	    	mediaTypeCode = ApplicationConstant.POINT_UPLOADING_VIDEO;
//	    }
//		Long point = this.sysPointService.getPointValueByCode(mediaTypeCode);
//		Long userId = salonMediaDto.getAuthor();
//		this.sysPointService.updateUserPoint(userId, point);

	}

public HostUnitDto getHostUnitById(Long id) {
	return this.salonDao.getHostUnitById(id);
}
/**
 * 沙龙首页显示的沙龙
 * @param pageSize
 * @param salonType
 * @return
 */
public List<SalonInfoDto> querySalonList4HomePageDisplay(int pageSize,String salonType){
	return this.salonDao.querySalonList4HomePageDisplay(pageSize, salonType);
}
public List<SalonInfoDto> querySalonListByType(int pageSize,String salonType){
	return this.salonDao.querySalonListByType(pageSize, salonType);
}

public List<SalonMediaDto> queryClassMediaList(int pageSize,String mediaType,String isExcellent) {
	return this.salonDao.queryClassMediaList(pageSize,mediaType,isExcellent);
}

public Long getMediaCountBySalon(Long salonId, String mediaType) {
	return this.salonDao.getMediaCountBySalon(salonId, mediaType);
}

public boolean existSalonAttend(Long salonId, Long userId) {
	long attendCount = this.salonDao.getSalonAttendCount(salonId, userId);
    if(attendCount > 0) {
    	return true;
    }else{
    	return false;
    }
}

public IUserService getUserService() {
	return userService;
}

public void setUserService(IUserService userService) {
	this.userService = userService;
}

}
