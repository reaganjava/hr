<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>大太阳建筑猎头-创业沙龙-沙龙视频</title>
	<s:include value="/jsp/common/JsAndCss.jsp"/>
	<link href="<%=request.getContextPath()%>/css/salon.css" rel="stylesheet" type="text/css" />
	<script src="<%=request.getContextPath()%>/javascripts/common/jcarousellite_1.0.1.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
	<link href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

function playmv(u){
	document.getElementById('play').innerHTML = '<embed id="abc" wmode="transparent" quality="high" width="275" height="550" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" src="' + u + '" /></embed>'
}

function setImageUrl(index,imageUrl,subject){

	var embed1= document.getElementById("classicvideopic");
	embed1.innerHTML = '<embed id="abc" wmode="transparent" quality="high" width="500" height="374" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" src="' + imageUrl + '" alt="'+subject+'" /></embed>';
	
	document.getElementById("curentMediaNumber").innerHTML=index;
	document.getElementById("subject").innerHTML=subject;

	
}
var flag = false;
function beforeCall(form, options){
   flag = $("#commentxForm").validationEngine('validate');
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
    $("#commentxForm").validationEngine({
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
<!--中间部分-->
<div class="online-content">
	<div class="online-left">
	<s:actionmessage cssStyle="color:blue"/>
    	<h1><span id="subject"><s:property value="salonMediaDto.subject"/></span><em>&nbsp;(<span id="curentMediaNumber"><s:property value="curentMediaNumber"/></span>/<s:property value="mediaCount"/>)<br />作者：<s:property value="salonMediaDto.userName"/>&nbsp;&nbsp;&nbsp;&nbsp;发表：<s:property value="getText('formatDate_fullTime',{salonMediaDto.submitDate})"/></em></h1>
        <div id="classicvideopic" class="classic-video-pic"><embed  src="<s:property value="uploadFilePath"/>/<s:property value="salonMediaDto.mediaName"/>" width="500" height="374" alt="<s:property value="salonMediaDto.subject"/>"/></div>
        <div class="small-video">
        	<div class="small-video-botton"><img src="<%=request.getContextPath()%>/images/small-video-left.png" width="27" height="30" class="prev"/></div>
            <div class="small-video-img">

                <ul>
                   <s:iterator value="salonVideoList" status="numberPosition">
                    <li>
                    	<a onclick="setImageUrl('<s:property value="#numberPosition.count"/>','<s:property value="uploadFilePath"/>/<s:property value="MediaName"/>','<s:property value="subject"/>');">
	            	 		<s:if test="videoCoverPic == null || videoCoverPic == ''">
	            	 			<img src="<%=request.getContextPath()%>/images/sp2.png" width="120" height="90" title="<s:property value="subject"/>"/>
	            	 		</s:if>
	            	 		<s:else>
	            	 			<img src="<s:property value="uploadFilePath"/>/<s:property value="videoCoverPic"/>" width="120" height="90" title="<s:property value="subject"/>"/>
	            	 		</s:else>
                    	</a>
                    </li>
                   </s:iterator>
                </ul>
            </div>
            <div class="small-video-botton2"><img src="<%=request.getContextPath()%>/images/small-video-right.png" width="27" height="30" class="next"/></div>
        </div>
         <s:form target="_blank" action="salonSearchAction!searchVideo.action">
         <s:hidden name="curentMediaNumber"/>
         <s:hidden name="searchFlag"/>
         <s:hidden id="searchContent" name="salonSearchVo.searchContent"/>
		<div class="classic-search">
        	<ul>
            	<li><input id="keyWords" name="salonSearchVo.keyWords" type="text" value="搜索视频" onfocus="if(this.value == '搜索视频')this.value='';" onblur="if(this.value=='')this.value='搜索视频'"/></li>
                <li class="ppk"><a href="#""><input type="image" src="<%=request.getContextPath()%>/images/classic-search.png" width="71" height="28"/></a></li>
           <li><a href="salonSearchAction!videoListInfo.action?salonId=<s:property value="salonSearchVo.salonId"/>" target="_blank">全部视频</a></li>
            </ul>
        </div>
        </s:form>
        <div class="online-left-title title10"><strong>用户评论</strong></div>
       <s:iterator value="commentList">
        <div class="user-reviews">
        	<h3><span>发表：<s:property value="getText('formatDate_fullTime',{submitDate})"/></span><s:property value="userName"/></h3>
            <p><s:property value="content"/></p>
        </div>
      </s:iterator>
       <!--翻页-->
  <s:form  id="pageFrom" name="pageFrom" method="POST" action="salonSearchAction!videoDetail.action">
      <s:hidden name="salonMediaDto.id"/>
      <s:hidden name="searchFlag"/>
      <s:hidden name="curentMediaNumber"/>
        <div class="salon-qx">
            <s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
        </div>
		<div class="salon-num">
        	<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
        </div>
    </s:form>
     <s:form id="commentxForm" name="commentxForm"  method="POST" action="salonSearchAction!addVideoComment.action">
        <s:hidden name="salonMediaDto.id"/>
        <s:hidden name="searchFlag"/>
        <s:hidden name="curentMediaNumber"/>
        <div class="online-left-title title9"><strong>发表评论</strong></div>
        <s:if test='#session.userInfoDto==null'>
        <div class="comment">
        	<ul>
            	<li class="comment0">用户名：</li>
            	<li><a href="#"><input name="" type="text" /></a></li>
                <li class="comment0">密码：</li>
                <li><a href="#"><input name="" type="text" /></a></li>
                <li><a href="#"><img src="<%=request.getContextPath()%>/images/comment-botton2.png" width="101" height="29" /></a></li>
            </ul>
        </div>
        </s:if>
        <div class="comment"><s:textarea id="content"  name="commentDto.content" cssClass="validate[custom[nullCheckS],length[1,400]]"/></div>
        <div class="comment2"><input type="image" src="<%=request.getContextPath()%>/images/comment-botton3.png" alt="马上发表"/></div>
      </s:form>
  </div>
    <div class="salon-right">
    	<div class="salon-title title7"><strong>经典沙龙</strong><a href="salonSearchAction!searchSalon.action?salonSearchVo.isExcellent=1">更多>></a></div>
        <div class="classic-font">
         <s:if test="firstClassSalonDto!=null">
        	<dl>
                <dt><a href="salonAction!toSalonDetail.action?salonInfoDto.id=<s:property value="firstClassSalonDto.id"/>" target="_Blank"><img src="<s:property value="uploadFilePath"/>/<s:property value="firstClassSalonDto.subjectPic"/>" width="120" height="90" /></a></dt>
                <dd><a href="salonAction!toSalonDetail.action?salonInfoDto.id=<s:property value="firstClassSalonDto.id"/>" target="_Blank"><s:property value="firstClassSalonDto.subject"/></a></dd>
                <dd><span  style="width: 100px; float: left" class="index_hid_css"><s:property value="firstClassSalonDto.content"/></span></dd>
            </dl>
          </s:if>
          <s:if test="classicSalonList!=null">
            <ul>
        	    <s:iterator value="classicSalonList">
            	<li><a href="salonAction!toSalonDetail.action?salonInfoDto.id=<s:property value="id"/>" target="_Blank"><s:property value="subject"/></a></li>
            	</s:iterator>
            </ul>
            </s:if>
        </div>
        <div class="salon-title title7"><strong>经典视频</strong><a href='salonSearchAction!classVideoListInfo.action?salonSearchVo.salonId=<s:property value="salonSearchVo.salonId"/>'>更多>></a></div>
        <div class="classic-video">
        	<ul>
            	<s:iterator value="classicMediaList" status="count">
            	<s:if test="#count.odd ||count.first">
            	<li class="classic1">
            	</s:if>
            	<s:elseif test="#count.even||count.last">
	             <li>
	           </s:elseif>
            	 	<a href="salonSearchAction!videoDetail.action?salonMediaDto.id=<s:property value="id"/>"><s:if test="videoCoverPic == null || videoCoverPic == ''"><img src="<%=request.getContextPath()%>/images/sp2.png" width="120" height="90" title="<s:property value="subject"/>"/></s:if><s:else><img src="<s:property value="uploadFilePath"/>/<s:property value="videoCoverPic"/>" width="120" height="90" title="<s:property value="subject"/>"/></s:else><br/><span><s:property value="subject"/></span></a>
            	</li>
            	</s:iterator>
            </ul>
        </div>
    </div>
</div>
<s:include value="/jsp/common/bottom.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
    $(".small-video-img").jCarouselLite({
        btnNext: ".next",
        btnPrev: ".prev",
        scroll:3
    });
});
</script>
</body>
</html>
