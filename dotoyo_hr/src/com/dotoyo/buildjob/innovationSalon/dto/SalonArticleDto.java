package com.dotoyo.buildjob.innovationSalon.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author Bill xu
 * @dateCreated 2011-01-07
 * @description 沙龙文章DTO
 *
 */
public class SalonArticleDto implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;

	private Long salonId;  //针对的沙龙
	private String subject; //文章标题
	private String shortSubject; //短标题，为了界面显示
	private Long author;   //上传者ID
	private String authorName;   //作者
	

	private String userName;   //作者(或上传者)
	private String content; //内容
	private String pictureName;  //图片名称
	private String videoName;    //视频名称
	private Date submitDate;     //发表日期
	private String articleStatus;//状态
	private String isExcellent = "0" ;  //是否经典
	private Long browseCount = 0L;    //被浏览次数
	private String isRecomment = "0";  //是否推荐
	private String iscream ="0";      //是否精华
	private String styleClass="line-dl1";

	private Long reputationCount = 0L;    //好评次数
	private Long schlussgruppeCount = 0L; //差评次数

	private Long commentCount = 0L; //文章的评论数目

	private String offlineSalonColumn; //线下沙龙栏目(线上沙龙此列为空)
	private String offlineSalonColumnName; //线下沙龙栏目(线上沙龙此列为空)


	private String articleBelongTo;    //线下沙龙文章的作者(线上沙龙为空)
	private String facePicName;        //线下沙龙头像(沙龙详情页面)

	private String salonSubject;  //沙龙名称
	private String salonLocation;  //沙龙名称
	private String salonType;  //沙龙类型

	public SalonArticleDto() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getSalonId() {
		return salonId;
	}

	public void setSalonId(Long salonId) {
		this.salonId = salonId;
	}

	public Long getAuthor() {
		return author;
	}

	public void setAuthor(Long author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPictureName() {
		return pictureName == null ? "" : pictureName.trim();
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public String getVideoName() {
		return videoName == null ? "" : videoName.trim();
	}

	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}

	public Date getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}

	public String getArticleStatus() {
		return articleStatus == null ? "" : articleStatus.trim();
	}

	public void setArticleStatus(String articleStatus) {
		this.articleStatus = articleStatus;
	}

	public String getIsExcellent() {
		return isExcellent == null ? "" : isExcellent.trim();
	}

	public void setIsExcellent(String isExcellent) {
		this.isExcellent = isExcellent;
	}

	public Long getBrowseCount() {
		return browseCount;
	}

	public void setBrowseCount(Long browseCount) {
		this.browseCount = browseCount;
	}

	public String getIsRecomment() {
		return isRecomment == null ? "" : isRecomment.trim();
	}

	public void setIsRecomment(String isRecomment) {
		this.isRecomment = isRecomment;
	}

	public String getIscream() {
		return iscream == null ? "" : iscream.trim();
	}

	public void setIscream(String iscream) {
		this.iscream = iscream;
	}

	public String getSubject() {
		return subject == null ? "" : subject.trim();
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getUserName() {
		return userName == null ? "" : userName.trim();
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Long getReputationCount() {
		return reputationCount;
	}

	public void setReputationCount(Long reputationCount) {
		this.reputationCount = reputationCount;
	}

	public Long getSchlussgruppeCount() {
		return schlussgruppeCount;
	}

	public void setSchlussgruppeCount(Long schlussgruppeCount) {
		this.schlussgruppeCount = schlussgruppeCount;
	}

	public Long getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Long commentCount) {
		this.commentCount = commentCount;
	}

	public String getOfflineSalonColumn() {
		return offlineSalonColumn == null ? "" : offlineSalonColumn.trim();
	}

	public void setOfflineSalonColumn(String offlineSalonColumn) {
		this.offlineSalonColumn = offlineSalonColumn;
	}

	public String getArticleBelongTo() {
		return articleBelongTo == null ? "" : articleBelongTo.trim();
	}

	public void setArticleBelongTo(String articleBelongTo) {
		this.articleBelongTo = articleBelongTo;
	}

	public String getFacePicName() {
		return facePicName == null ? "" : facePicName.trim();
	}

	public void setFacePicName(String facePicName) {
		this.facePicName = facePicName;
	}

	public String getSalonSubject() {
		return salonSubject == null ? "" : salonSubject.trim();
	}

	public void setSalonSubject(String salonSubject) {
		this.salonSubject = salonSubject;
	}

	public String getSalonLocation() {
		return salonLocation == null ? "" : salonLocation.trim();
	}

	public void setSalonLocation(String salonLocation) {
		this.salonLocation = salonLocation;
	}

	public String getShortSubject() {
		return shortSubject;
	}

	public void setShortSubject(String shortSubject) {
		this.shortSubject = shortSubject;
	}

	public String getSalonType() {
		return salonType;
	}

	public void setSalonType(String salonType) {
		this.salonType = salonType;
	}
	public String getOfflineSalonColumnName() {
		return offlineSalonColumnName;
	}

	public void setOfflineSalonColumnName(String offlineSalonColumnName) {
		this.offlineSalonColumnName = offlineSalonColumnName;
	}
	public String getStyleClass() {
		return styleClass;
	}

	public void setStyleClass(String styleClass) {
		this.styleClass = styleClass;
	}
	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

}
