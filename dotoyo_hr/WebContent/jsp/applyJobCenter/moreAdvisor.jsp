<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--顾问列表</title>
	<link href="<%=request.getContextPath()%>/css/people.css" rel="stylesheet" type="text/css" />
	<%String path=request.getContextPath(); %>
	<jsp:include page="../common/JsAndCss.jsp"/>
	<jsp:include page="applyJobCenterJS.jsp" />
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<s:include value="applyJobCenterNav.jsp"/>
<!--以上为头部分-->
<!--banner-->
<div class="people-banner">
	<jsp:include page="applyJobCenterHead.jsp" />
</div>
<!--中间部分-->
		<!--顾问列表-->
	    <div class="guwen-more">
        	<div class="jobs-title"><strong>顾问列表</strong></div>
            <div class="people-text2 people-text-bg1">
                <ul>
                  <li class="people1">求职者</li>
                  <li class="people9">职能</li>
                  <li class="people10">意向职位</li>
                    <li class="people4">工作性质</li>
                  <li class="people11">意向工作地点</li>
                    <li class="people6">发布时间</li>
                    <li class="people7">&nbsp;</li>
                    <li class="people8">&nbsp;</li>
                </ul>
            </div>
             <s:iterator value="advisorList">
             <div class="people-text2">
                <ul>
                    <li class="people1" title="<s:property value='userInfo.companyName'/>">
	                    <span style="width:60px;float:left" class="index_hid_css">
	                    	<s:property value="userInfo.companyName"/>
	                    </span>
                    </li>
                	<li class="people9"><s:property value="function.getName()"/></li>
                	<li class="people10" title="<s:property value='expectedPosition'/>">
	                	<span style="width:200px;float:left" class="index_hid_css">
	                		<s:property value="expectedPosition"/>
	                	</span>
                	</li>
                    <li class="people4"><s:property value="jobType.getName()"/></li>
                	<li class="people11" title="<s:property value='province.getName()'/><s:property value='city.getName()'/><s:property value='area.getName()'/>">
	                	<span style="width:130px;float:left" class="index_hid_css">
	                		<s:property value="city.getName()"/><s:property value="area.getName()"/>
	                	</span>
                	</li>
                    <li class="people6"><s:property value="getText('formatDate_yyyy-MM-dd',{submitDate})"/></li>
                    <li class="people7"><a href="#" onclick="javascript:alert('博站链接?userId='+<s:property value="userId"/>);return false;">查看博站</a></li>
                    <li class="people8"><a href="#" onclick="return sendInterviewNotice(<s:property value="id"/>);">邀请面试</a></li>
                </ul>
            </div>
            </s:iterator>
        </div>
    <s:form  id="pageFrom" name="pageFrom" method="POST" action="applyJobCenter!moreAdvisor.action">
       <div class="qx">
 			<s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
       </div>
       <div class="num">
			<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
       </div>
    </s:form>
<!--底部分-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
</html>