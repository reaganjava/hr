<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大太阳建筑猎头--人才中心</title>
<%String path = request.getContextPath(); %>
<link rel="shortcut icon" href="<%=path%>/images/dotoyo.ico" type="image/x-icon" />
<s:include value="/jsp/common/JsAndCss.jsp"/>
<link href="<%=path%>/css/people.css" rel="stylesheet" type="text/css" />
<s:include value="/jsp/applyJobCenter/applyJobCenterJS.jsp"/>
</head>
<body>
<s:include value="/jsp/common/head.jsp"/>
<s:include value="applyJobCenterNav.jsp"/>
<!--中间部分-->
<div class="people-banner">
	<s:include value="applyJobCenterHead.jsp"/>
</div>
<s:include value="/html/applyJobCenter/applyJobCenterIndex.html"/>
<s:include value="/jsp/common/bottom.jsp"/>
</body>
</html>