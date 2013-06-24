<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大太阳建筑猎头-创业沙龙</title>
<link href="<%=request.getContextPath()%>/css/salon.css" rel="stylesheet" type="text/css" />
<link type="image/x-icon" href="/images/dotoyo.ico" rel="shortcut icon">
<s:include value="/jsp/common/JsAndCss.jsp"/>
<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<s:include value="/jsp/common/head.jsp"/>
<s:include value="innovationSalonNav.jsp"/>
<s:include value="/html/innovationSalon/salonIndexTop.html"/>
<s:include value="/html/innovationSalon/salonIndexOffLine.html"/>
<s:include value="/html/innovationSalon/salonIndexOnline.html"/>
<s:include value="/html/innovationSalon/salonIndexHostUnit.html"/>
<s:include value="/html/innovationSalon/salonIndexAdvert.html"/>
<s:include value="/html/innovationSalon/salonIndexClassic.html"/>
<s:include value="/html/innovationSalon/salonIndexClassicArticle.html"/>
<s:include value="/html/innovationSalon/salonIndexBottom.html"/>
      	<div class="wangjie-box">
			<s:if test="firstOldSalonInfoDto != null">
			
	             <div class="wangjie-pic">
	             <s:if test="firstOldSalonInfoDto.salonType==1">
	             <a href="salonAction!toSalonDetail.action?salonInfoDto.id=<s:text name='firstOldSalonInfoDto.id'/>" target="_blank">
	             </s:if>
	             <s:if test="firstOldSalonInfoDto.salonType==0">
	             <a href="salonAction!toOffLineSalonDetail.action?salonInfoDto.id=<s:text name='firstOldSalonInfoDto.id'/>" target="_blank">
	             </s:if>
	             <img src="<s:text name='uploadFilePath'/>/<s:text name='firstOldSalonInfoDto.subjectPic'/>" width="76" height="57" alt="<s:text name='firstOldSalonInfoDto.id'/>"/></a></div>
	             <div class="wangjie-pic-font small-links">
	             
	                	             <s:if test="firstOldSalonInfoDto.salonType==1">
	             <a href="salonAction!toSalonDetail.action?salonInfoDto.id=<s:text name='firstOldSalonInfoDto.id'/>" target="_blank">
	             </s:if>
	             <s:if test="firstOldSalonInfoDto.salonType==0">
	             <a href="salonAction!toOffLineSalonDetail.action?salonInfoDto.id=<s:text name='firstOldSalonInfoDto.id'/>" target="_blank">
	             </s:if>
	                 
	                 <span class="index_hid_css" style="width:160px;float:left" title="<s:text name='firstOldSalonInfoDto.subject'/>"><s:text name='firstOldSalonInfoDto.subject'/></span></a><br />
	                  	发起时间：<s:date name="firstOldSalonInfoDto.startDate" format="yyyy-MM-dd"/>
	             </div>
			</s:if>
      	</div>
        <div class="wangjie-text">
        	<ul>
	        <s:if test="oldSalonList != null">
	        	<s:iterator value="oldSalonList" var="dto">
	                <dl>
	                	<dt>
	                		<s:if test="salonType==1">
		                	<a href="salonAction!toSalonDetail.action?salonInfoDto.id=<s:text name="id"/>" target="_blank" title="<s:text name="subject"/>">
	                			<s:text name="subject"/>
		                	</a>
		                	</s:if>
		                	<s:if test="salonType==0">
		                	<a href="salonAction!toOffLineSalonDetail.action?salonInfoDto.id=<s:text name="id"/>" target="_blank" title="<s:text name="subject"/>">
	                			<s:text name="subject"/>
		                	</a>
		                	</s:if>
	                	</dt>
	                	<dd><s:date name="startDate" format="yyyy-MM-dd"/></dd>
	                </dl>
	            </s:iterator>
	        </s:if>
            </ul>
        </div>
    </div>
</div>
<!--优秀创业团队-->
<s:include value="/jsp/common/bottom.jsp"/>
</body>
</html>
