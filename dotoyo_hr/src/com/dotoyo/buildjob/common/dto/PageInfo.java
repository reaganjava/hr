package com.dotoyo.buildjob.common.dto;

import java.io.Serializable;
import java.util.List;

/**
 * Page-information class, wrap the paging parameters.
 *
 * @author Bill xu
 *
 */
public class PageInfo implements Serializable {
	/**
	 * pageInfo 成员变量名称设置,默认pageInfo
	 */
	private String pageInfoName = "pageInfo";
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * Current page number.
	 */
	private int currentPageNum=1;
	/**
	 * Record size per page.
	 */
	private int pageSize = 10;

	/**
	 * Total number of records.
	 */
	private int totalNum;
	/**
	 * The description of order columns.
	 */

	/**
	 * 每个页面设置最多显示多少个可以翻页的页签
	 */
	private int pageCount4Paging = 5;
	/**
	 * 每个页面要显示多少个页面可以翻页List
	 * @return
	 */
	private List<Integer> pageCountList;
	/**
	 * 是否要显示上一页
	 */
	private boolean isDispalyPrivousPage =true;
	/**
	 * 是否要显示下一页
	 */
	private boolean isDispalyNextPage =true;

	/**
	 * 本页从第几条开始
	 */
	private int beginPositionNum;
	/**
	 * 本页显示到第几条
	 */
	private int endPositionNum;

	/**
	 * 跳到第几页
	 * @return
	 */
	private int gotoPageNum;

	/**
	 * 总页数
	 */
	private int totalPageNum;

	private String htmlListTableFootInfo;
	/**
	 * (No all choose check box)
	 */
	private String htmlListTableFootInfoNoAllCheck;
	private String htmlPagingInfo;

	private String fromFlag = "0";

	public int getCurrentPageNum() {
		return currentPageNum;
	}

	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getPageCount4Paging() {
		return pageCount4Paging;
	}

	public void setPageCount4Paging(int pageCount4Paging) {
		this.pageCount4Paging = pageCount4Paging;
	}



	public boolean isDispalyPrivousPage() {
		return isDispalyPrivousPage;
	}

	public void setDispalyPrivousPage(boolean isDispalyPrivousPage) {
		this.isDispalyPrivousPage = isDispalyPrivousPage;
	}

	public boolean isDispalyNextPage() {
		return isDispalyNextPage;
	}

	public void setDispalyNextPage(boolean isDispalyNextPage) {
		this.isDispalyNextPage = isDispalyNextPage;
	}

	public int getBeginPositionNum() {
		return beginPositionNum;
	}

	public void setBeginPositionNum(int beginPositionNum) {
		this.beginPositionNum = beginPositionNum;
	}

	public int getEndPositionNum() {
		return endPositionNum;
	}

	public void setEndPositionNum(int endPositionNum) {
		this.endPositionNum = endPositionNum;
	}

	public int getGotoPageNum() {
		return gotoPageNum;
	}

	public void setGotoPageNum(int gotoPageNum) {
		this.gotoPageNum = gotoPageNum;
	}
	public List<Integer> getPageCountList() {
		return pageCountList;
	}

	public void setPageCountList(List<Integer> pageCountList) {
		this.pageCountList = pageCountList;
	}

	/**
	 * The default constructor.
	 */
	public PageInfo() {

	}

	public String getHtmlListTableFootInfo() {
		return htmlListTableFootInfo;
	}

	public void setHtmlListTableFootInfo(String htmlListTableFootInfo) {
		this.htmlListTableFootInfo = htmlListTableFootInfo;
	}

	public String getHtmlPagingInfo() {
		return htmlPagingInfo;
	}

	public void setHtmlPagingInfo(String htmlPagingInfo) {
		this.htmlPagingInfo = htmlPagingInfo;
	}

	public int getTotalPageNum() {
		return totalPageNum;
	}

	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}

	public String getHtmlListTableFootInfoNoAllCheck() {
		return htmlListTableFootInfoNoAllCheck;
	}

	public void setHtmlListTableFootInfoNoAllCheck(
			String htmlListTableFootInfoNoAllCheck) {
		this.htmlListTableFootInfoNoAllCheck = htmlListTableFootInfoNoAllCheck;
	}

	public String getFromFlag() {
		return fromFlag;
	}

	public void setFromFlag(String fromFlag) {
		this.fromFlag = fromFlag;
	}

	public String getPageInfoName() {
		return pageInfoName;
	}

	public void setPageInfoName(String pageInfoName) {
		this.pageInfoName = pageInfoName;
	}


}
