<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理--信息详情</title>
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
			<div class="administrator-title"><strong>信息详情</strong></div>
			<div class="inside-tab">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="inside-tab">
					<tr>
						<td width="29%" height="40" align="right"><strong>发件人</strong>：</td>
						<td width="71%" align="left" class="tab-input">
							<s:if test="shortMessageDto.senderId==0">
								<font color="red">系统</font>
							</s:if>
							<s:else>
								<s:property value="shortMessageDto.senderRealName"/>
							</s:else>
						</td>
					</tr>
					<tr>
						<td width="29%" height="40" align="right"><strong>接收时间</strong>：</td>
						<td width="71%" align="left" class="tab-input">
						<s:date name="shortMessageDto.receiveDate" format="yyyy-MM-dd HH:mm:ss" />
						</td>
					</tr>
					<tr>
						<td width="29%" height="40" align="right"><strong>标题</strong>：</td>
						<td width="71%" align="left" class="tab-input">
							<s:if test="shortMessageDto.senderId==0">
								<font color="red"><s:property value="shortMessageDto.title"/></font>
							</s:if>
							<s:else>
								<s:property value="shortMessageDto.title"/>
							</s:else>
						</td>
					</tr>
					<tr>
						<td width="29%" height="40" align="right"><strong>内容</strong>：</td>
						<td width="71%" align="left" class="tab-input"><s:property value="shortMessageDto.message"/></td>
					</tr>
				</table>
			</div>
			<div class="shanchu" onclick="goBack();">返回</div>
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