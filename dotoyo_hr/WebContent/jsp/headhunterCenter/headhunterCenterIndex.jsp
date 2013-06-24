<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-猎头中心</title>
	<link type="image/x-icon" href="/images/dotoyo.ico" rel="shortcut icon">
	<s:include value="/html/common/JsAndCss.html"></s:include>
	<link href="<%=request.getContextPath()%>/css/head.css" rel="stylesheet" type="text/css" />
	<script src="<%=request.getContextPath()%>/javascripts/common/headHunterCenter.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
</head>
<body>
<s:include value="/jsp/common/head.jsp"></s:include>
<s:include value="headhunterCenterNav.jsp"/>
<s:include value="/html/headhunterCenter/headhunterCenterIndexTop.html"></s:include>
<s:include value="/html/headhunterCenter/headhunterCenterIndexAdvert.html"></s:include>
<s:include value="/html/headhunterCenter/headhunterCenterIndexBottom.html"></s:include>
<s:include value="/jsp/common/bottom.jsp"></s:include>
<script type="text/javascript">
function showRequest(formData, jqForm, options) {
    return true;
}
</script>
</body>
</html>