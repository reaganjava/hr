<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大太阳建筑猎头-创业沙龙-线上沙龙</title>
<s:include value="/jsp/common/JsAndCss.jsp"/>
<link href="<%=request.getContextPath()%>/css/salon.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">


var flag = false;
function beforeCall(form, options){
   flag = $("#commentForm1").validationEngine('validate');
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
    $("#commentForm1").validationEngine({
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
<div class="online-content">
<!--中间部分-->
<div class="online-content">
	<div class="online-left">
	 <s:actionmessage cssStyle="color:blue"/>
	 <s:actionerror cssStyle="color:red"/>
    	<h1><s:property value="salonInfoDto.subject"/></h1>
        <div class="online-pic-box">
        	<div class="online-pic"><img src="<s:property value="uploadFilePath"/>/<s:property value="salonInfoDto.subjectPic"/>" width="320" height="240" /></div>
            <div class="online-pic-font">
            	<ul>
                    <li>开始时间：<s:property value="getText('formatDate_yyyy-MM-dd',{salonInfoDto.startDate})"/></li>
                    <li>结束时间：<s:property value="getText('formatDate_yyyy-MM-dd',{salonInfoDto.endDate})"/></li>
                    <li>发起者：<s:property value="salonInfoDto.userName"/></li>
                    <li>参加人数：<s:property value="salonInfoDto.salonAttendCount"/>人</li>
                    <li><span>好评｛<s:property value="salonInfoDto.reputationCount"/>｝&nbsp;&nbsp;&nbsp;&nbsp;差评｛<s:property value="salonInfoDto.schlussgruppeCount"/>｝</span></li>
              </ul>
              <s:if test="actionToDoFlag == 0">
                <a href="salonAction!addSalonAttend.action?salonInfoDto.id=<s:property value="salonInfoDto.id"/>&salonInfoDto.salonType=<s:property value="salonInfoDto.salonType"/>"><img src="<%=request.getContextPath()%>/images/online-botton1.png" width="107" height="34" alt="我要参加"/></a>
                <a href="salonAction!toSalonOnlineUploadPage.action?salonInfoDto.id=<s:property value="salonInfoDto.id"/>&salonInfoDto.salonType=<s:property value="salonInfoDto.salonType"/>"><img src="<%=request.getContextPath()%>/images/online-botton2.png" width="107" height="34" alt="上传内容"/></a>
              </s:if>
            </div>
        </div>
        <h3>活动介绍......</h3>
        <p><s:property value="salonInfoDto.content"/></p>
      <div class="online-left-title title8"><strong>已报名参加的用户</strong><a href="salonSearchAction!userListInfo.action?salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>" target="_blank">更多>></a></div>
        <div class="user-images">
        	<ul>

          	 <s:iterator value="userInforList">
            	<li><a title="<s:property value="userName"/>" href="<s:property value="blogWebUrl"/>?userName=<s:property value="userName"/>" target="_blank" ><img src="<%=request.getContextPath()%>/pic/user-images6.jpg" width="48" height="48" /><br /><s:property value="userName"/></a></li>
              </s:iterator>
            </ul>
        </div>
        <div class="online-left-title title9"><strong>沙龙观点</strong><a href="salonSearchAction!search.action?salonSearchVo.searchTitle=<%=ApplicationConstant.SALON_SEARCH_TITLE_SALONARTICLE%>&salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>" target="_blank">更多>></a></div>
        <s:iterator value="salonArticleList">
        <div class="view">
        	<div class="view-picture"><a href="#"><img src="<%=request.getContextPath()%>/pic/user-images6.jpg" width="48" height="48" /></a></div>
            <div class="view-font">
            	<h3><span>时间：<s:property value="getText('formatDate_yyyy-MM-dd',{submitDate})"/>&nbsp;&nbsp;&nbsp;&nbsp;作者：<s:property value="userName"/></span>
            	<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="id"/>&salonArticleDto.salonId=<s:property value="salonInfoDto.id"/>" target="_blank" title="<s:property value="subject"/>"><span style="width:300px;float:left" class="index_hid_css"><s:property value="subject"/></span></a></h3>
                <p>浏览：<s:property value="browseCount"/>次&nbsp;&nbsp;&nbsp;&nbsp;回应次数：<s:property value="commentCount"/>次</p>
            </div>
        </div>
        </s:iterator>

<!--  
        <div class="online-left-title title8"><span>
        	<a href="salonSearchAction!toPictureUploadPage.action?salonMediaDto.salonId=<s:property value="salonInfoDto.id"/>&salonMediaDto.salonType=1" target="_blank">
    	 <img src="<%=request.getContextPath()%>/images/shang-pic.png" width="72" height="22" alt="上传图片" />
    	 </a>
        </span><strong>沙龙图片</strong><a href="salonSearchAction!pictureListInfo.action?salonId=<s:property value="salonInfoDto.id"/>" target="_blank">更多>></a>
		<s:if test="salonInfoDto.isExpired==0">
    
    	 </s:if>
        </div>

        <div class="salon-image">
        	<ul>
        	   <s:iterator value="salonPictureList" status="numberPosition">
        	   	<s:if test="status==1">
            		<li><a href="salonSearchAction!pictureDetail.action?salonMediaDto.id=<s:property value="id"/>&salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>&curentMediaNumber=<s:property value="#numberPosition.count"/>" target="_blank"><img src="<s:property value="uploadFilePath"/>/<s:property value="MediaName"/>" width="120" height="90" /><br /><s:property value="subject"/></a><br /><s:property value="userName"/></li>
            	</s:if>
               </s:iterator>

            </ul>
        </div>

    	<div class="online-left-title title9"><span>
    	<a href="salonSearchAction!toVideoUploadPage.action?salonMediaDto.salonId=<s:property value="salonInfoDto.id"/>&salonMediaDto.salonType=1" target="_blank">
    	    	<img src="<%=request.getContextPath()%>/images/shang-video.png" width="72" height="22" alt="上传视频" />
    	</a></span><strong>沙龙视频</strong><a href="salonSearchAction!videoListInfo.action?salonId=<s:property value="salonInfoDto.id"/>" target="_blank">更多>></a>
    	<s:if test="salonInfoDto.isExpired==0">
    	
    	</s:if>
    	</div>
        <div class="salon-image">
        	<ul>
        	   <s:iterator value="salonVideoList" status="numberPosition">
        	    <s:if test="status==1">
            		<li><a href="salonSearchAction!videoDetail.action?salonMediaDto.id=<s:property value="id"/>&curentMediaNumber=<s:property value="#numberPosition.count"/>" target="_blank">
            		<s:if test="videoCoverPic == null || videoCoverPic == ''">
	            	 			<img src="<%=request.getContextPath()%>/images/salon-video.jpg" width="120" height="90 title="<s:property value="subject"/>" />
	            	 		</s:if>
	            	 		<s:else>
	            	 			<img src="<s:property value="uploadFilePath"/>/<s:property value="videoCoverPic"/>" width="120" height="90" title="<s:property value="subject"/>"/>
	            	 		</s:else>
            		<br />
            		<s:property value="subject"/></a><br/><s:property value="userName"/></li>
            	</s:if>
               </s:iterator>
            </ul>
        </div>
     -->
        <div class="online-left-title title10"><strong>用户评论</strong></div>

          <s:iterator value="salonCommentList">
        <div class="user-reviews">
        	<h3><span>发表：<s:property value="getText('formatDate_fullTime',{submitDate})"/></span>评论者：<s:property value="userName"/></h3>
            <p><s:property value="content"/></p>
        </div>
        </s:iterator>

        <!--翻页-->
<s:form  id="pageFrom" name="pageFrom" method="POST" action="salonAction!toSalonDetail.action">
 <s:hidden name="salonInfoDto.id"/>
   <div class="salon-qx">
         <s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
   </div>

  <div class="salon-num">
    <s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
  </div>

</s:form>

 <s:form id="commentForm1" name="commentForm1" method="POST" action="salonAction!addSalonComment.action">
 <s:hidden name="salonInfoDto.id"/>
 <s:hidden name="salonInfoDto.salonType"/>
 <div class="online-left-title title10"><strong>发表评论</strong></div>
 <s:if test='#session.userInfoDto==null'>
      <div class="comment">
       	<ul>
              <li class="comment0">用户名：</li>
         	  <li><s:textfield name="userInfo.userName" id="userInfo.userName"/></li>
        	  <li class="comment0">密码：</li>
              <li><s:password name="userInfo.password" id="userInfo.password"/></li>
               <li><a href="<%=request.getContextPath()%>/homePage/homePageAction!toUserRegister.action"><img src="<%=request.getContextPath()%>/images/comment-botton2.png" width="101" height="29" /></a></li>
        </ul>
      </div>
     </s:if>
        <div class="comment"><s:textarea id="content"  name="commentDto.content" cssClass="validate[custom[nullCheckS],length[1,400]]"/></div>
        <div class="comment2">
        <input type="image" src="<%=request.getContextPath()%>/images/comment-botton3.png" width="101" height="29" alt="马上发表"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="salonAction!updateSalonAssessCount.action?salonInfoDto.id=<s:property value="salonInfoDto.id"/>&salonInfoDto.reputationCount=1&salonInfoDto.salonType=<%=ApplicationConstant.SALON_TYPE_ONLINE%>"><img src="<%=request.getContextPath()%>/images/comment-botton4.png" width="89" height="29" alt="好评"/></a>
        <a href="salonAction!updateSalonAssessCount.action?salonInfoDto.id=<s:property value="salonInfoDto.id"/>&salonInfoDto.schlussgruppeCount=1&salonInfoDto.salonType=<%=ApplicationConstant.SALON_TYPE_ONLINE%>"><img src="<%=request.getContextPath()%>/images/comment-botton5.png" width="89" height="29" alt="差评"/></a>
        </div>
  </s:form>


  </div>
    <div class="salon-right">
    	<div class="salon-title title7"><strong>热门线上沙龙</strong></div>
        <div class="online-font">
        	<ul>
        	  <s:iterator value="hotSalonList">
            	<li><a href="salonAction!toSalonDetail.action?salonInfoDto.id=<s:property value="id"/>"><s:property value="subject"/></a></li>
            </s:iterator>

            </ul>
        </div>
    </div>
</div>
</div>
<s:include value="../common/bottom.jsp"/>
</body>
</html>
