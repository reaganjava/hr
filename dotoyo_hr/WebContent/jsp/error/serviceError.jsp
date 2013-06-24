<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--  <meta http-equiv="refresh" content="5;url=<%=request.getContextPath()%>/" />-->
<title>服务器错误</title>
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
<p align="center">服务器发生错误，请稍后再试或联系管理员。5秒钟后自动
<a href="<%=request.getContextPath()%>/">返回首页</a>
</p>
<br/>
<br/>
<p align="center">


<a id="show" href="#" onclick="showErrorDetail();return false;">查看错误信息（仅供开发时使用，5秒钟內F5手动刷新错误页面，否则页面自动跳转）</a>
<a id="hide" href="#" onclick="hideErrorDetail();return false;" style="display:none;">查看错误信息（仅供开发时使用）</a>


</p>
<div id="errorDetail" style="display:none;">
<s:property value="exceptionStack" />
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