package com.dotoyo.buildjob.innovationSalon.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.dotoyo.buildjob.common.action.BuildJobAction;
import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.PageInfo;
import com.dotoyo.buildjob.common.html.HtmlGeneration;
import com.dotoyo.buildjob.common.service.IDataOperationService;
import com.dotoyo.buildjob.common.user.dto.LoginUserInfoDto;
import com.dotoyo.buildjob.common.util.DateUtil;
import com.dotoyo.buildjob.common.util.EssentialDataUtil;
import com.dotoyo.buildjob.common.util.FileUtil;
import com.dotoyo.buildjob.common.util.PropertiesValue;
import com.dotoyo.buildjob.common.util.StringUtil;
import com.dotoyo.buildjob.common.util.UploadFileProcessUtil;
import com.dotoyo.buildjob.innovationSalon.dto.CommentDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonArticleDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonInfoDto;
import com.dotoyo.buildjob.innovationSalon.dto.SalonMediaDto;
import com.dotoyo.buildjob.innovationSalon.service.ISalonManageService;
import com.dotoyo.buildjob.innovationSalon.service.ISalonSearchService;
import com.dotoyo.buildjob.innovationSalon.service.ISalonService;
import com.dotoyo.buildjob.innovationSalon.vo.SalonSearchVo;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;

/**
 *
 * @author Bill Xu
 * @dateCreated 2011-01-25
 * @description
 */
public class SalonManageAction extends BuildJobAction {
	private static Logger logger = Logger.getLogger(SalonManageAction.class);
	private static final long serialVersionUID = 1L;
	private ISalonManageService salonManageService;
	private ISalonService salonService;
	private ISalonSearchService salonSearchService;
	private IDataOperationService dataOperationService;
	private List<SalonInfoDto> salonList;// 沙龙列表
	private List<SalonArticleDto> articleList;// 沙龙列表
	private List<SalonMediaDto> mediaList;// 图片或视频列表
	private List<CommentDto> commentList;// 评论列表

	private PageInfo pageInfo;
	private SalonInfoDto salonInfoDto;
	private SalonMediaDto salonMediaDto;
	private SalonArticleDto salonArticleDto;
	private CommentDto commentDto;
	private File uploadPicFile;// 图片
	private String uploadPicFileFileName;
	private File uploadVideoFile;// 视频


	private File uploadFacePicFile;// 头像图片
	private String uploadFacePicFileFileName;




	private String uploadVideoFileFileName;

	private String strStartDate;
	private String strEndDate;

	private SalonSearchVo salonSearchVo;

	private String[] arrayIds;

	private File[] uploadFiles;// 上传文件
	private String[] uploadFilesFileName;// 上传文件名称
	private String[] uploadFilesSubject;// 上传文件标题

	private File[] uploadCoverFiles;// 上传视频封面文件
	private String[] uploadCoverFilesFileName;// 上传视频封面文件名称

	private String goFrom = "0"; // 控制页面转向
	private String uploadFilePath;

