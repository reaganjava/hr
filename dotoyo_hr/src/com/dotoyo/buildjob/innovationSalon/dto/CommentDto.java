package com.dotoyo.buildjob.innovationSalon.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author Bill xu
 * @dateCreated 2011-01-11
 * @description 评论DTO
 *
 */
public class CommentDto implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;

	private Long subjectId; //评论源ID
	private String subjectType; //评论的类型(0-文章评论,1-图片评论,2-视频评论,3-沙龙评论)
	private String subjectName; //评论的类型(沙龙文章标题,沙龙名称)
	private String status = "0"; //状态(0-待审核,1-通过,2-未通过)
	private String content; //内容
	private Long author;   //作者ID
	private String userName;   //作者
	private Date submitDate; //提交日期
	private String salonName = "";//沙龙名称




	public CommentDto() {
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}




	public Long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Long subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectType() {
		return subjectType == null ? "" : subjectType.trim();
	}
	public void setSubjectType(String subjectType) {
		this.subjectType = subjectType;
	}
	public String getStatus() {
		return status == null ? "" : status.trim();
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public String getContent() {
		return content == null ? "" : content.trim();
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getAuthor() {
		return author;
	}

	public void setAuthor(Long author) {
		this.author = author;
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

	public String getSubjectName() {
		return subjectName == null ? "" : subjectName.trim();
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getSalonName() {
		return salonName;
	}

	public void setSalonName(String salonName) {
		this.salonName = salonName;
	}
	



}
