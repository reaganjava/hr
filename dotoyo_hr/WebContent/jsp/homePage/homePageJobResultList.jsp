<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>${jobSearchVo.competencyName}招聘、求职 -职位搜索-大太阳建筑猎头网</title>
	<meta content="最新${jobSearchVo.competencyName}招聘，${jobSearchVo.competencyName}求职信息 -大太阳建筑猎头网。" name="description">
	<jsp:include page="/jsp/common/JsAndCss.jsp"></jsp:include>
	<link href="<%=request.getContextPath()%>/css/head.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/index-style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<jsp:include page="/jsp/common/head.jsp"></jsp:include>
	<s:include value="/jsp/headhunterCenter/headhunterCenterNav.jsp"/>
    <script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/jquery.query.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/jquery-form.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/headHunterCenter.js"></script>

<!--搜索下拉菜单~绝对定位~-->
<div class="abstract-down" id="showMenuID">
    <div class="abstract-down1" id="searchDown1" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
           <s:iterator value="industrysList">
               	<s:if test='parentCode=="001"'>
    	    		<li class="specializedDiv" style="width:700px;"><label><strong><s:property value="name"/></strong></label></li>
    	    	</s:if>
    	    	<s:else>
    	    		<li style="width:100px;float:left" class="index_hid_css" title="<s:property value='name'/>">
    	    			<a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'industryType','hiddenIndustryType');return false;"><s:property value="name"/></a>
    	    		</li>
    	    	</s:else>
            </s:iterator>
        </ul>
    </div>
    <div class="abstract-down2" id="searchDown2" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
           	 <s:iterator value="competencyList">
                <li style="width:200px;float:left" class="index_hid_css" title="<s:property value='name'/>">
                	<a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'competency','hiddenCompetency')"><s:property value="name"/></a>
                </li>
            </s:iterator>
        </ul>
    </div>
    <div class="abstract-down3" id="searchDown3" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <s:iterator id="provinceList" value="provinceList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'province','hiddenProvince');setCity('citySearch','hiddenCity')"><s:property value="name"/></a></li>
            </s:iterator>
        </ul>
    </div>
    <div class="abstract-down4" id="searchDown4" onmouseleave="menuHide(this)" style="display:none;">
        <ul id="cityId">
        </ul>
    </div>
    <div class="abstract-down5" id="searchDown5" onmouseleave="menuHide(this)" style="display:none;">
       <ul id="areaId">
	    </ul>
    </div>
    <div class="abstract-down12" id="searchDown6" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
             <s:iterator value="specializedTypeList">
                <s:if test='parentCode=="003"'>
    	    		<li class="specializedDiv" style="width:700px;"><label><strong><s:property value="name"/></strong></label></li>
    	    	</s:if>
    	    	<s:else>
    	    		<li style="width:145px;float:left" class="index_hid_css" title="<s:property value='name'/>">
    	    			<a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'specializedType','hiddenSpecializedType');return false;"><s:property value="name"/></a>
    	    		</li>
    	    	</s:else>
            </s:iterator>
        </ul>
    </div>
    <div class="abstract-down7" id="searchDown7" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <li><a id="0" href="javascript:void(0)" onclick="setValue(this,'isAdviser','hiddenisAdviser')">否</a></li>
            <li><a id="1" href="javascript:void(0)" onclick="setValue(this,'isAdviser','hiddenisAdviser')">是</a></li>
        </ul>
    </div>

    <div class="abstract-down9" id="searchDown9" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
         <s:iterator value="workingLifeList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'workingLife','hiddenWorkingLife')"><s:property value="name"/></a></li>
            </s:iterator>
        </ul>
    </div>
    <div class="abstract-down10" id="searchDown10" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
            <s:iterator value="jobNatureList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'jobNature','hiddenJobNature')"><s:property value="name"/></a></li>
              </s:iterator>
        </ul>
    </div>
    <div class="abstract-down11" id="searchDown11" onmouseleave="menuHide(this)" style="display:none;">
        <ul>
              <s:iterator value="educationList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'education','hiddenEducation')"><s:property value="name"/></a></li>
            </s:iterator>
        </ul>
    </div>
