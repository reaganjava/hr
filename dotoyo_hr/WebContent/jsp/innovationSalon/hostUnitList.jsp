<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大太阳建筑猎头-创业沙龙-主办单位</title>
<s:include value="/jsp/common/JsAndCss.jsp"/>
<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
</head>
<body>
<s:include value="/jsp/common/head.jsp"/>
<s:include value="innovationSalonNav.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<s:form  id="pageFrom" name="pageFrom" method="POST" action="salonSearchAction!serrchHostUnit.action">
<s:hidden id="salonSearchVo.salonId" name="salonSearchVo.salonId"/>
<div class="index-login-box">
  <div class="jobs-title"><strong>主办单位列表</strong></div>
  <div class="results-list-tab">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="15%" align="left"></td>
                <td width="20%" height="40" align="left"><strong>单位名称</strong></td>
                <td width="20%" align="left"><strong>单位简介</strong></td>
              </tr>
            <s:iterator value="queryHostUnitList">
              <tr>
                <td width="15%" height="40" align="left"><a href="<s:property value="linkURL"/>" target="_blank"><img src="<s:property value="uploadFilePath"/>/<s:property value="pictureName"/>" width="120" height="90" /></a>&nbsp;</td>
                <td width="20%" align="left"><a href="<s:property value="linkURL"/>" target="_blank"><s:property value="unitName"/></a></td>
                <td width="20%" align="left" title="<s:property value="introduction"/>"><span class="index_hid_css" style="width:150px;float:left"><s:property value="introduction"/></span></td>
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
