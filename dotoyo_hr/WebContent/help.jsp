<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大太阳建筑猎头--帮助中心</title>
	<s:include value="/html/common/JsAndCss.html"></s:include>
	<link href="<%=request.getContextPath()%>/css/head.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/other.css" rel="stylesheet" type="text/css" />
	<s:include value="/jsp/common/JsAndCss.jsp"/>
	<script src="<%=request.getContextPath()%>/javascripts/common/jquery-ui-1.7.2.custom.min.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/accordion.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/jquery.cookie.js"></script>
	<script type="text/javascript">
$(function(){
			//Main menu
			$(".nav li").mouseover(function(){
				$(".nav li").attr("class","nav-on");
				$(this).addClass("nav-out");
			});

			// Accordion
            $("#leftNav").accordion({
                header: "h3",
                collapsible: true,
				autoHeight: false,
                active: false,
				multipleMode: true
            });

			//Init active array
			var activeArr;
			if($.cookie("active_left_nav")!=null){
				activeArr = $.cookie("active_left_nav").replace(/(^\,*)|(\,*$)/g, "").split(",");
			}
			else{
				activeArr = new Array();
			}
			//Init left nav
			var activeA = $.cookie("active_left_nav_a");
			if(activeA != null){
				$("#leftNav a").removeClass("active");
				$("#leftNav a").eq(activeA).addClass("active");
			}
			if(activeArr.length>0)
			{
				$.each(activeArr,function(key,val){
					if(val!=""){
						$("#leftNav h3").eq(val).addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
					}
				});
			}
			//Set active array when click
			$("#leftNav h3").click(function(){
				var index = $("#leftNav h3").index($(this)[0]);
				if($(this).hasClass("ui-state-active")){
					//Add to array
					if($.inArray(index, activeArr)){
						activeArr.push(index);
					}
				}
				else{
					//Remove from array
					$.grep(activeArr,function(val,key){
						if(val==index){
							activeArr.splice(key, 1);
						}
					});
				}
				$.cookie("active_left_nav", activeArr.join(","));
			});

			$("#leftNav a").click(function(){
				$("#leftNav a").removeClass("active");
				var index = $("#leftNav a").index($(this)[0]);
				$(this).addClass("active");
				$.cookie("active_left_nav_a", index);
			});
        });
</script>
</head>
<body>
<s:include value="/jsp/common/head.jsp"></s:include>
<s:include value="homePageNav.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<div class="content">
	<div id="leftNav">
    	<ul>
            <li>
                <h3>最常见问题</h3>
                <div>
                      <a class="second-nav" tabindex="-1" href="#">最常见问题</a><span></span>
                      <h3>最常见问题</h3>
                      <ul>
                          <li><a href="#">-&nbsp;&nbsp;最常见问题</a></li>
                          <li><a href="#">-&nbsp;&nbsp;最常见问题</a></li>
                          <li><a href="#">-&nbsp;&nbsp;最常见问题</a></li>
                      </ul>
                      <a class="second-nav" tabindex="-1" href="#">最常见问题</a><span></span>
              </div>
            </li>
            <li>
                <h3>注册登录相关问题</h3>
                <ul>
                    <li><a href="#">注册登录相关问题</a></li>
                </ul>
            </li>
            <li>
                <h3>猎头相关问题</h3>
                <ul>
                    <li><a href="#">猎头相关问题</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="content-right">
    	 <div class="help-title help-title1"><strong>常见问题</strong></div>
         <div class="help-box">
         	<h1><img src="<%=request.getContextPath()%>/images/help-dian.gif" width="12" height="12" />什么叫猎头？</h1>
            <p>	猎头（Headhunting或Executive Search）,或称挖角，是一种于欧美十分流行的人才招聘方式，意思即指「网罗高级人才。 是一种帮助公司企业招聘高级候选人的人才中介机构。<br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;猎首（headhunting），又称猎头，中国古籍作馘首，指将人杀死后砍下并收集头颅的一种习俗。许多古代文明都曾流行过猎首的做法，有史籍记载的包括：古代中国人、台湾原住民、日本人、阿富汗的努里斯坦人、古印度的阿萨姆人和那加兰人、缅甸人、婆罗洲人、印度尼西亚人、菲律宾人、密克罗尼西亚人、美拉尼西亚人、新西兰毛利人、亚马逊平原地区的印第安人、尼日利亚人、欧洲的凯尔特人和斯基泰人，等等。猎首的做法到了第二次世界大战期间还在太平洋战场出现过，但到今天已经在全世界范围内基本绝迹了。
