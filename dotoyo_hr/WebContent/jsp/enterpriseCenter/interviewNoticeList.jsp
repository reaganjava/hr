<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理--面试通知</title>
	<%String path = request.getContextPath(); %>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
</head>
<body onload="init()">
	<jsp:include page="/jsp/common/top.jsp"></jsp:include>
	<!--以上为头部分-->
	<!--中间部分-->
	<div class="content">
		<jsp:include page="left.jsp"></jsp:include>
		<div class="content-right">
			<div class="administrator-title"><strong>面试通知</strong></div>
			<div class="inside-tab">
				<s:form id="listForm" name="listForm" method="post">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="5%"><input id="selected" name="" type="checkbox" value="" /></td>
							<td width="10%" height="40" align="left"><strong>职位名称</strong></td>
							<td width="10%" height="40" align="left"><strong>Email</strong></td>
							<td width="10%" height="40" align="left"><strong>手机</strong></td>
							<td width="10%" height="40" align="left"><strong>联系人</strong></td>
							<td width="10%" height="40" align="left"><strong>联系电话</strong></td>
							<td width="10%" height="10" align="left"><strong>标题</strong></td>
							<td width="15%" align="left"><strong>收件人</strong></td>
							<td width="10%" align="left"><strong> 发送日期</strong></td>
							<td width="10%" align="left"><strong>操作</strong></td>
						</tr>
						<s:iterator value="interviewNoticeList">
							<tr>
								<td width="5%"><input name="interviewNoticeCheckBox" type="checkbox" value="<s:property value="id"/>" /></td>
								<td width="10%" height="40" align="left" title="<s:text name='jobName'/>">
									<span style="width:60px;float:left" class="index_hid_css">
				                    	<s:text name="jobName"/>
				                    </span>
								</td>
								<td width="10%" height="40" align="left"><strong></strong></td>
								<td width="10%" height="40" align="left"><strong></strong></td>
								<td width="10%" height="40" align="left"><strong></strong></td>
								<td width="10%" height="40" align="left"><strong></strong></td>
								<td width="10%" height="40" align="left">
									<span style="width:100px;float:left" class="index_hid_css" title="<s:property value='title'/>">
										<s:property value="title"/>
									</span>
								</td>
								<td width="15%" align="left">
									<span style="width:120px;float:left" class="index_hid_css" title="<s:property value='receiverUserName'/>">
										<s:property value="receiverUserName"/>
									</span>
								</td>
								<td width="10%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{noticeDate})"/></td>
								<td width="10%" align="left" class="inside-links">
									<a href="sendInterviewNoticeManageAction!viewInterviewNoticeDetail.action?id=<s:property value="id"/>">查看</a>
								</td>
							</tr>
						</s:iterator>
					</table>
				</s:form> 
			</div>
			<s:form  id="pageFrom" name="pageFrom" method="POST" action="sendInterviewNoticeManageAction!viewInterviewNoticeList.action">
				<div class="qx">
					<s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
					<input id="SSS" type="checkbox" value="" />
					<label for="SSS">&nbsp;&nbsp;全选</label>
				</div>
				<div class="shanchu" onclick="deleteInterviewNotice()();">删除</div>
				<div class="num">
					<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
				</div>
			</s:form>
		</div>
	</div>
	<script type="text/javascript">
		function deleteInterviewNotice(){
			if(checkStatus("interviewNoticeCheckBox")){
				if(window.confirm("你确认要进行此操作吗？")){
				document.listForm.action = "sendInterviewNoticeManageAction!deleteInterviewNotice.action";
				document.listForm.submit();
				}
			}
			else{
				alert("请至少选择一条记录");
			}
		}
		
		function init(){
			$("#position_zhaoping_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
			$("#position_send_interview").addClass("active");
		}
	</script>
</body>
</html>
