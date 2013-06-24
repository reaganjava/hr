<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="/jsp/common/processing.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>
<body>
<s:form name="userRegister" method="post" action="saveUser">
	<table  align="center">
      <tr>
        <td>用户名：</td>
        <td>
          <input name="userInfo.userName" type="text" value="<s:property value='userInfo.userName'/>"/>
        (请使用Email为注册账号)
        </td>
      </tr>
      <tr>
        <td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
        <td>
          <input name="userInfo.password" type="password" value="<s:property value='userInfo.password'/>"/>
        (密码最少六位)
        </td>
      </tr>
      <tr>
        <td>验证码：</td>
        <td>
          <input name="captcha" type="text" />
          <img src="<%=request.getContextPath()%>/jcaptcha"
	     onclick="changeImage(this)" alt="click to refresh"	
	     style="cursor: pointer;" id="kaptchaImage">
	    </td>
      </tr>
      <tr>
	     <td>
	      <input type="submit"" value="注册" onclick="alert('注册猎头成功后，同时开通了博站，然后跳到搏站')"/>
	     </td>
	      <td>
	      	<s:property value="#request.unapprove"/>
	     </td>
      </tr>
    </table>
</s:form>

</body>
<script type="text/javascript">
	function changeImage(obj){
		obj.src="<%=request.getContextPath()%>"+"/jcaptcha?"+Math.random();
		// document.getElementById('kaptchaImage').src = 'jcaptcha?captchaId=' + Math.random(); 
	}
</script>
</html>
