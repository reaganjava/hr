<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<%
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--人才挖掘</title>
	<s:include value="/jsp/common/processing.jsp" />
	<s:include value="/jsp/common/JsAndCss.jsp"/>
	<link type="image/x-icon" href="/images/dotoyo.ico" rel="shortcut icon">
	<link href="<%=request.getContextPath()%>/css/index-style.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/excavate.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" />
</head>

<body>
<s:include value="/jsp/common/head.jsp"/>
<s:include value="peopleExcavateNav.jsp"/>
<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js"></script>
<script>
    $(document).ready(function(){
    	$("#peopleBtiExcavateAction").validationEngine();
    });
    /**
	* 限制textarea文本域输入的字符个数
	* @id        textarea表单ID
	* @count 要限制的最大字符数
	*/
	function limitChars(id, count){
	    var obj = document.getElementById(id);
	    if (obj.value.length > count){
	        obj.value = obj.value.substr(0, count);
	    }
	}
	function checkResubmit(){
	    $("#flag").val($("#f").val());
	    $("#bflag").val($("#f").val());
	}
</script>
<%
	response.setHeader("Cache-Control", "no-cache");
%>
<%
  java.util.Random rand = new java.util.Random();  
  Integer flag =new Integer(rand.nextInt());
  String str_flag = flag.toString();
  session.setAttribute("flag",str_flag); 
 %>
<input type="hidden" id="f" value="<%=str_flag%>"/>
<div class="excavate-banner"><span>在这里<strong><s:text name="countOFEnterprise"/></strong>个企业与<strong><s:text name="countOFPersonnel"/></strong>个人才</span></div>
<s:include value="/html/peopleExcavate/peopleExcavateIndexTop.html"/>
<s:include value="/html/peopleExcavate/peopleExcavateIndexAdvert.html"/>
<s:include value="/html/peopleExcavate/peopleExcavateIndexBottom.html"/>
<s:include value="/jsp/common/bottom.jsp"/>
</body>
</html>