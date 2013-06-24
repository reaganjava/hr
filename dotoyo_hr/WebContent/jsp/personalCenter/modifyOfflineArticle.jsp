<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-修改文章dsdd</title>
	<s:include value="/jsp/common/backgroundUserJsAndCss.jsp"/>
	<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

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
    $("#pageFrom").validationEngine({
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
<s:form name="pageFrom" id="pageFrom" method="post" action="salonManageAction!modifySalonArticle.action"  enctype ="multipart/form-data">
 <s:hidden name="salonArticleDto.id"/>
<div class="content">
<s:if test="loginUserInfoDto.userType == 1">
<s:include value="/jsp/enterpriseCenter/left.jsp"/>
</s:if>
<s:else>
<s:include value="left.jsp"/>
</s:else>
   <div class="content-right">
    	<div class="administrator-title"><strong>修改文章</strong></div>
    	<s:actionerror cssStyle="color:red"/>
        <div class="inside-tab">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="inside-tab">
			<tr>
					<td width="10%" height="40" align="right"><em>*</em>栏目：</td>

		          <td width="90%" align="left" class="tab-input">
		              <s:textfield id="salonArticleDto.offlineSalonColumnName" name="salonArticleDto.offlineSalonColumnName"  readonly="true"/>
		              <s:hidden id="salonArticleDto.offlineSalonColumn" name="salonArticleDto.offlineSalonColumn"/>
					</td>
			 </tr>

              <tr>
                <td width="10%" height="40" align="right"><em>*</em>标题：</td>
                <td width="90%" align="left" class="tab-input"><s:textfield id="subject" name="salonArticleDto.subject" cssClass="validate[custom[nullCheckS],custom[filteringSpecialChar],length[1,60]]"/></td>
              </tr>
              <tr>
                <td width="10%" height="40" align="right">作者：</td>
                <td width="90%" align="left" class="tab-input"><s:textfield id="salonArticleDto.articleBelongTo" name="salonArticleDto.articleBelongTo" maxlength="60"/></td>
              </tr>
              <tr>
                <td width="10%" height="40" align="right">头像：</td>
                <s:hidden id="salonArticleDto.facePicName" name="salonArticleDto.facePicName"/>
                <td width="90%" align="left" class="tab-input"><s:file id="uploadFacePicFileId" name="uploadFacePicFile" cssClass="validate[isCheckImg]"/></td>
              </tr>
              <tr>
                <td width="10%" height="40" align="right">图片文件：</td>
                <s:hidden id="salonArticleDto.pictureName" name="salonArticleDto.pictureName"/>
                <td width="90%" align="left" class="tab-input"><s:file id="uploadPicFileId" name="uploadPicFile" cssClass="validate[isCheckImg]"/></td>
              </tr>

              <tr>
                <td width="10%" height="40" align="right">视频文件：</td>
                  <s:hidden id="salonArticleDto.videoName" name="salonArticleDto.videoName"/>
                <td width="90%" align="left" class="tab-input"><s:file id="uploadVideoFileId"  name="uploadVideoFile" cssClass="validate[isCheckVedio]"/></td>
              </tr>
            </table>
            <div class="xiugai">
            	<div class="xiugai-font">内容：</div>
                <div class="xiugai-k">
                <textarea class="ckeditor" cols="80" id="content" name="salonArticleDto.content" rows="10">
                <s:property value="salonArticleDto.content" />
                </textarea>
                <script type="text/javascript">
  				//<![CDATA[
			CKEDITOR.replace('content',{ 
			filebrowserImageUploadUrl : './upload/uploadAction!execute.action?type=image',//图片上传组件路径
			filebrowserFlashUploadUrl : './upload/uploadAction!execute.action?type=flash' //Flash上传组件路径
		});
		//]]>
	</script>
                </div>
            </div>
         </div>
       	<input type="image" src="<%=request.getContextPath()%>/images/head-jobs-botton6.png" width="109" height="32" alt="修改"/>
  </div>
</div>
</s:form>
<script type="text/javascript">
function init(){
	$("#position_articleManage").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
}
</script>
</body>
</html>
