<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--关于我们</title>
	<link href="css/other.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/head.css" rel="stylesheet" type="text/css" />
	<s:include value="/html/common/JsAndCss.html"></s:include>
	<link href="<%=request.getContextPath()%>/css/head.css" rel="stylesheet" type="text/css" />
</head>
<body>
<s:include value="/jsp/common/head.jsp"></s:include>
<s:include value="homePageNav.jsp"/>
<div class="banner-box">
	<div class="banner"><img src="images/about-banner.png" width="980" height="230" /></div>
</div>
<!--以上为头部分-->
<!--中间部分-->
<div class="about-content">
	<div class="about-left">
    	<div class="about-left-top"><img src="<%=request.getContextPath()%>/images/about-gywm.png" width="152" height="54" alt="关于我们"/></div>
        <div class="about-nav">
        	<ul>
            	<li class="about-nav-out"><a href="<%=request.getContextPath()%>/about.jsp">关于我们</a></li>
                <li class="about-nav-on"><a href="<%=request.getContextPath()%>/legal-notices.jsp">法律声明</a></li>
                <li class="about-nav-on"><a href="<%=request.getContextPath()%>/contact-us.jsp">联系我们</a></li>
                <li class="about-nav-on"><a href="<%=request.getContextPath()%>/online-payment.jsp">网上支付</a></li>
                <li class="about-nav-on"><a href="<%=request.getContextPath()%>/member-points.jsp">会员积分</a></li>
            </ul>
        </div>
    </div>
    <div class="about-right">
    	<div class="about-right-title">关于我们</div>
        <div class="about-right-box">
        	<p>	“猎头”在英文里叫Headhunting，在国外，这是一种十分流行的人才招聘方式，香港和台湾方面把它翻译为“猎头”，所以引进大陆后我们也称之为猎头，意思即指“网罗高级人才”。<br /><br /> 　
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;猎头服务的出现，促成社会经济体制中人力资源的流动和合理配置，猎头服务已成为企业求取高级人才和高级人才流动的重要渠道，并逐渐开始形成了一种产业。高级人才委托招聘业务，又被称之为猎头服务。专门从事中高级人才中介公司，又往往被称之为猎头公司。猎头一词属舶来词，愿意为割取敌人的头作为战利品的人，这里意为物色人才的人。<br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“头”者智慧、才能集中之所在，”猎头“特指猎夺人才，即发现、追综、评价、甄选和高级人才。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;猎头公司就是依靠猎取社会所需各类高级人才而生存、获得的中介组织。 与人才交流中心不同，猎头公司采取隐蔽猎取、快速出击的主动竞争方式，为所需高级人才的客户猎取公司人才市场得不到的高级人才。猎头公司的猎物对象是高级管理人才。一般来说，主要是举荐总裁、副总裁、总经理、副总经理、人事总监、人事经理、财务经理、市场总监、市场经理、营销经理、产品经理、技术总监、技术经理、厂长、生产部经理、高级项目经理、高级工程师、博士后、博士、工商管理高级人才、其他高级顾问及其他经理级以上人才等。烽火猎聘公司总经理钟克峰先生认为，虽然没有严格的关于“猎头职位”的解释，但是如果望文生义并结合猎头行业实际，可以将“猎头职位”笼统地称为由猎头公司发布的招聘职位。<br />　　
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;而人才交流中心的服务是”蓝领“人才、基础事物人才、微观区域人才；前者是客户要什么挑什么，后者是坐而待命，来什么选什么。</p>
        </div>
    </div>
</div>
<!--底部分-->
<s:include value="/jsp/common/bottom.jsp"></s:include>
</body>
</html>
