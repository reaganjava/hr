<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib prefix="s" uri="/struts-tags" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大太阳建筑猎头--猎头中心--摘要显示</title>
<link href="<%=request.getContextPath()%>/css/index-style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/head.css" rel="stylesheet" type="text/css" />
<jsp:include page="../common/head.jsp"></jsp:include>
<s:include value="headhunterCenterNav.jsp"/>
<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
<!--以上为头部分-->
<!--搜索下拉菜单~绝对定位~-->
<div class="abstract-down" id="showMenuID">
    <div class="abstract-down1" id="searchDown1" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a href="#">监理和工程咨询</a></li>
            
        </ul>
    </div>
    <div class="abstract-down2" id="searchDown2" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a href="#">监理和工程咨询</a></li>
           
        </ul>
    </div>
    <div class="abstract-down3" id="searchDown3" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a href="#">北京市</a></li>
           
        </ul>
    </div>
    <div class="abstract-down4" id="searchDown4" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a href="#">天津市</a></li>
            
        </ul>
    </div>
    <div class="abstract-down5" id="searchDown5" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a href="#">芙蓉区</a></li>
           
        </ul>
    </div>
    <div class="abstract-down6" id="searchDown6" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a href="#">监理和工程咨询</a></li>
            
        </ul>
    </div>
    <div class="abstract-down7" id="searchDown7" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a href="#">否</a></li>
           
        </ul>
    </div>
    <div class="abstract-down8" id="searchDown8" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a href="#">2010-12-20</a></li>
           
        </ul>
    </div>
    <div class="abstract-down9" id="searchDown9" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a href="#">15年以上</a></li>
            
        </ul>
    </div>
    <div class="abstract-down10" id="searchDown10" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a href="#">全职</a></li>
           
        </ul>
    </div>
    <div class="abstract-down11" id="searchDown11" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a href="#">博士以上</a></li>
            
        </ul>
    </div>
    
</div>
<!--中间部分-->    
<div class="abstract-top-box">
	<div class="abstract-top-line">
        <div class="abstract-top">
          <div class="abstract-top-left">
                <div class="abstract-top-left1">
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">行业：</li>
                            <li class="abstract1"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#border1', '#searchDown1')" />
                                <input id="border1" name="" type="text" value="选择行业类别"/></li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">职能：</li>
                            <li class="abstract1"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#border2', '#searchDown2')" />
                                <input id="border2" name="" type="text" value="请选择目标职能"/></li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">地区：</li>
                            <li class="abstract2"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#border3', '#searchDown3')" /><input id="border3" name="" type="text" value="省份"/></li>
                            <li class="abstract2"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#border4', '#searchDown4')" /><input id="border4" name="" type="text" value="城市"/></li>
                            <li class="abstract2"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#border5', '#searchDown5')" /><input id="border5" name="" type="text" value="城区"/></li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">关键字：</li>
                            <li class="abstract3">
                                <input name="" type="text" value="请输入关键字"/></li>
                        </ul>
                    </div>
                </div>
                <div id="moreCondition" class="abstract-top-left2">
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</li>
                            <li class="abstract1"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#border6', '#searchDown6')" />
                                <input id="border6" name="" type="text" value="选择专业类别"/></li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">顾问：</li>
                            <li class="abstract2"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#border7', '#searchDown7')" />
                                <input id="border7" name="" type="text" value="否"/></li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">发布时间：</li>
                            <li class="abstract4"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#border8', '#searchDown8')" />
                                <input id="border8" name="" type="text" value="2010-12-30"/></li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">工作年限：</li>
                            <li class="abstract4"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#border9', '#searchDown9')" />
                                <input id="border9" name="" type="text" value="15年以上"/></li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">工作性质：</li>
                            <li class="abstract2"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#border10', '#searchDown10')" />
                                <input id="border10" name="" type="text" value="全职"/></li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">全职：</li>
                            <li class="abstract4"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#border11', '#searchDown11')" />
                                <input id="border11" name="" type="text" value="博士以上"/></li>
                        </ul>
                    </div> 
              </div>
          </div>
          <div class="abstract-top-right">
               <a href="#"><img src="<%=request.getContextPath()%>/images/abstract-botton1.png" width="120" height="28" title="职位搜索"/></a>
               <a href="#"><img src="<%=request.getContextPath()%>/images/abstract-botton2.png" width="120" height="28" title="企业搜索"/></a>
          </div>
        </div>
        <div class="abstract-top-bottom">
        	<img id="more" name="condition" src="<%=request.getContextPath()%>/images/abstract-jt-down.png" width="16" height="17" />
        	<img id="norm" name="condition" src="<%=request.getContextPath()%>/images/abstract-jt-on.png" width="16" height="17" />
        	<label for="condition">更多搜索条件</label>
        </div>
	</div>
