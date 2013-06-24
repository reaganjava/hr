<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大太阳建筑猎头-创业沙龙-文章</title>
<s:include value="/jsp/common/JsAndCss.jsp"/>
<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
</head>
<body>
<s:include value="/jsp/common/head.jsp"/>
<s:include value="innovationSalonNav.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<s:form  id="pageFrom" name="pageFrom" method="POST" action="salonSearchAction!searchArticle.action">
<s:hidden id="salonSearchVo.isExcellent" name="salonSearchVo.isExcellent"/>
<s:hidden id="salonSearchVo.salonId" name="salonSearchVo.salonId"/>
<div class="index-login-box">
  <div class="jobs-title"><strong>文章列表</strong></div>
  <div class="results-list">
       <ul>
           <li class="results0">文章标题：</li>
           <li>
           		<s:textfield id="subjectHid" name="salonSearchVo.subject" cssStyle="display:none"/>
           		<input type="text" id="subject" value="<s:text name="salonSearchVo.subject"/>"/>
           	</li>
           <li class="results0">作者：</li>
           <li>
           		<s:textfield id="userNameHid" name="salonSearchVo.userName" cssStyle="display:none"/>
           		<input type="text" id="userName" value="<s:text name="salonSearchVo.userName"/>" />
           </li>

           <li><a href="#" onclick="
           	document.getElementById('subjectHid').value=document.getElementById('subject').value;
           	document.getElementById('userNameHid').value=document.getElementById('userName').value;
            document.getElementById('pageFrom').submit()"><img src="<%=request.getContextPath()%>/images/inside-botton.png" /></a>
           </li>
       </ul>
  </div>
  <div class="results-list-tab">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="16%" height="40" align="left"><strong>文章标题</strong></td>
                <td width="6%" align="left"><strong>作者</strong></td>
                <td width="9%" align="left"><strong>发表日期</strong></td>
              </tr>
            <s:iterator value="salonArticleList">
              <tr>
                <td width="16%" height="40" align="left"><a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="id"/>" target="_blank"><s:property value="subject"/></a></td>
                <td width="6%" align="left"><s:property value="userName"/></td>
                <td width="9%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{submitDate})"/></td>
              </tr>
            </s:iterator>
            </table>
  </div>

</div>
<div class="qx">
   <s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
</div>
<div class="num">
   <s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
</div>
</s:form>
<s:include value="../common/bottom.jsp"/>
</body>
</html>
