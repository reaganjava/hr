<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>服务已过期</title>
</head>
<body onload='setTimeout("clickClose()",5000)'>
<br/>
<br/>
<br/>
<p align="center" >服务已过期，请重新购买！5秒钟后自动
	<a href="javascript:clickClose()">关闭页面</a>
</p>
<script type="text/javascript">
	function clickClose(){
		window.opener = null;
		window.close();
	}
</script>
</body>
</html>