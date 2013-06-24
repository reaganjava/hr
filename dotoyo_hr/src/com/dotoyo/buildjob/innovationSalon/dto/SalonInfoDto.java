package com.dotoyo.buildjob.innovationSalon.dto;

import java.io.File;
import java.io.Serializable;
import java.util.Date;

/**
 * @author Bill xu
 * @dateCreated 2011-01-06
 * @description 沙龙信息DTO
 *
 */
public class SalonInfoDto implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;

	private String salonType; // 沙龙类型 1--线上沙龙,0--线下沙龙
	private String salonTypeText; // 沙龙类型名字显示
	private String subject; // 沙龙主题
	private String content; // 沙龙简介
	private Date startDate; // 沙龙开始日期
	private Date endDate;// 沙龙结束日期
	private Long compere;// 沙龙组织者
	private String userName;   //作者
	private String sponsor;// 沙龙主办单位
	private String location;// 沙龙举办地点
	private String isExcellent="0";// 是否经典沙龙 0--否  1--是
	private String audiFlag="0";// 沙龙审核标识  0--待审核 1--审核通过  2-审核不通过
	private String subjectPic;// 沙龙主题图片名称
	private Date submitDate; //提交日期
	private Long browseCount = 0L; //点击次数
	private Long reputationCount = 0L;    //好评次数
	private Long schlussgruppeCount = 0L; //差评次数

	private Long salonAttendCount = 0L; //沙龙参加总人数
	private Long salonMediaCount = 0L; //沙龙具有的总图片或者视频总数

	private int intOrder=0; //顺序号
	private int mediaCount; //沙龙具有的图片或者视频的数目
	private int allCount; //沙龙具有的图片或者视频的数目
	public int getAllCount() {
		return allCount;
	}

	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}

	private String isExpired="0";


	public String getIsExpired() {
		return isExpired;
	}

	public void setIsExpired(String isExpired) {
		this.isExpired = isExpired;
	}

	public SalonInfoDto() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSalonType() {
		return salonType;
	}

	public void setSalonType(String salonType) {
		this.salonType = salonType;
	}

	public String getSubject() {
		return subject == null ? "" : subject.trim();
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content == null ? "" : content.trim();
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Long getCompere() {
		return compere;
	}

	public void setCompere(Long compere) {
		this.compere = compere;
	}

	public String getSponsor() {
		return sponsor == null ? "" : sponsor.trim();
	}

	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}

	public String getLocation() {
		return location == null ? "" : location.trim();
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getIsExcellent() {
		return isExcellent == null ? "" : isExcellent.trim();
	}

	public void setIsExcellent(String isExcellent) {
		this.isExcellent = isExcellent;
	}


	public String getSubjectPic() {
		return subjectPic == null ? "" : subjectPic.trim();
	}

	public void setSubjectPic(String subjectPic) {
		this.subjectPic = subjectPic;
	}


	public String getAudiFlag() {
		return audiFlag == null ? "" : audiFlag.trim();
	}

	public void setAudiFlag(String audiFlag) {
		this.audiFlag = audiFlag;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getUserName() {
		return userName == null ? "" : userName.trim();
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}

	public Long getBrowseCount() {
		return browseCount;
	}

	public void setBrowseCount(Long browseCount) {
		this.browseCount = browseCount;
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

	public Long getSalonAttendCount() {
		return salonAttendCount;
	}

	public void setSalonAttendCount(Long salonAttendCount) {
		this.salonAttendCount = salonAttendCount;
	}

	public Long getSalonMediaCount() {
		return salonMediaCount;
	}

	public void setSalonMediaCount(Long salonMediaCount) {
		this.salonMediaCount = salonMediaCount;
	}

	public int getIntOrder() {
		return intOrder;
	}

	public void setIntOrder(int intOrder) {
		this.intOrder = intOrder;
	}

	public int getMediaCount() {
		return mediaCount;
	}

	public void setMediaCount(int mediaCount) {
		this.mediaCount = mediaCount;
	}

	public String getSalonTypeText() {
		return salonTypeText;
	}

	public void setSalonTypeText(String salonTypeText) {
		this.salonTypeText = salonTypeText;
	}

}
