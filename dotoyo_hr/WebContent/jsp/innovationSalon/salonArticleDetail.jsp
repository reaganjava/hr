<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page
	import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大太阳建筑猎头-文章详情</title>
<s:include value="/jsp/common/JsAndCss.jsp"/>
<link href="<%=request.getContextPath()%>/css/salon.css"
	rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">


var flag = false;
function beforeCall(form, options){
   flag = $("#commentForm").validationEngine('validate');
   if(flag){
   	 	form.submit();
   }
   return true;
}
function login(){
	
		var from= document.getElementById("commentForm");
		var islogin= document.getElementById("commentForm_islogin");
		islogin.value="1";
		from.submit();
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
    $("#commentForm").validationEngine({
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
<s:include value="/jsp/common/head.jsp" />
<s:include value="innovationSalonNav.jsp"/>
<div class="online-content"><!--中间部分-->
<div class="online-content">
<div class="online-left">
<h2><s:property value="salonArticleDto.subject" /><em>&nbsp;<br />
作者：<s:property value="salonArticleDto.userName" />&nbsp;&nbsp;&nbsp;&nbsp;发表：<s:property
	value="getText('formatDate_fullTime',{salonArticleDto.submitDate})" /></em></h2>

	<div class="classic-video-pic">
	<p><s:property value="salonArticleDto.content" escape="false"/></p>
	</div>

	<div class="classic-video-pic">
		<s:if test='salonArticleDto.videoName != null && salonArticleDto.videoName != ""'>
			<embed	src="<s:property value="uploadFilePath"/>/<s:property value="salonArticleDto.videoName"/>" width="500" height="400" loop="true" autostart="true" />
		</s:if>
	</div>
	<div class="classic-video-pic">
        	<ul>
        	<s:if test="salonArticleDtoUp==null">
            	<li>上一篇：无</li>
            	      </s:if>  
            <s:else>
            <li>上一篇：<a href="innovationSalon/salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticleDtoUp.id" />"><s:property value="salonArticleDtoUp.subject" /></a></li>
            </s:else>
       
           <s:if test="salonArticleDtoDown==null">
            <li>下一篇：无</li>
           </s:if> 
            <s:else>
             <li>下一篇：<a href="innovationSalon/salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticleDtoDown.id" />"><s:property value="salonArticleDtoDown.subject" /></a></li>
            </s:else>
            </ul>
     </div>
	<div class="view-details-botton">
	<ul>
		<li class="botton3"><a href="#" title="好评总数">好评(<s:property
			value="salonArticleDto.reputationCount" />)次</a></li>
		<li class="botton3"><a href="#" title="差评总数">差评(<s:property
			value="salonArticleDto.schlussgruppeCount" />)次</a></li>
	</ul>
</div>


<div class="online-left-title title10"><strong>用户评论</strong></div>
<s:iterator value="salonCommentList">
	<div class="user-reviews">
	<h3><span>发表：<s:property
		value="getText('formatDate_fullTime',{submitDate})" /></span>评论者：<s:property
		value="userName" /></h3>
	<p><s:property value="content" /></p>
	</div>
</s:iterator>

 <!--翻页-->
 <s:form id="pageFrom" name="pageFrom" method="POST"
	action="salonAction!toArticleDetail.action">
	<s:hidden name="salonArticleDto.id" />
	<div class="salon-qx"><s:property
		value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false" />
	</div>
	<div class="salon-num"><s:property
		value="pageInfo.htmlPagingInfo" escapeHtml="false" /></div>
</s:form>
<s:form id="commentForm" name="commentForm" method="POST"
	action="salonAction!addArticleComment.action">
	<s:hidden name="salonArticleDto.id" />
	<s:hidden name="salonArticleDto.salonId" />
	<s:hidden name="islogin" />
	<div class="online-left-title title10"><strong>发表评论</strong></div>
 <div align="left"><s:actionmessage cssStyle="color:blue"/></div>
    <s:if test='#session.userInfoDto==null'>
      <div class="comment">
       	<ul>
              <li class="comment0">用户名：</li>
         	  <li><s:textfield name="userInfo.userName" id="userInfo.userName"/></li>
        	  <li class="comment0">密码：</li>
              <li><s:password name="userInfo.password" id="userInfo.password"/></li>
               <li><a href="#" onclick="login();"><img src="<%=request.getContextPath()%>/images/comment-botton1.png" width="101" height="29" /></a></li>
               <li><a href="<%=request.getContextPath()%>/homePage/homePageAction!toUserRegister.action"><img src="<%=request.getContextPath()%>/images/comment-botton2.png" width="101" height="29" /></a></li>
        </ul>
      </div>
     </s:if>
	<div class="comment"><s:textarea id="content"
		name="commentDto.content" cssClass="validate[custom[nullCheckS],length[1,400]]"/></div>
	<div class="comment2"><input type="image"
		src="<%=request.getContextPath()%>/images/comment-botton3.png"
		width="101" height="29" alt="马上发表" />&nbsp;&nbsp;&nbsp;&nbsp; <a
		href="salonAction!updateAirtcleAssessCount.action?salonArticleDto.id=<s:property value="salonArticleDto.id"/>&salonArticleDto.reputationCount=1"><img
		src="<%=request.getContextPath()%>/images/comment-botton4.png"
		width="89" height="29" alt="好评" /></a> <a
		href="salonAction!updateAirtcleAssessCount.action?salonArticleDto.id=<s:property value="salonArticleDto.id"/>&salonArticleDto.schlussgruppeCount=1""><img
		src="<%=request.getContextPath()%>/images/comment-botton5.png"
		width="89" height="29" alt="差评" /></a></div>
</s:form></div>
<div class="salon-right">
<div class="salon-title title7"><strong>热门观点</strong></div>
<div class="online-font">
<ul>
	<s:iterator value="hotArticleList">
		<li><a
			href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="id"/>"><s:property
			value="subject" /></a></li>
	</s:iterator>

</ul>
</div>
<div class="salon-title title7"><strong>作者相关文章</strong></div>
<div class="online-font">
<ul>
	<s:iterator value="articleForUserList">
		<li><a
			href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="id"/>"><s:property
			value="subject" /></a></li>
	</s:iterator>
</ul>
</div>
</div>
</div>
</div>
<s:include value="/jsp/common/bottom.jsp" />
</body>

</html>
