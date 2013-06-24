package com.dotoyo.buildjob.innovationSalon.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.DateUtil;
import com.dotoyo.buildjob.common.util.FileUtil;
import com.dotoyo.buildjob.common.util.PropertiesValue;
import com.dotoyo.buildjob.common.util.StringUtil;
import com.dotoyo.buildjob.common.util.UploadFileProcessUtil;
import com.dotoyo.buildjob.innovationSalon.dto.CommentDto;
import com.dotoyo.buildjob.innovationSalon.dto.HostUnitDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;
import com.dotoyo.buildjob.innovationSalon.service.ISalonSearchService;
import com.dotoyo.buildjob.innovationSalon.service.ISalonService;
import com.dotoyo.buildjob.innovationSalon.vo.SalonSearchVo;
import com.dotoyo.buildjob.sys.service.ISalonAdminService;

/**
 *
 * @author Bill Xu
 * @dateCreated 2011-01-18
 * @description 沙龙搜索等处理
 */
public class SalonSearchAction extends BuildJobAction {

	private static final long serialVersionUID = 1L;
	private ISalonSearchService salonSearchService;
	private ISalonService salonService;
	private SalonSearchVo salonSearchVo;
	private SalonMediaDto salonMediaDto;
	private PageInfo pageInfo;
	private String blogWebUrl;
	private ISalonAdminService salonAdminService;
	private String searchFlag;  //null 前台
	public String getSearchFlag() {
		return searchFlag;
	}

	public void setSearchFlag(String searchFlag) {
		this.searchFlag = searchFlag;
	}

	public ISalonAdminService getSalonAdminService() {
		return salonAdminService;
	}

	public void setSalonAdminService(ISalonAdminService salonAdminService) {
		this.salonAdminService = salonAdminService;
	}

	private List<SalonInfoDto> salonList;// 沙龙列表
	private List<SalonArticleDto> salonArticleList; // salon article information
	private List<SalonInfoDto>classicSalonList;// 经典沙龙
	private List<SalonArticleDto>salonClassicArticleList;//沙龙经典文章
	private List<SalonMediaDto> salonPictureList; // salon picture information
	private List<LoginUserInfoDto> userInforList; // user information list


	// list
	private List<SalonMediaDto> salonVideoList; // salon video information list

	private List<SalonMediaDto> classicMediaList; // 经典图片或者视频
	private List<HostUnitDto> queryHostUnitList;
	public List<HostUnitDto> getQueryHostUnitList() {
		return queryHostUnitList;
	}

	public void setQueryHostUnitList(List<HostUnitDto> queryHostUnitList) {
		this.queryHostUnitList = queryHostUnitList;
	}

	private SalonInfoDto firstClassSalonDto;
	List<CommentDto> commentList; //comment information list
    private CommentDto commentDto;

    private String strStartDate;
	private String strEndDate;
	private Long salonId;

	private File[] uploadFiles;// 上传文件
	private String[] uploadFilesFileName;//上传文件名称
	private String[] uploadFilesSubject;//上传文件标题

	private File[] uploadCoverFiles;// 上传视频封面文件
	private String[] uploadCoverFilesFileName;//上传视频封面文件名称
	private String mediaType;  //标识是图片还是视频
	private String uploadFilePath;
	private int mediaCount;
	private int curentMediaNumber = 1;//获取点中的当前图片位置

	public String search() {
		//搜索的数据为状态是通过的
		this.salonSearchVo.setStatus(ApplicationConstant.STATUS_PASSED);
		// search article
		if (salonSearchVo.getSearchTitle().equalsIgnoreCase(
				ApplicationConstant.SALON_SEARCH_TITLE_SALONARTICLE)) {
			return this.searchArticle();
			// search picture
		} else if (salonSearchVo.getSearchTitle().equalsIgnoreCase(
				ApplicationConstant.SALON_SEARCH_TITLE_SALONPIC)) {
			return this.searchPicture();
			// search video
		} else if (salonSearchVo.getSearchTitle().equalsIgnoreCase(
				ApplicationConstant.SALON_SEARCH_TITLE_SALONVEDIO)) {
			return this.searchVideo();
		} else {
			// search salon information
			return this.searchSalon();
		}

	}

