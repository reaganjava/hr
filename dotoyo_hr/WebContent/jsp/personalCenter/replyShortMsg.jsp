<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理--发邮件(回邮件)</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
	<%String path = request.getContextPath(); %>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js"></script>
	<script>
	    function beforeCall(form, options){
	       if($("#replyShortMsgForm").validationEngine('validate')){
	    	   form.submit();
	       }
	       return true;
	    }
	    
	    // Called once the server replies to the aja form validation request
	    function ajaxValidationCallback(status, form, json, options){
	    }
	    $(document).ready(function(){
	        $("#replyShortMsgForm").validationEngine({
	            ajaxFormValidation: true,
	            onAjaxFormComplete: ajaxValidationCallback,
	            onBeforeAjaxFormValidation: beforeCall,
	            validationEventTriggers:"blur",  //触发的事件  validationEventTriggers:"keyup blur",  
	              
	            success:false,//为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false  
	            promptPosition: "topLeft"//提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight  
	        });
	    });
	</script>
</head>
<body onload="init()">
	<jsp:include page="/jsp/common/top.jsp" />
	<!--以上为头部分-->
	<!--中间部分-->
	<div class="content">
		<s:if test="loginUserInfoDto.userType == 1">
			<s:include value="/jsp/enterpriseCenter/left.jsp"/>
		</s:if>
		<s:elseif test="loginUserInfoDto.userType == 0">
			<s:include value="left.jsp"/>
		</s:elseif>
		<div class="content-right">
			<div class="administrator-title"><strong>发邮件/回邮件</strong></div>
			<div class="inside-tab">
			<s:form id="replyShortMsgForm" name="replyShortMsgForm" method="post" action="shortMsgManageAction!saveReplyShortMsg.action">
				<s:hidden name="receiveShortMsgId"></s:hidden>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="inside-tab">
					<tr>
						<td width="35%" height="40" align="right">收件人：</td>
						<td width="23%" align="left" class="tab-input">
							<s:textfield size="30" name="replyShortMessageDto.receiverUserName" title="多个收件人请以';'隔开" cssClass="validate[emails]"></s:textfield>
						</td>
						<td width="42%" align="left" >
							<a href="javascript:viewReceiveContact()">
								<img src="<%=path %>/images/sxr.png" width="68" height="27" />
							</a>
						</td>
					</tr>
					<tr>
						<td width="35%" height="40" align="right">标&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
						<td width="23%" align="left" class="tab-input">
							<s:textfield name="replyShortMessageDto.title" size="30" cssClass="validate[required]" maxlength="30"></s:textfield>
						</td>
						<td width="42%" align="left">&nbsp;</td>
					</tr>
					<tr>
						<td height="40" align="right">&nbsp;</td>
						<td colspan="2" align="left" class="tab-input">
							<s:textarea name="replyShortMessageDto.message" cssClass="validate[required,length[0,200]]"></s:textarea>
						</td>
					</tr>
				</table>
			</s:form>
			</div>
			<div class="shanchu" onclick="sendShortMsg()">
				保存
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function viewReceiveContact(){
			var form = document.getElementById("replyShortMsgForm");
			form.action = "shortMsgManageAction!viewReceiveContact.action";
			form.submit();
		}
		function sendShortMsg(){
			$("#replyShortMsgForm").submit();
		}
		function init(){
			$("#position_zhaoping_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
			$("#position_shortMessageManage").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
			$("#position_receiveBox").addClass("active");
		}
	</script>
</body>
</html>
