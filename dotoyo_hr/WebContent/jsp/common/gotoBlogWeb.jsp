<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="refresh" content="5;url=<s:property value="blogWebUrl"/>" />
	<title>跳转到博站</title>
</head>
<body>
<br/>
<br/>
<br/>
<p align="center"><s:property value="remindMsg"/>
	<a href="<%=request.getContextPath()%>/">返回主页</a></p>
</body>
</html>