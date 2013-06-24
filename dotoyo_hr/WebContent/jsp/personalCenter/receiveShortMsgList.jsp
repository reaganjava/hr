<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理--收件箱</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
	<%String path = request.getContextPath(); %>
</head>
<body onload="init()">
	<jsp:include page="/jsp/common/top.jsp" />
	<!--以上为头部分-->
	<!--中间部分-->
	<div class="content">
		<s:if test="loginUserInfoDto.userType == 1">
			<s:include value="/jsp/enterpriseCenter/left.jsp"/>
		</s:if>
		<s:else>
			<s:include value="left.jsp"/>
		</s:else>
		<div class="content-right">
			<div class="administrator-title"><strong>收件箱</strong></div>
			<s:form id="searchForm" name="searchForm" method="post" action="shortMsgManageAction!viewRecieveShortMsgList.action">
				<s:hidden name="shortMessageDto.senderId"></s:hidden>
				<s:hidden name="shortMessageDto.status"></s:hidden>
				<div class="inside-search">
					<ul>
						<li>标题：
							<s:textfield name="shortMessageDto.title" size="17"></s:textfield>
						</li>
						<li>
							<a href="javascript:clickSearch()">
								<img src="<%=path %>/images/inside-botton.png" width="68" height="25" />
							</a>
						</li>
					</ul>
				</div>
			</s:form>
			<div class="inside-tab">
				<s:form id="listForm" name="listForm" method="post">
					<s:hidden name="shortMessageDto.title"></s:hidden>
					<s:hidden name="shortMessageDto.senderId"></s:hidden>
					<s:hidden name="shortMessageDto.status"></s:hidden>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="4%"><input id="selected" type="checkbox" value="" /></td>
							<td width="35%" height="40" align="left"><strong>标题</strong></td>
							<td width="29%" align="left"><strong>发件人</strong></td>
							<td width="14%" align="left"><strong> 收件日期</strong></td>
							<td width="8%" align="left"><strong>状态</strong></td>
							<td width="5%" align="left"><strong>操作</strong></td>
							<td width="5%" align="left">&nbsp;</td>
						</tr>
						<s:iterator value="shortMessageList">
							<s:if test="senderId==0">
								<tr>
									<td width="4%"><input name="shortMsgCheckBox" type="checkbox" value="<s:property value="id"/>" /></td>
									<td width="35%" height="40" align="left">
										<font color="red"><s:property value="title"/></font>
									</td>
									<td width="29%" align="left">
										<font color="red">系统</font>
									</td>
									<td width="14%" align="left">
										<font color="red">
											<s:date name="receiveDate" format="yyyy-MM-dd"/>
										</font>
									</td>
									<td width="8%" align="left">
											<s:if test="status==0">
												未查看
											</s:if>
											<s:if test="status==1">
												已查看
											</s:if>
									</td>
									<td width="5%" align="left" class="inside-links">
										<a href="shortMsgManageAction!viewReceiveShortMsgDetail.action?id=<s:property value="id"/>">
											查看
										</a>
									</td>
									<td width="5%" align="left">
									</td>
								</tr>
							</s:if>
							<s:else>
								<tr>
									<td width="4%"><input name="shortMsgCheckBox" type="checkbox" value="<s:property value="id"/>" /></td>
									<td width="35%" height="40" align="left">
										<span style="width:240px;float:left" class="index_hid_css" title="<s:property value='title'/>">
											<s:property value="title"/>
										</span>
									</td>
									<td width="29%" align="left">
										<span style="width:200px;float:left" class="index_hid_css" title="<s:property value='senderRealName'/>">
											<s:property value="senderRealName"/>
										</span>
									</td>
									<td width="14%" align="left"><s:date name="receiveDate" format="yyyy-MM-dd"/></td>
									<td width="8%" align="left">
											<s:if test="status==0">
												未查看
											</s:if>
											<s:if test="status==1">
												已查看
											</s:if>
									</td>
									<td width="5%" align="left" class="inside-links">
										<a href="shortMsgManageAction!viewReceiveShortMsgDetail.action?id=<s:property value="id"/>">
											查看
										</a>
									</td>
									<td width="5%" align="left">
										<a href="shortMsgManageAction!toReplyShortMsg.action?receiveShortMsgId=<s:property value="id"/>">
											回复
										</a>
									</td>
								</tr>
							</s:else>
						</s:iterator>
					</table>  
				</s:form>  
			</div>
			<s:form  id="pageFrom" name="pageFrom" method="POST" action="shortMsgManageAction!viewRecieveShortMsgList.action">
				<s:hidden name="shortMessageDto.senderId"></s:hidden>
				<s:hidden name="shortMessageDto.status"></s:hidden>
				<s:hidden name="shortMessageDto.title"></s:hidden>
				<div class="qx">
						<s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
						<input id="SSS" name="" type="checkbox" value="" />
						<label for="SSS">&nbsp;&nbsp;全选</label>
				</div>
				<div class="shanchu" onclick="deleteReceiveShortMsg();">
					删除
				</div>
				<div class="num">
					<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
				</div>
			</s:form>
		</div>
	</div>
	<script type="text/javascript">
		function deleteReceiveShortMsg(){
			if(checkStatus("shortMsgCheckBox")){
				if(window.confirm("你确认要进行此操作吗？")){
				document.listForm.action = "shortMsgManageAction!deleteReceiveShortMsg.action";
				document.listForm.submit();
				}
			}
			else{
				alert("请至少选择一条记录");
			}
		}
		function init(){
			$("#position_zhaoping_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
			$("#position_shortMessageManage").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
			$("#position_receiveBox").addClass("active");
		}
	</script>
</body>
</html>