</div>
<div class="abstract-title"><h3>国家建筑工程师</h3><span>当前搜索条件："<strong>房地产及业物+建筑设计师+广东.深圳.福田</strong>"</span></div>
<!--分页按钮-->
<div class="abstract-botton">
	<div class="abstract-botton-left">
        <ul>
            <li class="abstract-botton1"><input name="" type="checkbox" value="" /></li>
            <li class="abstract-botton1">全选</li>
            <li><img src="<%=request.getContextPath()%>/images/abstract-kssq.gif" width="100" height="25" /></li>
        </ul>
    </div>
    <div class="abstract-botton-right">
        <ul>
            <li class="abstract-botton1">显示：</li>
            <li><a href="abstract2.html"><img src="<%=request.getContextPath()%>/images/abstract-zwbt.gif" width="68" height="24" alt="标题显示"/></a></li>
            <li><a href="abstract.html"><img src="<%=request.getContextPath()%>/images/abstract-zwzy.gif" width="68" height="24" alt="摘要显示"/></a></li>
            <li class="abstract-botton1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排序：</li>
            <li><a href="#"><img src="<%=request.getContextPath()%>/images/abstract-afbsj.gif" width="84" height="24" alt="按发布时间"/></a></li>
            <li><a href="#"><img src="<%=request.getContextPath()%>/images/abstract-axgd.gif" width="68" height="24" alt="按相关度"/></a></li>
        </ul>
    </div>
</div>
<div class="abstract-botton">
	<div class="abstract-botton-left">
        <ul>
            <li class="abstract-botton1"><input name="" type="checkbox" value="" /></li>
            <li class="abstract-botton1">全选</li>
            <li><img src="<%=request.getContextPath()%>/images/abstract-kssq2.gif" width="100" height="25" /></li>
        </ul>
    </div>
    <div class="abstract-botton-right">
        <ul>
            <li class="abstract-botton1">显示：</li>
            <li><a href="abstract2.html"><img src="<%=request.getContextPath()%>/images/abstract-zwbt2.gif" width="68" height="24" alt="标题显示"/></a></li>
            <li><a href="abstract.html"><img src="<%=request.getContextPath()%>/images/abstract-zwzy2.gif" width="68" height="24" alt="摘要显示"/></a></li>
            <li class="abstract-botton1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排序：</li>
            <li><a href="#"><img src="<%=request.getContextPath()%>/images/abstract-afbsj2.gif" width="84" height="24" alt="按发布时间"/></a></li>
            <li><a href="#"><img src="<%=request.getContextPath()%>/images/abstract-axgd2.gif" width="68" height="24" alt="按相关度"/></a></li>
        </ul>
    </div>
</div>

<!--摘要列表-->
<div class="abstract-text-title">
     <ul>
         <li class="abstract-text0"></li>
         <li class="abstract-text1"><strong>职位名称</strong></li>
         <li class="abstract-text2"><strong>公司名称</strong></li>
         <li class="abstract-text3"><strong>工作地点</strong></li>
         <li class="abstract-text4"><strong>发布时间</strong></li>
    </ul>
