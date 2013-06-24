<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理--已申请的职位</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
</head>
<body onload="init()">
<jsp:include page="/jsp/common/top.jsp"></jsp:include>

<!--中间部分-->
<div class="content">
	<jsp:include page="left.jsp"></jsp:include>
    <div id="myJobList" class="content-right">
    	<div class="administrator-title"><strong>已申请职位</strong></div>
    	<s:form name="searchMyJobs" action="personalCenterAction!myAppliedJobs.action" method="post">
        <div class="inside-search">
        	<ul>
            	<li>申请职位：<input name="jobName" type="text" size="17" value="<s:property value="jobName"/>"/></li>
                <li>招聘公司：<input name="companyName" type="text" size="17" value="<s:property value="companyName"/>"/></li>
                <li>职位状态：<s:select list="jobStatus" name="status" value="status">
                			  </s:select>
                </li>
                <li id="inside-search-input"><input type="image" src="<%=request.getContextPath()%>/images/inside-botton.png" /></li>
            </ul>
        </div>
        </s:form>
        <s:form  id="pageFrom" name="pageFrom" method="POST" action="personalCenterAction!myAppliedJobs.action">
        <div class="inside-tab">
   	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="1%"><input id="selected" type="checkbox"/></td>
                <td width="19%" height="40" align="left"><strong>职位名称</strong></td>
                <td width="29%" align="left"><strong>招聘公司</strong></td>
                <td width="13%" align="left"><strong>申请时间</strong></td>
                <td width="12%" align="left"><strong>职位状态</strong></td>
                <td width="12%" align="left"><strong>操作</strong></td>
                <td width="9%"  align="left">&nbsp;</td>
                <td width="9%" align="left">&nbsp;</td>
              </tr>
              <s:iterator value="myAppliedJobList">
	              <tr>
	                <td width="4%"><input name="myJobs" type="checkbox" value="<s:property value="id"/>"/></td>
	                <td width="19%" height="40" align="left"><s:property value="jobName"/></td>
	                <td width="29%" align="left"><s:property value="companyName"/></td>
	                <td width="13%" align="left"><s:property value="getText('format.date',{applicationDate})"/></td>
	                <td width="12%" align="left"><s:if test="status==1">正常</s:if><s:elseif test="status==2">已过期</s:elseif><s:elseif test="status==0">暂停</s:elseif>  </td>
	                <td width="9%" align="left" class="inside-links">
	                <a target="_blank" href="<s:url action="personalCenterAction!myAppliedJobInfoDetail" namespace="/personalCenter">
	                    <s:param name="jobId"><s:property value="jobId"/></s:param></s:url>">职位详细</a>
	                </td>
	              </tr>
              </s:iterator>
        </table>
		</div>
     <div class="qx">
         <s:property value="pageInfo.htmlListTableFootInfo" escapeHtml="false"/>
     </div>
	 <div class="shanchu" onclick="deleteMyJob('myJobs')">删除</div>
     <div class="num">
    	<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
     </div>
	</s:form>
  </div>
</div>
<script type="text/javascript">
function deleteMyJob(checkboxName){
	if(checkStatus(checkboxName)==false) {
		alert('请选中你要删除的职位');
	}else{
		if(window.confirm("你确认要进行此操作吗？")){
		document.pageFrom.action='personalCenterAction!deleteMyJob.action';
		document.pageFrom.method='post';
		document.pageFrom.submit();
		}
	}
}
function init(){
	$("#position_zhaoping_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
	$("#position_receivedApply").addClass("active");
}
</script>
</body>
</html>
