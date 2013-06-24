<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
.index_hid_css {
   overflow:hidden;
   word-break:keep-all;
   white-space:nowrap;
   text-overflow:ellipsis;
}

</style>
<div class="top">
	<div class="top-left"><img src="<%=request.getContextPath()%>/images/logo.png" width="152" height="88" alt="中国建筑平台"/></div>
    <div class="top-right"><span style="color:#f60"><s:property value="#session.userInfoDto.userName"/></span>&nbsp;&nbsp;大太阳建筑网猎头平台欢迎您！</div>
</div>
<div class="nav">
	<ul>
    	<li class="nav-on" id="menu01"><a href="<%=request.getContextPath()%>/">首页</a></li>
        <li class="nav-on" id="menu02"><a href="<%=request.getContextPath()%>/headhunterCenter/">猎头中心</a></li>
        <li class="nav-on" id="menu03"><a href="<%=request.getContextPath()%>/applyJobCenter/">人才中心</a></li>
        <li class="nav-on" id="menu04"><a href="<%=request.getContextPath()%>/peopleExcavate/">人才挖掘</a></li>
        <li class="nav-on" id="menu05"><a href="<%=request.getContextPath()%>/certificateCenter/">猎证中心</a></li>
        <li class="nav-on" id="menu08"><a href="<%=request.getContextPath()%>/innovationSalon/">创业沙龙</a></li>
    </ul>
</div>
<script type="text/javascript">
//submit form
function submitForm(formName){

	if(formName == null){
	  document.form.submit();
	}else{
      formName.submit();
	}
}
//go back
function goBack(){
	window.history.go(-1);
}

//submit batch choose action form
function submitFormChooseCheck(formName,checkBoxName){
	if(checkStatus(checkBoxName)){
	if(confirm("你确认要进行此操作吗?")){
	if(formName == null){
	  document.form.submit();
	}else{
      formName.submit();
	}
  }
 }else{
   alert("请选择最少一条记录");
 }
}

//submit batch choose action form
function submitForm4ChangeAction(formName,checkBoxName,actionName){
	if(checkStatus(checkBoxName)){
	  if(confirm("你确认要进行此操作吗?")){
		if(formName == null){
		  document.form.submit();
		}else{
		  formName.action=actionName;
	      formName.submit();
		}
	}
 }else{
   alert("请选择最少一条记录");
 }
}
//submit batch choose action form
function submitForm4ChangeActionCheck(formName,actionName){
  if(confirm("你确认要进行此操作吗?")){
	if(formName == null){
	  document.form.submit();
	}else{
	  formName.action=actionName;
      formName.submit();
	}
  }
}
//submit batch choose action form
function submitForm4ChangeActionCheckNull(formName,actionName){
	if(formName == null){
	  document.form.submit();
	}else{
	  formName.action=actionName;
      formName.submit();
	}
}
//submit batch choose action form
function submitForm4ChangeActionNull(formName,checkBoxName,actionName){
	document.getElementById("hidden_true_box").checked = true;
	if(checkStatus(checkBoxName)){
	  if(confirm("你确认要进行此操作吗?")){
		if(formName == null){
		  document.form.submit();
		}else{
		  formName.action=actionName;
	      formName.submit();
		}
	   }
	 }else{
	   alert("请选择最少一条记录");
	 }
}

</script>