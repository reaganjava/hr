<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大太阳建筑猎头-创业沙龙-上传图片</title>
<s:include value="/jsp/common/JsAndCss.jsp"/>
<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
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
<body>
<s:include value="/jsp/common/head.jsp"/>
<s:include value="innovationSalonNav.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<s:form name="uploadMediaForm" id="uploadMediaForm" method="post" action="salonSearchAction!uploadFilesProcess.action"  enctype ="multipart/form-data">
<s:hidden id="salonMediaDto.salonId" name="salonMediaDto.salonId"/>
<s:hidden id="salonMediaDto.salonType" name="salonMediaDto.salonType"/>
<s:hidden id="salonMediaDto.mediaType" name="salonMediaDto.mediaType" value="0"/>
<div class="index-login-box">
  <div class="jobs-title"><strong>上传图片</strong></div>
    <div class="jobs-select">
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</li>
          <li class="jobs12">
           <s:textfield id="subject1Id" name="uploadFilesSubject" cssClass="validate[custom[nullCheckS]]" maxlength="40"/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>图片文件：</li>
          <li>
           <s:file name="uploadFiles" cssClass="validate[custom[nullCheckS],isCheckImg]"/>
          </li>
        </ul>
      </div>
    </div>

 <div id ="moreUpload">
    <div class="jobs-select">
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</li>
          <li class="jobs12">
           <s:textfield id="uploadFilesSubject1" name="uploadFilesSubject" cssClass="validate[clearPromp['uploadFiles1']]" maxlength="40"/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0">图片文件：</li>
          <li>
           <s:file name="uploadFiles" id="uploadFiles1" cssClass="validate[isCheckImg,checkNullRelatedS['由于图片标题已输入','uploadFilesSubject1']]"/>
          </li>
        </ul>
      </div>
    </div>

    <div class="jobs-select">
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</li>
          <li class="jobs12">
           <s:textfield id="uploadFilesSubject2" name="uploadFilesSubject" cssClass="validate[clearPromp['uploadFiles2']]" maxlength="40"/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0">图片文件：</li>
          <li>
           <s:file name="uploadFiles" id="uploadFiles2" cssClass="validate[isCheckImg,checkNullRelatedS['由于图片标题已输入','uploadFilesSubject2']]"/>
          </li>
        </ul>
      </div>

    </div>

       <div class="jobs-select">
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</li>
          <li class="jobs12">
           <s:textfield id="uploadFilesSubject3" name="uploadFilesSubject" cssClass="validate[clearPromp['uploadFiles3']]" maxlength="40"/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0">图片文件：</li>
          <li>
           <s:file name="uploadFiles" id="uploadFiles3" cssClass="validate[isCheckImg,checkNullRelatedS['由于图片标题已输入','uploadFilesSubject3']]"/>
          </li>
        </ul>
      </div>

    </div>
       <div class="jobs-select">
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</li>
          <li class="jobs12">
           <s:textfield id="uploadFilesSubject4" name="uploadFilesSubject" cssClass="validate[clearPromp['uploadFiles4']]" maxlength="40"/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0">图片文件：</li>
          <li>
           <s:file name="uploadFiles" id="uploadFiles4" cssClass="validate[isCheckImg,checkNullRelatedS['由于图片标题已输入','uploadFilesSubject4']]"/>
          </li>
        </ul>
      </div>
    </div>

  </div>

  <br/>
  <div class="jobs-botton">
         <input type="image" src="<%=request.getContextPath()%>/images/jobs-tj.png" width="83" height="32" alt="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <a href="javascript:showElement('#moreUpload')"><img src="<%=request.getContextPath()%>/images/scgd.png" width="120" height="32" alt="上传更多"/></a>
         <a href="javascript:hideElement('#moreUpload')"><img src="<%=request.getContextPath()%>/images/ycgd.png" width="120" height="32" alt="隐藏更多"/></a>
  </div>
<s:actionmessage cssStyle="color:blue"/>
<s:actionerror cssStyle="color:red"/>
</div>
</s:form>
<s:include value="../common/bottom.jsp"/>
<script type="text/javascript">
hideElement('#moreUpload');
</script>
</body>
</html>