</div>
<!--中间部分-->
<s:form id="jobSearch" name="jobSearch" method="post" action="/search_main/">
<s:hidden id="advancedSearch1" name="jobSearchVo.advancedSearch"/>
<s:hidden id="showAbstract1" name="showAbstract"></s:hidden>
<div class="abstract-top-box">
	<div class="abstract-top-line">
        <div class="abstract-top">
          <div class="abstract-top-left">
                <div class="abstract-top-left1">
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">行业：</li>
                            <li class="abstract1"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#industryType', '#searchDown1')" />
                                 
                                 <s:if test='jobSearchVo.industryName==""'>
                                 	<s:textfield id="industryType" name="jobSearchVo.industryName" value="选择行业类型"/>
                                 </s:if>
                                 <s:else>
                                 	<s:textfield id="industryType" name="jobSearchVo.industryName"/>
                                 </s:else>
		               	    	 <s:hidden id="hiddenIndustryType" name="jobSearchVo.industryType" />
		               	    </li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">职能：</li>
                            <li class="abstract1"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#competency', '#searchDown2')" />
                               <s:textfield id="competency"  name="jobSearchVo.competencyName"/>
                                <s:hidden id="hiddenCompetency" name="jobSearchVo.competency" />
                            </li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">地区：</li>
                            <li class="abstract2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#province', '#searchDown3')" />
                            	<s:textfield id="province" name="jobSearchVo.provinceName"/>
                    			<s:hidden id="hiddenProvince" name="jobSearchVo.provinceCode"  />
                            </li>
                            <li class="abstract2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="loadData('citySearch', '#searchDown4')" />
                            	<s:textfield id="citySearch" name="jobSearchVo.cityName" />
                    			<s:hidden id="hiddenCity" name="jobSearchVo.cityCode"  />
                            </li>
                            <li class="abstract2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="loadData('areaSearch', '#searchDown5')" />
                            	<s:if test='jobSearchVo.areaName==""'>
                            		<s:textfield id="areaSearch" name="jobSearchVo.areaName" value="城区"/>
                            	</s:if>
                            	<s:else>
                            		<s:textfield id="areaSearch" name="jobSearchVo.areaName" />
                            	</s:else>
                    			<s:hidden id="hiddenArea" name="jobSearchVo.areaCode" />
                            </li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">关键字：</li>
                            <li class="abstract3">
                            	 <s:if test='jobSearchVo.keyWord==""'>
                            	 	<s:textfield name="jobSearchVo.keyWord"  onfocus="keyWordsOnFocus(this)" value="请输入关键字..." onblur="keyWordsOnBlur(this)"/>
                            	 </s:if>
                            	 <s:else>
                            	 	<s:textfield name="jobSearchVo.keyWord"  onfocus="keyWordsOnFocus(this)" onblur="keyWordsOnBlur(this)"/>
                            	 </s:else>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="moreCondition" class="abstract-top-left2" style="display:none">
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</li>
                            <li class="abstract1"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#specializedType', '#searchDown6')" />
                               <s:textfield id="specializedType" name="jobSearchVo.specializedName"/>
                               <s:hidden id="hiddenSpecializedType" name="jobSearchVo.specializedType" />
                            </li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">顾问：</li>
                            <li class="abstract2"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#isAdviser', '#searchDown7')" />
                                <s:textfield  id="isAdviser" name="jobSearchVo.isAdviserName" />
                                <s:hidden id="hiddenisAdviser" name="jobSearchVo.isAdviser"/>
                            </li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">发布时间：</li>
                            <li class="abstract16">
                                <s:textfield name="jobSearchVo.jobIssuetDate" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',errDealMode:1,maxDate:'%y-%M-{%d}'})"/>
                            </li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">工作年限：</li>
                            <li class="abstract4"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#workingLife', '#searchDown9')" />
                                <s:textfield id="workingLife"  name="jobSearchVo.workingLifeName"/>
                    			<s:hidden id="hiddenWorkingLife" name="jobSearchVo.workingLife"/>
                    		</li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">工作性质：</li>
                            <li class="abstract2"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#jobNature', '#searchDown10')" />
                                 <s:textfield  id="jobNature" name="jobSearchVo.jobNatureName"/>
	                             <s:hidden id="hiddenJobNature" name="jobSearchVo.jobNature" />
	                        </li>
                        </ul>
                    </div>
                    <div class="select-div">
                        <ul>
                            <li class="abstract0">学历：</li>
                            <li class="abstract4"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#education', '#searchDown11')" />
                                <s:textfield id="education" name="jobSearchVo.educationName" />
                    			<s:hidden id="hiddenEducation" name="jobSearchVo.education" />
                    		</li>
                        </ul>
                    </div>
              </div>
          </div>
          <div class="abstract-top-right">
          	   <s:hidden id="searchType" name="jobSearchVo.searchType"/>
               <input id="position" type="image" src="<%=request.getContextPath()%>/images/abstract-botton11.png" title="职位搜索"/>
               <input id="company" type="image" src="<%=request.getContextPath()%>/images/abstract-botton2.png" title="企业搜索"/>
          </div>
        </div>
        <div class="abstract-top-bottom">
        	<img id="more" name="condition" src="<%=request.getContextPath()%>/images/abstract-jt-down.png" width="16" height="17" style="display:none;"/>
        	<img id="norm" name="condition" src="<%=request.getContextPath()%>/images/abstract-jt-on.png" width="16" height="17" />
        	<label for="condition">更多搜索条件</label>
        </div>
	</div>
