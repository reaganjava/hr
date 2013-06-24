<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大太阳建筑猎头-创业沙龙-发起沙龙</title>
<s:include value="/jsp/common/JsAndCss.jsp"/>
<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
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
<body>
<s:include value="/jsp/common/head.jsp"/>
<s:include value="innovationSalonNav.jsp"/>
<!--以上为头部分-->
<!--搜索下拉菜单~绝对定位~-->
<div class="jobs-down" id="showMenuID">
    <div class="jobs-down5" id="searchDown1" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a href="#" id="0" onClick="setValue(this,'salonName1','salonInfoDto.salonType');showElement('#hostUnitDiv');showElement('#salonAdressDiv');$.validationEngine.closePrompt($('#salonName1'));">线下沙龙</a></li>
            <li><a href="#" id="1" onClick="setValue(this,'salonName1','salonInfoDto.salonType');hideElement('#hostUnitDiv');hideElement('#salonAdressDiv');$.validationEngine.closePrompt($('#salonName1'));">线上沙龙</a></li>
        </ul>
    </div>
</div>
<!--中间部分-->
<s:form name="pageFrom" id="pageFrom" method="post" action="salonAction!addSalon.action"  enctype ="multipart/form-data">
<s:hidden id="salonInfoDto.salonType" name="salonInfoDto.salonType" />
<div class="index-login-box">
  <div class="jobs-title"><strong>沙龙发起</strong></div>
    <s:actionerror cssStyle="color:red"/>
    <div class="jobs-select">
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em></>沙龙类型：</li>
          <li class="jobs13"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onClick="menuClick('#salonName1', '#searchDown1')" />
            <s:textfield id="salonName1" name="salonName" cssClass="validate[custom[nullCheckS]]" readonly="true"/>
          </li>
        </ul>
      </div>

      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>沙龙名称：</li>
      <li class="jobs12">
            <s:textfield id="subject" name="salonInfoDto.subject" cssClass="validate[custom[nullCheckS],custom[filteringSpecialChar]]" maxLength="40"/>
       </li>
        </ul>

      </div>
      <div id ="hostUnitDiv" class="jobs-select-div">
        <ul>
          <li class="jobs0">主&nbsp;&nbsp;办&nbsp;&nbsp;方：</li>
          <li class="jobs12">
             <s:textfield id="salonInfoDto.sponsor" name="salonInfoDto.sponsor" maxlength="25"/>
          </li>
        </ul>
      </div>
      <div id ="salonAdressDiv" class="jobs-select-div">
        <ul>
          <li class="jobs0">沙龙地点：</li>
          <li class="jobs12">
            <s:textfield id="salonInfoDto.location" name="salonInfoDto.location" maxlength="50"/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>开始时间：</li>
          <li class="jobs7">
           <input  id="strStartDatex" name="strStartDate" type="text" value="<s:property value="strStartDate"/>" class="validate[custom[nullCheckS]]" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',errDealMode:1,minDate:'%y-%M-{%d}',maxDate:'#F{$dp.$D(\'strEndDatex\')}'})"/></li>
      <!--       <s:textfield id="salonInfoDto.startDate" name="salonInfoDto.startDate" cssClass="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',errDealMode:1,minDate:'%y-%M-{%d}'})"/> -->
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>结束时间：</li>
          <li class="jobs7">
          <input  id="strEndDatex" name="strEndDate" type="text" value="<s:property value="strEndDate"/>" class="validate[custom[nullCheckS]]" onclick="chooseExpDate();"/></li>
         <!--  <s:textfield id="salonInfoDto.endDate" name="salonInfoDto.endDate" cssClass="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',errDealMode:1,minDate:'%y-%M-{%d}'})"/> -->
          </li>
        </ul>
      </div>
    </div>

    <!-- <div class="salon-select"><em>*</em> 主题图片：<s:file name="uploadPicFile" cssClass="required picture"/></div> -->
    <div class="salon-select"><em>*</em>主题图片：<s:file name="uploadPicFile" cssClass="validate[custom[nullCheckS],isCheckImg]"/>
    	<span style="color:red"></span>
    </div>
    <div class="salon-select"><em>*</em>
      内容介绍：<s:textarea name="salonInfoDto.content" cssClass="validate[length[1,2000]]" /></div>
    <div class="jobs-botton"><input type="image" src="<%=request.getContextPath()%>/images/jobs-tj.png" width="83" height="32" alt="提交" />
    <input type="image" src="<%=request.getContextPath()%>/images/salon-fh.png" width="83" height="32" alt="返回" onclick="document.location.replace('<%=request.getContextPath()%>/innovationSalon/');return false;"/>
</div>
</div>

</s:form>
<!--优秀创业团队-->
<s:include value="/jsp/common/bottom.jsp"/>
</body>
</html>
<script type="text/javascript">
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
