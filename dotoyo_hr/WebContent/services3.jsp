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
            <li class="dh-on"><a href="services2.jsp"><em>2.</em>挂证服务</a></li>
            <li class="dh-out"><a href="services3.jsp"><em>3.</em>猎证服务</a></li>
            <li class="dh-on"><a href="services4.jsp"><em>4.</em>招聘服务</a></li>
            <li class="dh-on"><a href="services5.jsp"><em>5.</em>广告位服务</a></li>
        </ul>
	</div>
 <!--猎证服务-->
    <div class="services-add-bg nzfw-banner">
    	<div class="add-font"></div>
        <div class="add-about">
        	<div class="add-about-title"><span>猎证服务简介</span></div>
            <h3>什么是猎证服务？</h3>
            <p>大太阳猎证——针对建筑行业特点，以及广大企业与个人的需求，我们推出了大太阳建筑猎证服务。覆盖的范围包括：注册建筑师、注册结构师、注册建造师、注册监理师、注册造价师等业内证书，我们目前已有几千名证书待注册的个人信息。通过对市场行情的深刻认识行业法规的熟悉以及大量的信息储备，我们可以在最短的时间内以最合适的价格帮助企业找到所需证书。</p>
        </div>
    </div>
</div>
</div>
<s:include value="/jsp/common/bottom.jsp"></s:include>
</body>
</html>