</div>
</s:form>
<div id="jobResultList">
<div class="abstract-title"><h3>搜索结果</h3><span>当前搜索条件：<strong id="searchCriteria">	</strong></span></div>
<!--分页按钮-->
<s:form id="pageFrom" name="pageFrom" method="POST" action="/search_home/">
<s:hidden id="advancedSearch2" name="jobSearchVo.advancedSearch"/>
<s:hidden id="showAbstract2" name="showAbstract"></s:hidden>
<div class="abstract-botton">
	<div class="abstract-botton-left">
        <ul>
            <li class="abstract-botton1"><input id="jobCheckBox" type="checkbox" /></li>
            <li class="abstract-botton1">全选</li>
            <li><input type="image" src="<%=request.getContextPath()%>/images/abstract-kssq.gif"/></li>
        </ul>
    </div>
    <div class="abstract-botton-right">
        <ul>
            <li class="abstract-botton1">显示：</li>
            <li><a href="javascript:void(0)"><img id="showPatternbt" src="<%=request.getContextPath()%>/images/abstract-zwbt.gif" width="68" height="24" alt="标题显示"/></a></li>
            <li><a href="javascript:void(0)"><img id="showPatternzy" src="<%=request.getContextPath()%>/images/abstract-zwzy2.gif" width="68" height="24" alt="摘要显示"/></a></li>
            <li class="abstract-botton1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排序：</li>
            <li><a href="javascript:void(0)"><img onclick="showOrderBy(this)" id="orderByJobIssuetDate" src="<%=request.getContextPath()%>/images/abstract-afbsj2.gif" width="84" height="24" alt="按发布时间"/></a></li>
            <li><a href="javascript:void(0)"><img onclick="showOrderBy(this)" id="orderByJobKeyWord" src="<%=request.getContextPath()%>/images/abstract-axgd2.gif" width="68" height="24" alt="按相关度"/></a></li>
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
	             <li class="abstract-text0"><input name="jobCheckBoxed" type="checkbox" value="<s:property value="id"/>-<s:property value="userId"/>"/></li>
	             <li class="abstract-text1">
	             	<a target="_blank" href="<s:url action="headhunterCenterAction!getJobInfoDetail" namespace="/headhunterCenter">
	                    <s:param name="jobId"><s:property value="id"/></s:param>
	                    <s:param name="userId"><s:property value="userId"/></s:param></s:url>"><s:property value="jobName"/>
			        </a>
	             </li>
	             <li class="abstract-text2">
	             	<a href="#" onclick="return linkBoStation(<s:property value="userId"/>);return false;">
						<s:property value="companyName"/>
		            </a>
	             </li>
	             <li class="abstract-text3"><s:property value="cityCode"/> <s:property value="areaCode"/></li>
	             <li class="abstract-text4"><s:property value="getText('format.date',{jobIssuetDate})"/>
	             <img src="<%=request.getContextPath()%>/images/abstract-text-icon.gif" width="7" height="12" /></li>
	         </ul>
	    </div>
	    <div class="abstract-text-p" style="display:none">
	    	<div class="abstract-text-p-left">
	        	<p>
	            	<strong>行业类型</strong>：<s:property value="industryType"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <strong>职能</strong>：<s:property value="competency"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <strong>专业类型</strong>：<s:property value="specializedType"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <strong>工作性质</strong>：<s:property value="jobNature"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
	                <strong>顾问</strong>：<s:if test='isAdviser=="1"'>是</s:if><s:elseif test='isAdviser=="0"'>否</s:elseif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <strong>招聘人数</strong>：<s:property value="recruitingNumber"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <strong>月薪</strong>：<s:property value="salary"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <strong>年龄</strong>：<s:property value="ageName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <strong>性别</strong>：<s:if test='sex=="1"'>男</s:if><s:elseif test='sex=="0"'>女</s:elseif><s:elseif test='sex=="2"'>不限</s:elseif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <strong>学历要求</strong>：<s:property value="education"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <strong>工作年限</strong>：<s:property value="workingLife"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>
	                <strong>语言能力</strong>：<s:property value="langCapa"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <strong>掌握程度</strong>：<s:property value="mastery"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <strong>计算机能力</strong>：<s:property value="computerGrade"/>
			  </p>
	        </div>
	    	<div class="abstract-text-botton">
		    	<a href="javascript:void(0)">
		    		<img src="<%=request.getContextPath()%>/images/abstract-text-botton1.gif" width="75" height="28" alt="快速申请" onclick="return appliedJob(<s:property value="id"/>,<s:property value="userId"/>);"/>
		    	</a>
		    	<a href="javascript:void(0)">
		    		<img src="<%=request.getContextPath()%>/images/abstract-text-botton2.gif" width="75" height="28" alt="企业博站" onclick="javascript:alert('博站链接?userId='+<s:property value="userId"/>);return false;"/>
		    	</a>
	    	</div>
	    </div>
	</div>
