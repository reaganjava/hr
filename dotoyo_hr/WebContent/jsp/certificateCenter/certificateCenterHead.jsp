<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<div class="certificate-banner">
	<span>
		<a href="<%=path%>/certificateCenter/certificateAction!toSubmitCert.action" target="_blank"><img src="<%=path%>/images/certificate-botton1.png" width="121" height="29" alt="个人证书提交"/></a>
		<a href="<%=path%>/certificateCenter/certificateAction!toSubmitCertNeeds.action" target="_blank"><img src="<%=path%>/images/certificate-botton2.png" width="148" height="29" alt="企业登记证书需求" /></a>
    </span>
</div>