<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-线下沙龙图片</title>
	<s:include value="/jsp/common/backgroundUserJsAndCss.jsp"/>
	<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
	<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">


var flag = false;
function beforeCall(form, options){
   flag = $("#pageFrom").validationEngine('validate');
   if(flag){
   	 	form.submit();
   }
   return true;
}
function beforeClickCall(){

}
// Called once the server replies to the aja form validation request
function ajaxValidationCallback(status, form, json, options){
   alert("Callback");
}
function callFail(){
	alert("callFailFunction");
}
$(document).ready(function(){
    $("#uploadMediaForm").validationEngine({
        ajaxFormValidation: true,
        onAjaxFormComplete: ajaxValidationCallback,
        onBeforeAjaxFormValidation: beforeCall,
		validationEventTriggers:"blur",  //触发的事件  validationEventTriggers:"keyup blur",
		inlineValidation: true,//是否即时验证，false为提交表单时验证,默认true
		success :  false//为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
    });
});
</script>
</head>
<body onload="init()">
<s:include value="/jsp/common/top.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<div class="content">
<s:if test="loginUserInfoDto.userType == 1">
<s:include value="/jsp/enterpriseCenter/left.jsp"/>
</s:if>
<s:else>
<s:include value="left.jsp"/>
</s:else>
<s:form name="uploadMediaForm" id="uploadMediaForm" method="post" action="salonManageAction!uploadFilesProcess.action"  enctype ="multipart/form-data">
<s:hidden id="salonMediaDto.salonId" name="salonMediaDto.salonId"/>
<s:hidden id="salonMediaDto.mediaType" name="salonMediaDto.mediaType"/>
<s:hidden id="goFrom" name="goFrom"/>
   <div class="content-right">
    	<div class="administrator-title"><strong>上传图片</strong></div>
    	<s:actionerror cssStyle="color:red"/>
        <div class="inside-tab">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="inside-tab">
              <tr>
                <td width="35%" height="40" align="right">沙龙名称：</td>
                <td align="left" class="tab-input"><s:property value="salonInfoDto.subject"/></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right"><em>*</em>图片标题：</td>
                <td align="left" class="tab-input"><s:textfield id="uploadFilesSubject0" name="uploadFilesSubject" cssClass="validate[custom[nullCheckS]]" maxlength="40"/></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right"><em>*</em>图片文件：</td>
                <td align="left" class="tab-input"><s:file name="uploadFiles" cssClass="validate[custom[nullCheckS],isCheckImg]"/></td>
              </tr>
       </table>

         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="inside-tab" id="moreUpload">
              <tr>
                <td width="35%" height="40" align="right">图片标题：</td>
                <td align="left" class="tab-input"><s:textfield id="uploadFilesSubject1" name="uploadFilesSubject" cssClass="validate[clearPromp['uploadFiles1']]" maxlength="40"/></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right">图片文件：</td>
                <td align="left" class="tab-input"><s:file name="uploadFiles" id="uploadFiles1" cssClass="validate[isCheckImg,checkNullRelatedS['由于图片标题已输入','uploadFilesSubject1']]" /></td>
              </tr>

              <tr>
                <td width="35%" height="40" align="right">图片标题：</td>
                <td align="left" class="tab-input"><s:textfield id="uploadFilesSubject2" name="uploadFilesSubject" cssClass="validate[clearPromp['uploadFiles2']]" maxlength="40"/></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right">图片文件：</td>
                <td align="left" class="tab-input"><s:file name="uploadFiles" id="uploadFiles2" cssClass="validate[isCheckImg,checkNullRelatedS['由于图片标题已输入','uploadFilesSubject2']]"/></td>
              </tr>

              <tr>
                <td width="35%" height="40" align="right">图片标题：</td>
                <td align="left" class="tab-input"><s:textfield id="uploadFilesSubject3" name="uploadFilesSubject" cssClass="validate[clearPromp['uploadFiles3']]" maxlength="40"/></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right">图片文件：</td>
                <td align="left" class="tab-input"><s:file name="uploadFiles" id="uploadFiles3" cssClass="validate[isCheckImg,checkNullRelatedS['由于图片标题已输入','uploadFilesSubject3']]"/></td>
              </tr>

               <tr>
                <td width="35%" height="40" align="right">图片标题：</td>
                <td align="left" class="tab-input"><s:textfield id="uploadFilesSubject4" name="uploadFilesSubject" cssClass="validate[clearPromp['uploadFiles4']]" maxlength="40"/></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right">图片文件：</td>
                <td align="left" class="tab-input"><s:file name="uploadFiles" id="uploadFiles4" cssClass="validate[isCheckImg,checkNullRelatedS['由于图片标题已输入','uploadFilesSubject4']]"/></td>
              </tr>

       </table>
</div>
 <div class="system-botton4">
 	  <ul>
 	  	  <li><input type="image" src="<%=request.getContextPath()%>/images/shangchuan.png" width="83" height="32" alt="上传"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
 	  	  <li><a href="#" onclick="showElement('#moreUpload')"><img src="<%=request.getContextPath()%>/images/scgd.png" width="120" height="32" alt="上传更多"/></a></li>
 	  	  <li><a href="#" onclick="hideElement('#moreUpload')"><img src="<%=request.getContextPath()%>/images/ycgd.png" width="120" height="32" alt="隐藏更多"/></a></li>
 	  </ul>
  </div>
</s:form>
</div>
<script type="text/javascript">
hideElement('#moreUpload');
function init(){
	$("#position_offlineSalonPicture").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
}
</script>

</body>
</html>