package com.dotoyo.buildjob.innovationSalon.vo;

import java.io.Serializable;
import java.util.Date;

import com.dotoyo.buildjob.common.dto.AreaDto;
import com.dotoyo.buildjob.common.dto.CityDto;
import com.dotoyo.buildjob.common.dto.ProvinceDto;
import com.dotoyo.buildjob.systemManage.dto.ClassMasterDto;
/**
 * @author Bill Xu
 * @dateCreated 2011-01-18
 * @description 沙龙搜索VO
 */
public class SalonSearchVo implements Serializable {

	private static final long serialVersionUID = -7447413618528966622L;

	private String searchTitle;// 搜索主题
	private String searchContent;// 搜索内容
	private String keyWords;// 关键字
	private Date startDate;// 开始日期
	private Date endDate;// 结束日期

	private String subject;// 标题
	private String sponsor;// 主办单位
	private String location;// 去办地点
	private String userName;// 发起人
	private String content;// 内容
	private String author;// 作者

	private String mediaType;// 识别是图片还是视频
	private String salonType; // 沙龙类型 1--线上沙龙,0--线下沙龙
	private String isExcellent ;// 是否经典沙龙 0--否  1--是
	private String oldSalonFlag;
	private Long compere;// 沙龙组织者

	private Long salonId;// 沙龙ID
	private Long userId;// user id
	private String status;// 状态
	private String offlineSalonColumn;
	


	private Date pendingDate;// 用于判断还未结束的沙龙(正在进行中的沙龙)
	
	private String isNew;

	public SalonSearchVo() {

	}

	public String getSearchTitle() {
		return searchTitle == null ? "" : searchTitle.trim();
	}

	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}

	public String getSearchContent() {
		return searchContent == null ? "" : searchContent.trim();
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	public String getKeyWords() {
		return keyWords == null ? "" : keyWords.trim();
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}


	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getSubject() {
		return subject == null ? "" : subject.trim();
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public String getUserName() {
		return userName == null ? "" : userName.trim();
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContent() {
		return content == null ? "" : content.trim();
	}

	public void setContent(String content) {
		this.content = content;
	}



	public String getAuthor() {
		return author == null ? "" : author.trim();
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getMediaType() {
		return mediaType == null ? "" : mediaType.trim();
	}

	public void setMediaType(String mediaType) {
		this.mediaType = mediaType;
	}

	public String getSalonType() {
		return salonType == null ? "" : salonType.trim();
	}

	public void setSalonType(String salonType) {
		this.salonType = salonType;
	}

	public String getIsExcellent() {
		return isExcellent == null ? "" : isExcellent.trim();
	}

	public void setIsExcellent(String isExcellent) {
		this.isExcellent = isExcellent;
	}

	public String getOldSalonFlag() {
		return oldSalonFlag == null ? "" : oldSalonFlag.trim();
	}

	public void setOldSalonFlag(String oldSalonFlag) {
		this.oldSalonFlag = oldSalonFlag;
	}

	public Long getCompere() {
		return compere;
	}

	public void setCompere(Long compere) {
		this.compere = compere;
	}

	public Long getSalonId() {
		return salonId;
	}

	public void setSalonId(Long salonId) {
		this.salonId = salonId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getStatus() {
		return status == null ? "" : status.trim();
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getPendingDate() {
		return pendingDate;
	}

	public void setPendingDate(Date pendingDate) {
		this.pendingDate = pendingDate;
	}

	public String getIsNew() {
		return isNew;
	}

	public void setIsNew(String isNew) {
		this.isNew = isNew;
	}
	public String getOfflineSalonColumn() {
		return offlineSalonColumn;
	}

	public void setOfflineSalonColumn(String offlineSalonColumn) {
		this.offlineSalonColumn = offlineSalonColumn;
	}


}
