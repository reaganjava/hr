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
			<s:form id="searchForm" name="searchForm" method="post" action="receiveInterviewNoticeManageAction!viewInterviewNoticeList.action">
		        <div class="inside-search">
		        	<ul>
		                <li>状态：
				 			<s:select name="interviewNoticeDto.status" list="#{null:'所有','0':'未查看','1':'已查看' }" listKey="key" listValue="value"></s:select>
						</li>
		                <li>
		                	<a href="javascript:clickSearch();"><img src="<%=request.getContextPath()%>/images/inside-botton.png" width="68" height="25" /></a>
		                </li>
		            </ul>
		        </div>
		    </s:form>
			<div class="inside-tab">
				<s:form id="listForm" name="listForm" method="post">
					<s:hidden name="interviewNoticeDto.status"></s:hidden>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="2%"><input id="selected" name="" type="checkbox" value="" /></td>
							<td width="15%" height="40" align="left"><strong>职位名称</strong></td>
							<td width="7%" height="40" align="left"><strong>Email</strong></td>
							<td width="7%" height="40" align="left"><strong>手机</strong></td>
							<td width="7%" height="40" align="left"><strong>联系人</strong></td>
							<td width="9%" height="40" align="left"><strong>联系电话</strong></td>
							<td width="9%" height="40" align="left"><strong>标题</strong></td>
							<td width="9%" align="left"><strong>发件人</strong></td>
							<td width="9%" align="left"><strong>公司名称</strong></td>
							<td width="10%" align="left"><strong> 收件日期</strong></td>
							<td width="8%" align="left"><strong> 状态</strong></td>
							<td width="8%" align="left"><strong>操作</strong></td>
						</tr>
						<s:iterator value="interviewNoticeList">
							<tr>
								<td width="2%"><input name="interviewNoticeCheckBox" type="checkbox" value="<s:property value="id"/>" /></td>
								<td width="15%" height="40" align="left" title="<s:text name='jobName'/>">
									<span style="width:105px;float:left" class="index_hid_css">
				                    	<s:text name="jobName"/>
				                    </span>
								</td>
								<td width="7%" height="40" align="left"><strong></strong></td>
								<td width="7%" height="40" align="left"><strong></strong></td>
								<td width="7%" height="40" align="left"><strong></strong></td>
								<td width="9%" height="40" align="left"><strong></strong></td>
								<td width="9%" height="40" align="left">
									<span style="width:60px;float:left" class="index_hid_css" title="<s:property value='title'/>">
										<s:property value="title"/>
									</span>
								</td>
								<td width="9%" align="left">
									<span style="width:60px;float:left" class="index_hid_css" title="<s:property value='senderUserName'/>">
										<s:property value="senderUserName"/>
									</span>
								</td>
								<td width="9%" align="left">
									<span style="width:60px;float:left" class="index_hid_css" title="<s:property value='senderRealName'/>">
										<s:property value="senderRealName"/>
									</span>
								</td>
								<td width="10%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{noticeDate})"/></td>
								<td width="8%" align="left">
									<s:if test="status==0">
										未查看
									</s:if>
									<s:elseif test="status==1">
										已查看
									</s:elseif>
								</td>
								<td width="8%" align="left" class="inside-links">
									<a href="receiveInterviewNoticeManageAction!viewInterviewNoticeDetail.action?id=<s:property value="id"/>">查看</a>
								</td>
							</tr>
						</s:iterator>
					</table>
				</s:form> 
			</div>
			<s:form  id="pageFrom" name="pageFrom" method="POST" action="receiveInterviewNoticeManageAction!viewInterviewNoticeList.action">
				<s:hidden name="interviewNoticeDto.status"></s:hidden>
				<div class="qx">
					<s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
					<input id="SSS" type="checkbox" value="" />
					<label for="SSS">&nbsp;&nbsp;全选</label>
				</div>
				<div class="shanchu" onclick="deleteInterviewNotice();">删除</div>
				<div class="num">
					<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
				</div>
			</s:form>
		</div>
	</div>
	<script type="text/javascript">
		function clickSearch(){
			document.searchForm.submit();
		}
		function deleteInterviewNotice(){
			if(checkStatus("interviewNoticeCheckBox")){
				if(window.confirm("你确认要进行此操作吗？")){
				document.listForm.action = "receiveInterviewNoticeManageAction!deleteInterviewNotice.action";
				document.listForm.submit();
				}
			}
			else{
				alert("请至少选择一条记录");
			}
		}
		function init(){
			$("#position_zhaoping_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
			$("#position_receiveInterview").addClass("active");
		}
	</script>
</body>
</html>
