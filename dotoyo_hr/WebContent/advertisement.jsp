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
	<link href="<%=request.getContextPath()%>/javascripts/common/jquery-1.2.6.pack.js" rel="stylesheet" type="text/css" />
	<s:include value="/jsp/common/JsAndCss.jsp"/>
	
	<style type="text/css">

#banner {position:relative; width:724px; height:230px;overflow:hidden;text-align:left;}
#banner_list img {width:724px; height:230px;border:0px;}
#banner_bg {position:absolute; bottom:0;background-color:#000;height:30px;filter: Alpha(Opacity=30);opacity:0.3;z-index:1000;cursor:pointer; width:0px; }
#banner_info{position:absolute; bottom:0; left:5px;height:22px;color:#fff;z-index:1001;cursor:pointer}
#banner_text {position:absolute;width:120px;z-index:1002; right:3px; bottom:3px;}
#banner ul {position:absolute;list-style-type:none;filter: Alpha(Opacity=80);opacity:0.8; border:1px solid #fff;z-index:1002;
			margin:0; padding:0; bottom:3px; right:5px;}
#banner ul li { padding:0px 8px;float:left;display:block;color:#FFF;border:#e5eaff 1px solid;background:#6f4f67;cursor:pointer}
#banner ul li.on { background:#900}
#banner_list a{position:absolute;} <!-- 让四张图片都可以重叠在一起-->
</style>
<script type="text/javascript">
	var t = n = 0, count;
	$(document).ready(function(){	
		count=$("#banner_list a").length;
		$("#banner_list a:not(:first-child)").hide();
		$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
		$("#banner_info").click(function(){window.open($("#banner_list a:first-child").attr('href'), "_blank")});
		$("#banner li").click(function() {
			var i = $(this).text() - 1;//获取Li元素内的值，即1，2，3，4
			n = i;
			if (i >= count) return;
			$("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
			$("#banner_info").unbind().click(function(){window.open($("#banner_list a").eq(i).attr('href'), "_blank")})
			$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
			document.getElementById("banner").style.background="";
			$(this).toggleClass("on");
			$(this).siblings().removeAttr("class");
		});
		t = setInterval("showAuto()", 2000);
		$("#banner").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 4000);});
	})
	
	function showAuto()
	{
		n = n >=(count - 1) ? 0 : ++n;
		$("#banner li").eq(n).trigger('click');
	}
</script>
</head>
<body>
<s:include value="/jsp/common/head.jsp"></s:include>
<s:include value="homePageNav.jsp"/>
<!--以上为头部分-->
<!--搜索-->
<div class="advertisement-top-add">
         <img src="<%=request.getContextPath()%>/images/advertisement-top-add.png" width="980" height="92" />
</div>
<!--中间部分-->
<div class="advertisement">
	<div class="advertisement-left">

    	
    	<div id="banner">	
	<div id="banner_bg"></div>  <!--标题背景-->
	<div id="banner_info"></div> <!--标题-->
    <ul>
        <li class="on">1</li>
        <li>2</li>
        <li>3</li>
        <li>4</li>
        <li>5</li>
    </ul>
   <div id="banner_list">
   	<s:iterator value="list002">
    	 <a href="<s:property value="url"/>" target="_blank"><img src="<s:property value="uploadFilePath"/>/<s:property value="imgName"/>" width="724" height="230" /></a>
		</s:iterator>

	</div>
</div>


  <div class="advertisement-box">
        	<div class="advertisement-title"><span>名企招聘</span></div>
            <div class="advertisement-add add1">
            	<ul>
				<s:iterator value="list003">
            	<li><a href="<s:property value="url"/>"><img src="<s:property value="uploadFilePath"/>/<s:property value="imgName"/>" width="155" height="60" /><br /><s:property value="title"/></a></li>
            	</s:iterator>
    	      		
                </ul>
            </div>
            <div class="advertisement-title city-title2"><span>热门招聘</span></div>
			<div class="advertisement-add add2">
            	<ul>
    	      		
                    <s:iterator value="list004">
            	<li><a href="<s:property value="url"/>"><img src="<s:property value="uploadFilePath"/>/<s:property value="imgName"/>" width="155" height="60" /><br /><s:property value="title"/></a></li>
            	</s:iterator>
                </ul>
        </div>
      		<div class="advertisement-title city-title2"><span>紧急招聘</span></div>
            <div class="advertisement-font">
            	<ul>
                    <s:iterator value="list005">
                    	<li><a href="<s:property value="url"/>"><s:property value="company"/></a><span><a href="<s:property value="url"/>"><s:property value="title"/></a></span></li>
            		</s:iterator>
                </ul>
    	</div>
        </div>
    </div>
    <div class="advertisement-right">
         <ul>
           		<s:iterator value="list001">
            	<li><a href="<s:property value="url"/>"><img src="<s:property value="uploadFilePath"/>/<s:property value="imgName"/>" width="237" height="70" alt="<s:property value="title"/>"/></a></li>
            	</s:iterator>
         </ul>
    </div>
</div>
<!--底部分-->
<s:include value="/jsp/common/bottom.jsp"></s:include>
</body>
</html>