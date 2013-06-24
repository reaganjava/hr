<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大太阳建筑猎头-创业沙龙-参加用户</title>
<s:include value="/jsp/common/JsAndCss.jsp"/>
<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
</head>
<body>
<s:include value="/jsp/common/head.jsp"/>
<s:include value="innovationSalonNav.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<s:form  id="pageFrom" name="pageFrom" method="POST" action="salonSearchAction!userListInfo.action">
<s:hidden id="salonSearchVo.salonId" name="salonSearchVo.salonId"/>
<div class="index-login-box">
  <div class="jobs-title"><strong>用户列表</strong></div>
  <div class="results-list-tab">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" align="left"></td>
                <td width="16%" height="40" align="left"><strong>用户名称</strong></td>
                <td width="9%" align="left"><strong>参加日期</strong></td>
              </tr>
            <s:iterator value="userInforList">
              <tr>
                <td width="16%" height="40" align="left"><a href="<s:property value="blogWebUrl"/>?userName=<s:property value="userName"/>" target="_blank" ><img src="<%=request.getContextPath()%>/pic/user-images6.jpg" width="48" height="48" /></a></td>
                <td width="6%" align="left"><s:property value="userName"/></td>
                <td width="9%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{registerDate})"/></td>
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
