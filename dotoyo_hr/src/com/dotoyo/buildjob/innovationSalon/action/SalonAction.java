package com.dotoyo.buildjob.innovationSalon.action;

import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.BlogUserInfoDto;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.user.service.IUserService;
import com.dotoyo.buildjob.common.util.CacheManager;
import com.dotoyo.buildjob.common.util.DateUtil;
import com.dotoyo.buildjob.common.util.EssentialDataUtil;
import com.dotoyo.buildjob.common.util.FileUtil;
import com.dotoyo.buildjob.common.util.Md5;
import com.dotoyo.buildjob.common.util.PropertiesValue;
import com.dotoyo.buildjob.common.util.StringUtil;
import com.dotoyo.buildjob.common.util.UploadFileProcessUtil;
import com.dotoyo.buildjob.innovationSalon.dto.CommentDto;
import com.dotoyo.buildjob.innovationSalon.dto.HostUnitDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonAttendDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;
import com.dotoyo.buildjob.innovationSalon.service.ISalonService;
import com.dotoyo.buildjob.sys.dto.SysAdDto;
import com.dotoyo.buildjob.sys.service.ISalonAdminService;
import com.dotoyo.buildjob.sys.service.ISysAdService;
import com.dotoyo.buildjob.sys.service.ISysFilterWordService;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 *
 * @author Bill Xu
 * @dateCreated 2011-01-10
 * @description
 */

public class SalonAction extends BuildJobAction implements SessionAware {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private ISalonService salonService;
	private ISalonAdminService salonAdminService;

	private IUserService userService;
	private ISysFilterWordService sysFilterWordService;
	private ISysAdService sysAdService;

	private SalonInfoDto firstOnlineSalonInfoDto;
	private SalonInfoDto firstOfflineSalonInfoDto;
	private SalonInfoDto firstOldSalonInfoDto;
	private List<SalonInfoDto> onlineSalonList;// 线上沙龙
	private List<SalonInfoDto> offlineSalonList;// 线下沙龙
	private List<SalonInfoDto> classicSalonList;// 经典沙龙
	private List<SalonInfoDto> oldSalonList;// 往届沙龙

	private List<HostUnitDto> hostUnitList;// 主办单位
	private List<SalonArticleDto> salonClassicArticleList;// 沙龙经典文章

	private List<ClassMasterDto> searchTitleList;// search title
	private List<ClassMasterDto> searchContentList; // search content

	// add salon

	private SalonInfoDto salonInfoDto;
	private CommentDto commentDto;
	private LoginUserInfoDto userInfo;
	private BlogUserInfoDto blogUserInfoDto;
	private Map<String, Object> session = null;
	private String strStartDate;
	private String strEndDate;
	private File uploadPicFile;// 图片
	private String uploadPicFileFileName;
	private File uploadVideoFile;// 视频
	private String uploadVideoFileFileName;
	private File uploadFacePicFile;// 头像图片
	private String uploadFacePicFileFileName;

	// detail salon
	private List<LoginUserInfoDto> userInforList; // user information list
	private List<SalonMediaDto> salonPictureList; // salon picture information
													// list
	private List<SalonMediaDto> salonVideoList; // salon video information list
	private List<SalonArticleDto> salonArticleList; // salon article information
													// list
	private List<CommentDto> salonCommentList; // salon comment information list
	private List<SalonInfoDto> hotSalonList; // hot salon information list

	// offline salon detail

	private SalonArticleDto salonArticle1001Dto;
	private SalonArticleDto salonArticle1002Dto;
	private SalonArticleDto salonArticle1003Dto;
	private SalonArticleDto salonArticle1004Dto;
	private SalonArticleDto salonArticle1005Dto;
	private SalonArticleDto salonArticle1006Dto;

	private SalonMediaDto firstVideoDto;

	// get article detail information
	private SalonArticleDto salonArticleDto;
	private SalonArticleDto salonArticleDtoUp;

	private SalonArticleDto salonArticleDtoDown;
	private List<SalonArticleDto> hotArticleList; // hot article information
													// list
	private List<SalonArticleDto> articleForUserList; // article information
	private SysAdDto salonAdDto;
	private List<SysAdDto> salonAdList;

	private String fileServerURL;

	private PageInfo pageInfo;
	private String uploadFilePath;
	private String blogWebUrl;
	private String remindMsg;
	private String actionToDoFlag = "0"; //控制某动作是否可以操作(页面的按钮是否显示出来) 0--是不限制，1-是限制
	private String goFrom = "0"; //控制进入方法的入口
	private String islogin="0";



	public ISalonService getSalonService() {
		return salonService;
	}

	public String initIndex() {
		//
		oldSalonList = salonService.queryOldSalonList(ApplicationConstant.SALON_HOME_OLD_SIZE);
		if(oldSalonList!=null && oldSalonList.size()>0){
		   firstOldSalonInfoDto = oldSalonList.get(0);
		   oldSalonList.remove(0);
		}
		this.uploadFilePath = PropertiesValue
		.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		//HtmlGeneration.getInstance().refreshSalonOldPage();
		return "success";
	}

	public String init() {
		// get search list
		this.searchTitleList = EssentialDataUtil
				.queryEssentialDataListByParentCode(ApplicationConstant.SALON_SEARCH_TITLE);
		this.uploadFilePath = PropertiesValue
				.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);