	public String searchSalon() {

		int pageSize = 10;
		if (salonSearchVo.getSearchContent() != null) {
			if (salonSearchVo.getSearchContent().equalsIgnoreCase(
					ApplicationConstant.SALON_SEARCH_SALONNAME_LAUNCH)) {
				this.salonSearchVo.setUserName(salonSearchVo.getKeyWords());
			} else if (salonSearchVo.getSearchContent().equalsIgnoreCase(
					ApplicationConstant.SALON_SEARCH_SALONNAME_NAME)) {
				this.salonSearchVo.setSubject(salonSearchVo.getKeyWords());
			} else if (salonSearchVo.getSearchContent().equalsIgnoreCase(
					ApplicationConstant.SALON_SEARCH_SALONNAME_INTROU)) {
				this.salonSearchVo.setContent(salonSearchVo.getKeyWords());
			}else{
				salonSearchVo.setSearchContent(ApplicationConstant.SALON_SEARCH_SALONNAME_NAME);
				if("".equals(this.salonSearchVo.getSubject())){
					this.salonSearchVo.setSubject(salonSearchVo.getKeyWords());
				}
			}
		}

		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);

		if (this.strStartDate != null
				&& !this.strStartDate.equalsIgnoreCase("")) {
			this.salonSearchVo.setStartDate(DateUtil
					.parseToDate(this.strStartDate));
		}
		if (this.strEndDate != null && !this.strEndDate.equalsIgnoreCase("")) {
			this.salonSearchVo
					.setEndDate(DateUtil.parseToDate(this.strEndDate));
		}
		//获取往届沙龙
		this.salonSearchVo.setStatus(ApplicationConstant.STATUS_PASSED);
		if(this.salonSearchVo.getOldSalonFlag()!=null && !this.salonSearchVo.getOldSalonFlag().equalsIgnoreCase("")){

		    Calendar calendar = GregorianCalendar.getInstance();
		    calendar.setTime(new Date());
		    calendar.add(Calendar.DATE, -1);
		    Date date = calendar.getTime();
		    if (this.strEndDate != null && !this.strEndDate.equalsIgnoreCase("")) {
		    	if(salonSearchVo.getEndDate().getTime() > date.getTime()){
		    		this.salonSearchVo.setEndDate(DateUtil.parseToDate(DateUtil.getFormatDateByFormat(date, "yyyy-MM-dd")));
		    	}
		    }else{
		    	this.salonSearchVo.setEndDate(DateUtil.parseToDate(DateUtil.getFormatDateByFormat(date, "yyyy-MM-dd")));
		    }
		}else{
		   this.salonSearchVo.setPendingDate(DateUtil.parseToDate(DateUtil.getFormatDateByFormat(new Date(), "yyyy-MM-dd")));
		}


