<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="<%=request.getContextPath()%>/javascripts/common/jquery.js"></script>
<title>发起沙龙成功</title>
</head>
<body>
<script type="text/javascript">
alert("沙龙发起成功，请等待管理员审核.");
window.location.href = "<%=request.getContextPath()%>/salonAction!init.action";
</script>
</body>
</html>