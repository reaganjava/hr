<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascripts/common/jquery.js"></script> 
<script type="text/javascript">
	$(function(){
		$("#submit").click(function(){
			document.getElementById("loading").innerHTML="<img src='<%=request.getContextPath() %>/images/Process.gif' style='padding-top:10px'>";
			document.all('LoadProcess').style.visibility="visible";
		});	
	});
</script>

</head>
<body>
<div id="LoadProcess" style="position:absolute; left:0px; top:0px; width:100%; height:100%; z-index:100; visibility:hidden; filter:alpha(opacity=70); opacity:0.7">  
  <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0"> 
    <tr>  
      <td align="center" bgcolor="#FFFFFF">
      <div id="loading"></div>
      <br/>
      	<span class="STYLE1">请稍候，正在加载数据...... </span>
      </td> 
    </tr>
  </table> 
</div>

</body>
</html>