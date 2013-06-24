<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-企业后台</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
	<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
</head>

<body onload="init()">
<jsp:include page="/jsp/common/top.jsp"></jsp:include>

<div class="content">
<jsp:include page="left.jsp"></jsp:include>
<div class="content-right">
    	<div class="administrator-title"><strong>收到的职位申请</strong></div>
    	<s:form  id="pageFrom" name="pageFrom" method="POST" action="applicationsReceivedAction!applicationsReceiveds.action">
    	<s:hidden name="jobSearchVo.applyJobQueryType"></s:hidden>
        <div class="inside-search">
        	<ul>
            	<li>职位名称:<input type="text" id="jobNameFalse" name="jobNameFalse" size="17" value="<s:property value='jobSearchVo.jobName'/>"/></li>
                <li id="inside-search-input" onclick="setSearchValue()">
                	<input type="image" src="<%=request.getContextPath()%>/images/inside-botton.png" />
                </li>
            </ul>
        </div>
        <s:hidden id="jobName" name="jobSearchVo.jobName"></s:hidden>
        <div class="inside-tab">
   	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><input id="selected" name="selected" type="checkbox" /></td>
                <td width="25%" height="40" align="left"><strong>职位名称</strong></td>
                <td width="25%" align="left"><strong>最新时间</strong></td>
                <td width="25%" align="center"><strong>招聘人数</strong></td>
                <td width="25%" align="center"><strong>申请人数</strong></td>
                <td width="27%" align="left">&nbsp;</td>
              </tr>
              <s:iterator value="applicationsReceivedList">
	              <tr>
	                <td width="5%"><input name="myPublishedJobs" type="checkbox" value="<s:property value="id"/>" /></td>
	                <td width="25%" height="40" align="left"><s:property value="jobName"/></td>
	                <td width="25%" align="left"><s:property value="getText('format.date',{lastUpdateTime})"/></td>
	                <td width="25%" align="center"><s:property value="recruitingNumber"/></td>
	                <td width="25%" align="center">
		                <a href="
			                <s:url action="applicationsReceivedAction!detailsOfJobApplications.action">
			                	<s:param name="jobId"><s:property value="id"/></s:param>
			                	<s:param name="applyJobQueryType"><s:property value="jobSearchVo.applyJobQueryType"/></s:param>
		                	</s:url>">
		                	<s:property value="applicantsNumber"/>
	                	</a>
                	</td>
	              </tr>
              </s:iterator>
        </table>
	    </div>

		<div class="qx">
	        <s:property value="pageInfo.htmlListTableFootInfo" escapeHtml="false"/>
	    </div>
		<div class="shanchu" onclick="changeMyPublishingJobs('myPublishedJobs')">删除职位</div>
	    <div class="num">
	    	<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
	    </div>
		</s:form>
  </div>
</div>
<script type="text/javascript">
function changeMyPublishingJobs(checkboxName){
	if(checkStatus(checkboxName)==false) {
		alert('请至少选中一个职位');
	}else{
		if(window.confirm("你确认要进行此操作吗?")){
			document.pageFrom.action='enterpriseCenterAction!deleteMyPublishedJob.action?requestType=0';
			document.pageFrom.method='post';
			document.pageFrom.submit();
		}
	}
}

function suspendJobs(checkboxName){
	if(checkStatus(checkboxName)==false) {
		alert('请至少选中一个职位');
	}else{
		if(window.confirm("你确认要进行此操作吗?")){
			document.pageFrom.action='enterpriseCenterAction!suspendPublishedJob.action';
			document.pageFrom.method='post';
			document.pageFrom.submit();
		}
	}
}

function init(){
	$("#position_zhaoping_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
	$("#position_zhaoping_received").addClass("active");
}
function setSearchValue(){
	var jobName = $("#jobNameFalse").val();
	$("#jobName").val(jobName);
}
</script>
</body>
</html>