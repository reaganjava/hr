<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理--修改密码</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
	<%String path = request.getContextPath(); %>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js"></script>
	<script>
	    function beforeCall(form, options){
	       if($("#editPasswordForm").validationEngine('validate')){
	    	   alert('----->');
	    	   form.submit();
	       }
	       return true;
	    }
	    
	    // Called once the server replies to the aja form validation request
	    function ajaxValidationCallback(status, form, json, options){
	       alert("Callback");
	    }
	    $(document).ready(function(){
	        $("#editPasswordForm").validationEngine({
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
		<s:else>
			<s:include value="left.jsp"/>
		</s:else>
		<div class="content-right">
			<div class="administrator-title"><strong>修改密码</strong></div>
			<div class="inside-tab">
				<s:form id="editPasswordForm" name="editPasswordForm" method="post" action="userAction!saveEditPassword.action">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="inside-tab">
						<tr>
							<td width="35%" height="40" align="right">用户名：</td>
							<td align="left" class="tab-input"><s:property value="userInfo.userName"/></td>
						</tr>
						<tr>
							<td width="35%" height="40" align="right">原密码：</td>
							<td align="left" class="tab-input">
								<s:password id="oldPassword" name="oldPassword" maxlength="15" cssClass="validate[required,length[6,15]]"></s:password>
							</td>
						</tr>
						<tr>
							<td width="35%" height="40" align="right">新密码：</td>
							<td align="left" class="tab-input">
								<s:password id="newPassword" name="newPassword" maxlength="15" cssClass="validate[required,length[6,15],notEqual[oldPassword]]"></s:password>
							</td>
						</tr>
					</table>
				</s:form>
			</div>
			<div class="shanchu" onclick="clickSubmit()">
				确认修改
			</div>
		</div>
	</div>
	<s:hidden id="message" name="message"></s:hidden>
	<script type="text/javascript">
		var message =  $("#message").val();
		if(message != null && message != "")
			alert(message);
		function clickSubmit(){
			$("#editPasswordForm").submit();
		}
		function init(){
			$("#position_editPassword").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
		}
	</script>
</body>
</html>
