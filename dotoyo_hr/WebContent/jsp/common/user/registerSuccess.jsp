<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册成功</title>
<%String path = request.getContextPath();%>
</head>
<body>
<script type="text/javascript">
	if(window.confirm("注册成功！是否立即完善博站资料？")){
		window.location.replace("<%=path%>/blogUserAction!toCompleteBlogUserInfo.action");
	}
	else{
		window.location.replace("<%=path%>/");
	}
</script>
</body>
</html>