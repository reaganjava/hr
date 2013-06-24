<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-线下沙龙发起</title>
	<s:include value="/jsp/common/backgroundUserJsAndCss.jsp"/>
	<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
	<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">


var flag = false;
function beforeCall(form, options){
   flag = $("#addSalonForm1").validationEngine('validate');
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
    $("#addSalonForm1").validationEngine({
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
<s:form id="addSalonForm1" name="addSalonForm1" method="post" action="salonManageAction!addSalon.action" enctype ="multipart/form-data">
	<s:hidden name="salonInfoDto.salonType" id="salonInfoDto.salonType"/>
   <div class="content-right">
    	<div class="administrator-title"><strong>线下沙龙发起</strong></div>
    	<s:actionerror cssStyle="color:red"/>
        <div class="inside-tab">
   	    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="inside-tab">
              <tr>
                <td width="29%" height="40" align="right"><em>*</em><strong>沙龙名称</strong>：</td>
                <td align="left" class="tab-input"><s:textfield id="subject" maxlength="40" name="salonInfoDto.subject" cssClass="validate[custom[nullCheckS],custom[filteringSpecialChar]]"/></td>
              </tr>
              <tr>
                <td width="29%" height="40" align="right"><strong>主办方</strong>：</td>
                <td align="left" class="tab-input"><s:textfield id="salonInfoDto.sponsor" name="salonInfoDto.sponsor" maxlength="25"/></td>
              </tr>
               <tr>
                <td width="29%" height="40" align="right"><strong>沙龙地点</strong>：</td>
                <td align="left" class="tab-input"><s:textfield id="salonInfoDto.location" name="salonInfoDto.location" maxlength="50"/></td>
              </tr>

              <tr>
                <td width="29%" height="40" align="right"><em>*</em><strong>沙龙开始时间</strong>：</td>
                <td align="left" class="tab-input"> <s:textfield cssClass='validate[custom[nullCheckS]] Wdate2' id="strStartDatex" name="strStartDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',errDealMode:1,minDate:'%y-%M-{%d}',maxDate:'#F{$dp.$D(\\'strEndDatex\\')}'})"/></td>
              </tr>
              <tr>
                <td width="29%" height="40" align="right"><em>*</em><strong>沙龙结束时间</strong>：</td>
                <td align="left" class="tab-input"><s:textfield cssClass='validate[custom[nullCheckS]] Wdate2' id="strEndDatex" name="strEndDate" onclick="chooseExpDate();"/></td>
              </tr>
              <tr>
                <td width="29%" height="40" align="right"><em>*</em><strong>主题图片</strong>：</td>
                <td align="left" class="tab-input"><s:file name="uploadPicFile" cssClass="validate[custom[nullCheckS],isCheckImg]"/></td>
              </tr>
              <tr>
                <td width="29%" height="40" align="right"><em>*</em><strong>内容介绍</strong>：</td>
                <td align="left" class="tab-input"><s:textarea name="salonInfoDto.content" cssClass="validate[custom[nullCheckS],length[1,400]]"/></td>
              </tr>
            </table>
  </div>

       	<div class="system-botton3">
        	<ul>
                <li class="botton1"><input type="image" src="<%=request.getContextPath()%>/images/salon-tj.png" width="120" height="30" alt="提交"/></li>
                <li class="botton3"><a href="javascript:window.location.href='salonManageAction!myLaunchSalonList.action?salonInfoDto.salonType=0'" title="返回">返回</a></li>
            </ul>
		</div>

  </div>
</s:form>
</div>
<script type="text/javascript">
function init(){
	$("#position_salonManage").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
	$("#position_offline_salon").addClass("active");
}
function chooseExpDate(){
	var effDate = $("#strStartDatex").val();
	if(effDate == "" || effDate == null){
		WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-{%d}'});
	}
	else{
		WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'strStartDatex\')}'});
	}
}
</script>
</body>
</html>
