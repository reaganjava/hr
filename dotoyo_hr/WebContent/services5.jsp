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
            <li class="dh-on"><a href="services3.jsp"><em>3.</em>猎证服务</a></li>
            <li class="dh-on"><a href="services4.jsp"><em>4.</em>招聘服务</a></li>
            <li class="dh-out"><a href="services5.jsp"><em>5.</em>广告位服务</a></li>
        </ul>
	</div>
     <!--广告位服务-->
    <div class="services-add-bg addfw-banner">
    	<div class="add-font"></div>
        <div class="add-about">
        	<div class="add-about-title"><span>广告位服务简介</span></div>
            <h3>什么是广告位服务？</h3>
            <p>大太阳建筑猎头（hr.jzpt.com）网站拥有近1000万已注册的个人会员，每天吸引超过2000万用户访问。每天，会员
企业都会发布数万条招聘信息，您的招聘信息如何才能脱颖而出，获得更多求职者关注？
    站点广告服务帮助企业锁定千万人才的目光，配合企业会籍，将为企业招聘和形象推广带来绝佳效果。大太阳建筑猎头
（hr.jzpt.com)一直坚持广告数量的“合理”原则，杜绝广告泛滥，干扰用户操作。因此，我们可供销售的广告资源非常
有限，请尽早挑选绝佳位置，为招聘加油！
</p>
        </div>
    </div>
</div>
</div>
<s:include value="/jsp/common/bottom.jsp"></s:include>
</body>
</html>