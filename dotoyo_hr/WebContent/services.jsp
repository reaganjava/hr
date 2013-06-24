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
        	<li class="dh-out"><a href="services.jsp"><em>1.</em>人才挖掘服务</a></li>
            <li class="dh-on"><a href="services2.jsp"><em>2.</em>挂证服务</a></li>
            <li class="dh-on"><a href="services3.jsp"><em>3.</em>猎证服务</a></li>
            <li class="dh-on"><a href="services4.jsp"><em>4.</em>招聘服务</a></li>
            <li class="dh-on"><a href="services5.jsp"><em>5.</em>广告位服务</a></li>
        </ul>
	</div>
    <div class="services-banner">
    	<div class="services-banner-title"><img src="images/services-banner-title.jpg" width="425" height="115" /></div>
      <div class="services-font"></div>
    </div>
    <div class="services-bottom">
    	<div class="services-bottom-left">
        	
          <div class="services-lc">增值服务流程<br />
            <img src="<%=request.getContextPath()%>/images/services-lc.jpg" width="457" height="84" /></div>
        </div>
        <div class="services-bottom-right">
        	<div class="services-about-title"><span>增值服务简介</span></div>
            <h3>什么是增值服务？</h3>
            <p>	工业增加值 指工业企业在报告期内以货币形式表现的工业生产活动的最终成果,是企业全部生产活动的总成果扣除了在生产过程中消耗或转移的物质产品和劳务价值后的余额,是企业生产过程中新增加的价值。<br />
一个企业中拥有登陆账号，能够登陆、使用系统的所有人员被称之为“操作员”。每个操作员都只有一个登陆账号，操作员使用登陆账号才能登陆系统，使用服务。<br /><br /></p>
        </div>
    </div>
</div>
<s:include value="/jsp/common/bottom.jsp"></s:include>
</body>
</html>