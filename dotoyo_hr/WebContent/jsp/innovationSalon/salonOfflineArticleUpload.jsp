<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大太阳建筑猎头-创业沙龙-线下沙龙上传文章</title>
<s:include value="/jsp/common/JsAndCss.jsp"/>
<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
	<style type="text/css">
	div{overflow:visible;}
	</style>
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
    $("#addAirticleForm").validationEngine({
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
<!--搜索下拉菜单~绝对定位~-->
<div class="jobs-down" id="showMenuID">
    <div class="jobs-down5" id="searchDown1" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
        <s:iterator value="searchTitleList">
            <li><a href="#" id="<s:property value="code" />" onclick="setValue(this,'offlineSalonColumnName','salonArticleDto.offlineSalonColumn');$.validationEngine.closePrompt($('#offlineSalonColumnName'));"><s:property value="name"/></a></li>
         </s:iterator>
        </ul>
    </div>
</div>
<!--中间部分-->
<s:form name="addAirticleForm" id="addAirticleForm" method="post" action="salonAction!addSalonArticle.action"  enctype ="multipart/form-data">
 <s:hidden name="salonInfoDto.id"/>
 <s:hidden name="salonInfoDto.salonType"/>
<div class="index-login-box">
  <div class="jobs-title"><strong>上传沙龙内容</strong></div>
    <s:actionerror cssStyle="color:red"/>
    <div class="jobs-select2">
      <div class="jobs-select-div2">
        <ul>
          <li class="jobs9"><em>*</em>栏&nbsp;&nbsp;&nbsp;&nbsp;目：</li>
          <li class="jobs13"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#offlineSalonColumnName', '#searchDown1')" />
              <s:textfield id="offlineSalonColumnName" name="offlineSalonColumnName" cssClass="validate[custom[nullCheckS]]" readonly="true"/>
              <s:hidden id="salonArticleDto.offlineSalonColumn" name="salonArticleDto.offlineSalonColumn"/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div2">
        <ul>
          <li class="jobs9"><em>*</em>标&nbsp;&nbsp;&nbsp;&nbsp;题：</li>
          <li class="jobs12">
            <s:textfield id="subject" name="salonArticleDto.subject" cssClass="validate[custom[nullCheckS],custom[filteringSpecialChar]]" maxlength="40"/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div2">
        <ul>
          <li class="jobs9">作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</li>
          <li class="jobs12">
            <s:textfield id="salonArticleDto.articleBelongTo" name="salonArticleDto.articleBelongTo" maxlength="40"/>
          </li>
        </ul>
      </div>
     <div class="jobs-select-div2">
        <ul>
          <li class="jobs11">头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：</li>
          <li>
            <s:file id="uploadFacePicFileId" name="uploadFacePicFile" cssClass="validate[isCheckImg]"/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div2">
        <ul>
          <li class="jobs11">封面&nbsp;图片：</li>
          <li>
            <s:file id="uploadPicFileId" name="uploadPicFile" cssClass="validate[isCheckImg]"/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div2">
        <ul>
          <li class="jobs11">视&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;频：</li>
          <li>
            <s:file id="uploadVideoFileId" name="uploadVideoFile" cssClass="validate[isCheckVedio]"/>
          </li>
        </ul>
      </div>
    </div>
    <div class="salon-select2"><em></em>内&nbsp;&nbsp;&nbsp;&nbsp;容：
    <s:textarea cssClass="ckeditor validate[length[0,8000]]" cols="80" id="content" name="salonArticleDto.content" rows="10">

    </s:textarea>
<script type="text/javascript">
  //<![CDATA[
		CKEDITOR.replace('content',{ 
			filebrowserImageUploadUrl : './upload/uploadAction!execute.action?type=image',//图片上传组件路径
			filebrowserFlashUploadUrl : './upload/uploadAction!execute.action?type=flash' //Flash上传组件路径
		});
		//]]>
	</script>
    </div>

    <div class="jobs-botton">
      <input type="image" src="<%=request.getContextPath()%>/images/jobs-tj.png" width="83" height="32" alt="提交"/>
      <img src="<%=request.getContextPath()%>/images/salon-fh.png" width="83" style="cursor:pointer;" height="32" alt="关闭" onclick="document.location.replace('<%=request.getContextPath()%>/innovationSalon/salonAction!toOffLineSalonDetail.action?salonInfoDto.id=<s:text name="salonInfoDto.id"/>');"/>
</div>

</div>
</s:form>

<!--底部分-->
<s:include value="/jsp/common/bottom.jsp"/>
</body>
</html>
