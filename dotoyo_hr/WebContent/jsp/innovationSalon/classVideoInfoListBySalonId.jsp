<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大太阳建筑猎头-创业沙龙-经典视频</title>
<s:include value="/jsp/common/JsAndCss.jsp"/>
<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
</head>

<body>
<s:include value="/jsp/common/head.jsp"/>
<s:include value="innovationSalonNav.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<s:form  id="pageFrom" name="pageFrom" method="POST" action="salonSearchAction!videoListInfo.action">
<s:hidden id="salonId" name="salonId"/>
<div class="index-login-box">
  <div class="jobs-title"><strong>经典视频</strong></div>
  <div class="salon-pic-more">
	   <ul>
	   <s:iterator value="salonVideoList">
            <li>
            	<a href="salonSearchAction!videoDetail.action?salonMediaDto.id=<s:property value="id"/>" target="_blank">
            		<s:if test="videoCoverPic == null || videoCoverPic == ''">
            			<img src="<%=request.getContextPath()%>/images/sp2.png" width="120" height="90" title="<s:property value="subject"/>"/>
            		</s:if>
            		<s:else>
            			<img src="<s:property value="uploadFilePath"/>/<s:property value="videoCoverPic"/>" width="120" height="90" title="<s:property value="subject"/>"/>
            		</s:else>
            	</a>
            	<br/>
            	<span title="<s:property value="userName"/>"><s:property value="userName"/></span>
            </li>
       </s:iterator>
       </ul>
  </div>
</div>

<div class="qx">
   <s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
</div>
<div class="num">
   <s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
</div>
</s:form>
<s:include value="../common/bottom.jsp"/>
</body>

</html>