</p>
            <h3>猎头公司首页相关展示</h3>
            <img src="pic/help1.jpg" width="639" height="206" />
         </div>
         <div class="help-title help-title2"><strong>一般问题</strong></div>
         <div class="help-box">
         	<h1><img src="<%=request.getContextPath()%>/images/help-dian.gif" width="12" height="12" />什么叫猎头公司？</h1>
            <p>	“猎头”在英文里叫Headhunting,在国外，这是一种十分流行的人才招聘方式，香港和台湾方面把它翻译为“猎头”，所以引进大陆后我们也称之为猎头，意思即指“网罗高级人才”。<br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;猎头服务的出现，促成社会经济体制中人力资源的流动和合理配置，猎头服务已成为企业求取高级人才和高级人才流动的重要渠道，并逐渐开始形成了一种产业。
<br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中国职业经理人市场的日渐成熟，促成了国内各大城市开始出现数以百计的猎头公司，专业的猎头顾问一般都具有良好的认识经理经验，能够为企业提供人力资源开发知道性建议，他们品行优良，副责任，能够提供候选人才的真实情况并能进行坦诚交流，阅历丰富，至少从事过外企较高的职位，这样才能提供有参考价值的意见，专业的猎头顾问还应保守，严守行业规范和职业操守。全面理解客户需要是成功找到合适人才的前提，因此猎头顾问必须具备高超的沟通能力和技巧，这样才能准确的了解客户真正的需要。专业的猎头顾问还要具备较深的心理学，人际关系学知识等。正由于这种超值和专业的服务，无论是从人员质量及招聘成本上均被许多企业所认可，已正成为一种趋势。
</p>
            <h3>猎头公司相关解析</h3>
            <img src="<%=request.getContextPath()%>/pic/help2.jpg" width="408" height="239" />
         </div>
         <div class="help-title help-title3"><strong>疑难问题</strong></div>
         <div class="help-box">
         	<h1><img src="<%=request.getContextPath()%>/images/help-dian.gif" width="12" height="12" />什么叫猎头职位？</h1>
            <p>	高级人才委托招聘业务，又被称之为猎头服务。专门从事中高级人才中介公司，又往往被称之为猎头公司。猎头一词属舶来词，愿意为割取敌人的头作为战利品的人，这里意为物色人才的人。“头”者智慧、才能集中之所在，”猎头“特指猎夺人才，即发现、追综、评价、甄选和高级人才。猎头公司就是依靠猎取社会所需各类高级人才而生存、获得的中介组织。<br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;与人才交流中心不同，猎头公司采取隐蔽猎取、快速出击的主动竞争方式，为所需高级人才的客户猎取公司人才市场得不到的高级人才。猎头公司的猎物对象是高级管理人才。一般来说，主要是举荐总裁、副总裁、总经理、副总经理、人事总监、人事经理、财务经理、市场总监、市场经理、营销经理、产品经理、技术总监、技术经理、厂长、生产部经理、高级项目经理、高级工程师、博士后、博士、工商管理高级人才、其他高级顾问及其他经理级以上人才等。而人才交流中心的服务是”蓝领“人才、基础事物人才、微观区域人才；前者是客户要什么挑什么，后者是坐而待命，来什么选什么。</p>
         </div>
  </div>
</div>
<s:include value="/jsp/common/bottom.jsp"></s:include>
</body>
</html>
