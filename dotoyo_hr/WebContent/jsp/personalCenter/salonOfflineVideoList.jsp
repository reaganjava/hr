<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-线下沙龙视频</title>
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
      	<s:form id="searchForm" name="searchForm" method="POST" action="salonManageAction!searchSalonMedia.action">
      	<s:hidden name="salonMediaDto.mediaType" id="salonMediaDto.mediaType"/>
    	<div class="administrator-title"><strong>沙龙视频</strong></div>
        <div class="inside-search">
        	<ul>
            	<li>沙龙名称： <s:textfield id="salonSearchVo.subject" name="salonSearchVo.subject"/></li>
                <li><a href="javascript:submitForm(document.getElementById('searchForm'))"><img src="<%=request.getContextPath()%>/images/inside-botton.png" width="68" height="25" /></a></li>
            </ul>
        </div>
        </s:form>
        <div class="geren-video">
   	    	 <ul>
   	    	 <s:iterator value="salonList">
                 <li>
                  <a href="salonManageAction!toMediaListBySalonPage.action?salonMediaDto.salonId=<s:property value="id"/>&salonMediaDto.mediaType=<%=ApplicationConstant.MEDIA_TYPE_VIDEO%>"
                  title="<s:property value="subject"/>">
                    <img src="<s:property value="uploadFilePath"/>/<s:property value="subjectPic"/>" width="120" height="90" /><br />
                     <span style="width:130px;float:left" class="index_hid_css"><s:property value="subject"/></span>
                    (<s:property value="salonMediaCount"/>)
                   </a>
                    <p>
                    	<a href="salonManageAction!toUploadMediaPage.action?salonMediaDto.salonId=<s:property value="id"/>&salonMediaDto.mediaType=<s:property value="salonMediaDto.mediaType"/>&goFrom=0" title="增加图片">
                    		增加
                    	</a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    </p>
                 </li>
             </s:iterator>
             </ul>
		</div>
	<s:form  id="pageFrom" name="pageFrom" method="POST" action="salonManageAction!toMediaListPage.action">
  	 <s:hidden name="salonMediaDto.mediaType" id="salonMediaDto.mediaType"/>
       <div class="qx">
           <s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
       </div>
        <div class="num">
        	<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
       	</div>
     </s:form>
  </div>

</div>
<script type="text/javascript">
function init(){
	$("#position_offlineSalonMedia").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
}
</script>
</body>
</html>