<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--猎证中心--证书查询中心</title>
	<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
	<jsp:include page="../common/JsAndCss.jsp"/>
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<s:include value="certificateCenterNav.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<div class="guwen-more">
  <div class="jobs-title"><strong>证书查询中心</strong></div>
  <div class="certificate-search">
    	<ul>    
    		<s:iterator value="certVerifyInfoList" status="index">
	    		<s:if test="#index.getIndex()%3==0">
	    			<li class="certificate-search1"><a href="<s:property value="verifySite"/>"><s:property value="certName"/></a></li>
	    		</s:if>
	    		<s:if test="#index.getIndex()%3==1">
	    			<li class="certificate-search2"><a href="<s:property value="verifySite"/>"><s:property value="certName"/></a></li>
	    		</s:if>
	    		<s:if test="#index.getIndex()%3==2">
	    			<li class="certificate-search3"><a href="<s:property value="verifySite"/>"><s:property value="certName"/></a></li>
	    		</s:if>
    		</s:iterator>
        </ul>
  </div>
</div>


<!--底部分-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
</html>