</div>
 <s:iterator value="jobResultList">
	<div class="abstract-text-box">
	    <div class="abstract-text" >
	         <ul>
	             <li class="abstract-text0"><input name="" type="checkbox" value="" /></li>
	             <li class="abstract-text1"><a href="#"><s:property value="jobName"/> </a></li>
	             <li class="abstract-text2">深圳市大展科技有限公司</li>
	             <li class="abstract-text3">深圳市-南山区</li>
	             <li class="abstract-text4">2010-12-31</li>
	         </ul>
	    </div>
	    <div class="abstract-text-p">
	    	<div class="abstract-text-p-left">
	        	<p>
	            	<strong>行业类型</strong>：建筑行业
	                <strong>职能</strong>：国家建筑工程师
	                <strong>专业类型</strong>：土木工程
	                <strong>工作性质</strong>：全职
	                <strong>顾问</strong>：否
	                <strong>招聘人数</strong>：12人
	                <strong>月薪</strong>：12000元以上
	                <strong>年龄</strong>：25岁
	                <strong>性别</strong>：男
	                <strong>学历要求</strong>：博士
	                <strong>工作年限</strong>：12
	                <strong>语言能力</strong>：英语12以上
	                <strong>掌握程度</strong>：熟练
	                <strong>计算机能力</strong>：非常精通 
			  </p>
	        </div>
	    	<div class="abstract-text-botton"><a href="#"><img src="<%=request.getContextPath()%>/images/abstract-text-botton1.gif" width="75" height="28" alt="快速申请"/></a><a href="#"><img src="<%=request.getContextPath()%>/images/abstract-text-botton2.gif" width="75" height="28" alt="企业博站"/></a></div>
	    </div>
	</div>
</s:iterator>

<!--页码分页-->      
<div class="quanxuan"><span><img src="<%=request.getContextPath()%>/images/quanxuan-icon.png" width="4" height="7" />&nbsp;&nbsp;共4156456条&nbsp;&nbsp;&nbsp;&nbsp;显示1-12条&nbsp;&nbsp;&nbsp;&nbsp;第8页&nbsp;&nbsp;&nbsp;&nbsp;<select name="">
       		<option>前50页</option>
            <option>后50页</option>
            <option>50-300页</option>
            <option>300-500页</option>
       </select></span><input name="" type="checkbox" value="" />&nbsp;&nbsp;全选
</div>
<div class="num">
     <ul>
         <li><a href="#"><img src="<%=request.getContextPath()%>/images/on.png" width="71" height="28" alt="上一页"/></a></li>
         <li class="num-out"><a href="#">1</a></li>
         <li class="num-on"><a href="#">2</a></li>
         <li class="num-on"><a href="#">3</a></li>
         <li class="num-on"><a href="#">4</a></li>
         <li class="num-on"><a href="#">5</a></li>
         <li class="num-on"><a href="#">6</a></li>
         <li class="num-on"><a href="#">7</a></li>
         <li class="num-on"><a href="#">8</a></li>
         <li class="num-on"><a href="#">9</a></li>
         <li class="num-on"><a href="#">10</a></li>
         <li class="num-on"><a href="#">11</a></li>
         <li class="num-on"><a href="#">12</a></li>
         <li><a href="#"><img src="<%=request.getContextPath()%>/images/next.png" width="71" height="28" alt="下一页"/></a></li>
     </ul>
</div>
	
<!--底部分-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
<script type="text/javascript">
$(function(){
	changeMenu(document.getElementById('menu02'));
	lastIndex = document.getElementById('menu02');
	
	$("#moreCondition").hide();
	$("#norm").hide();
	
	$("#more").click(function(){
		$("#moreCondition").show();
		$("#more").hide();
		$("#norm").show();
	});
	$("#norm").click(function(){
		$("#moreCondition").hide();
		$("#norm").hide();
		$("#more").show();
	});
	
});
</script>
</html>