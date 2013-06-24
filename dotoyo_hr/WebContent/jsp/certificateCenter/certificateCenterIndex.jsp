<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--猎证中心</title>
	<%String path = request.getContextPath(); %>
	<link href="<%=path%>/css/front-side.css" rel="stylesheet" type="text/css" />
	<link type="image/x-icon" href="/images/dotoyo.ico" rel="shortcut icon">
	<jsp:include page="../common/JsAndCss.jsp"/>
	<script src="<%=path%>/javascripts/common/select.js"></script>
	<script src="<%=path%>/javascripts/common/region.js"></script>
</head>
<body>
<s:include value="/jsp/common/head.jsp"/>
<s:include value="certificateCenterNav.jsp"/>
<s:include value="/html/certificateCenter/certificateCenterIndex.html"/>
<s:include value="/jsp/common/bottom.jsp"/>
</body>
</html>