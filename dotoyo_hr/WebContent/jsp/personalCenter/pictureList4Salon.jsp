<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-线下沙龙图片</title>
	<s:include value="/jsp/common/backgroundUserJsAndCss.jsp"/>
	<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
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
<s:actionmessage cssStyle="color:blue"/>
 <div class="content-right">
    	<div class="administrator-title"><strong>沙龙图片</strong></div>
       <s:form id="deleteForm" name="deleteForm" method="POST" action="salonManageAction!deleteMedia.action">
       <s:hidden name="salonMediaDto.mediaType" id="salonMediaDto.mediaType"/>
  	   <s:hidden name="salonMediaDto.salonId" id="salonMediaDto.salonId"/>
        <div class="geren-video">
   	    	 <ul>
   	    	 <s:iterator value="mediaList">
                 <li><a href="salonSearchAction!pictureDetail.action?salonMediaDto.id=<s:property value="id"/>&searchFlag=1" target="_blank"">
                  <img src="<s:property value="uploadFilePath"/>/<s:property value="MediaName"/>" width="120" height="90" /><br/>
                  <span style="width:120px;float:left" title="<s:property value="subject"/>" class="index_hid_css"><s:property value="subject"/></span>
                  </a><p><input id="arrayIds" name="arrayIds" type="checkbox" value="<s:property value="id"/>"/></p>
                </li>
             </s:iterator>
             </ul>
		</div>
	</s:form>
	<s:form  id="pageFrom" name="pageFrom" method="POST" action="salonManageAction!toMediaListBySalonPage.action">
  	 <s:hidden name="salonMediaDto.mediaType" id="salonMediaDto.mediaType"/>
  	 <s:hidden name="salonMediaDto.salonId" id="salonMediaDto.salonId"/>
       <div class="qx">
           <s:property value="pageInfo.htmlListTableFootInfo" escapeHtml="false"/>
       </div>
       	<div class="system-botton3">
        	<ul>
                <li class="botton1"><a href="salonManageAction!toUploadMediaPage.action?salonMediaDto.salonId=<s:property value="salonMediaDto.salonId"/>&salonMediaDto.mediaType=<s:property value="salonMediaDto.mediaType"/>&goFrom=1" title="增加图片">增加图片</a></li>
                <li class="botton3"><a href="#" onclick="submitFormChooseCheck(deleteForm,'arrayIds')" title="删除">删除</a></li>
            </ul>
		</div>
        <div class="num">
        	<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
       	</div>
     </s:form>
  </div>

</div>

</body>
<script type="text/javascript">
function init(){
	$("#position_offlineSalonPicture").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
}
</script>
</html>