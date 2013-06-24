<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="userLogon.action">
    <img src="<%=request.getContextPath()%>/jcaptcha"
	     onclick="changeImage(this)" alt="click to refresh"	
	     style="cursor: pointer;" id="kaptchaImage"> 
	<input type='text' name='captcha' value=''> 
	<s:submit></s:submit>
</form>
</body>
</html>
<script type="text/javascript">
	function changeImage(obj){
		obj.src="<%=request.getContextPath()%>"+"/jcaptcha?"+Math.random();
		// document.getElementById('kaptchaImage').src = 'jcaptcha?captchaId=' + Math.random(); 
	}
</script>