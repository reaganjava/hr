package com.dotoyo.buildjob.common.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.dotoyo.buildjob.common.constant.ApplicationConstant;
import com.dotoyo.buildjob.common.dto.PageInfo;

/**
 * @author Bill Xu
 * @dateCreated 2011-01-14
 * @description 获取翻页数据
 *
 */
public class PagingDataListUtil {
	private PagingDataListUtil() {
	}

	private static SqlMapClientTemplate sqlMapClientTemplate;
	private final static String gotoPageJsFunction = "gotoPage";
	private final static String directGotoPageJsFunction = "directGotoPage";

	/**
	 *
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static List getPagingData(PageInfo pageInfo, String querySQLCountId,
			String querySQLId, Map<String, Object> paraMap) {

		if(!pageInfo.getFromFlag().equalsIgnoreCase(ApplicationConstant.PAGING_FROM_FLAGS_NUMBER)){
			pageInfo.setCurrentPageNum(1);
		}
		//reset the from flag
		pageInfo.setFromFlag(ApplicationConstant.PAGING_FROM_FLAGS_OTHER);

		int beginPositionNum = (pageInfo.getCurrentPageNum() - 1)
				* pageInfo.getPageSize();
		int maxResults = pageInfo.getPageSize();

		pageInfo.setTotalNum((Integer) sqlMapClientTemplate.queryForObject(
				querySQLCountId, paraMap));

        List returnList = new ArrayList();
        returnList = sqlMapClientTemplate.queryForList(querySQLId, paraMap,
				beginPositionNum, maxResults);

		pageInfo.setBeginPositionNum(beginPositionNum);
		pageInfo.setEndPositionNum(beginPositionNum + returnList.size());
		pageInfo.setTotalPageNum(getTotalPageNum(pageInfo));
		pageInfo.setPageCountList(packagePageCountList(pageInfo));
		pageInfo.setDispalyPrivousPage(setPrivousPageDisplay(pageInfo));
		pageInfo.setDispalyNextPage(setNextPageDisplay(pageInfo));
		pageInfo.setHtmlListTableFootInfoNoAllCheck(packageListTableFootInfoHtmlNoAllCheck(pageInfo));
		pageInfo.setHtmlListTableFootInfo(packageListTableFootInfoHtml(pageInfo
				.getHtmlListTableFootInfoNoAllCheck()));
		pageInfo.setHtmlPagingInfo(packagePagingInfoHtml(pageInfo));

		return returnList;

	}

	/**
	 *
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static List getPagingData(PageInfo pageInfo, String querySQLCountId,
			String querySQLId, Object paraObj) {
		if(!pageInfo.getFromFlag().equalsIgnoreCase(ApplicationConstant.PAGING_FROM_FLAGS_NUMBER)){
			pageInfo.setCurrentPageNum(1);
		}
		//reset the from flag
		pageInfo.setFromFlag(ApplicationConstant.PAGING_FROM_FLAGS_OTHER);

		int beginPositionNum = (pageInfo.getCurrentPageNum() - 1)
				* pageInfo.getPageSize();
		int maxResults = pageInfo.getPageSize();

		pageInfo.setTotalNum((Integer) sqlMapClientTemplate.queryForObject(
				querySQLCountId, paraObj));
		List returnList = new ArrayList();
	    returnList = sqlMapClientTemplate.queryForList(querySQLId, paraObj,
					beginPositionNum, maxResults);

		pageInfo.setBeginPositionNum(beginPositionNum);
		pageInfo.setEndPositionNum(beginPositionNum + returnList.size());
		pageInfo.setTotalPageNum(getTotalPageNum(pageInfo));
		pageInfo.setPageCountList(packagePageCountList(pageInfo));
		pageInfo.setDispalyPrivousPage(setPrivousPageDisplay(pageInfo));
		pageInfo.setDispalyNextPage(setNextPageDisplay(pageInfo));
		pageInfo.setHtmlListTableFootInfoNoAllCheck(packageListTableFootInfoHtmlNoAllCheck(pageInfo));
		pageInfo.setHtmlListTableFootInfo(packageListTableFootInfoHtml(pageInfo
				.getHtmlListTableFootInfoNoAllCheck()));
		pageInfo.setHtmlPagingInfo(packagePagingInfoHtml(pageInfo));

		return returnList;
	}

	public SqlMapClientTemplate getSqlMapClientTemplate() {
		return sqlMapClientTemplate;
	}

	public void setSqlMapClientTemplate(
			SqlMapClientTemplate sqlMapClientTemplate) {
		PagingDataListUtil.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	// 提供页面显示的翻页的List
	private static List<Integer> packagePageCountList(PageInfo pageInfo) {
		int totalNum = pageInfo.getTotalNum();
		ArrayList<Integer> list = new ArrayList<Integer>();
		if(totalNum <= 0) return list;
		int pageCount4Paging = pageInfo.getPageCount4Paging();
		int pageSize = pageInfo.getPageSize();
		int currentPageNum = pageInfo.getCurrentPageNum();

		// int pagePart = 0; //一共可以分成几段
		int listSize = 0; // 要组装的list的size
		int lastPartListSize = 0; // 最后一段要组装的list的size
		int totalPart = 0; // 一共有多少段
		if (totalNum % (pageCount4Paging * pageSize) == 0) {
			lastPartListSize = pageCount4Paging;
			totalPart = totalNum / (pageCount4Paging * pageSize);
		} else {
			totalPart = totalNum / (pageCount4Paging * pageSize) + 1;
			int raimRecord = totalNum % (pageCount4Paging * pageSize);
			if (raimRecord % pageSize == 0) {
				lastPartListSize = raimRecord / pageSize;
			} else {
				lastPartListSize = raimRecord / pageSize + 1;
			}
		}

		/*int currentPart = 0;// 当前页处于第几段
		if (currentPageNum % pageCount4Paging == 0) {
			currentPart = currentPageNum / pageCount4Paging;
		} else {
			currentPart = (currentPageNum / pageCount4Paging) + 1;
		}

		if (currentPart == totalPart) {// 如果当前处于的段是最后一段
			listSize = lastPartListSize;
		} else {
			listSize = pageCount4Paging;
		}*/