		this.salonList = this.salonSearchService.querySalonList(pageInfo,
				this.salonSearchVo);
		return "searchSalon";
	}
	public String serrchHostUnit() {

		int pageSize = 10;

		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		pageInfo.setPageSize(pageSize);
		this.uploadFilePath=PropertiesValue.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		this.queryHostUnitList = this.salonAdminService.queryHostUnitList(pageInfo);
		return "serrchHostUnit";
	}

    //搜索文章
	public String searchArticle() {

		if (salonSearchVo.getSearchContent() != null) {
			if (salonSearchVo.getSearchContent().equalsIgnoreCase(
					ApplicationConstant.SALON_SEARCH_SALONARTICLE_AUTHOR)) {
				this.salonSearchVo.setUserName(salonSearchVo.getKeyWords()); //如果是线下沙龙，是指文章上传者
				this.salonSearchVo.setAuthor(salonSearchVo.getKeyWords());//如果是线下沙龙，是指文章作者
			} else if (salonSearchVo.getSearchContent().equalsIgnoreCase(
					ApplicationConstant.SALON_SEARCH_SALONARTICLE_SUBJECT)) {
				this.salonSearchVo.setSubject(salonSearchVo.getKeyWords());
			} else if (salonSearchVo.getSearchContent().equalsIgnoreCase(
					ApplicationConstant.SALON_SEARCH_SALONARTICLE_CONTENT)) {
				this.salonSearchVo.setContent(salonSearchVo.getKeyWords());
			} else {
				if(salonSearchVo.getKeyWords()!="" ){
					this.salonSearchVo.setSubject(salonSearchVo.getKeyWords());
				}
			}
		}

		if (this.strStartDate != null
				&& !this.strStartDate.equalsIgnoreCase("")) {
			this.salonSearchVo.setStartDate(DateUtil
					.parseToDate(this.strStartDate));
		}
		if (this.strEndDate != null && !this.strEndDate.equalsIgnoreCase("")) {
			this.salonSearchVo
					.setEndDate(DateUtil.parseToDate(this.strEndDate));
		}
		salonSearchVo.setStatus(ApplicationConstant.STATUS_PASSED);

		int pageSize = 10;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		this.salonArticleList = this.salonSearchService.querySalonArticleList(
				pageInfo, salonSearchVo);
		return "searchArticle";
	}
    //搜索图片
	public String searchPicture() {
		if (salonSearchVo.getSearchContent() != null) {
		   if (salonSearchVo.getSearchContent().equalsIgnoreCase(
					ApplicationConstant.SALON_SEARCH_SALONPIC_SUBJECT)) {
				this.salonSearchVo.setSubject(salonSearchVo.getKeyWords());
			}else if (salonSearchVo.getSearchContent().equalsIgnoreCase(
					ApplicationConstant.SALON_SEARCH_SALONPIC_AUTHOR)) {
				this.salonSearchVo.setAuthor(salonSearchVo.getKeyWords());
			}else{
				if(!"".equals(salonSearchVo.getKeyWords())){
					this.salonSearchVo.setSubject(salonSearchVo.getKeyWords());
				}
			}
		}

		if (this.strStartDate != null
				&& !this.strStartDate.equalsIgnoreCase("")) {
			this.salonSearchVo.setStartDate(DateUtil
					.parseToDate(this.strStartDate));
		}
		if (this.strEndDate != null && !this.strEndDate.equalsIgnoreCase("")) {
			this.salonSearchVo
					.setEndDate(DateUtil.parseToDate(this.strEndDate));
		}

		int pageSize = 12;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		salonSearchVo.setStatus(ApplicationConstant.STATUS_PASSED);
		this.pageInfo.setPageSize(pageSize);
		this.salonSearchVo.setMediaType(ApplicationConstant.MEDIA_TYPE_PICTURE);
		this.salonPictureList = this.salonSearchService.querySalonMediaList(pageInfo, salonSearchVo);
		this.uploadFilePath=PropertiesValue.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		return "searchPiture";
	}
    //搜索视频
	public String searchVideo() {
		if (salonSearchVo.getSearchContent() != null) {
			   if (salonSearchVo.getSearchContent().equalsIgnoreCase(
						ApplicationConstant.SALON_SEARCH_SALONVID_SUBJECT)) {
					this.salonSearchVo.setSubject(salonSearchVo.getKeyWords());
				}else if (salonSearchVo.getSearchContent().equalsIgnoreCase(
						ApplicationConstant.SALON_SEARCH_SALONVID_AUTHOR)) {
					this.salonSearchVo.setAuthor(salonSearchVo.getKeyWords());
				}else{
					if(!"".equals(salonSearchVo.getKeyWords())){
						this.salonSearchVo.setSubject(salonSearchVo.getKeyWords());
					}
				}
			}

			if (this.strStartDate != null
					&& !this.strStartDate.equalsIgnoreCase("")) {
				this.salonSearchVo.setStartDate(DateUtil
						.parseToDate(this.strStartDate));
			}
			if (this.strEndDate != null && !this.strEndDate.equalsIgnoreCase("")) {
				this.salonSearchVo
						.setEndDate(DateUtil.parseToDate(this.strEndDate));
			}

			int pageSize = 12;
			if (this.pageInfo == null) {
				this.pageInfo = new PageInfo();
			}
			salonSearchVo.setStatus(ApplicationConstant.STATUS_PASSED);
			this.pageInfo.setPageSize(pageSize);
			this.salonSearchVo.setMediaType(ApplicationConstant.MEDIA_TYPE_VIDEO);
			this.salonVideoList = this.salonSearchService.querySalonMediaList(pageInfo, salonSearchVo);
			this.uploadFilePath=PropertiesValue.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		return "searchVideo";
	}

    //图片详情
	public String pictureDetail() {

	  this.salonMediaDto = this.salonSearchService.getSalonMediaById(this.salonMediaDto.getId());
	  Long salongId=this.salonMediaDto.getSalonId();
	  if(searchFlag == null || !searchFlag.equals("1")){
		  this.salonPictureList = this.salonService.querySalonMediaListBySalonId(this.salonMediaDto.getSalonId(), ApplicationConstant.MEDIA_TYPE_PICTURE, ApplicationConstant.STATUS_PASSED);
	  }else{
		  this.salonPictureList = this.salonService.querySalonMediaListBySalonId(this.salonMediaDto.getSalonId(), ApplicationConstant.MEDIA_TYPE_PICTURE, null);
	  }
	  //get classic media list
	  this.classicMediaList = this.salonService.queryClassMediaList(8, ApplicationConstant.MEDIA_TYPE_PICTURE,ApplicationConstant.MEDIA_IS_EXCELLENT_YES);

	//classic salon list
	  this.classicSalonList = this.salonService.querySalonList(ApplicationConstant.SALON_HOME_CLASSIC_SIZE, null, ApplicationConstant.SALON_IS_EXCELLENT_YES);
	  if(this.classicSalonList!=null && this.classicSalonList.size()>0){
		  firstClassSalonDto = this.classicSalonList.get(0);
		   this.classicSalonList.remove(0);
		}
	//get picture comment list
		if(this.pageInfo == null){
			this.pageInfo = new PageInfo();
		}
	  this.pageInfo.setPageSize(ApplicationConstant.SALON_DETAIL_COMMENT_SIZE);
	  this.commentList = this.salonService.querySalonCommentList(this.pageInfo,  this.salonMediaDto.getId(), ApplicationConstant.COMMENT_SUBJECT_TYPE_PICTURE, ApplicationConstant.STATUS_PASSED);
	  this.uploadFilePath=PropertiesValue.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
	  this.mediaCount = this.salonPictureList.size();
	  this.salonSearchVo = new SalonSearchVo();
	  this.salonSearchVo.setSalonId(salongId);
	  this.salonSearchVo.setSearchContent(ApplicationConstant.SALON_SEARCH_SALONPIC_SUBJECT);
	  return "viewPictureDetail";
	}

    //视频详情
	public String videoDetail() {
		  this.salonMediaDto = this.salonSearchService.getSalonMediaById(this.salonMediaDto.getId());
		  Long salongId=this.salonMediaDto.getSalonId();
		  if(searchFlag == null || !searchFlag.equals("1")){
			  this.salonVideoList = this.salonService.querySalonMediaListBySalonId(this.salonMediaDto.getSalonId(), ApplicationConstant.MEDIA_TYPE_VIDEO, ApplicationConstant.STATUS_PASSED);
		  }else{
			  this.salonVideoList = this.salonService.querySalonMediaListBySalonId(this.salonMediaDto.getSalonId(), ApplicationConstant.MEDIA_TYPE_VIDEO, null);
		  }
		 //get classic media list
		  this.classicMediaList = this.salonService.queryClassMediaList(8, ApplicationConstant.MEDIA_TYPE_VIDEO,ApplicationConstant.MEDIA_IS_EXCELLENT_YES);

		//classic salon list
		  this.classicSalonList = this.salonService.querySalonList(ApplicationConstant.SALON_HOME_CLASSIC_SIZE, null, ApplicationConstant.SALON_IS_EXCELLENT_YES);
		  if(this.classicSalonList!=null && this.classicSalonList.size()>0){
			  firstClassSalonDto = this.classicSalonList.get(0);
			   this.classicSalonList.remove(0);
			}
		//get picture comment list
			if(this.pageInfo == null){
				this.pageInfo = new PageInfo();
			}
			this.pageInfo.setPageSize(ApplicationConstant.SALON_DETAIL_COMMENT_SIZE);
			this.commentList = this.salonService.querySalonCommentList(this.pageInfo,  this.salonMediaDto.getId(), ApplicationConstant.COMMENT_SUBJECT_TYPE_VIDEO, ApplicationConstant.STATUS_PASSED);
		this.uploadFilePath=PropertiesValue.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		this.mediaCount = this.salonVideoList.size();
		this.salonSearchVo = new SalonSearchVo();
		this.salonSearchVo.setSalonId(salongId);
		this.salonSearchVo.setSearchContent(ApplicationConstant.SALON_SEARCH_SALONVID_SUBJECT);
		return "viewVideoDetail";
	}


   // add picture comment information
	public String addPictureComment() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();
		//if (this.salonService.existSalonAttend(this.salonSearchVo.getSalonId(),
		//		userId)) {// 只有参加了沙龙的用户才可以发表评论
			//检查文件标题和内容是否含有过滤词
			String word = null;
			if((word = StringUtil.isExistsFilterWords(commentDto.getContent())) != null){
				this.addActionMessage("内容中含有敏感词, " + word);
				return this.pictureDetail();
			}
		    this.commentDto.setAuthor(userId); //login user id
		    this.commentDto.setSubjectId(this.salonMediaDto.getId());
		    this.commentDto.setSubjectType(ApplicationConstant.COMMENT_SUBJECT_TYPE_PICTURE);
		    this.salonService.saveCommentInfo(this.commentDto);
		    //显示提交信息
		    commentDto.setContent("");
		    this.addActionMessage(ApplicationConstant.SUBMIT_COMMENT_MSG);
		//} else {
			//this.addActionMessage(ApplicationConstant.SALON_NOT_ATTEND_ADD_COMMENT_MSG);
		//}
		return this.pictureDetail();
	}

	// add video comment information
	public String addVideoComment() {
	        super.getLoginUserInfo();
            Long userId = this.loginUserInfoDto.getId();// get from login user
    		//检查文件标题和内容是否含有过滤词
    		String word = null;
    		if((word = StringUtil.isExistsFilterWords(commentDto.getContent())) != null){
    			this.addActionMessage("内容中含有敏感词, " + word);
    			return this.videoDetail();
    		}
		    this.commentDto.setAuthor(userId); //login user id
		    this.commentDto.setSubjectId(this.salonMediaDto.getId());
		    this.commentDto.setSubjectType(ApplicationConstant.COMMENT_SUBJECT_TYPE_VIDEO);
		    this.salonService.saveCommentInfo(this.commentDto);
		    //显示提示信息
		    this.addActionMessage(ApplicationConstant.SUBMIT_COMMENT_MSG);
		    commentDto.setContent("");
		    return this.videoDetail();
	}

	 //视频信息列表
	public String videoListInfo() {
			int pageSize = 12;
			if (this.pageInfo == null) {
				this.pageInfo = new PageInfo();
			}
			this.pageInfo.setPageSize(pageSize);
			this.salonVideoList = this.salonSearchService.querySalonMediaListBySalonId(pageInfo, this.salonId,ApplicationConstant.MEDIA_TYPE_VIDEO);
			this.uploadFilePath=PropertiesValue.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		return "videoListInfoBySalon";
	}
	//经典视频信息列表
	public String classVideoListInfo() {
		int pageSize = 12;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		this.salonVideoList = this.salonSearchService.querySalonMediaListByIdAndisExcellent(pageInfo, this.salonId, ApplicationConstant.MEDIA_TYPE_VIDEO,ApplicationConstant.MEDIA_IS_EXCELLENT_YES);
		this.uploadFilePath=PropertiesValue.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
	return "classVideoListInfoBySalon";
}

	 //图片信息列表
	public String pictureListInfo() {
			int pageSize = 12;
			if (this.pageInfo == null) {
				this.pageInfo = new PageInfo();
			}
			this.pageInfo.setPageSize(pageSize);
			this.salonPictureList = this.salonSearchService.querySalonMediaListBySalonId(pageInfo, this.salonId,ApplicationConstant.MEDIA_TYPE_PICTURE);
		this.uploadFilePath=PropertiesValue.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		return "pictureListInfoBySalon";
	}
	//经典图片信息列表
	public String classPictureListInfo() {
		int pageSize = 12;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		this.salonPictureList = this.salonSearchService.querySalonMediaListByIdAndisExcellent(pageInfo, this.salonId,ApplicationConstant.MEDIA_TYPE_PICTURE,ApplicationConstant.MEDIA_IS_EXCELLENT_YES);
	this.uploadFilePath=PropertiesValue.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
	return "classPictureListInfoBySalon";
}
	 //已经参加沙龙用户列表
	public String userListInfo() {
			int pageSize = 10;
			if (this.pageInfo == null) {
				this.pageInfo = new PageInfo();
			}
			this.pageInfo.setPageSize(pageSize);
			// get join user list
			this.userInforList = this.salonService.querySalonUserListByPage(
					pageInfo,
					this.salonSearchVo.getSalonId());
			//获取博站的URL
			this.blogWebUrl = PropertiesValue.getPropertyValueByKey(ApplicationConstant.BLOG_WEB_URL);
		return "userListInfoBySalon";
	}

	 //图片上传页面
	@SuppressWarnings("unchecked")
	public String toPictureUploadPage() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<String> actionMessageList = (List<String>) session
				.getAttribute("actionMessageList");
		if (actionMessageList != null) {
			for (String actionMessage : actionMessageList) {
				this.addActionMessage(actionMessage);
			}
			session.removeAttribute("actionMessageList");
		}
		return "toPictureUploadPage";
	}
	 //视频上传页面
	@SuppressWarnings("unchecked")
	public String toVideoUploadPage() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<String> actionMessageList = (List<String>) session
				.getAttribute("actionMessageList");
		if (actionMessageList != null) {
			for (String actionMessage : actionMessageList) {
				this.addActionMessage(actionMessage);
			}
			session.removeAttribute("actionMessageList");
		}
		return "toVideoUploadPage";
	}
	 //上传视频或图片文件
	public String uploadFilesProcess() {

		List<String> actionMessageList = new ArrayList<String>();
		HttpSession session = ServletActionContext.getRequest().getSession();
		
	    super.getLoginUserInfo();
        Long userId = this.loginUserInfoDto.getId();// get from login user
        //判断用户是否是沙龙的参与者
    	if (!this.salonService.existSalonAttend(this.salonMediaDto.getSalonId(),userId)){
    	    this.uploadFilesSubject = null;
    		this.addActionMessage(ApplicationConstant.SALON_NOT_ATTEND_UPLOAD_FILE_MSG);
    		actionMessageList = (List<String>)this.getActionMessages();
    		session.setAttribute("actionMessageList", actionMessageList);
    		 if(this.salonMediaDto.getMediaType().equalsIgnoreCase(ApplicationConstant.MEDIA_TYPE_VIDEO)){
    			 return "redirectToVideoUpload";
    		 }else{
    			 return "redirectToPictureUpload";
    		 }
    	}

    	//检查上传文件的合法性(大小)
   	    if(this.salonMediaDto.getMediaType().equalsIgnoreCase(ApplicationConstant.MEDIA_TYPE_VIDEO)){//上传视频
   	    	if(this.checkUploadFileSize(null, this.uploadFiles, 'v')||this.checkUploadFileSize(null, this.uploadCoverFiles, 'p')){
   	    	    this.uploadFilesSubject = null;
   	    		actionMessageList = (List<String>)this.getActionMessages();
   	    		session.setAttribute("actionMessageList", actionMessageList);
   	    		return "redirectToVideoUpload";
   	    	}
   	    }else{//上传图片
   	    	if(this.checkUploadFileSize(null, this.uploadFiles, 'p')){
   	    	   this.uploadFilesSubject = null;
				actionMessageList = (List<String>) this.getActionMessages();
				session.setAttribute("actionMessageList", actionMessageList);
				return "redirectToPictureUpload";
   	    	}
   	    }
   	    if("1".equals(salonMediaDto.getSalonType())) this.salonMediaDto.setStatus("1");
		this.salonMediaDto.setAuthor(userId); //login user id
		List<SalonMediaDto> uploadFileList = new ArrayList<SalonMediaDto>();
		if(this.salonMediaDto.getMediaType().equalsIgnoreCase(ApplicationConstant.MEDIA_TYPE_VIDEO)){
			uploadFileList=UploadFileProcessUtil.uploadFiles(this.uploadFiles,this.uploadFilesFileName,this.uploadFilesSubject,this.uploadCoverFiles,this.uploadCoverFilesFileName);
		}else{
			uploadFileList=UploadFileProcessUtil.uploadFiles(this.uploadFiles,this.uploadFilesFileName,this.uploadFilesSubject,null,null);
		}
	    this.salonService.saveMediaInfo(salonMediaDto, uploadFileList);

	    this.uploadFilesSubject = null;
	    if(this.salonMediaDto.getMediaType().equalsIgnoreCase(ApplicationConstant.MEDIA_TYPE_VIDEO)){
	    	this.addActionMessage("视频上传成功");
    		actionMessageList = (List<String>)this.getActionMessages();
    		session.setAttribute("actionMessageList", actionMessageList);
		    return "redirectToVideoUpload";
	    }else{
	    	this.addActionMessage("图片上传成功");
    		actionMessageList = (List<String>)this.getActionMessages();
    		session.setAttribute("actionMessageList", actionMessageList);
	    	return "redirectToPictureUpload";
	    }
	}


	//限制上传文件大小
	private boolean checkUploadFileSize(File singleFile,File[] batchFile,char fileType){
		boolean blnCanUpload =false;
		double defileFileSize =0d;
		String str = "";
		switch(fileType){
			case 'v'://属性文件定义的需要限制的文件大小
				defileFileSize = Double.parseDouble(PropertiesValue.getPropertyValueByKey(ApplicationConstant.UPLOADFILE_VIDEO_SIZE));
				str = "视频文件";
				break;
			case 'p'://属性文件定义的需要限制的文件大小
				defileFileSize = Double.parseDouble(PropertiesValue.getPropertyValueByKey(ApplicationConstant.UPLOADFILE_IMG_SIZE));
				str = "图片文件";
				break;
			default:
				defileFileSize = 1d;
			}

		if(singleFile!=null){
			blnCanUpload = FileUtil.getInstance().checkFileSizeByM(singleFile, defileFileSize);
		}
		if(batchFile!=null){
			blnCanUpload = FileUtil.getInstance().checkFileSizeByM(batchFile, defileFileSize);
		}
		if(!blnCanUpload){
			this.addActionError("上传的"+str+"不能大于"+defileFileSize+"兆");
		}
		return !blnCanUpload;
	}


	public SalonSearchVo getSalonSearchVo() {
		return salonSearchVo;
	}

	public void setSalonSearchVo(SalonSearchVo salonSearchVo) {
		this.salonSearchVo = salonSearchVo;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public ISalonSearchService getSalonSearchService() {
		return salonSearchService;
	}

	public void setSalonSearchService(ISalonSearchService salonSearchService) {
		this.salonSearchService = salonSearchService;
	}

	public List<SalonInfoDto> getSalonList() {
		return salonList;
	}

	public void setSalonList(List<SalonInfoDto> salonList) {
		this.salonList = salonList;
	}

	public List<SalonArticleDto> getSalonArticleList() {
		return salonArticleList;
	}

	public void setSalonArticleList(List<SalonArticleDto> salonArticleList) {
		this.salonArticleList = salonArticleList;
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

	public SalonMediaDto getSalonMediaDto() {
		return salonMediaDto;
	}

	public void setSalonMediaDto(SalonMediaDto salonMediaDto) {
		this.salonMediaDto = salonMediaDto;
	}

	public ISalonService getSalonService() {
		return salonService;
	}

	public void setSalonService(ISalonService salonService) {
		this.salonService = salonService;
	}

	public List<SalonInfoDto> getClassicSalonList() {
		return classicSalonList;
	}

	public void setClassicSalonList(List<SalonInfoDto> classicSalonList) {
		this.classicSalonList = classicSalonList;
	}

	public List<SalonArticleDto> getSalonClassicArticleList() {
		return salonClassicArticleList;
	}

	public void setSalonClassicArticleList(
			List<SalonArticleDto> salonClassicArticleList) {
		this.salonClassicArticleList = salonClassicArticleList;
	}

	public SalonInfoDto getFirstClassSalonDto() {
		return firstClassSalonDto;
	}

	public void setFirstClassSalonDto(SalonInfoDto firstClassSalonDto) {
		this.firstClassSalonDto = firstClassSalonDto;
	}

	public List<CommentDto> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<CommentDto> commentList) {
		this.commentList = commentList;
	}

	public CommentDto getCommentDto() {
		return commentDto;
	}

	public void setCommentDto(CommentDto commentDto) {
		this.commentDto = commentDto;
	}

	public Long getSalonId() {
		return salonId;
	}

	public void setSalonId(Long salonId) {
		this.salonId = salonId;
	}



	public File[] getUploadFiles() {
		return uploadFiles;
	}

	public void setUploadFiles(File[] uploadFiles) {
		this.uploadFiles = uploadFiles;
	}

	public String[] getUploadFilesFileName() {
		return uploadFilesFileName;
	}

	public void setUploadFilesFileName(String[] uploadFilesFileName) {
		this.uploadFilesFileName = uploadFilesFileName;
	}

	public String[] getUploadFilesSubject() {
		return uploadFilesSubject;
	}

	public void setUploadFilesSubject(String[] uploadFilesSubject) {
		this.uploadFilesSubject = uploadFilesSubject;
	}

	public File[] getUploadCoverFiles() {
		return uploadCoverFiles;
	}

	public void setUploadCoverFiles(File[] uploadCoverFiles) {
		this.uploadCoverFiles = uploadCoverFiles;
	}

	public String[] getUploadCoverFilesFileName() {
		return uploadCoverFilesFileName;
	}

	public void setUploadCoverFilesFileName(String[] uploadCoverFilesFileName) {
		this.uploadCoverFilesFileName = uploadCoverFilesFileName;
	}

	public String getMediaType() {
		return mediaType;
	}

	public void setMediaType(String mediaType) {
		this.mediaType = mediaType;
	}

	public String getUploadFilePath() {
		return uploadFilePath;
	}

	public void setUploadFilePath(String uploadFilePath) {
		this.uploadFilePath = uploadFilePath;
	}

	public List<SalonMediaDto> getClassicMediaList() {
		return classicMediaList;
	}

	public void setClassicMediaList(List<SalonMediaDto> classicMediaList) {
		this.classicMediaList = classicMediaList;
	}

	public int getMediaCount() {
		return mediaCount;
	}

	public void setMediaCount(int mediaCount) {
		this.mediaCount = mediaCount;
	}

	public int getCurentMediaNumber() {
		return curentMediaNumber;
	}

	public void setCurentMediaNumber(int curentMediaNumber) {
		this.curentMediaNumber = curentMediaNumber;
	}
	public List<LoginUserInfoDto> getUserInforList() {
		return userInforList;
	}

	public void setUserInforList(List<LoginUserInfoDto> userInforList) {
		this.userInforList = userInforList;
	}

	public String getBlogWebUrl() {
		return blogWebUrl;
	}

	public void setBlogWebUrl(String blogWebUrl) {
		this.blogWebUrl = blogWebUrl;
	}

}