</s:iterator>

<!--页码分页-->
<div class="qx">
    <s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
</div>
<div class="num">
  	<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
</div>


<s:hidden  id="orderBy" name="jobSearchVo.orderBy" />

<s:hidden  id="competencyName" name="jobSearchVo.competencyName" />
<s:hidden  name="jobSearchVo.competency" />

<s:hidden id="provinceName" name="jobSearchVo.provinceName" />
<s:hidden  name="jobSearchVo.provinceCode" />

<s:hidden id="cityName" name="jobSearchVo.cityName" />
<s:hidden  name="jobSearchVo.cityCode" />

<s:hidden id="keyWord" name="jobSearchVo.keyWord" />

<s:hidden  name="jobSearchVo.dateHorizon" />
<s:hidden id="dateHorizonName" name="jobSearchVo.dateHorizonName" />

<s:hidden id="competencyMainType" name="competencyMainType"/>
<input type="hidden" id="illegal_operation" value="<s:property value="getText('illegal_operation')"/>"/>
<input type="hidden" id="please_login" value="<s:property value="getText('please_login')"/>"/>
<input type="hidden" id="please_select" value="<s:property value="getText('please_select')"/>"/>
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>"/>

</s:form>
</div>
<!--底部分-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	if($("#advancedSearch1").val()=="1"){
		$("#moreCondition").show();
		$("#norm").show();
	}else{
		$("#more").show();
	}
	
	var showAbstract = $("#showAbstract1").val();
	if(showAbstract == "1"){
		$(".abstract-text-p").show();
		$("#showPatternbt").attr("src","../images/abstract-zwbt2.gif");
		$("#showPatternzy").attr("src","../images/abstract-zwzy.gif");
	}
});
function showOrderBy(orderBy){
	$("#orderBy").val($(orderBy).attr("id"));

	// 提交表单
	document.pageFrom.action="/search_home/";
	document.pageFrom.method='post';
	document.pageFrom.submit();
}
function showRequest(formData, jqForm, options) {
	if(checkStatus('jobCheckBoxed')==false) {
 		alert('请至少选中一个职位');
 		return false;
 	}
    return true;
}

$(function(){
	var b="选择";
	var c="不限";
	var competencyName=$("#competencyName").val();
	if(competencyName.indexOf(b)>=0||competencyName.indexOf(c)>=0){
		competencyName="";
	}
	var dateHorizonName=$("#dateHorizonName").val();
	if(dateHorizonName.indexOf(b)>=0||dateHorizonName.indexOf(c)>=0){
		dateHorizonName="";
	}

	var provinceName=$("#provinceName").val();
	if(provinceName.indexOf("省份")>=0||provinceName.indexOf(c)>=0){
		provinceName="";
	}
	var cityName=$("#cityName").val();
	if(cityName.indexOf("城市")>=0){
		cityName="";
	}

	var searchCriteriaArray = new Array(provinceName,cityName,competencyName,dateHorizonName,$("#keyWord").val());
	var searchCriteriaStr='';
	for(var i=0;i<searchCriteriaArray.length;++i){
		if(searchCriteriaArray[i]!=null&&searchCriteriaArray[i]!=''){
			searchCriteriaStr+='"'+searchCriteriaArray[i]+'"'+'+';
		}
	}
	$("#searchCriteria").text(searchCriteriaStr.substring(0,searchCriteriaStr.length-1));
});


</script>
</body>
</html>
