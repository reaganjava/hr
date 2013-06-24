package com.dotoyo.buildjob.innovationSalon.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Bill xu
 * @dateCreated 2011-01-11
 * @description 沙龙图片或者视频DTO
 *
 */
public class SalonMediaDto implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;

	private Long salonId;  //沙龙ID
	private Long author;   //作者ID
	private String userName;   //作者
	private String mediaType ;//类型(0-图片,1-视频)
	private String MediaName;//图片或者视频的名称
	private String status = "0"; //状态
	private String subject; //标题
	private Date submitDate; //提交日期
	private String videoCoverPic; //视频封面图片名称
	private String isExcellent="0";// 是否经典 0--否  1--是
	private String salonType="";// 是否经典 0--否  1--是


	//private Long salonId

	public SalonMediaDto() {
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
	public String getStatus() {
		return status == null ? "" : status.trim();
	}
	public void setStatus(String status) {
		this.status = status;
	}


	public String getSubject() {
		return subject == null ? "" : subject.trim();
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Long getAuthor() {
		return author;
	}
	public void setAuthor(Long author) {
		this.author = author;
	}

	public String getMediaType() {
		return mediaType == null ? "" : mediaType.trim();
	}

	public void setMediaType(String mediaType) {
		this.mediaType = mediaType;
	}

	public String getMediaName() {
		return MediaName == null ? "" : MediaName.trim();
	}

	public void setMediaName(String mediaName) {
		MediaName = mediaName;
	}

	public Date getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}
	public String getUserName() {
		return userName == null ? "" : userName.trim();
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getVideoCoverPic() {
		return videoCoverPic == null ? "" : videoCoverPic.trim();
	}
	public void setVideoCoverPic(String videoCoverPic) {
		this.videoCoverPic = videoCoverPic;
	}
	public void setIsExcellent(String isExcellent) {
		this.isExcellent = isExcellent;
	}
	public String getIsExcellent() {
		return isExcellent == null ? "" : isExcellent.trim();
	}
	public void IsExcellent(String isExcellent) {
		this.isExcellent = isExcellent;
	}
	public String getSalonType() {
		return salonType;
	}
	public void setSalonType(String salonType) {
		this.salonType = salonType;
	}
}
