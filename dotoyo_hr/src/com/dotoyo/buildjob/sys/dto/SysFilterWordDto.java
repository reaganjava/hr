package com.dotoyo.buildjob.sys.dto;

import java.io.Serializable;
import java.util.Date;
/**
 * 过滤词
 * @author wisdy.xiao
 *
 */
public class SysFilterWordDto implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = -899625069924698200L;
	private Long id;
	private String words;     //过滤词
	private String notes;     //备注
	private Long operator;    //操作人
	private String operatorName; //操作人名称
	private Date last_edit_date; //最后更新日期
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getWords() {
		return words != null ? words.trim() : "";
	}
	public void setWords(String words) {
		this.words = words;
	}
	public String getNotes() {
		return notes != null ? notes.trim() : "";
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
	public Date getLast_edit_date() {
		return last_edit_date;
	}
	public void setLast_edit_date(Date lastEditDate) {
		last_edit_date = lastEditDate;
	}
	public String getOperatorName() {
		return operatorName == null ? "" : operatorName;
	}
	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

}