		return "success";
	}
	/**
	 * 经典文章
	 */
	public void loadSalonClassicArticle(){
		// get classic article list
		this.salonClassicArticleList = transSalonClassicArticleList(this.salonService
				.querySalonArticleList(
						ApplicationConstant.SALON_HOME_CLASSIC_ARTICLE_SIZE,
						ApplicationConstant.ARTICLE_IS_EXCELLENT_YES,
						ApplicationConstant.STATUS_PASSED));
		this.uploadFilePath = PropertiesValue
		.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
	}
	/**
	 * 经典沙龙
	 */
	public void loadSalonClassic(){
		// classic salon list
		this.classicSalonList = this.salonService.querySalonList(
				ApplicationConstant.SALON_HOME_CLASSIC_SIZE, null,
				ApplicationConstant.SALON_IS_EXCELLENT_YES);
		this.uploadFilePath = PropertiesValue
		.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);

	}
	/**
	 * 主办单位
	 */
	public void loadSalonHostUnit(){
		// get host unit list
		this.hostUnitList = this.salonService
				.queryHostUnitList(ApplicationConstant.SALON_HOME_HOST_UNIT_SIZE);
		for(HostUnitDto hostUnitDto :this.hostUnitList ){
			if(hostUnitDto.getIntroduction()!=null &&hostUnitDto.getIntroduction().length()>80 ){
				hostUnitDto.setIntroduction(hostUnitDto.getIntroduction().substring(0, 80)+"...");
			}
		}
		this.uploadFilePath = PropertiesValue
		.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
	}
	/**
	 * 线下沙龙
	 */
	public void loadSalonOffLine(){
		// off line salon list
		this.offlineSalonList = salonService.querySalonList4HomePageDisplay(
				ApplicationConstant.SALON_HOME_OFFLINE_SIZE,
				ApplicationConstant.SALON_TYPE_OFFLINE);
		int offlineSalonListSize = this.offlineSalonList.size();
		if(offlineSalonListSize<9){
			List<SalonInfoDto> tempList=salonService.querySalonListByType(ApplicationConstant.SALON_HOME_OFFLINE_SIZE,ApplicationConstant.SALON_TYPE_OFFLINE);
			int index=0;
			for(int i=offlineSalonListSize;i<9;i++){
				if(index==tempList.size()) break;
				this.offlineSalonList.add(tempList.get(index));
				index++;
			}
			if (this.offlineSalonList != null && this.offlineSalonList.size() > 0) {
				firstOfflineSalonInfoDto = this.offlineSalonList.get(0);
				// get attend member count
				firstOfflineSalonInfoDto
						.setSalonAttendCount(this.salonService
								.getSalonAntendCount(this.firstOfflineSalonInfoDto
										.getId()));
				this.offlineSalonList.remove(0);
			}
		}else{
			firstOfflineSalonInfoDto = this.offlineSalonList.get(0);
			// get attend member count
			firstOfflineSalonInfoDto
					.setSalonAttendCount(this.salonService
							.getSalonAntendCount(this.firstOfflineSalonInfoDto
									.getId()));
			this.offlineSalonList.remove(0);
		}
		this.uploadFilePath = PropertiesValue
		.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
	}
	/**
	 * 线上沙龙
	 */
	public void loadSalonOnline(){
		// online salon list
		this.onlineSalonList = salonService.querySalonList4HomePageDisplay(
				ApplicationConstant.SALON_HOME_ONLINE_SIZE,
				ApplicationConstant.SALON_TYPE_ONLINE);
		int onlineSalonListSize = this.onlineSalonList.size();
		if(onlineSalonListSize<9){
			List<SalonInfoDto> tempList=salonService.querySalonListByType(ApplicationConstant.SALON_HOME_OFFLINE_SIZE,ApplicationConstant.SALON_TYPE_ONLINE);
			int index=0;
			for(int i=onlineSalonListSize;i<9;i++){
				if(index==tempList.size()) break;
				this.onlineSalonList.add(tempList.get(index));
				index++;
			}
			if (this.onlineSalonList != null && this.onlineSalonList.size() > 0) {
				firstOnlineSalonInfoDto = this.onlineSalonList.get(0);
				// get attend member count
				firstOnlineSalonInfoDto
						.setSalonAttendCount(this.salonService
								.getSalonAntendCount(this.firstOnlineSalonInfoDto
										.getId()));
				this.onlineSalonList.remove(0);
			}
		}else{
			firstOnlineSalonInfoDto = this.onlineSalonList.get(0);
			// get attend member count
			firstOnlineSalonInfoDto
					.setSalonAttendCount(this.salonService
							.getSalonAntendCount(this.firstOnlineSalonInfoDto
									.getId()));
			this.onlineSalonList.remove(0);
		}
		
		
		
		this.uploadFilePath = PropertiesValue
		.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
	}
	/**
	 * 页面广告加载
	 */
	public void loadSalonAd(){
		SysAdDto sysad = new SysAdDto();
		sysad.setPosition(ApplicationConstant.SERVICE_ADVERT_SALON_001);
		sysad.setType(ApplicationConstant.AD_TYPE_IMAGE_AND_FLASH);
		sysad.setCurrentDate(new Date());
		sysad.setLimitNumber(5);
		List<SysAdDto> list= sysAdService.queryAdForList(sysad);
		int listsize=list==null?0:list.size();

		for(int i=0;i<5;i++){
			if(i>=listsize){
				SysAdDto ad = new SysAdDto();
				ad.setImgName(ApplicationConstant.DOTOYO_DEFAULT_IMG008);
				ad.setTitle(ApplicationConstant.DOTOYO_DEFAULT_TITLE);
				ad.setUrl(ApplicationConstant.DOTOYO_DEFAULT_URL);
				ad.setStartDate(new Date());
				ad.setEndDate(new Date());
				list.add(ad);
			}else{
				replaceImg(list.get(i),ApplicationConstant.DOTOYO_DEFAULT_IMG008);
			}
		}
		if(null!=list&&list.size()>0){
			setSalonAdDto(list.get(0));
		}
		
		setSalonAdList(list);
		setFileServerURL((String) CacheManager.getInstanceMemcachedClient().get("fileServerURL"));
	}
	private String dateFormatStr="yyyy-MM-dd HH:mm:ss";
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

	public String toLaunchSalonPage() {
		return "launchSalon";
	}
	private String msg = "";
	// add salon
	public String addSalon() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		//检查文件标题和内容是否含有过滤词
		String word = null;
		if((word = StringUtil.isExistsFilterWords(salonInfoDto.getSubject())) != null){
			this.addActionError("标题中含有敏感词, " + word);
			return this.toLaunchSalonPage();
		}
		if((word = StringUtil.isExistsFilterWords(salonInfoDto.getContent())) != null){
			this.addActionError("内容中含有敏感词, " + word);
			return this.toLaunchSalonPage();
		}
		if(!this.checkUploadFileSize(this.uploadPicFile, null, 'p')){
			msg = "文件超过限制大小["+Double.parseDouble(PropertiesValue.getPropertyValueByKey(ApplicationConstant.UPLOADFILE_IMG_SIZE))+"M]";
			 return this.toLaunchSalonPage();
		}
		String newPicFileName = UploadFileProcessUtil.uploadFile(
				this.uploadPicFile, this.uploadPicFileFileName);
		this.salonInfoDto.setStartDate(DateUtil.parseToDate(strStartDate));
		this.salonInfoDto.setEndDate(DateUtil.parseToDate(strEndDate));
		this.salonInfoDto.setCompere(userId); // login user id
		this.salonInfoDto.setSubjectPic(newPicFileName);
		this.salonService.addSalon(salonInfoDto);

		return "addSalon";
	}

	// get online salon detail information

	@SuppressWarnings("unchecked")
	public String toSalonDetail() {
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<String> actionMessageList = (List<String>) session
				.getAttribute("actionMessageList");
		if (actionMessageList != null) {
			for (String actionMessage : actionMessageList) {
				this.addActionMessage(actionMessage);
			}
			session.removeAttribute("actionMessageList");
		}

		// get join user list
		this.userInforList = this.salonService.queryJoinSalonUserList(
				ApplicationConstant.SALON_ONLINE_JION_USER_SIZE,
				this.salonInfoDto.getId());
		// get picture list
		this.salonPictureList = this.salonService.querySalonMediaList(
				ApplicationConstant.SALON_DETAIL_PICTURE_SIZE,
				this.salonInfoDto.getId(),
				ApplicationConstant.MEDIA_TYPE_PICTURE,
				ApplicationConstant.STATUS_PASSED);
		// get video list
		this.salonVideoList = this.salonService.querySalonMediaList(
				ApplicationConstant.SALON_DETAIL_VIDEO_SIZE,
				this.salonInfoDto.getId(),
				ApplicationConstant.MEDIA_TYPE_VIDEO,
				ApplicationConstant.STATUS_PASSED);
		// get article list
		this.salonArticleList = this.salonService
				.querySalonArticleListBySalonId(
						ApplicationConstant.SALON_DETAIL_ARTICLE_SIZE,
						this.salonInfoDto.getId(),
						ApplicationConstant.STATUS_PASSED);
		/**过滤线上沙龙图片和视频显示，文章未审核的不显示**/
//		if(salonPictureList != null){
//			for(int i = 0;i < salonPictureList.size();i++){
//				salonPictureList.get(i).setStatus("0");
//			}
//		}
//		if(salonVideoList != null){
//			for(int i = 0;i < salonVideoList.size();i++){
//				salonVideoList.get(i).setStatus("0");
//			}
//		}
//		for(SalonArticleDto article : salonArticleList){
//			String pictureName = article.getPictureName();
//			String videoName = article.getVideoName();
//			if(!StringUtil.newInstance().sNull(pictureName).equals("") && salonPictureList != null){
//				for(int i = 0;i < salonPictureList.size();i++){
//					SalonMediaDto picture = salonPictureList.get(i);
//					if(pictureName.equals(picture.getMediaName())){
//						salonPictureList.get(i).setStatus(article.getArticleStatus());
//					}
//				}
//			}
//			if(!StringUtil.newInstance().sNull(videoName).equals("") && salonVideoList != null){
//				for(int i = 0 ;i < salonVideoList.size();i++){
//					SalonMediaDto video = salonVideoList.get(i);
//					if(videoName.equals(video.getMediaName())){
//						salonVideoList.get(i).setStatus(article.getArticleStatus());
//					}
//				}
//			}
//		}
		// get hot salon list
		this.hotSalonList = this.salonService.queryHotSalonList(
				ApplicationConstant.SALON_HOT_SIZE,
				ApplicationConstant.SALON_TYPE_ONLINE);
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo
				.setPageSize(ApplicationConstant.SALON_DETAIL_COMMENT_SIZE);
		// pageInfo.setCurrentPageNum(currentPageNum);
		this.salonCommentList = this.salonService.querySalonCommentList(
				this.pageInfo, this.salonInfoDto.getId(),
				ApplicationConstant.COMMENT_SUBJECT_TYPE_SALON,
				ApplicationConstant.STATUS_PASSED);

		// get salon detail information
		this.salonInfoDto = this.salonService
				.getSalonInfoById(this.salonInfoDto.getId());
		if(ApplicationConstant.DATE_COMPARISON_STATUS_BEFORE.equals(DateUtil.dateComparison(this.salonInfoDto.getEndDate(),new Date()))){
			this.salonInfoDto.setIsExpired("1");
		}
		// get attend member count
		this.salonInfoDto.setSalonAttendCount(this.salonService
				.getSalonAntendCount(this.salonInfoDto.getId()));
		// update browse count for this salon
		this.salonService.updateSalonForCount(this.salonInfoDto.getId(), 1L,
				0L, 0L);
		this.uploadFilePath = PropertiesValue
				.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		//控制操作动作
		Date salonEndDate = this.salonInfoDto.getEndDate();
		if(DateUtil.dateComparison(salonEndDate,new Date()).equalsIgnoreCase("before")){
			this.actionToDoFlag = "1";
		}else{
			this.actionToDoFlag = "0";
		}
		//获取博站的URL
		this.blogWebUrl = PropertiesValue.getPropertyValueByKey(ApplicationConstant.BLOG_WEB_URL);
		//如果是从提交评论后转过来，则需要提示信息
		if(this.goFrom.equalsIgnoreCase("1")){
			this.addActionMessage(ApplicationConstant.SUBMIT_COMMENT_MSG);
		}
		return "salonDetailPage";
	}

	// add salon comment information
	public String addSalonComment() {
		List<String> actionMessageList = new ArrayList<String>();
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		if (this.loginAndSubmit()) {
			super.getLoginUserInfo();
			Long userId = this.loginUserInfoDto.getId();// get from login user
			if (this.salonService.existSalonAttend(this.salonInfoDto.getId(),
					userId)) {// 只有参加了沙龙的用户才可以发表评论
				if (this.sysFilterWordService.isExistsWords(this.commentDto
						.getContent().trim())) {// 存在敏感词汇
					goFrom = "0";
					this.addActionMessage(ApplicationConstant.KEY_WORD_MSG);
					actionMessageList.add(ApplicationConstant.KEY_WORD_MSG);
				} else {
					this.commentDto.setAuthor(userId); // login user id
					this.commentDto.setSubjectId(this.salonInfoDto.getId());
					this.commentDto
							.setSubjectType(ApplicationConstant.COMMENT_SUBJECT_TYPE_SALON);
					this.salonService.saveCommentInfo(this.commentDto);
					this.commentDto = null;
					goFrom = "0";
					this.addActionMessage(ApplicationConstant.SUBMIT_COMMENT_MSG);
					actionMessageList.add(ApplicationConstant.SUBMIT_COMMENT_MSG);
				}
			} else {
				goFrom = "0";
				this.addActionMessage(ApplicationConstant.SALON_NOT_ATTEND_ADD_COMMENT_MSG);
				actionMessageList.add(ApplicationConstant.SALON_NOT_ATTEND_ADD_COMMENT_MSG);
			}
		}
		session.setAttribute("actionMessageList", actionMessageList);
		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_ONLINE)) {
			return "salonOnlineComment";
			//return toSalonDetail();
		} else {
			return "salonOfflineComment";
			//return toOffLineSalonDetail();
		}
	}

	// add article comment information
	public String addArticleComment() {
		List<String> actionMessageList = new ArrayList<String>();
		HttpSession session = ServletActionContext.getRequest().getSession();
		boolean inlogin =  this.loginAndSubmit();
		if (inlogin&&!"1".equals(this.islogin)) {
			super.getLoginUserInfo();
			Long userId = this.loginUserInfoDto.getId();// get from login user
			if (this.salonService.existSalonAttend(this.salonArticleDto.getSalonId(),
					userId)) {
				if (this.sysFilterWordService.isExistsWords(this.commentDto
						.getContent().trim())) {// 存在敏感词汇
					this.addActionMessage(ApplicationConstant.KEY_WORD_MSG);
					actionMessageList.add(ApplicationConstant.KEY_WORD_MSG);
				}else{
				this.commentDto.setAuthor(userId); // login user id
				this.commentDto.setSubjectId(this.salonArticleDto.getId());
				this.commentDto.setSubjectType(ApplicationConstant.COMMENT_SUBJECT_TYPE_ARTICLE);
				this.salonService.saveCommentInfo(this.commentDto);
				this.commentDto = null;
				this.addActionMessage(ApplicationConstant.SUBMIT_COMMENT_MSG);
				actionMessageList.add(ApplicationConstant.SUBMIT_COMMENT_MSG);
				}
			}else {
				goFrom = "0";
				this.addActionMessage(ApplicationConstant.SALON_NOT_ATTEND_ADD_COMMENT_MSG);
				actionMessageList.add(ApplicationConstant.SALON_NOT_ATTEND_ADD_COMMENT_MSG);
			}
		}else if (inlogin&&"1".equals(this.islogin)) {
			this.islogin="0";
			this.addActionMessage(ApplicationConstant.SALON_IS_LOGIN_MSG);
			actionMessageList.add(ApplicationConstant.SALON_IS_LOGIN_MSG);
		}
		session.setAttribute("actionMessageList", actionMessageList);
		return "redirectToArticleDetail";
	}
	// join salon information
	public String addSalonAttend() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
        if(this.loginUserInfoDto.getUserType()==null||this.loginUserInfoDto.getUserType().equalsIgnoreCase("")){//用户信息不完成，需要到博站完善信息
        	return this.gotoBolgWeb();
        }
		SalonAttendDto salonAttendDto = new SalonAttendDto();
		salonAttendDto.setUserId(userId); // login user id
		salonAttendDto.setSalonId(this.salonInfoDto.getId());

		if (this.salonService.existSalonAttend(this.salonInfoDto.getId(),
				userId)) {
			this.goFrom=  "0";
			this.addActionMessage(ApplicationConstant.SALON_ATTEND_EXIST_MSG);
		} else {
			this.goFrom=  "0";
			this.salonService.saveSalonAttendInfo(salonAttendDto);
			//刷新沙龙信息
			if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
					ApplicationConstant.SALON_TYPE_ONLINE)) {
				HtmlGeneration.getInstance().refreshSalonOnlinePage(null);
			} else {
				HtmlGeneration.getInstance().refreshSalonOfflinePage(null);
			}
		}
		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_ONLINE)) {
			return this.toSalonDetail();
		} else {
			return this.toOffLineSalonDetail();
		}
	}

	// 沙龙好评或者差评
	public String updateSalonAssessCount() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		this.salonService.updateSalonForCount(this.salonInfoDto.getId(), 0L,
				this.salonInfoDto.getReputationCount(),
				this.salonInfoDto.getSchlussgruppeCount());
		this.goFrom = "0";
		//** 检查是否已参加 **//
		/*
		if (!this.salonService.existSalonAttend(this.salonInfoDto.getId(),
				userId)) {
			this.addActionMessage(ApplicationConstant.SALON_NOT_ATTEND_ADD_COMMENT_MSG);
			if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
					ApplicationConstant.SALON_TYPE_ONLINE)) {
				return "salonDetailPage";
			}else{
				return "salonofflineDetailPage";
			}

		}*/
		/**评论提交**/
		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_ONLINE)) {
			return "redirectToSalonDetail";
		} else {
			return "redirectToOffLineSalonDetail";
		}
	}

	// 获取文章的详情信息

	public String toArticleDetail() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<String> actionMessageList = (List<String>) session
				.getAttribute("actionMessageList");
		if (actionMessageList != null) {
			for (String actionMessage : actionMessageList) {
				this.addActionMessage(actionMessage);
			}
			session.removeAttribute("actionMessageList");
		}
		this.salonArticleDto = this.salonService
				.getSalonArticleById(this.salonArticleDto.getId());
		
		this.salonArticleDtoUp=this.salonService
		.getSalonArticleByUpId(this.salonArticleDto.getId(),this.salonArticleDto.getSalonId(),salonArticleDto.getOfflineSalonColumn());
		this.salonArticleDtoDown=this.salonService
		.getSalonArticleByDownId(this.salonArticleDto.getId(),this.salonArticleDto.getSalonId(),salonArticleDto.getOfflineSalonColumn());
		// get salon article comment list

		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo
				.setPageSize(ApplicationConstant.SALON_DETAIL_COMMENT_SIZE);
		// pageInfo.setCurrentPageNum(currentPageNum);
		this.salonCommentList = this.salonService.querySalonCommentList(
				this.pageInfo, this.salonArticleDto.getId(),
				ApplicationConstant.COMMENT_SUBJECT_TYPE_ARTICLE,
				ApplicationConstant.STATUS_PASSED);
		// this.salonCommentList =
		// this.salonService.querySalonCommentList(ApplicationConstant.SALON_DETAIL_COMMENT_SIZE,
		// this.salonArticleDto.getId(),
		// ApplicationConstant.COMMENT_SUBJECT_TYPE_ARTICLE,
		// ApplicationConstant.STATUS_PASSED);
		// get hot article information list
		this.hotArticleList = this.salonService
				.queryHotArticleList(ApplicationConstant.ARTICLE_HOT_SIZE);
		// get article information list by user
		this.articleForUserList = new ArrayList<SalonArticleDto>();
		List<SalonArticleDto> tmplist = this.salonService.queryArticleListByAuthor(
				ApplicationConstant.ARTICLE_AUTHOR_SIZE,
				salonArticleDto.getAuthor());
		//过滤未通过的
		for(SalonArticleDto dto : tmplist){
			if(ApplicationConstant.STATUS_PASSED.equals(dto.getArticleStatus())){
				articleForUserList.add(dto);
			}
		}
		// update article browse count
		this.salonService.updateArticleForCount(this.salonArticleDto.getId(),
				1L, 0L, 0L);
		this.uploadFilePath = PropertiesValue
				.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		return "articleDetail";
	}

	// 文章好评或者差评
	public String updateAirtcleAssessCount() {
		this.salonService.updateArticleForCount(this.salonArticleDto.getId(),
				0L, this.salonArticleDto.getReputationCount(),
				this.salonArticleDto.getSchlussgruppeCount());
		this.goFrom = "0";
		return "redirectToArticleDetail";
	}

	// 线上沙龙内容上传页面
	public String toSalonOnlineUploadPage() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		if (!this.salonService.existSalonAttend(this.salonInfoDto.getId(),userId)){
    		this.addActionError(ApplicationConstant.SALON_NOT_ATTEND_UPLOAD_ARTICLE_MSG);
    		return this.toSalonDetail();
    	}
		return "salonOnlineUploadPage";
	}

	// 线下沙龙内容上传页面
	public String toSalonOfflineUploadPage() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		if (!this.salonService.existSalonAttend(this.salonInfoDto.getId(),userId)){
    		this.addActionError(ApplicationConstant.SALON_NOT_ATTEND_UPLOAD_ARTICLE_MSG);
    		return this.toOffLineSalonDetail();
    	}
		
		this.searchTitleList = EssentialDataUtil
				.queryEssentialDataListByParentCode(ApplicationConstant.SALON_OFFLINE_COLUMN);
		return "salonOfflineUploadPage";
	}

	// add salon article information
	public String addSalonArticle() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		//检查文件标题和内容是否含有过滤词
		String word = null;
		if((word = StringUtil.isExistsFilterWords(salonArticleDto.getSubject())) != null){
			this.addActionError("标题中含有敏感词, " + word);
    		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
					ApplicationConstant.SALON_TYPE_OFFLINE)) {
				return this.toSalonOfflineUploadPage();
			}else{
				return this.toSalonOnlineUploadPage();
			}
		}
		if((word = StringUtil.isExistsFilterWords(salonArticleDto.getContent())) != null){
			this.addActionError("内容中含有敏感词, " + word);
    		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
					ApplicationConstant.SALON_TYPE_OFFLINE)) {
				return this.toSalonOfflineUploadPage();
			}else{
				return this.toSalonOnlineUploadPage();
			}
		}
		if((word = StringUtil.isExistsFilterWords(salonArticleDto.getArticleBelongTo())) != null){
			this.addActionError("作者中含有敏感词, " + word);
    		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
					ApplicationConstant.SALON_TYPE_OFFLINE)) {
				return this.toSalonOfflineUploadPage();
			}else{
				return this.toSalonOnlineUploadPage();
			}
		}
		//检查不是沙龙的参与者，不能上传文章
		if (!this.salonService.existSalonAttend(this.salonInfoDto.getId(),userId)){
    		this.addActionError(ApplicationConstant.SALON_NOT_ATTEND_UPLOAD_ARTICLE_MSG);
    		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
					ApplicationConstant.SALON_TYPE_OFFLINE)) {
				return this.toSalonOfflineUploadPage();
			}else{
				return this.toSalonOnlineUploadPage();
			}
    	}


		//检查上传文件的合法性(大小)
		if(!this.checkUploadFileSize(this.uploadPicFile, null, 'p')||!this.checkUploadFileSize(this.uploadVideoFile, null, 'v')||!this.checkUploadFileSize(this.uploadFacePicFile, null, 'p')){
			if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
					ApplicationConstant.SALON_TYPE_OFFLINE)) {
				return this.toSalonOfflineUploadPage();
			}else{
				return this.toSalonOnlineUploadPage();
			}
		}
		if(this.uploadVideoFile!=null&&this.uploadPicFile!=null){
				String newPicFileName = UploadFileProcessUtil.uploadFile(
						this.uploadPicFile, this.uploadPicFileFileName);
				String newVideoFileName = UploadFileProcessUtil.uploadFile(
						this.uploadVideoFile, this.uploadVideoFileFileName);
				this.salonArticleDto.setPictureName(newPicFileName);
				this.salonArticleDto.setVideoName(newVideoFileName);
		}else{
			if((this.uploadVideoFile==null&&this.uploadPicFile!=null)||(this.uploadVideoFile!=null&&this.uploadPicFile==null)){
				this.addActionError("视频和封面图片必须一起上传！");
				if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
						ApplicationConstant.SALON_TYPE_OFFLINE)) {
					return this.toSalonOfflineUploadPage();
				}else{
					return this.toSalonOnlineUploadPage();
				}
			}
		}

		this.salonArticleDto.setSalonId(this.salonInfoDto.getId());
		this.salonArticleDto.setAuthor(userId);// login user id
		this.salonArticleDto.setAuthorName(this.salonArticleDto.getArticleBelongTo());

		this.salonArticleDto.setSalonType(this.salonInfoDto.getSalonType());

		if (this.uploadFacePicFile != null) {
			String newFacePicFile = UploadFileProcessUtil.uploadFile(
					this.uploadFacePicFile, this.uploadFacePicFileFileName);
			this.salonArticleDto.setFacePicName(newFacePicFile);
		}

		this.salonService.saveSalonArticleInfo(this.salonArticleDto);

		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_OFFLINE)) {
			return "redirectToOffLineSalonDetail";
		} else {
			return "redirectToSalonDetail";
		}
	}

	// get off line salon detail information

	@SuppressWarnings("unchecked")
	public String toOffLineSalonDetail() {
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<String> actionMessageList = (List<String>) session
				.getAttribute("actionMessageList");
		if (actionMessageList != null) {
			for (String actionMessage : actionMessageList) {
				this.addActionMessage(actionMessage);
			}
			session.removeAttribute("actionMessageList");
		}
		
		// get join user list
		this.userInforList = this.salonService.queryJoinSalonUserList(
				ApplicationConstant.SALON_OFFLINE_JION_USER_SIZE,
				this.salonInfoDto.getId());
		// 获取嘉宾致辞等文章
		this.salonArticle1001Dto = this.salonService
				.querySalonArticleListByColumn(this.salonInfoDto.getId(),
						ApplicationConstant.SALON_OFFLINE_COLUMN_1001,
						ApplicationConstant.STATUS_PASSED);
		this.salonArticle1002Dto = this.salonService
				.querySalonArticleListByColumn(this.salonInfoDto.getId(),
						ApplicationConstant.SALON_OFFLINE_COLUMN_1002,
						ApplicationConstant.STATUS_PASSED);
		this.salonArticle1003Dto = this.salonService
				.querySalonArticleListByColumn(this.salonInfoDto.getId(),
						ApplicationConstant.SALON_OFFLINE_COLUMN_1003,
						ApplicationConstant.STATUS_PASSED);
		this.salonArticle1004Dto = this.salonService
				.querySalonArticleListByColumn(this.salonInfoDto.getId(),
						ApplicationConstant.SALON_OFFLINE_COLUMN_1004,
						ApplicationConstant.STATUS_PASSED);
		this.salonArticle1005Dto = this.salonService
				.querySalonArticleListByColumn(this.salonInfoDto.getId(),
						ApplicationConstant.SALON_OFFLINE_COLUMN_1005,
						ApplicationConstant.STATUS_PASSED);
		this.salonArticle1006Dto = this.salonService
				.querySalonArticleListByColumn(this.salonInfoDto.getId(),
						ApplicationConstant.SALON_OFFLINE_COLUMN_1006,
						ApplicationConstant.STATUS_PASSED);
		int ii=1;
		if(this.salonArticle1001Dto!=null){
			this.salonArticle1001Dto.setStyleClass("line-dl"+ii);
			ii++;
		}
		if(this.salonArticle1002Dto!=null){
			if(ii==1){
				this.salonArticle1002Dto.setStyleClass("line-dl1");
				ii++;
			}else{
				this.salonArticle1002Dto.setStyleClass("line-dl2");
				ii--;
			}
		}
		if(this.salonArticle1003Dto!=null){
			if(ii==1){
				this.salonArticle1003Dto.setStyleClass("line-dl1");
				ii++;
			}else{
				this.salonArticle1003Dto.setStyleClass("line-dl2");
				ii--;
			}
		}
		if(this.salonArticle1004Dto!=null){
			if(ii==1){
				this.salonArticle1004Dto.setStyleClass("line-dl1");
				ii++;
			}else{
				this.salonArticle1004Dto.setStyleClass("line-dl2");
				ii--;
			}
		}
		if(this.salonArticle1005Dto!=null){
			if(ii==1){
				this.salonArticle1005Dto.setStyleClass("line-dl1");
				ii++;
			}else{
				this.salonArticle1005Dto.setStyleClass("line-dl2");
				ii--;
			}
		}
		if(this.salonArticle1006Dto!=null){
			if(ii==1){
				this.salonArticle1006Dto.setStyleClass("line-dl1");
				ii++;
			}else{
				this.salonArticle1006Dto.setStyleClass("line-dl2");
				ii--;
			}
		}

		// get picture list
		this.salonPictureList = this.salonService.querySalonMediaList(6,
				this.salonInfoDto.getId(),
				ApplicationConstant.MEDIA_TYPE_PICTURE,
				ApplicationConstant.STATUS_PASSED);

		// get video list
		this.salonVideoList = this.salonService.querySalonMediaList(5,
				this.salonInfoDto.getId(),
				ApplicationConstant.MEDIA_TYPE_VIDEO,
				ApplicationConstant.STATUS_PASSED);
		if (this.salonVideoList != null && this.salonVideoList.size() > 0) {
			this.firstVideoDto = this.salonVideoList.get(0);
			this.salonVideoList.remove(0);
		}

		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo
				.setPageSize(ApplicationConstant.SALON_DETAIL_COMMENT_SIZE);
		// pageInfo.setCurrentPageNum(currentPageNum);
		this.salonCommentList = this.salonService.querySalonCommentList(
				this.pageInfo, this.salonInfoDto.getId(),
				ApplicationConstant.COMMENT_SUBJECT_TYPE_SALON,
				ApplicationConstant.STATUS_PASSED);
		// get salon detail information
		this.salonInfoDto = this.salonService
				.getSalonInfoById(this.salonInfoDto.getId());
		// get attend member count
		this.salonInfoDto.setSalonAttendCount(this.salonService
				.getSalonAntendCount(this.salonInfoDto.getId()));
		if(ApplicationConstant.DATE_COMPARISON_STATUS_BEFORE.equals(DateUtil.dateComparison(this.salonInfoDto.getEndDate(),new Date()))){
			this.salonInfoDto.setIsExpired("1");
		}
		// update browse count for this salon
		this.salonService.updateSalonForCount(this.salonInfoDto.getId(), 1L,
				0L, 0L);
		this.uploadFilePath = PropertiesValue
				.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		//获取博站的URL
		this.blogWebUrl = PropertiesValue.getPropertyValueByKey(ApplicationConstant.BLOG_WEB_URL);
		//如果是从提交评论后转过来，则需要提示信息
		if(this.goFrom.equalsIgnoreCase("1")){
			this.addActionMessage(ApplicationConstant.SUBMIT_COMMENT_MSG);
		}
		return "salonofflineDetailPage";
	}

	// 提交信息时，同时登录
	private boolean loginAndSubmit() {
		boolean blnLogin = false;
		if (super.getLoginUserInfo() == null) {// 还没有登录
			String userName = userInfo.getUserName();
			String password = Md5.encoderByMd5(userInfo.getPassword());
			userInfo = userService.getUserByUserNameAndPassword(userName,
					password);
			if (userInfo == null) {
				this.addActionMessage("密码和用户名错误!");
			} else {
				this.blogUserInfoDto = userService
						.getUserInfoDetailByUserName(userName);
				if (this.blogUserInfoDto != null) {
					userInfo.setUserType(this.blogUserInfoDto.getUserType());
					session.put(
							ApplicationConstant.SESSION_PARAMETER_USER_INFO,
							userInfo);
					blnLogin = true;
				} else {
					this.addActionMessage("登录用户的数据有误,请与管理员联系!");
				}

			}
		} else {
			blnLogin = true;
		}

		return blnLogin;
	}

	// 处理返回的经典文章数据长度等

	private List<SalonArticleDto> transSalonClassicArticleList(
			List<SalonArticleDto> paralist) {
		List<SalonArticleDto> tempList = new ArrayList<SalonArticleDto>();
		for (SalonArticleDto dto : paralist) {
			if (dto.getSubject() != null && dto.getSubject().length() > 10) {
				dto.setShortSubject(StringUtils.substring(dto.getSubject(), 0,
						9));
			} else {
				dto.setShortSubject(dto.getSubject());
			}
			tempList.add(dto);
		}
		return tempList;
	}
    //跳转到博站
	private String gotoBolgWeb(){
		this.blogWebUrl = PropertiesValue.getPropertyValueByKey(ApplicationConstant.BLOG_WEB_URL);
		this.remindMsg =ApplicationConstant.BLOG_REMIND_MSG;
		return "gotoBlogWeb";
	}

	//限制上传文件大小
	private boolean checkUploadFileSize(File singleFile,File[] batchFile,char fileType){
		String mess = "上传的";
		boolean blnCanUpload =false;
		double defileFileSize =0d;

		switch(fileType){
			case 'v'://属性文件定义的需要限制的文件大小
				defileFileSize = Double.parseDouble(PropertiesValue.getPropertyValueByKey(ApplicationConstant.UPLOADFILE_VIDEO_SIZE));
				mess+="视频";
				break;
			case 'p'://属性文件定义的需要限制的文件大小
				defileFileSize = Double.parseDouble(PropertiesValue.getPropertyValueByKey(ApplicationConstant.UPLOADFILE_IMG_SIZE));
				mess+="图片";
				break;
			default:
				defileFileSize = 1d;
			}
	   if(singleFile == null && batchFile == null ){
		   return true;
	   }else if(singleFile!=null){
			blnCanUpload = FileUtil.getInstance().checkFileSizeByM(singleFile, defileFileSize);
	   }else if (batchFile!=null){
			blnCanUpload = FileUtil.getInstance().checkFileSizeByM(batchFile, defileFileSize);
		}

		if(blnCanUpload == false){
			mess += "不能大于"+defileFileSize+"兆";
			this.addActionError(mess);
		}

		return blnCanUpload;
	}


	public void setSalonService(ISalonService salonService) {
		this.salonService = salonService;
	}

	public SalonInfoDto getFirstOnlineSalonInfoDto() {
		return firstOnlineSalonInfoDto;
	}

	public void setFirstOnlineSalonInfoDto(SalonInfoDto firstOnlineSalonInfoDto) {
		this.firstOnlineSalonInfoDto = firstOnlineSalonInfoDto;
	}

	public List<SalonInfoDto> getOnlineSalonList() {
		return onlineSalonList;
	}

	public void setOnlineSalonList(List<SalonInfoDto> onlineSalonList) {
		this.onlineSalonList = onlineSalonList;
	}

	public SalonInfoDto getFirstOfflineSalonInfoDto() {
		return firstOfflineSalonInfoDto;
	}

	public void setFirstOfflineSalonInfoDto(
			SalonInfoDto firstOfflineSalonInfoDto) {
		this.firstOfflineSalonInfoDto = firstOfflineSalonInfoDto;
	}

	public List<SalonInfoDto> getOfflineSalonList() {
		return offlineSalonList;
	}

	public void setOfflineSalonList(List<SalonInfoDto> offlineSalonList) {
		this.offlineSalonList = offlineSalonList;
	}

	public List<HostUnitDto> getHostUnitList() {
		return hostUnitList;
	}

	public void setHostUnitList(List<HostUnitDto> hostUnitList) {
		this.hostUnitList = hostUnitList;
	}

	public List<SalonArticleDto> getSalonClassicArticleList() {
		return salonClassicArticleList;
	}

	public void setSalonClassicArticleList(
			List<SalonArticleDto> salonClassicArticleList) {
		this.salonClassicArticleList = salonClassicArticleList;
	}

	public List<SalonInfoDto> getClassicSalonList() {
		return classicSalonList;
	}

	public void setClassicSalonList(List<SalonInfoDto> classicSalonList) {
		this.classicSalonList = classicSalonList;
	}

	public List<SalonInfoDto> getOldSalonList() {
		return oldSalonList;
	}

	public void setOldSalonList(List<SalonInfoDto> oldSalonList) {
		this.oldSalonList = oldSalonList;
	}

	public SalonInfoDto getFirstOldSalonInfoDto() {
		return firstOldSalonInfoDto;
	}

	public void setFirstOldSalonInfoDto(SalonInfoDto firstOldSalonInfoDto) {
		this.firstOldSalonInfoDto = firstOldSalonInfoDto;
	}

	public List<ClassMasterDto> getSearchTitleList() {
		return searchTitleList;
	}

	public void setSearchTitleList(List<ClassMasterDto> searchTitleList) {
		this.searchTitleList = searchTitleList;
	}

	public List<ClassMasterDto> getSearchContentList() {
		return searchContentList;
	}

	public void setSearchContentList(List<ClassMasterDto> searchContentList) {
		this.searchContentList = searchContentList;
	}

	public SalonInfoDto getSalonInfoDto() {
		return salonInfoDto;
	}

	public void setSalonInfoDto(SalonInfoDto salonInfoDto) {
		this.salonInfoDto = salonInfoDto;
	}

	public String getStrStartDate() {
		return strStartDate;
	}

	public void setStrStartDate(String strStartDate) {
		this.strStartDate = strStartDate;
	}

	public String getStrEndDate() {
		return strEndDate;
	}

	public void setStrEndDate(String strEndDate) {
		this.strEndDate = strEndDate;
	}

	public File getUploadPicFile() {
		return uploadPicFile;
	}

	public void setUploadPicFile(File uploadPicFile) {
		this.uploadPicFile = uploadPicFile;
	}

	public String getUploadPicFileFileName() {
		return uploadPicFileFileName;
	}

	public void setUploadPicFileFileName(String uploadPicFileFileName) {
		this.uploadPicFileFileName = uploadPicFileFileName;
	}

	public List<LoginUserInfoDto> getUserInforList() {
		return userInforList;
	}

	public void setUserInforList(List<LoginUserInfoDto> userInforList) {
		this.userInforList = userInforList;
	}

	public List<SalonMediaDto> getSalonPictureList() {
		return salonPictureList;
	}

	public void setSalonPictureList(List<SalonMediaDto> salonPictureList) {
		this.salonPictureList = salonPictureList;
	}

	public List<SalonMediaDto> getSalonVideoList() {
		return salonVideoList;
	}

	public void setSalonVideoList(List<SalonMediaDto> salonVideoList) {
		this.salonVideoList = salonVideoList;
	}

	public List<SalonArticleDto> getSalonArticleList() {
		return salonArticleList;
	}

	public void setSalonArticleList(List<SalonArticleDto> salonArticleList) {
		this.salonArticleList = salonArticleList;
	}

	public List<CommentDto> getSalonCommentList() {
		return salonCommentList;
	}

	public void setSalonCommentList(List<CommentDto> salonCommentList) {
		this.salonCommentList = salonCommentList;
	}

	public List<SalonInfoDto> getHotSalonList() {
		return hotSalonList;
	}

	public void setHotSalonList(List<SalonInfoDto> hotSalonList) {
		this.hotSalonList = hotSalonList;
	}

	public CommentDto getCommentDto() {
		return commentDto;
	}

	public void setCommentDto(CommentDto commentDto) {
		this.commentDto = commentDto;
	}

	public SalonArticleDto getSalonArticleDto() {
		return salonArticleDto;
	}

	public void setSalonArticleDto(SalonArticleDto salonArticleDto) {
		this.salonArticleDto = salonArticleDto;
	}

	public List<SalonArticleDto> getHotArticleList() {
		return hotArticleList;
	}

	public void setHotArticleList(List<SalonArticleDto> hotArticleList) {
		this.hotArticleList = hotArticleList;
	}

	public List<SalonArticleDto> getArticleForUserList() {
		return articleForUserList;
	}

	public void setArticleForUserList(List<SalonArticleDto> articleForUserList) {
		this.articleForUserList = articleForUserList;
	}

	public File getUploadVideoFile() {
		return uploadVideoFile;
	}

	public void setUploadVideoFile(File uploadVideoFile) {
		this.uploadVideoFile = uploadVideoFile;
	}

	public String getUploadVideoFileFileName() {
		return uploadVideoFileFileName;
	}

	public void setUploadVideoFileFileName(String uploadVideoFileFileName) {
		this.uploadVideoFileFileName = uploadVideoFileFileName;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public File getUploadFacePicFile() {
		return uploadFacePicFile;
	}

	public void setUploadFacePicFile(File uploadFacePicFile) {
		this.uploadFacePicFile = uploadFacePicFile;
	}

	public String getUploadFacePicFileFileName() {
		return uploadFacePicFileFileName;
	}

	public void setUploadFacePicFileFileName(String uploadFacePicFileFileName) {
		this.uploadFacePicFileFileName = uploadFacePicFileFileName;
	}

	public SalonArticleDto getSalonArticle1001Dto() {
		return salonArticle1001Dto;
	}

	public void setSalonArticle1001Dto(SalonArticleDto salonArticle1001Dto) {
		this.salonArticle1001Dto = salonArticle1001Dto;
	}

	public SalonArticleDto getSalonArticle1002Dto() {
		return salonArticle1002Dto;
	}

	public void setSalonArticle1002Dto(SalonArticleDto salonArticle1002Dto) {
		this.salonArticle1002Dto = salonArticle1002Dto;
	}

	public SalonArticleDto getSalonArticle1003Dto() {
		return salonArticle1003Dto;
	}

	public void setSalonArticle1003Dto(SalonArticleDto salonArticle1003Dto) {
		this.salonArticle1003Dto = salonArticle1003Dto;
	}

	public SalonArticleDto getSalonArticle1004Dto() {
		return salonArticle1004Dto;
	}

	public void setSalonArticle1004Dto(SalonArticleDto salonArticle1004Dto) {
		this.salonArticle1004Dto = salonArticle1004Dto;
	}

	public SalonArticleDto getSalonArticle1005Dto() {
		return salonArticle1005Dto;
	}

	public void setSalonArticle1005Dto(SalonArticleDto salonArticle1005Dto) {
		this.salonArticle1005Dto = salonArticle1005Dto;
	}

	public SalonArticleDto getSalonArticle1006Dto() {
		return salonArticle1006Dto;
	}

	public void setSalonArticle1006Dto(SalonArticleDto salonArticle1006Dto) {
		this.salonArticle1006Dto = salonArticle1006Dto;
	}

	public SalonMediaDto getFirstVideoDto() {
		return firstVideoDto;
	}

	public void setFirstVideoDto(SalonMediaDto firstVideoDto) {
		this.firstVideoDto = firstVideoDto;
	}

	public LoginUserInfoDto getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(LoginUserInfoDto userInfo) {
		this.userInfo = userInfo;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public BlogUserInfoDto getBlogUserInfoDto() {
		return blogUserInfoDto;
	}

	public void setBlogUserInfoDto(BlogUserInfoDto blogUserInfoDto) {
		this.blogUserInfoDto = blogUserInfoDto;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getUploadFilePath() {
		return uploadFilePath;
	}

	public void setUploadFilePath(String uploadFilePath) {
		this.uploadFilePath = uploadFilePath;
	}

	public ISysFilterWordService getSysFilterWordService() {
		return sysFilterWordService;
	}

	public void setSysFilterWordService(
			ISysFilterWordService sysFilterWordService) {
		this.sysFilterWordService = sysFilterWordService;
	}

	public String getBlogWebUrl() {
		return blogWebUrl;
	}

	public void setBlogWebUrl(String blogWebUrl) {
		this.blogWebUrl = blogWebUrl;
	}

	public String getRemindMsg() {
		return remindMsg;
	}

	public void setRemindMsg(String remindMsg) {
		this.remindMsg = remindMsg;
	}

	public String getActionToDoFlag() {
		return actionToDoFlag;
	}

	public void setActionToDoFlag(String actionToDoFlag) {
		this.actionToDoFlag = actionToDoFlag;
	}


	public String getGoFrom() {
		return goFrom;
	}

	public void setGoFrom(String goFrom) {
		this.goFrom = goFrom;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public void setSysAdService(ISysAdService sysAdService) {
		this.sysAdService = sysAdService;
	}

	public ISysAdService getSysAdService() {
		return sysAdService;
	}

	public void setSalonAdDto(SysAdDto salonAdDto) {
		this.salonAdDto = salonAdDto;
	}

	public SysAdDto getSalonAdDto() {
		return salonAdDto;
	}

	public void setFileServerURL(String fileServerURL) {
		this.fileServerURL = fileServerURL;
	}

	public String getFileServerURL() {
		return fileServerURL;
	}
	public ISalonAdminService getSalonAdminService() {
		return salonAdminService;
	}

	public void setSalonAdminService(ISalonAdminService salonAdminService) {
		this.salonAdminService = salonAdminService;
	}
	public List<SysAdDto> getSalonAdList() {
		return salonAdList;
	}

	public void setSalonAdList(List<SysAdDto> salonAdList) {
		this.salonAdList = salonAdList;
	}
	public SalonArticleDto getSalonArticleDtoUp() {
		return salonArticleDtoUp;
	}

	public void setSalonArticleDtoUp(SalonArticleDto salonArticleDtoUp) {
		this.salonArticleDtoUp = salonArticleDtoUp;
	}

	public SalonArticleDto getSalonArticleDtoDown() {
		return salonArticleDtoDown;
	}

	public void setSalonArticleDtoDown(SalonArticleDto salonArticleDtoDown) {
		this.salonArticleDtoDown = salonArticleDtoDown;
	}
	public String getIslogin() {
		return islogin;
	}

	public void setIslogin(String islogin) {
		this.islogin = islogin;
	}
}
