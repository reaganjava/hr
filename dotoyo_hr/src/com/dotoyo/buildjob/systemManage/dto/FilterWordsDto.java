package com.dotoyo.buildjob.systemManage.dto;

import java.io.Serializable;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;

/**
 * @author tyler.qu
 * @dateCreated 2010-12-2
 * @description 敏感词
 *
 */
public class FilterWordsDto implements Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String words;
	private String notes;
	private Long operator;

	public FilterWordsDto() {
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getWords() {
		return words == null ? "" : words.trim();
	}
	public void setWords(String words) {
		this.words = words;
	}
	public String getNotes() {
		return notes == null ? "" : notes.trim();
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public Long getOperator() {
		return operator;
	}
	public void setOperator(Long operator) {
		this.operator = operator;
	}
	@Override
	public String toString() {
		try {
		    return BeanUtils.describe(this).toString();
		} catch (Exception e) {
		    Logger.getLogger(this.getClass()).error(ApplicationConstant.ERROR_CONVERTING_OBJECT_TO_STRING, e);
		}
		    return super.toString();
	}
}
