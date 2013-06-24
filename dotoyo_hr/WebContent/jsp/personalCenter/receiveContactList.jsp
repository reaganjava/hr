<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理--收件人列表</title>
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
			<div class="administrator-title"><strong>收件人列表</strong></div>
			<div class="inside-tab">
			<s:form id="selectReceiveContactForm" name="selectReceiveContactForm" method="post" action="shortMsgManageAction!selectReceiveContact.action">
				<s:hidden name="receiveShortMsgId"></s:hidden>
				<s:hidden name="replyShortMessageDto.receiverUserName"></s:hidden>
				<s:hidden name="replyShortMessageDto.title"></s:hidden>
				<s:hidden name="replyShortMessageDto.message"></s:hidden>
				<s:hidden name="replyShortMessageDto.senderId"></s:hidden>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="9%"><input id="selected" type="checkbox" value="" /></td>
						<td width="34%" height="40" align="left"><strong>用户名</strong></td>
						<td width="33%" align="left"><strong>状态</strong></td>
						<td width="24%" align="left"><strong>最近登录时间</strong></td>
					</tr>
					<s:iterator value="receiveContactList">
						<tr>
							<td width="9%">
								<input id="receiveContactCheckBox" name="receiveContactCheckBox" type="checkbox" value="<s:property value="userName"/>" />
							</td>
							<td width="34%" height="40" align="left"><s:property value="userName"/></td>
							<td width="33%" align="left">
								<s:if test="status==0">
									停用
								</s:if>
								<s:elseif test="status==1">
									正常
								</s:elseif>
							</td>
							<td width="24%" align="left"><s:date name="lastLoginDate" format="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
					</s:iterator>
				</table>
			</s:form>
			</div>
			<s:form  id="pageFrom" name="pageFrom" method="POST" action="shortMsgManageAction!viewReceiveContact.action">
				<s:hidden name="receiveShortMsgId"></s:hidden>
				<s:hidden name="replyShortMessageDto.receiverUserName"></s:hidden>
				<s:hidden name="replyShortMessageDto.title"></s:hidden>
				<s:hidden name="replyShortMessageDto.message"></s:hidden>
				<s:hidden name="replyShortMessageDto.senderId"></s:hidden>
				<div class="qx">
						<s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
						<input id="SSS" name="" type="checkbox" value="" />
						<label for="SSS">&nbsp;&nbsp;全选</label>
				</div>
				<div class="shanchu" onclick="submitForm(selectReceiveContactForm)">
					确定
				</div>
				<div class="num">
					<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
				</div>
			</s:form>
		</div>
	</div>
	<script type="text/javascript">
	function init(){
		$("#position_zhaoping_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
		$("#position_shortMessageManage").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
		$("#position_receiveBox").addClass("active");
	}
	</script>
</body>
</html>
