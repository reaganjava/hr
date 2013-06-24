<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--用户注册</title>
	<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
	<jsp:include page="../../../jsp/common/JsAndCss.jsp"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js"></script>
	<script>
	    function beforeCall(form, options){
	       if($("#userRegisterForm").validationEngine('validate')){
	    	   form.submit();
	       }
	       return true;
	    }
	    
	    // Called once the server replies to the aja form validation request
	    function ajaxValidationCallback(status, form, json, options){
	    }
	    $(document).ready(function(){
	        $("#userRegisterForm").validationEngine({
	            ajaxFormValidation: true,
	            onAjaxFormComplete: ajaxValidationCallback,
	            onBeforeAjaxFormValidation: beforeCall,
	            validationEventTriggers:"blur",  //触发的事件  validationEventTriggers:"keyup blur",  
	            success:false//为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false  
	        });
	    });
	</script>
</head>
<body>
<jsp:include page="../../../jsp/common/head.jsp"></jsp:include>
<s:include value="../../../homePageNav.jsp"/>
<!--以上为头部分-->
<!--中间部分-->

<s:form id="userRegisterForm" name="userRegisterForm" method="post" action="/common/saveUser.action">
<input id="userRegisterFormFlag" type="hidden" value="0"/>
<div class="index-login-box">
  <div class="jobs-title"><strong>用户注册</strong></div>
    <div class="index-login">
          <ul>
              <li class="jobs0"><em>*</em>用户名：</li>
              <li class="jobs12">
              	<input id="userName" name="userInfo.userName" type="text" value="" maxlength="40" class="validate[custom[email]]"/>
              </li>
              <li id="index-login1">请使用Email为注册账号</li>
          </ul>
          <ul>
              <li class="jobs0"><em>*</em>密&nbsp;&nbsp;&nbsp;&nbsp;码：</li>
              <li class="jobs12">
              	<input id="password" name="userInfo.password" type="password" value="" maxlength="15" class="validate[passwordRegister[6,15]]"/>
              </li>
              <li id="index-login1">密码最少六位</li>
          </ul>
          <ul>
              <li class="jobs0"><em>*</em>验证码：</li>
              <li class="jobs12"><input id="captcha" name="captcha" type="text" value="" class="validate[requiredYZM]"/></li>
              <li id="index-login1"><img src="<%=request.getContextPath()%>/jcaptcha" onclick="changeImage(this)" alt="点击刷新"	
	     style="cursor: pointer;" id="kaptchaImage" width="80" height="20" /></li>
          </ul>
       </div>
    <div class="jobs-botton">
    	<input  type="image" src="<%=request.getContextPath()%>/images/index-login-botton.png" alt="注册"/>
    </div>
</div>
</s:form>
<s:hidden id="message" name="message"></s:hidden>
<!--底部分-->
<jsp:include page="../../../jsp/common/bottom.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	var errorMessage = $("#message").val();
	if(errorMessage!=null && errorMessage!= "")
		alert(errorMessage);
});

function changeImage(obj){
	obj.src="<%=request.getContextPath()%>"+"/jcaptcha?"+Math.random();
}
</script>
</body>
</html>