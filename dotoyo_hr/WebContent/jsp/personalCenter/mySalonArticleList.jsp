<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-本人观点</title>
	<s:include value="/jsp/common/backgroundUserJsAndCss.jsp"/>
	<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<s:include value="/jsp/common/top.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<div class="content">

      	<s:form id="searchForm" name="searchForm" method="POST" action="salonManageAction!searchArticle.action">
   	 	<s:hidden name="salonMediaDto.salonId" id="salonMediaDto.salonId"/>
    	<div class="administrator-title4"><strong>本人观点</strong></div>
        <div class="inside-search5">
           	<ul>
            	<li>观点标题：<s:textfield id="salonSearchVo.subject" name="salonSearchVo.subject" /></li>
                <li><a href="#" onclick="submitForm(searchForm)"><img src="<%=request.getContextPath()%>/images/inside-botton.png" width="68" height="25" alt="搜索"/></a></li>

            </ul>
        </div>
       </s:form>
        <s:form id="deleteForm" name="deleteForm" method="POST" action="salonManageAction!deleteArticle.action">
        <s:hidden name="salonMediaDto.salonId" id="salonMediaDto.salonId"/>
   	    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size:14px;">
              <tr>
                <td width="5%"><input id="selected" name="selected" type="checkbox" value=""/></td>
               <td width="13%" align="left"><strong>观点标题</strong></td>
                <td width="12%" height="40" align="left"><strong>沙龙名称</strong></td>
                <td width="6%" align="left"><strong>发表时间</strong></td>
                <td width="6%" align="left"><strong>沙龙地点</strong></td>
                <td width="6%" align="left"><strong>操作</strong></td>
              </tr>
             <s:iterator value="articleList">
              <tr>
                <td width="5%"><input id="arrayIds" name="arrayIds" type="checkbox" value="<s:property value="id"/>"/></td>
                <td width="13%" align="left"><s:property value="subject"/></td>
                <td width="12%" height="40" align="left"><s:property value="salonSubject"/></td>
                <td width="10%" align="left"><s:property value="getText('formatDate_fullTime',{submitDate})"/></td>
                <td width="15%" align="left" class="inside-links"><s:property value="salonLocation"/></td>
                <td width="6%" align="left" class="inside-links">
                 <a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="id"/>" target="_blank">查看</a>
                </td>
              </tr>
            </s:iterator>
            </table>
          </s:form>
<s:form  id="pageFrom" name="pageFrom" method="POST" action="salonManageAction!searchArticle.action">
  	 <s:hidden name="salonInfoDto.salonType" id="salonInfoDto.salonType"/>
  	 <s:hidden name="salonMediaDto.salonId" id="salonMediaDto.salonId"/>
     <div class="qx-other">
         <s:property value="pageInfo.htmlListTableFootInfo" escapeHtml="false"/>
     </div>
       	<div class="shanchu">
        	<ul>
                <a href="#" onclick="submitFormChooseCheck(deleteForm,'arrayIds')" title="删除"><li class="botton1">删除</li></a>
            </ul>
		</div>
        <div class="num-other">
    	<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
     </div>

</s:form>


</div>

</body>
</html>