	// 发起沙龙信息列表
	public String myLaunchSalonList() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		int pageSize = 10;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		salonSearchVo = new SalonSearchVo();
		this.salonList = this.salonManageService.querySalonListByUserId(
				pageInfo, userId, this.salonInfoDto.getSalonType());
		if(strStartDate == null){
			strEndDate = "";
			strStartDate = "";
		}
		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_ONLINE)) {
			return "myLaunchOnlineSalonPage";
		} else {
			return "myLaunchOfflineSalonPage";
		}

	}

	// 参与沙龙信息列表
	public String myJoinSalonList() {
		salonSearchVo = new SalonSearchVo();
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		int pageSize = 10;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		SalonSearchVo tmp = new SalonSearchVo();
		tmp.setUserId(userId);
		tmp.setSalonType(this.salonInfoDto.getSalonType());
		strStartDate = null;
		strEndDate = null;
		this.salonList = this.salonManageService.queryJoinSalonListByUserId(
				pageInfo, tmp);
		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_ONLINE)) {
			return "joinOnlineSalon";
		} else {
			return "joinOfflineSalon";
		}

	}

	// 参与沙龙信息列表
	public String searchMyJoinSalonList() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		int pageSize = 10;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		salonSearchVo.setUserId(userId);
		salonSearchVo.setSalonType(this.salonInfoDto.getSalonType());
		if(strStartDate != null && !strStartDate.equals("")){
			salonSearchVo.setStartDate(DateUtil.parseToDate(strStartDate));
		}
		if(strEndDate != null && !strEndDate.equals("")){
			salonSearchVo.setEndDate(DateUtil.parseToDate(strEndDate));
		}
		this.salonList = this.salonManageService.queryJoinSalonListByUserId(
				pageInfo, salonSearchVo);
		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_ONLINE)) {
			return "joinOnlineSalon";
		} else {
			return "joinOfflineSalon";
		}

	}

	// 本人在沙龙发表的观点信息列表
	public String mySalonArticleList() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		int pageSize = 10;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		this.articleList = this.salonManageService
				.querySalonArticelListByUserId(pageInfo, userId,
						this.salonMediaDto.getSalonId());
		return "mySalonArticleList";
	}

	// to launch salon page
	public String toLaunchPage() {
		this.getLoginUserInfo();
		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_ONLINE)) {
			return "launchOnlineSalon";
		} else {
			return "launchOfflineSalon";
		}
	}

	// to upload media page
	public String toUploadMediaPage() {
		this.getLoginUserInfo();
		this.salonInfoDto = this.salonService.getSalonInfoById(salonMediaDto
				.getSalonId());
		if (this.salonMediaDto.getMediaType().equalsIgnoreCase(
				ApplicationConstant.MEDIA_TYPE_PICTURE)) {
			return "uploadPicture";
		} else {
			return "uploadVideo";
		}
	}

	// to launch salon page

	public String toUpdatePage() {
		this.getLoginUserInfo();
		this.salonInfoDto = this.salonService
				.getSalonInfoById(this.salonInfoDto.getId());
		this.strStartDate = DateUtil.getDateString(this.salonInfoDto
				.getStartDate());
		this.strEndDate = DateUtil
				.getDateString(this.salonInfoDto.getEndDate());
		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_ONLINE)) {
			return "updateOnlineSalon";
		} else {
			return "updateOfflineSalon";
		}
	}
	private String toUpdatePageRtn(){
		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_ONLINE)) {
			return "updateOnlineSalon";
		} else {
			return "updateOfflineSalon";
		}
	}
	// to personal article manage page
	public String toArticleManagePage() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		int pageSize = 10;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		if(salonSearchVo == null){
			salonSearchVo = new SalonSearchVo();
		}
		this.salonSearchVo.setUserId(userId);
		if (this.salonMediaDto != null
				&& this.salonMediaDto.getSalonId() != null) {
			this.salonSearchVo.setSalonId(this.salonMediaDto.getSalonId());
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

		this.articleList = this.salonSearchService.querySalonArticleList(
				pageInfo, salonSearchVo);
		if(strStartDate == null){
			strStartDate = "";
			strEndDate = "";
		}
		return "personalArticleManage";
	}

	// to personal comment manage page
	public String toCommentManagePage() {
		super.getLoginUserInfo();

		Long userId = this.loginUserInfoDto.getId();// get from login user
		int pageSize = 10;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		if(salonSearchVo == null){
			salonSearchVo = new SalonSearchVo();
		}
		this.salonSearchVo.setUserId(userId);

		if (this.strStartDate != null
				&& !this.strStartDate.equalsIgnoreCase("")) {
			this.salonSearchVo.setStartDate(DateUtil
					.parseToDate(this.strStartDate));
		}
		if (this.strEndDate != null && !this.strEndDate.equalsIgnoreCase("")) {
			this.salonSearchVo
					.setEndDate(DateUtil.parseToDate(this.strEndDate));
		}
		this.commentList = this.salonManageService.searchAllCommentList(
				pageInfo, salonSearchVo);
		if(strEndDate == null){
			strStartDate = "";
			strEndDate = "";
		}
		return "personalCommentManage";
	}

	// to modify article page
	public String toModifyArticlePage() {
		this.getLoginUserInfo();
		String salonType=salonArticleDto.getSalonType();
		this.salonArticleDto = this.salonService
				.getSalonArticleById(this.salonArticleDto.getId());
		salonArticleDto.setSalonType(salonType);
		this.uploadFilePath = PropertiesValue
		.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		ClassMasterDto searchTitle  = EssentialDataUtil.getEssentialDataBycode(salonArticleDto.getOfflineSalonColumn());
		if(null!=searchTitle){
			salonArticleDto.setOfflineSalonColumnName(searchTitle.getName());
		}
		if(ApplicationConstant.SALON_TYPE_ONLINE.equals(salonType)){
		   return "modifyArticle";
		}else{
			return "modifyOfflineArticle";
		}
	}

	// to media list page(off line)
	@SuppressWarnings("unchecked")
	public String toMediaListPage() {
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<String> actionMessageList = (List<String>) session
				.getAttribute("actionMessageList");
		if (actionMessageList != null) {
			for (String actionMessage : actionMessageList) {
				this.addActionMessage(actionMessage);
			}
			session.removeAttribute("actionMessageList");
		}
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		int pageSize = 8;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		this.salonList = this.salonManageService
				.querySalonListBySalonType4Media(pageInfo,
						ApplicationConstant.SALON_TYPE_OFFLINE,
						this.salonMediaDto.getMediaType(),loginUserInfoDto.getId().toString());
		this.uploadFilePath = PropertiesValue
				.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		if (this.salonMediaDto.getMediaType().equalsIgnoreCase(
				ApplicationConstant.MEDIA_TYPE_PICTURE)) {
			return "salonOfflinePictureList";
		} else {
			return "salonOfflineVideoList";
		}
	}

	// to media list page for salon
	public String toMediaListBySalonPage() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<String> actionMessageList = (List<String>) session
				.getAttribute("actionMessageList");
		if (actionMessageList != null) {
			for (String actionMessage : actionMessageList) {
				this.addActionMessage(actionMessage);
			}
			session.removeAttribute("actionMessageList");
		}
		
		super.getLoginUserInfo();
		int pageSize = 8;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		this.mediaList = this.salonManageService.querySalonMediaListBySalonId(
				pageInfo, this.salonMediaDto.getSalonId(),
				this.salonMediaDto.getMediaType(),
				null,this.loginUserInfoDto.getId());

		this.uploadFilePath = PropertiesValue
				.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);

		if (this.salonMediaDto.getMediaType().equalsIgnoreCase(
				ApplicationConstant.MEDIA_TYPE_PICTURE)) {
			return "pictureList4Salon";
		} else {
			return "videoList4Salon";
		}
	}

	// to personal comment modify page
	public String toCommentModifyPage() {
		this.getLoginUserInfo();
		this.commentDto = this.salonManageService
				.getCommentById(this.commentDto.getId());
		return "modifyComment";
	}

	// 增加沙龙
	public String addSalon() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		//检查文件标题和内容是否含有过滤词
		String word = null;
		if((word = StringUtil.isExistsFilterWords(salonInfoDto.getSubject())) != null){
			this.addActionError("名称中含有敏感词, " + word);
			return this.toLaunchPage();
		}
		if((word = StringUtil.isExistsFilterWords(salonInfoDto.getContent())) != null){
			this.addActionError("内容中含有敏感词, " + word);
			return this.toLaunchPage();
		}
		// 检查上传文件的合法性(大小)
		if (!this.checkUploadFileSize(this.uploadPicFile, null, 'p')) {
			return this.toLaunchPage();
		}
		String newPicFileName = UploadFileProcessUtil.uploadFile(
				this.uploadPicFile, this.uploadPicFileFileName);
		this.salonInfoDto.setStartDate(DateUtil.parseToDate(strStartDate));
		this.salonInfoDto.setEndDate(DateUtil.parseToDate(strEndDate));
		this.salonInfoDto.setCompere(userId); // login user id
		this.salonInfoDto.setSubjectPic(newPicFileName);
		this.salonService.addSalon(salonInfoDto);
		this.strStartDate = null;
		this.strEndDate = null;
        return "addSalonSuccess";

	}

	// 更新沙龙
	public String updateSalon() {

		//检查文件标题和内容是否含有过滤词
		String word = null;
		if((word = StringUtil.isExistsFilterWords(salonInfoDto.getSubject())) != null){
			this.addActionError("名称中含有敏感词, " + word);
			return this.toUpdatePageRtn();
		}
		if((word = StringUtil.isExistsFilterWords(salonInfoDto.getContent())) != null){
			this.addActionError("内容中含有敏感词, " + word);
			return this.toUpdatePageRtn();
		}
		// 检查上传文件的合法性(大小)
		if (!this.checkUploadFileSize(this.uploadPicFile, null, 'p')) {
			return this.toUpdatePageRtn();
		}
		if(this.uploadPicFile != null){
			String newPicFileName = UploadFileProcessUtil.uploadFile(
					this.uploadPicFile, this.uploadPicFileFileName);
			this.salonInfoDto.setSubjectPic(newPicFileName);
		}
		this.salonInfoDto.setStartDate(DateUtil.parseToDate(strStartDate));
		this.salonInfoDto.setEndDate(DateUtil.parseToDate(strEndDate));
		this.salonService.updateSalon(salonInfoDto);
		this.strEndDate = null;
		this.strStartDate = null;
		//刷新沙龙
		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_ONLINE)) {
			HtmlGeneration.getInstance().refreshSalonOnlinePage(null);
		} else {
			HtmlGeneration.getInstance().refreshSalonOfflinePage(null);
		}
		//刷新经典沙龙
		HtmlGeneration.getInstance().refreshSalonClassicPage(null);
		return "updateSalonSuccess";
	}

	// 删除沙龙
	public String deleteSalon() {
		//String ids = StringUtils.join(this.arrayIds, ",");
		//this.salonService.deleteSalon(ids);
		try{
			dataOperationService.removeSalonByIds(arrayIds);
		}catch(Exception e){
			logger.error(e);
		}
		//刷新沙龙
		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_ONLINE)) {
			HtmlGeneration.getInstance().refreshSalonOnlinePage(null);
		} else {
			HtmlGeneration.getInstance().refreshSalonOfflinePage(null);
		}
		//刷新经典沙龙
		HtmlGeneration.getInstance().refreshSalonClassicPage(null);
		return this.myLaunchSalonList();
	}

	// 删除文章
	public String deleteArticle() {
		//String ids = StringUtils.join(this.arrayIds, ",");
		//this.salonManageService.deleteArticle(ids);
		try{
			dataOperationService.removeArticleByIds(arrayIds);
			//刷新主页面的经典文章
			HtmlGeneration.getInstance().refreshSalonClassicArticlePage(null);
		}catch(Exception e){
			logger.error(e);
		}
		if (this.goFrom != null && this.goFrom.equalsIgnoreCase("1")) {
			return this.toArticleManagePage();
		} else {
			return this.mySalonArticleList();
		}
	}

	// 删除评论
	public String deleteComment() {
		String ids = StringUtils.join(this.arrayIds, ",");
		this.salonManageService.deleteComment(ids);
		return this.toCommentManagePage();
	}

	// 修改评论
	public String modifyComment() {
		this.salonManageService.modifyComment(commentDto);
		return this.toCommentManagePage();
	}

	// 取消参与沙龙
	public String cancelJoinSalon() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		String ids = StringUtils.join(this.arrayIds, ",");
		this.salonManageService.cancelJoinSalon(ids, userId);
		return this.myJoinSalonList();
	}

	// 删除图片或者视频
	public String deleteMedia() {
		String ids = StringUtils.join(this.arrayIds, ",");
		this.salonManageService.deleteMedia(ids);
		try{
			if(ApplicationConstant.MEDIA_TYPE_PICTURE.equals(salonMediaDto.getMediaType())){
				dataOperationService.removePictureMediaByIds(arrayIds);
			}else{
				dataOperationService.removeVedioMediaByIds(arrayIds);
			}
		}catch(Exception e){
			logger.error(e);
		}
		return this.toMediaListBySalonPage();
	}

	// 更新文章
	public String modifySalonArticle() {
		// 检查上传文件的合法性(大小)
		if (!this.checkUploadFileSize(this.uploadPicFile, null, 'p')
				|| !this.checkUploadFileSize(this.uploadVideoFile, null, 'v')||!this.checkUploadFileSize(this.uploadFacePicFile, null, 'p')) {
			return this.toModifyArticlePage();
		}
		String newPicFileName = UploadFileProcessUtil.uploadFile(
				this.uploadPicFile, this.uploadPicFileFileName);
		String newVideoFileName = UploadFileProcessUtil.uploadFile(
				this.uploadVideoFile, this.uploadVideoFileFileName);
		String newFacePicFileName = UploadFileProcessUtil.uploadFile(
				this.uploadFacePicFile, this.uploadFacePicFileFileName);
		if (newPicFileName != null && !newPicFileName.equalsIgnoreCase("")) {
			this.salonArticleDto.setPictureName(newPicFileName);
		}
		if (newFacePicFileName != null && !newFacePicFileName.equalsIgnoreCase("")) {
			this.salonArticleDto.setFacePicName(newFacePicFileName);
		}
		if (newVideoFileName != null && !newVideoFileName.equalsIgnoreCase("")) {
			this.salonArticleDto.setVideoName(newVideoFileName);
		}
		this.salonArticleDto.setSubmitDate(new Date());
		this.salonManageService.modifyArticle(this.salonArticleDto);
		//刷新主页面的经典文章
		HtmlGeneration.getInstance().refreshSalonClassicArticlePage(null);
		return this.toArticleManagePage();
	}

	// 搜索沙龙信息
	public String searchSalon() {
		int pageSize = 10;
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
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		salonSearchVo.setSalonType(this.salonInfoDto.getSalonType());
		salonSearchVo.setCompere(userId);
		// salonSearchVo.setStatus(ApplicationConstant.STATUS_PASSED);
		this.salonList = this.salonSearchService.querySalonList(pageInfo,
				salonSearchVo);
		if(strStartDate == null){
			strEndDate = "";
			strStartDate = "";
		}
		if (this.salonInfoDto.getSalonType().equalsIgnoreCase(
				ApplicationConstant.SALON_TYPE_ONLINE)) {
			return "myLaunchOnlineSalonPage";
		} else {
			return "myLaunchOfflineSalonPage";
		}
	}

	// 搜索文章
	public String searchArticle() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		int pageSize = 10;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		if(this.salonSearchVo==null){
			this.salonSearchVo=new SalonSearchVo();
		}
		this.salonSearchVo.setUserId(userId);
		if (this.salonMediaDto != null
				&& this.salonMediaDto.getSalonId() != null) {
			this.salonSearchVo.setSalonId(this.salonMediaDto.getSalonId());
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

		this.articleList = this.salonSearchService.querySalonArticleList(
				pageInfo, salonSearchVo);
		if (this.goFrom.equalsIgnoreCase("1")) {
			return "personalArticleManage";
		} else {
			return "mySalonArticleList";
		}
	}

	// 搜索评论
	public String searchComment() {
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		int pageSize = 10;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		this.salonSearchVo.setUserId(userId);

		if (this.strStartDate != null
				&& !this.strStartDate.equalsIgnoreCase("")) {
			this.salonSearchVo.setStartDate(DateUtil
					.parseToDate(this.strStartDate));
		}
		if (this.strEndDate != null && !this.strEndDate.equalsIgnoreCase("")) {
			this.salonSearchVo
					.setEndDate(DateUtil.parseToDate(this.strEndDate));
		}
		this.commentList = this.salonManageService.searchAllCommentList(
				pageInfo, this.salonSearchVo);
		return "personalCommentManage";
	}

	// 搜索图片或者视频
	public String searchSalonMedia() {
		super.getLoginUserInfo();
		int pageSize = 8;
		if (this.pageInfo == null) {
			this.pageInfo = new PageInfo();
		}
		this.pageInfo.setPageSize(pageSize);
		salonSearchVo.setSalonType(ApplicationConstant.SALON_TYPE_OFFLINE);
		salonSearchVo.setMediaType(this.salonMediaDto.getMediaType());

		salonSearchVo.setUserId(loginUserInfoDto.getId());
		this.salonList = this.salonManageService
				.searchSalonListBySalonType4Media(pageInfo, salonSearchVo);
		this.uploadFilePath = PropertiesValue
				.getPropertyValueByKey(ApplicationConstant.FILE_SERVER_PATH);
		if (this.salonMediaDto.getMediaType().equalsIgnoreCase(
				ApplicationConstant.MEDIA_TYPE_PICTURE)) {
			return "salonOfflinePictureList";
		} else {
			return "salonOfflineVideoList";
		}
	}

	// 上传视频或图片文件
	public String uploadFilesProcess() {
		List<String> actionMessageList = new ArrayList<String>();
		HttpSession session = ServletActionContext.getRequest().getSession();
		
		List<SalonMediaDto> uploadFileList = new ArrayList<SalonMediaDto>();
		super.getLoginUserInfo();
		Long userId = this.loginUserInfoDto.getId();// get from login user
		this.salonMediaDto.setAuthor(userId); // login user id

		if (this.salonMediaDto.getMediaType().equalsIgnoreCase(
				ApplicationConstant.MEDIA_TYPE_VIDEO)) {
			//检查视频限制
			if(!checkUploadFileSize(null,uploadFiles,'v')){
				return toUploadMediaPage();
			}
			uploadFileList = UploadFileProcessUtil.uploadFiles(
					this.uploadFiles, this.uploadFilesFileName,
					this.uploadFilesSubject, this.uploadCoverFiles,
					this.uploadCoverFilesFileName);
		} else {
			//检查图片限制
			if(!checkUploadFileSize(null,uploadFiles,'p')){
				return toUploadMediaPage();
			}
			uploadFileList = UploadFileProcessUtil.uploadFiles(
					this.uploadFiles, this.uploadFilesFileName,
					this.uploadFilesSubject, null, null);
		}
		this.salonService.saveMediaInfo(salonMediaDto, uploadFileList);

		if (this.salonMediaDto.getMediaType().equalsIgnoreCase(
				ApplicationConstant.MEDIA_TYPE_VIDEO)) {
			this.addActionMessage("视频上传成功");
			actionMessageList.add("视频上传成功");
		} else {
			this.addActionMessage("图片上传成功");
			actionMessageList.add("图片上传成功");
		}
		session.setAttribute("actionMessageList", actionMessageList);
		if (this.goFrom.equalsIgnoreCase("0")) {
			String result = "uploadSuccessToMediaListPage";
			return result;
		} else {
			String result = "uploadSuccessToMediaListBySalonPage";
			return result;
		}
	}

	// 限制上传文件大小(合法的为ture，不合法的为false)
	private boolean checkUploadFileSize(File singleFile, File[] batchFile,
			char fileType) {
		boolean blnCanUpload = false;
		double defileFileSize = 0d;
		String str = "";
		switch (fileType) {
		case 'v':// 属性文件定义的需要限制的文件大小
			defileFileSize = Double
					.parseDouble(PropertiesValue
							.getPropertyValueByKey(ApplicationConstant.UPLOADFILE_VIDEO_SIZE));
			str = "视频文件";
			break;
		case 'p':// 属性文件定义的需要限制的文件大小
			defileFileSize = Double
					.parseDouble(PropertiesValue
							.getPropertyValueByKey(ApplicationConstant.UPLOADFILE_IMG_SIZE));
			str = "图片文件";
			break;
		default:
			defileFileSize = 1d;
		}

		if (singleFile != null) {
			blnCanUpload = FileUtil.getInstance().checkFileSizeByM(singleFile,
					defileFileSize);
		}else{
			blnCanUpload = true;
		}
		if (batchFile != null) {
			blnCanUpload = FileUtil.getInstance().checkFileSizeByM(batchFile,
					defileFileSize);
		}
		if (!blnCanUpload) {
			this.addActionError("上传的" + str + "不能大于" + defileFileSize + "兆");
		}
		return blnCanUpload;
	}

	public ISalonManageService getSalonManageService() {
		return salonManageService;
	}

	public void setSalonManageService(ISalonManageService salonManageService) {
		this.salonManageService = salonManageService;
	}

	public List<SalonInfoDto> getSalonList() {
		return salonList;
	}

	public void setSalonList(List<SalonInfoDto> salonList) {
		this.salonList = salonList;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public SalonInfoDto getSalonInfoDto() {
		return salonInfoDto;
	}

	public void setSalonInfoDto(SalonInfoDto salonInfoDto) {
		this.salonInfoDto = salonInfoDto;
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

	public ISalonService getSalonService() {
		return salonService;
	}

	public void setSalonService(ISalonService salonService) {
		this.salonService = salonService;
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

	public ISalonSearchService getSalonSearchService() {
		return salonSearchService;
	}

	public void setSalonSearchService(ISalonSearchService salonSearchService) {
		this.salonSearchService = salonSearchService;
	}

	public SalonSearchVo getSalonSearchVo() {
		return salonSearchVo;
	}

	public void setSalonSearchVo(SalonSearchVo salonSearchVo) {
		this.salonSearchVo = salonSearchVo;
	}

	public String[] getArrayIds() {
		return arrayIds;
	}

	public void setArrayIds(String[] arrayIds) {
		this.arrayIds = arrayIds;
	}

	public List<SalonArticleDto> getArticleList() {
		return articleList;
	}

	public void setArticleList(List<SalonArticleDto> articleList) {
		this.articleList = articleList;
	}

	public List<SalonMediaDto> getMediaList() {
		return mediaList;
	}

	public void setMediaList(List<SalonMediaDto> mediaList) {
		this.mediaList = mediaList;
	}

	public SalonMediaDto getSalonMediaDto() {
		return salonMediaDto;
	}

	public void setSalonMediaDto(SalonMediaDto salonMediaDto) {
		this.salonMediaDto = salonMediaDto;
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

	public String getGoFrom() {
		return goFrom;
	}

	public void setGoFrom(String goFrom) {
		this.goFrom = goFrom;
	}

	public SalonArticleDto getSalonArticleDto() {
		return salonArticleDto;
	}

	public void setSalonArticleDto(SalonArticleDto salonArticleDto) {
		this.salonArticleDto = salonArticleDto;
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

	public LoginUserInfoDto getLoginUserInfoDto() {
		return loginUserInfoDto;
	}

	public void setLoginUserInfoDto(LoginUserInfoDto loginUserInfoDto) {
		this.loginUserInfoDto = loginUserInfoDto;
	}

	public String getUploadFilePath() {
		return uploadFilePath;
	}

	public void setUploadFilePath(String uploadFilePath) {
		this.uploadFilePath = uploadFilePath;
	}

	public IDataOperationService getDataOperationService() {
		return dataOperationService;
	}

	public void setDataOperationService(IDataOperationService dataOperationService) {
		this.dataOperationService = dataOperationService;
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
}
