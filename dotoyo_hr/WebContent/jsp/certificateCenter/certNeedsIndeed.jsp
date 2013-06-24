<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--猎证中心--急需猎证信息</title>
	<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
	<jsp:include page="../common/JsAndCss.jsp"/>
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<s:include value="certificateCenterNav.jsp"/>
<!--以上为头部分-->
<!--banner-->
<s:include value="certificateCenterHead.jsp"/>
<!--中间部分-->
		<!--顾问列表-->
	    <div class="guwen-more">
        	<div class="jobs-title"><strong>急需猎证信息</strong></div>
            <div class="people-text people-text-bg2">
                <ul>
                    <li class="people1">编号</li>
                    <li class="people2">证书类型</li>
                    <li class="people3">证书名称</li>
                    <li class="people4">挂证地区</li>
                    <li class="people5">需求数量</li>
                    <li class="people6">发布时间</li>
                </ul>
            </div>
            <s:iterator value="certNeedsIndeedList">
	            <div class="people-text">
	                <ul>
	                    <li class="people1"><s:property value="id"/></li>
	                    <li class="people2"><s:property value="certType.getName()"/></li>
	                    <li class="people3"><a target="_blank" href="certificateAction!viewCertNeedsDetail.action?certNeedsId=<s:property value="id"/>&userId=<s:property value="userId"/>"><s:property value="cert.getName()"/></a></li>
	                    <li class="people4" title="<s:property value="province.getName()"/><s:property value="city.getName()"/><s:property value="area.getName()"/>">
		                    <span style="width:180px;float:left" class="index_hid_css"><s:property value="province.getName()"/><s:property value="city.getName()"/><s:property value="area.getName()"/></span>
		                </li>
	                    <li class="people5"><s:property value="certNeedsAmount"/></li>
	                    <li class="people6"><s:property value="getText('formatDate_yyyy-MM-dd',{effDate})"/></li>
	                </ul>
	            </div>
            </s:iterator>
        </div>
    <s:form  id="pageFrom" name="pageFrom" method="POST" action="certificateAction!moreCertNeedsIndeed.action">
       <div class="qx">
       		<s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
       </div>
       <div class="num">
       		<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
       </div>
    </s:form>



<!--底部分-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
</html>