<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-增值服务</title>
	<s:include value="/html/common/JsAndCss.html"></s:include>
	<link href="<%=request.getContextPath()%>/css/head.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/other.css" rel="stylesheet" type="text/css" />
	<s:include value="/jsp/common/JsAndCss.jsp"/>
</head>
<body>
<s:include value="/jsp/common/head.jsp"></s:include>
<s:include value="homePageNav.jsp"/>
<div class="services-title"><img src="<%=request.getContextPath()%>/images/services-title.png" width="161" height="18" /></div>
<div class="services-box">
	<div class="services-nav">
	 <ul>
        	<li class="dh-on"><a href="services.jsp"><em>1.</em>人才挖掘服务</a></li>
            <li class="dh-out"><a href="services2.jsp"><em>2.</em>挂证服务</a></li>
            <li class="dh-on"><a href="services3.jsp"><em>3.</em>猎证服务</a></li>
            <li class="dh-on"><a href="services4.jsp"><em>4.</em>招聘服务</a></li>
            <li class="dh-on"><a href="services5.jsp"><em>5.</em>广告位服务</a></li>
        </ul>
	</div>
  <div class="services-add-bg gzfw-banner">
    	<div class="add-font"></div>
        <div class="add-about">
       	  <div class="add-about-title"><span>挂证服务简介</span></div>
            <h3>什么是挂证服务？</h3>
            <p>将您的个人注册证书信息提交给我们，在有最新行业猎头及证书兼职信息时，我们会和您及时联系，免费帮您寻找合适
职位。证书信息确保填写完整，包括证书专业、考证省份、注册情况及社会保险等，以便我们更好的为您服务。</p>
        </div>
  </div>
</div>
<s:include value="/jsp/common/bottom.jsp"></s:include>
</body>
</html>