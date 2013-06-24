package com.dotoyo.buildjob.sys.dto;

import java.io.File;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dotoyo.buildjob.common.util.StringUtil;
/**
 * 广告
 * @author wisdy.xiao
 *
 */
public class SysAdDto implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 5438196475883140567L;
	private Long id;
	private String oldTitle;
	private String title;     //广告标题
	private String company;   //公司
	private String city;      //公司所在城市
	private String province;  //公司所在省市
	private String position;  //位置
	private String oldPosition;
	private String positionName;  //位置
	private Date startDate;   //广告时段-开始
	private Date stopDate;   //广告时段-开始
	private String start;
	private Date endDate;     //广告时段-结束
	private String end;
	private String status;    //状态
	private String type;      //类型
	private String typeContent; //广告内容
	private String url;       //路径
	private String width;     //长
	private String height;    //宽
	private String description; //介绍
	private File  file; //文件上传对象
	private String imgName;//图片名称
	private String serverUrl; //图片服务地址
	private Date currentDate;
	private SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	private int index=0;
	private String adindex; //索引
	private int limitNumber;

	public String getOldPosition() {
		return oldPosition;
	}
	public void setOldPosition(String oldPosition) {
		this.oldPosition = oldPosition;
	}
	public int getLimitNumber() {
		return limitNumber;
	}
	public void setLimitNumber(int limitNumber) {
		this.limitNumber = limitNumber;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title != null ? title.trim() : "";
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCompany() {
		return company != null ? company.trim() : "";
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPosition() {
		return position != null ? position.trim() : "";
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Date getStartDate() throws ParseException {
		if(start != null && !start.equals("")){
			if(StringUtil.newInstance().sNull(start).equals("")) return null;
			return simpleFormat.parse(start);
		}
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public String getStart() {
		return start != null ? start.trim() : "";
	}
	public void setStart(String start) {
		this.start = start;
	}
	public Date getEndDate() throws ParseException {
		if(end != null && !end.equals("")){
			if(StringUtil.newInstance().sNull(end).equals("")) return null;
			return simpleFormat.parse(end);
		}
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getEnd() {
		return end != null ? end.trim() : "";
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getStatus() {
		return status  == null ? "" : status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getType() {
		return type == null ? "" : type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUrl() {
		return url != null ? url.trim() : "";
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getWidth() {
		return width != null ? width.trim() : "";
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getHeight() {
		return height != null ? height.trim() : "";
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getPositionName() {
		return positionName == null ? "" : positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public Date getStopDate() {
		return stopDate;
	}
	public void setStopDate(Date stopDate) {
		this.stopDate = stopDate;
	}
	public String getDescription() {
		return description != null ? description.trim() : "";
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getOldTitle() {
		return oldTitle == null ? "" : oldTitle;
	}
	public void setOldTitle(String oldTitle) {
		this.oldTitle = oldTitle;
	}
	public String getTypeContent() {
		return typeContent;
	}
	public void setTypeContent(String typeContent) {
		this.typeContent = typeContent;
	}
	public String getCity() {
		return city == null ? "" : city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getProvince() {
		return province == null ? "" : province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getImgName() {
		return imgName == null ? "" : imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getServerUrl() {
		return serverUrl == null ? "" : serverUrl;
	}
	public void setServerUrl(String serverUrl) {
		this.serverUrl = serverUrl;
	}
	public void setCurrentDate(Date currentDate) {
		this.currentDate = currentDate;
	}
	public Date getCurrentDate() {
		return currentDate;
	}

	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getAdindex() {
		return adindex != null ? adindex.trim() : "";
	}
	public void setAdindex(String adindex) {
		this.adindex = adindex;
	}

}
