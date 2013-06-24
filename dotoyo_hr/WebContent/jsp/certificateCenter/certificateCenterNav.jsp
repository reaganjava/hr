<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<script type="text/javascript">
function recoverMenu(){
	for(var i=1;i<=6;i++)
	{
		$("#menu0"+i).attr("class","nav-on");
	}
	$("#menu05").attr("class","nav-out");
}
</script>
<div class="nav">
	<ul>
    	<li id="menu01" class="nav-on" onmouseover="changeMenu(this)" onmouseout="recoverMenu()"><a href="<%=request.getContextPath()%>/">首页</a></li>
        <li id="menu02" class="nav-on" onmouseover="changeMenu(this)" onmouseout="recoverMenu()"><a href="<%=request.getContextPath()%>/headhunterCenter/">猎头中心</a></li>
        <li id="menu03" class="nav-on" onmouseover="changeMenu(this)" onmouseout="recoverMenu()"><a href="<%=request.getContextPath()%>/applyJobCenter/">人才中心</a></li>
        <li id="menu04" class="nav-on" onmouseover="changeMenu(this)" onmouseout="recoverMenu()"><a href="<%=request.getContextPath()%>/peopleExcavate/">人才挖掘</a></li>
        <li id="menu05" class="nav-out" onmouseover="changeMenu(this)" onmouseout="recoverMenu()"><a href="<%=request.getContextPath()%>/certificateCenter/">猎证中心</a></li>
        <li id="menu06" class="nav-on" onmouseover="changeMenu(this)" onmouseout="recoverMenu()"><a href="<%=request.getContextPath()%>/innovationSalon/">创业沙龙</a></li>
    </ul>
</div>