		int beginNum = 1;
		if(currentPageNum>3){
			beginNum = currentPageNum - 2;
		}

		for (int i = 0; i < 5; i++) {
			if(beginNum<=pageInfo.getTotalPageNum()){
				list.add(beginNum);
				beginNum = beginNum + 1;
			}
		}
		return list;
	}

	// 生成表格列表信息HTML
	private static String packageListTableFootInfoHtml(String htmlNoAllCheck) {
        //数据时
		if(htmlNoAllCheck.equalsIgnoreCase("")) return "";
		StringBuffer strFootInfoHtml = new StringBuffer("");
		strFootInfoHtml.append(htmlNoAllCheck);
		strFootInfoHtml	.append("<input id=\"SSS\" name=\"SSS\" type=\"checkbox\" value=\"ffff\"/>&nbsp;&nbsp;全选");
		return strFootInfoHtml.toString();
	}

	// 生成表格列表信息HTML(No all choose check box)
	private static String packageListTableFootInfoHtmlNoAllCheck(
			PageInfo pageInfo) {
		String contextPath = ServletActionContext.getServletContext()
				.getContextPath();
		StringBuffer strFootInfoHtml = new StringBuffer("");
		String strImage = contextPath + "/images/quanxuan-icon.png";
		String strConfirmImage = contextPath + "/images/queding.png";
		//数据总数为0,返回空字符串
		if(pageInfo.getTotalNum() <= 0) return "";

		strFootInfoHtml.append("<ul>");
		strFootInfoHtml.append("<li class=\"qx1\">");
		strFootInfoHtml.append("<img src=\"");
		strFootInfoHtml.append(strImage);
		strFootInfoHtml.append("\" width=\"4\" height=\"7\"/></li>");

		strFootInfoHtml.append("<li>");
		strFootInfoHtml.append("共");
		strFootInfoHtml.append(pageInfo.getTotalNum());
		strFootInfoHtml.append("条");
		strFootInfoHtml.append("</li>");

		strFootInfoHtml.append("<li>显示");
		strFootInfoHtml.append(pageInfo.getBeginPositionNum() + 1);
		strFootInfoHtml.append("-");
		strFootInfoHtml.append(pageInfo.getEndPositionNum());
		strFootInfoHtml.append("条");
		strFootInfoHtml.append("</li>");

		strFootInfoHtml.append("<li>第");
		strFootInfoHtml.append(pageInfo.getCurrentPageNum());
		strFootInfoHtml.append("/");
		strFootInfoHtml.append(pageInfo.getTotalPageNum());
		strFootInfoHtml.append("&nbsp;页");
		strFootInfoHtml.append("</li>");

		strFootInfoHtml.append("<input type=\"hidden\" id=\"totalPageNumId\"");
		strFootInfoHtml.append(" value = \"");
		strFootInfoHtml.append(pageInfo.getTotalPageNum());
		strFootInfoHtml.append("\"/>");

		strFootInfoHtml.append("<input type=\"hidden\" id=\"fromFlagId\" name=\""+pageInfo.getPageInfoName()+".fromFlag\"");
		strFootInfoHtml.append(" value = \"");
		strFootInfoHtml.append(pageInfo.getFromFlag());
		strFootInfoHtml.append("\"/>");

		strFootInfoHtml.append("<li>");
		strFootInfoHtml.append("<input type=\"text\" onkeypress=\"if(event.keyCode==13||event.which==13){return false;}\" id=\"gotoPageNum\"");
		strFootInfoHtml.append(" value = \"");
		strFootInfoHtml.append(pageInfo.getCurrentPageNum());
		strFootInfoHtml.append("\" size=\"1\"/>");
		strFootInfoHtml.append("</li>");

		strFootInfoHtml.append("<li>");
		strFootInfoHtml.append("<img alt=\"确定\" src=\"");
		strFootInfoHtml.append(strConfirmImage);
		strFootInfoHtml.append("\" width=\"63\" height=\"23\"");
		strFootInfoHtml.append(" onclick = \"");
		strFootInfoHtml.append(directGotoPageJsFunction+"('"+pageInfo.getPageInfoName()+"')");
		strFootInfoHtml.append("\" />");
		strFootInfoHtml.append("</li>");

		strFootInfoHtml.append("</ul>");
		return strFootInfoHtml.toString();
	}

	// 生翻页信息HTML
	private static String packagePagingInfoHtml(PageInfo pageInfo) {

		StringBuffer strPagingInfoHtml = new StringBuffer("");
		//数据总数为0,返回空字符串
		if(pageInfo.getTotalNum() <= 0) return "";

		String strNumOnClass = "num-on";
		String strNumOutClass = "num-out";
		int currentPageNum = pageInfo.getCurrentPageNum();

		strPagingInfoHtml
				.append("<input type=\"hidden\" id=\""+pageInfo.getPageInfoName()+".currentPageNum\" name=\""+pageInfo.getPageInfoName()+".currentPageNum\"");
		strPagingInfoHtml.append(" value = \"");
		strPagingInfoHtml.append(pageInfo.getCurrentPageNum());
		strPagingInfoHtml.append("\"/>");

		strPagingInfoHtml.append("<ul>");
		if (pageInfo.isDispalyPrivousPage()) {
			strPagingInfoHtml.append("<li class=\"num-on\">");
			strPagingInfoHtml.append("<a href=\"javascript:");
			strPagingInfoHtml.append(gotoPageJsFunction);
			strPagingInfoHtml.append("(");
			strPagingInfoHtml.append(currentPageNum - 1);
			strPagingInfoHtml.append(",'"+pageInfo.getPageInfoName());
			strPagingInfoHtml.append("')\" ");
			strPagingInfoHtml.append(">上一页");
			strPagingInfoHtml.append("</a>");
			strPagingInfoHtml.append("</li>");
		}
		for (Integer tempPageNum :pageInfo.getPageCountList()) {// 显示的页签
    		strPagingInfoHtml.append("<li class=\"");
			if (tempPageNum == currentPageNum) {
				strPagingInfoHtml.append(strNumOutClass);
			} else {
				strPagingInfoHtml.append(strNumOnClass);
			}
			strPagingInfoHtml.append("\">");
			strPagingInfoHtml.append("<a href=\"javaScript:");
			strPagingInfoHtml.append(gotoPageJsFunction);
			strPagingInfoHtml.append("(");
			strPagingInfoHtml.append(tempPageNum);
			strPagingInfoHtml.append(",'"+pageInfo.getPageInfoName());
			strPagingInfoHtml.append("')\">");
			strPagingInfoHtml.append(tempPageNum);
			strPagingInfoHtml.append("</a></li>");
		}
		if (pageInfo.isDispalyNextPage()) {
			strPagingInfoHtml.append("<li class=\"num-on\">");
			strPagingInfoHtml.append("<a href=\"javascript:");
			strPagingInfoHtml.append(gotoPageJsFunction);
			strPagingInfoHtml.append("(");
			strPagingInfoHtml.append(currentPageNum + 1);
			strPagingInfoHtml.append(",'"+pageInfo.getPageInfoName());
			strPagingInfoHtml.append("')\" ");
			strPagingInfoHtml.append(">下一页");
			strPagingInfoHtml.append("</a>");
			strPagingInfoHtml.append("</li>");
		}
		strPagingInfoHtml.append("</ul>");
		return strPagingInfoHtml.toString();
	}

	// 一共有多少页
	private static int getTotalPageNum(PageInfo pageInfo) {
		int totalPageNum = 0;
		int totalNum = pageInfo.getTotalNum();
		int pageSize = pageInfo.getPageSize();

		if (totalNum % pageSize == 0) {
			totalPageNum = totalNum / pageSize;
		} else {
			totalPageNum = totalNum / pageSize + 1;
		}
		return totalPageNum;
	}

	// 判断是否需要显示上一页
	private static boolean setPrivousPageDisplay(PageInfo pageInfo) {
		boolean tempIsDisplay = false;
		if (pageInfo.getCurrentPageNum() > 1) {
			tempIsDisplay = true;
		}
		return tempIsDisplay;
	}

	// 判断是否需要显示下一页

	private static boolean setNextPageDisplay(PageInfo pageInfo) {
		int totalNum = pageInfo.getTotalNum();
		if(totalNum <=0 ) return false;
		int pageSize = pageInfo.getPageSize();
		ArrayList<Integer> pageCountList = new ArrayList<Integer>();
		pageCountList = (ArrayList<Integer>) pageInfo.getPageCountList();
		boolean tempIsDisplay = true;
		if (pageCountList != null && pageCountList.size() > 0) {
			if (pageInfo.getCurrentPageNum() == pageCountList.get(pageCountList
					.size() - 1)) {
				if (pageCountList.get(pageCountList.size() - 1) * pageSize >= totalNum) {
					tempIsDisplay = false;
				}

			}
		}
		return tempIsDisplay;
	}

}
