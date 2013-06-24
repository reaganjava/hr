<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-线下沙龙视频</title>
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
    	<div class="administrator-title"><strong>上传视频</strong></div>
    	<s:actionmessage cssStyle="color:blue"/>
    	<s:actionerror cssStyle="color:red"/>
        <div class="inside-tab">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="inside-tab">
              <tr>
                <td width="35%" height="40" align="right">沙龙名称：</td>
                <td align="left" class="tab-input"><s:property value="salonInfoDto.subject"/></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right"><em>*</em>视频标题：</td>
                <td align="left" class="tab-input"><s:textfield id="uploadFilesSubject1" name="uploadFilesSubject" cssClass="validate[custom[nullCheckS]]" maxLength="40"/></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right"><em>*</em>视频文件：</td>
                <td align="left" class="tab-input"><s:file name="uploadFiles" cssClass="validate[custom[nullCheckS],custom[isVedio]]"/></td>
              </tr>

               <tr>
                <td width="35%" height="40" align="right"><em>*</em>视频封面图片：</td>
                <td align="left" class="tab-input"><s:file name="uploadCoverFiles" cssClass="validate[custom[nullCheckS],custom[isImg]]"/></td>
              </tr>
       </table>

         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="inside-tab" id="moreUpload">
             <tr>
                <td width="35%" height="40" align="right">视频标题：</td>
                <td align="left" class="tab-input"><s:textfield id="uploadFilesSubject" name="uploadFilesSubject" maxlength="40"/></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right">视频文件：</td>
                <td align="left" class="tab-input"><s:file name="uploadFiles" id="uploadFiles1" onchange="changeVedio1(this)"/></td>
              </tr>

               <tr>
                <td width="35%" height="40" align="right">视频封面图片：</td>
                <td align="left" class="tab-input"><s:file name="uploadCoverFiles" id="uploadCoverFiles1" onchange="changeImg1(this)"/></td>
              </tr>

             <tr>
                <td width="35%" height="40" align="right">视频标题：</td>
                <td align="left" class="tab-input"><s:textfield id="uploadFilesSubject" name="uploadFilesSubject" maxlength="40"/></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right">视频文件：</td>
                <td align="left" class="tab-input"><s:file name="uploadFiles" id="uploadFiles2" onchange="changeVedio1(this)"/></td>
              </tr>

               <tr>
                <td width="35%" height="40" align="right">视频封面图片：</td>
                <td align="left" class="tab-input"><s:file name="uploadCoverFiles" id="uploadCoverFiles2" onchange="changeImg1(this)" /></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right">视频标题：</td>
                <td align="left" class="tab-input"><s:textfield id="uploadFilesSubject" name="uploadFilesSubject" maxlength="40"/></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right">视频文件：</td>
                <td align="left" class="tab-input"><s:file name="uploadFiles" id="uploadFiles3" onchange="changeVedio1(this)"/></td>
              </tr>

               <tr>
                <td width="35%" height="40" align="right">视频封面图片：</td>
                <td align="left" class="tab-input"><s:file name="uploadCoverFiles" id="uploadCoverFiles3" onchange="changeImg1(this)"/></td>
              </tr>

               <tr>
                <td width="35%" height="40" align="right">视频标题：</td>
                <td align="left" class="tab-input"><s:textfield id="uploadFilesSubject" name="uploadFilesSubject" maxlength="40"/></td>
              </tr>
              <tr>
                <td width="35%" height="40" align="right">视频文件：</td>
                <td align="left" class="tab-input"><s:file name="uploadFiles" id="uploadFiles4" onchange="changeVedio1(this)"/></td>
              </tr>

               <tr>
                <td width="35%" height="40" align="right">视频封面图片：</td>
                <td align="left" class="tab-input"><s:file name="uploadCoverFiles" id="uploadCoverFiles4" onchange="changeImg1(this)"/></td>
              </tr>

       </table>
</div>
 <div class="system-botton4">
 	  <u>
         <li><input type="image" src="<%=request.getContextPath()%>/images/shangchuan.png" width="83" height="32" alt="上传"/></li>
         <li><a href="#" onclick="showElement('#moreUpload')"><img src="<%=request.getContextPath()%>/images/scgd.png" width="120" height="32" alt="上传更多"/></a></li>
         <li><a href="#" onclick="hideElement('#moreUpload')"><img src="<%=request.getContextPath()%>/images/ycgd.png" width="120" height="32" alt="隐藏更多"/></a></li>
  	 </u>
  </div>
</s:form>
</div>
<script type="text/javascript">
hideElement('#moreUpload');
//验证图片格式
/**
changeImg1(document.getElementById("uploadCoverFiles1"));
function changeImg1(){
	if(arguments[0].value == ""){
		arguments[0].className="";
		return;
	}
	arguments[0].className="validate[custom[isImg]]";
}

changeImg2(document.getElementById("uploadCoverFiles2"));
function changeImg2(){
	if(arguments[0].value == ""){
		arguments[0].className="";
		return;
	}
	arguments[0].className="validate[custom[isImg]]";
}

changeImg3(document.getElementById("uploadCoverFiles3"));
function changeImg3(){
	if(arguments[0].value == ""){
		arguments[0].className="";
		return;
	}
	arguments[0].className="validate[custom[isImg]]";
}

changeImg4(document.getElementById("uploadCoverFiles4"));
function changeImg4(){
	if(arguments[0].value == ""){
		arguments[0].className="";
		return;
	}
	arguments[0].className="validate[custom[isImg]]";
}
//验证视频格式
changeVedio1(document.getElementById("uploadFiles1"));
function changeVedio1(){
	if(arguments[0].value == ""){
		arguments[0].className="";
		return;
	}
	arguments[0].className="validate[custom[isVedio]]";
}

changeVedio2(document.getElementById("uploadFiles2"));
function changeVedio2(){
	if(arguments[0].value == ""){
		arguments[0].className="";
		return;
	}
	arguments[0].className="validate[custom[isVedio]]";
}

changeVedio3(document.getElementById("uploadFiles3"));
function changeVedio3(){
	if(arguments[0].value == ""){
		arguments[0].className="";
		return;
	}
	arguments[0].className="validate[custom[isVedio]]";
}

changeVedio4(document.getElementById("uploadFiles4"));
function changeVedio4(){
	if(arguments[0].value == ""){
		arguments[0].className="";
		return;
	}
	arguments[0].className="validate[custom[isVedio]]";
}
*/
function init(){
	$("#position_offlineSalonMedia").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
}
</script>
</body>
</html>