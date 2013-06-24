<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="refresh" content="5;url=<%=request.getContextPath()%>/" />
<title>页面不存在</title>
<script src="<%=request.getContextPath()%>/javascripts/common/jquery.js"></script>
</head>
<body>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<p align="center">你访问的页面不存在。5秒钟后自动
<a href="<%=request.getContextPath()%>">返回首页</a>
</p>
<br/>
<br/>
<div id="errorDetail" style="display:none;">
</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<script type="text/javascript">
function showErrorDetail(){
	$("#show").hide();
	$("#hide").show();
	$("#errorDetail").show();
}
function hideErrorDetail(){
	$("#hide").hide();
	$("#show").show();
	$("#errorDetail").hide();
}
</script>
</body>
</html>