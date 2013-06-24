<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大太阳建筑猎头-创业沙龙-线下沙龙</title>
<s:include value="/jsp/common/JsAndCss.jsp"/>
<link href="<%=request.getContextPath()%>/css/salon.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
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
<style>
.line-part h3 a{color:#fff; text-decoration:none;}
.line-part h3 a:hover{color:#fff; text-decoration:none;}
</style>
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
        <div class="online-pic-box2">
        	<div class="online-pic"><img src="<s:property value="uploadFilePath"/>/<s:property value="salonInfoDto.subjectPic"/>" width="320" height="240" /></div>
            <div class="online-pic-font2">
            	<ul>
                    <li>开始时间：<s:property value="getText('formatDate_yyyy-MM-dd',{salonInfoDto.startDate})"/></li>
                    <li>结束时间：<s:property value="getText('formatDate_yyyy-MM-dd',{salonInfoDto.endDate})"/></li>
                    <li>已参人数：<s:property value="salonInfoDto.salonAttendCount"/>人</li>
                    <li>组&nbsp;&nbsp;织&nbsp;&nbsp;者：<s:property value="salonInfoDto.userName"/></li>
                    <li>举办地点：<s:property value="salonInfoDto.location"/></li>
                    <li>举办单位：<s:property value="salonInfoDto.sponsor"/></li>
                    <li><span>好评｛<s:property value="salonInfoDto.reputationCount"/>｝&nbsp;&nbsp;&nbsp;&nbsp;差评｛<s:property value="salonInfoDto.schlussgruppeCount"/>｝</span></li>
              </ul>
              <s:if test="salonInfoDto.isExpired==0">
                 <a href="salonAction!addSalonAttend.action?salonInfoDto.id=<s:property value="salonInfoDto.id"/>&salonInfoDto.salonType=<s:property value="salonInfoDto.salonType"/>"><img src="<%=request.getContextPath()%>/images/online-botton1.png" width="107" height="34" alt="我要参加"/></a>
                 <a href="salonAction!toSalonOfflineUploadPage.action?salonInfoDto.id=<s:property value="salonInfoDto.id"/>&salonInfoDto.salonType=<s:property value="salonInfoDto.salonType"/>"><img src="<%=request.getContextPath()%>/images/online-botton2.png" width="107" height="34" alt="上传内容"/></a>
            </s:if>
            </div>
        </div>
        <h3>活动介绍......</h3>
       <p><s:property value="salonInfoDto.content"/></p>
  </div>
    <div class="salon-right">
    	<div class="salon-title title7"><strong>已报名参加活动的用户</strong><a href="salonSearchAction!userListInfo.action?salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>" target="_blank">更多>></a></div>
        <div class="line-images">
        	<ul>
        	    <s:iterator value="userInforList">
            	<li><a title="<s:property value="userName"/>" href="<s:property value="blogWebUrl"/>?userName=<s:property value="userName"/>" target="_blank" ><img src="<%=request.getContextPath()%>/pic/user-images6.jpg" width="48" height="48" /><br /><s:property value="userName"/></a></li>
                 </s:iterator>
            </ul>
        </div>

    </div>
</div>
<s:if test="salonArticle1001Dto !=null">
<div class="online-left-title title11"><strong>嘉宾致辞</strong><a href="salonSearchAction!search.action?salonSearchVo.offlineSalonColumn=018-1001&salonSearchVo.searchTitle=<%=ApplicationConstant.SALON_SEARCH_TITLE_SALONARTICLE%>&salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>" target="_blank">更多>></a></div>
<div class="line-part">
  	<h3  class="line-h-bg1"><a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1001Dto.id"/>" target="_blank"><s:property value="salonArticle1001Dto.subject"/></a></h3>
    <dl class="line-dl1">
    	<dt>
    		<a href="#">
    			<s:if test="salonArticle1001Dto.facePicName != null && salonArticle1001Dto.facePicName != ''">
    				<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1001Dto.id"/>" target="_blank"><img src="<s:property value="uploadFilePath"/>/<s:property value="salonArticle1001Dto.facePicName"/>" width="320" height="240" /></a>
    			</s:if>
    		</a>
    	</dt>
    	<dd class="<s:property value="salonArticle1001Dto.styleClass"/>">
    	发言者：<s:property value="salonArticle1001Dto.authorName"/>
    	    时间：<s:property value="getText('formatDate_yyyy-MM-dd',{salonArticle1001Dto.submitDate})"/>
               浏览次数：<s:property value="salonArticle1001Dto.browseCount"/>次
    	</dd>
        <dd class="line-dd2">
	        <div style="height:190px;overflow:hidden;">
	        	<s:property value="salonArticle1001Dto.content" escape="false"/>
	        </div>
	        <div style="text-align:right;margin-right:10px;">
	        	<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1001Dto.id"/>" target="_blank">[查看详细]</a>
	        </div>
       </dd>
    </dl>
</div>
</s:if>
<s:if test="salonArticle1002Dto !=null">
<div class="online-left-title title11"><strong>嘉宾观点</strong><a href="salonSearchAction!search.action?salonSearchVo.offlineSalonColumn=018-1002&salonSearchVo.searchTitle=<%=ApplicationConstant.SALON_SEARCH_TITLE_SALONARTICLE%>&salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>" target="_blank">更多>></a></div>
<div class="line-part">
  	<h3 class="line-h-bg3"><a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1002Dto.id"/>" target="_blank"><s:property value="salonArticle1002Dto.subject"/></a></h3>
    <dl class="<s:property value="salonArticle1002Dto.styleClass"/>">
    	<dt><a href="#">
    		<s:if test="salonArticle1002Dto.facePicName != null && salonArticle1002Dto.facePicName != ''">
    		<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1002Dto.id"/>" target="_blank">
    			<img src="<s:property value="uploadFilePath"/>/<s:property value="salonArticle1002Dto.facePicName"/>" width="320" height="240" />
    		</a>
    		</s:if>
    	</a></dt>
    	<dd class="line-dd1">
    	发言者：<s:property value="salonArticle1002Dto.authorName"/>
    	时间：<s:property value="getText('formatDate_yyyy-MM-dd',{salonArticle1002Dto.submitDate})"/>
    	 浏览次数：<s:property value="salonArticle1002Dto.browseCount"/>次
    	 </dd>
        <dd class="line-dd2">
	        <div style="height:190px;overflow:hidden;">
	        	<s:property value="salonArticle1002Dto.content" escape="false"/>
	        </div>
	        <div style="text-align:right;margin-right:10px;">
	        	<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1002Dto.id"/>" target="_blank">[查看详细]</a>
	        </div>
       </dd>

    </dl>
</div>
</s:if>
<s:if test="salonArticle1003Dto !=null">
<div class="online-left-title title12"><strong>用户观点</strong><a href='salonSearchAction!search.action?salonSearchVo.offlineSalonColumn=018-1003&salonSearchVo.searchTitle=<%=ApplicationConstant.SALON_SEARCH_TITLE_SALONARTICLE%>&salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>'  target="_blank">更多>></a></div>
<div class="line-part">
  	<h3  class="line-h-bg3"><a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1003Dto.id"/>" target="_blank"><s:property value="salonArticle1003Dto.subject"/></a></h3>
    <dl class="<s:property value="salonArticle1003Dto.styleClass"/>">
    	<dt><a href="#">
    		<s:if test="salonArticle1003Dto.facePicName != null && salonArticle1003Dto.facePicName != ''">
    		<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1003Dto.id"/>" target="_blank">
    			<img src="<s:property value="uploadFilePath"/>/<s:property value="salonArticle1003Dto.facePicName"/>" width="320" height="240" />
    		</a>
    		</s:if>
    	</a></dt>
    	<dd class="line-dd1">
    	发言者：<s:property value="salonArticle1003Dto.authorName"/>
    	时间：<s:property value="getText('formatDate_yyyy-MM-dd',{salonArticle1003Dto.submitDate})"/>
    	 浏览次数：<s:property value="salonArticle1003Dto.browseCount"/>次
    	 </dd>
        <dd class="line-dd2">
	        <div style="height:190px;overflow:hidden;">
	        	<s:property value="salonArticle1003Dto.content" escape="false"/>
	        </div>
	        <div style="text-align:right;margin-right:10px;">
	        	<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1003Dto.id"/>" target="_blank">[查看详细]</a>
	        </div>
		</dd>

    </dl>
</div>
</s:if>
<s:if test="salonArticle1004Dto!=null">
<div class="online-left-title title12"><strong>嘉宾讨论</strong><a href='salonSearchAction!search.action?salonSearchVo.offlineSalonColumn=018-1004&salonSearchVo.searchTitle=<%=ApplicationConstant.SALON_SEARCH_TITLE_SALONARTICLE%>&salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>' target="_blank">更多>></a></div>
<div class="line-part">
  	<h3 class="line-h-bg2"><a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1004Dto.id"/>" target="_blank"><s:property value="salonArticle1004Dto.subject"/></a></h3>
    <dl class="<s:property value="salonArticle1004Dto.styleClass"/>">
    	<dt><a href="#">
    		<s:if test="salonArticle1004Dto.facePicName != null && salonArticle1004Dto.facePicName != ''">
    		<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1004Dto.id"/>" target="_blank">
    			<img src="<s:property value="uploadFilePath"/>/<s:property value="salonArticle1004Dto.facePicName"/>" width="320" height="240" />
    		</a>
    		</s:if>
    	</a></dt>
    	<dd class="line-dd1">
    	发言者：<s:property value="salonArticle1004Dto.authorName"/>
    	时间：<s:property value="getText('formatDate_yyyy-MM-dd',{salonArticle1004Dto.submitDate})"/>
    	 浏览次数：<s:property value="salonArticle1004Dto.browseCount"/>次
    	</dd>
        <dd class="line-dd2">
	        <div style="height:190px;overflow:hidden;">
	        	<s:property value="salonArticle1004Dto.content" escape="false"/>
	        </div>
	        <div style="text-align:right;margin-right:10px;">
	         	<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1004Dto.id"/>" target="_blank">[查看详细]</a>
	        </div>
        </dd>

    </dl>
</div>
</s:if>
<s:if test="salonArticle1005Dto !=null">
<div class="online-left-title title13"><strong>嘉宾互动</strong>	<a href='salonSearchAction!search.action?salonSearchVo.offlineSalonColumn=018-1005&salonSearchVo.searchTitle=<%=ApplicationConstant.SALON_SEARCH_TITLE_SALONARTICLE%>&salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>' target="_blank">更多>></a></div>
<div class="line-part">
  	<h3  class="line-h-bg3"><a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1005Dto.id"/>" target="_blank"><s:property value="salonArticle1005Dto.subject"/></a></h3>
    <dl class="<s:property value="salonArticle1005Dto.styleClass"/>">
    	<dt><a href="#">
    		<s:if test="salonArticle1005Dto.facePicName != null && salonArticle1005Dto.facePicName != ''">
    		<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1005Dto.id"/>" target="_blank">
    			<img src="<s:property value="uploadFilePath"/>/<s:property value="salonArticle1005Dto.facePicName"/>" width="320" height="240" />
    	</a>
    		</s:if>
    	</a></dt>
    	<dd class="line-dd1">
    	发言者：<s:property value="salonArticle1005Dto.authorName"/>
    	时间：<s:property value="getText('formatDate_yyyy-MM-dd',{salonArticle1005Dto.submitDate})"/>
    	 浏览次数：<s:property value="salonArticle1005Dto.browseCount"/>次
    	</dd>
        <dd class="line-dd2">
	        <div style="height:190px;overflow:hidden;">
	        	<s:property value="salonArticle1005Dto.content" escape="false"/>
	        </div>
	        <div style="text-align:right;margin-right:10px;">
	        	<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1005Dto.id"/>" target="_blank">[查看详细]</a>
	        </div>
        </dd>

    </dl>
</div>
</s:if>
<s:if test="salonArticle1006Dto!=null">
<div class="online-left-title title13"><strong>用户互动</strong><a href='salonSearchAction!search.action?salonSearchVo.offlineSalonColumn=018-1006&salonSearchVo.searchTitle=<%=ApplicationConstant.SALON_SEARCH_TITLE_SALONARTICLE%>&salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>' target="_blank">更多>></a></div>
<div class="line-part">
  	<h3 class="line-h-bg3"><a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1006Dto.id"/>" target="_blank"><s:property value="salonArticle1006Dto.subject"/></a></h3>
    <dl class="<s:property value="salonArticle1006Dto.styleClass"/>">
    	<dt><a href="#">
    		<s:if test="salonArticle1006Dto.facePicName != null && salonArticle1006Dto.facePicName != ''">
    		<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1006Dto.id"/>" target="_blank">
    			<img src="<s:property value="uploadFilePath"/>/<s:property value="salonArticle1006Dto.facePicName"/>" width="320" height="240" />
    		</a>
    		</s:if>
    	</a></dt>
    	<dd class="line-dd1">
    	发言者：<s:property value="salonArticle1006Dto.authorName"/>
    	时间：<s:property value="getText('formatDate_yyyy-MM-dd',{salonArticle1006Dto.submitDate})"/>
    	 浏览次数：<s:property value="salonArticle1006Dto.browseCount"/>次
    	</dd>
        <dd class="line-dd2">
	        <div style="height:190px;overflow:hidden;">
	        	<s:property value="salonArticle1006Dto.content" escape="false"/>
	        </div>
	        <div style="text-align:right;margin-right:10px;">
	        	<a href="salonAction!toArticleDetail.action?salonArticleDto.id=<s:property value="salonArticle1006Dto.id"/>" target="_blank">[查看详细]</a>
	        </div>
		</dd>
	</dl>
</div>
</s:if>
<div class="line-pic-video">
	<div class="line-pic">
    	<div class="online-left-title title14"><span>
    	<s:if test="salonInfoDto.isExpired==0">
    	<a href="salonSearchAction!toVideoUploadPage.action?salonMediaDto.salonId=<s:property value="salonInfoDto.id"/>" target="_blank">
    	<img src="<%=request.getContextPath()%>/images/salon-botton3.png" width="72" height="22" alt="上传视频" />
    	</a>
    	</s:if>
    	</span><strong>沙龙视频</strong>
    	<a href="salonSearchAction!videoListInfo.action?salonId=<s:property value="salonInfoDto.id"/>" target="_blank">更多>></a></div>
        <div class="line-font">
        	<s:if test="firstVideoDto !=null">
        	<dl>
                <dt>
               <a href="salonSearchAction!videoDetail.action?salonMediaDto.id=<s:property value="firstVideoDto.id"/>" target="_blank">
                  <img src="<s:property value="uploadFilePath"/>/<s:property value="firstVideoDto.videoCoverPic"/>" width="120" height="90" />
                </a></dt>
                <dd><a href="salonSearchAction!videoDetail.action?salonMediaDto.id=<s:property value="firstVideoDto.id"/>&salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>" target="_blank"><s:property value="firstVideoDto.subject"/></a></dd>
                <dd><s:property value="firstVideoDto.userName"/></dd>
            </dl>
            </s:if>
        	<ul>
        	    <s:iterator value="salonVideoList" status="numberPosition">
            	  <li><a href="salonSearchAction!videoDetail.action?salonMediaDto.id=<s:property value="id"/>&salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>&curentMediaNumber=<s:property value="#numberPosition.count"/>" target="_blank"><s:property value="subject"/></a></li>
                </s:iterator>
            </ul>
        </div>
    </div>
    <div class="line-video">
    	<div class="online-left-title title15"><span>
    	<s:if test="salonInfoDto.isExpired==0">
    	<a href="salonSearchAction!toPictureUploadPage.action?salonMediaDto.salonId=<s:property value="salonInfoDto.id"/>" target="_blank">
    	 <img src="<%=request.getContextPath()%>/images/salon-botton4.png" width="72" height="22" alt="上传图片" />
    	 </a>
    	 </s:if>
    	</span><strong>沙龙图片</strong>
    	<a href="salonSearchAction!pictureListInfo.action?salonId=<s:property value="salonInfoDto.id"/>" target="_blank">更多>></a></div>

        <div class="line-video-pic">
        	<ul>
        	  <s:iterator value="salonPictureList"  status="numberPosition">
            	<li><a href="salonSearchAction!pictureDetail.action?salonMediaDto.id=<s:property value="id"/>&salonSearchVo.salonId=<s:property value="salonInfoDto.id"/>&curentMediaNumber=<s:property value="#numberPosition.count"/>" target="_blank">
            	<img src="<s:property value="uploadFilePath"/>/<s:property value="MediaName"/>" width="120" height="90" /><br /><s:property value="userName"/></a>
            	</li>
            </s:iterator>
            </ul>
        </div>
    </div>
</div>
<div class="online-left-title title13"><strong>用户评论</strong></div>
   <s:iterator value="salonCommentList">
<div class="salon-line">
	<h3>
	  <span>发表：<s:property value="getText('formatDate_fullTime',{submitDate})"/></span>
	                    评论者：<s:property value="userName"/>
	</h3>
	<p><s:property value="content"/></p>
</div>
</s:iterator>
<s:form  id="pageFrom" name="pageFrom" method="POST" action="salonAction!toOffLineSalonDetail.action">
 <s:hidden name="salonInfoDto.id"/>
<div class="qx">
      <s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
</div>
<div class="num">
	    <s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
</div>
</s:form>

 <s:form id="commentForm1" name="commentForm1" method="POST" action="salonAction!addSalonComment.action">
 <s:hidden name="salonInfoDto.id"/>
 <s:hidden name="salonInfoDto.salonType"/>
<div class="online-left-title title13"><strong>发表评论</strong></div>
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
<div class="comment2"><input type="image"  src="<%=request.getContextPath()%>/images/comment-botton3.png" width="101" height="29" alt="马上发表"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="salonAction!updateSalonAssessCount.action?salonInfoDto.id=<s:property value="salonInfoDto.id"/>&salonInfoDto.reputationCount=1&salonInfoDto.salonType=<s:property value="salonInfoDto.salonType"/>"><img src="<%=request.getContextPath()%>/images/comment-botton4.png" width="89" height="29" alt="好评"/></a>
<a href="salonAction!updateSalonAssessCount.action?salonInfoDto.id=<s:property value="salonInfoDto.id"/>&salonInfoDto.schlussgruppeCount=1&salonInfoDto.salonType=<s:property value="salonInfoDto.salonType"/>"><img src="<%=request.getContextPath()%>/images/comment-botton5.png" width="89" height="29" alt="差评"/></a><br /><br /><br /></div>
</s:form>

</div>
<s:include value="/jsp/common/bottom.jsp"/>
</body>


</html>
