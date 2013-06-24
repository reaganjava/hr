<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-人才搜索-线上人才</title>
	<jsp:include page="/jsp/common/processing.jsp" />
	<jsp:include page="/jsp/common/JsAndCss.jsp"></jsp:include>
	<link href="<%=request.getContextPath()%>/css/index-style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/excavate.css" rel="stylesheet" type="text/css" />
</head>

<body>
<jsp:include page="/jsp/common/head.jsp"></jsp:include>
<s:include value="peopleExcavateNav.jsp"/>
<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/jquery-form.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/excavateTalents.js"></script>
<div style="height:10px;"></div>
<s:form  id="pageFrom" name="pageFrom" method="POST" action="/talentSearch/">
<s:hidden id="showAbstract" name="showAbstract"></s:hidden>
<div class="excavate-search-botton">
	<div class="excavate-search-botton-left">
        <ul>
            <li class="excavate-search-botton1"><input id="talentCheckBox" type="checkbox"/></li>
            <li class="excavate-search-botton1">全选</li>
            <li><input type="image" src="<%=request.getContextPath()%>/images/plyq.gif" /></li>
        </ul>
    </div>
    <div class="excavate-search-botton-right">
        <ul>
            <li class="excavate-search-botton1">显示：</li>
            <li><a href="javascript:void(0)"><img id="showPatternbt" src="<%=request.getContextPath()%>/images/abstract-zwbt.gif" width="68" height="24" alt="标题显示"/></a></li>
            <li><a href="javascript:void(0)"><img id="showPatternzy" src="<%=request.getContextPath()%>/images/abstract-zwzy2.gif" width="68" height="24" alt="摘要显示"/></a></li>
            <li class="excavate-search-botton1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排序：</li>
            <li><a href="javascript:showOrderBy(this)"><img onclick="showOrderBy(this)" id="jobKeyWord" src="<%=request.getContextPath()%>/images/excavate-search-zwmc2.gif" width="68" height="24" alt="按职位名称"/></a></li>
            <li><a href="javascript:showOrderBy(this)"><img onclick="showOrderBy(this)" id="categoryIndex" src="<%=request.getContextPath()%>/images/excavate-search-xjzs2.gif" width="68" height="24" alt="按星级指数"/></a></li>
            <li><a href="javascript:showOrderBy(this)"><img onclick="showOrderBy(this)" id="workingLife" src="<%=request.getContextPath()%>/images/excavate-search-gznx2.gif" width="68" height="24" alt="按工作年限"/></a></li>
            <li><a href="javascript:showOrderBy(this)"><img onclick="showOrderBy(this)" id="userInfoUpdateDate" src="<%=request.getContextPath()%>/images/excavate-search-gxsj2.gif" width="68" height="24" alt="按更新时间"/></a></li>
        </ul>
    </div>
</div>

<!--摘要列表-->
<div class="rcss-title">
     <ul>
         <li class="rcss0"></li>
         <li class="rcss5"><strong>意向职位</strong></li>
         <li class="rcss1"><strong>职能名称</strong></li>
         <li class="rcss2"><strong>行业类型</strong></li>
         <li class="rcss5"><strong>专业类型</strong></li>
         <li class="rcss2"><strong>专长</strong></li>
         <li class="rcss3"><strong>星级指数</strong></li>
         <li class="rcss4"><strong>更新时间</strong></li>
    </ul>
</div>


<s:iterator value="excavateResultList">
	<div class="rcss-box">
	    <div class="rcss" >
	         <ul>
	             <li class="rcss0"><input name="talentCheckBoxed" type="checkbox" value="<s:property value="userId"/>"/></li>
	             <li class="rcss5" >
	             	    <span style="width:150px;float:left" class="index_hid_css">
	                    	<a href="javascript:void(0)" onclick="alert('博站链接?userId='+<s:property value="userId"/>)" title="<s:property value="jobName"/>"><s:property value="jobName"/></a>
	                    </span>
	             </li>
	             <li class="rcss1" title="<s:property value="competency"/>">
	             	    <span style="width:190px;float:left" class="index_hid_css">
	                    	<s:property value="competency"/>
	                    </span>
	             </li>
	             <li class="rcss2" title="<s:property value="industryType"/>">
	             	    <span style="width:100px;float:left" class="index_hid_css">
	                    	<s:property value="industryType"/>
	                    </span>
	             </li>
	             <li class="rcss5" title="<s:property value="specializedType"/>">
             	   	<span style="width:150px;float:left" class="index_hid_css">
                    	<s:property value="specializedType"/>
                    </span>
	             </li>
	             <li class="rcss2" title="<s:property value="metier"/>">
	                <span style="width:100px;float:left" class="index_hid_css">
                    	<s:property value="metier"/>
                    </span>
	             </li>
	             <li class="rcss3"><img src="<%=request.getContextPath()%>/images/xin<s:property value="categoryIndex"/>.gif" width="50" height="10" /></li>
	             <li class="rcss4"><s:property value="getText('format.date',{userInfoUpdateDate})"/><img src="<%=request.getContextPath()%>/images/abstract-text-icon.gif" width="7" height="12" /></li>
	         </ul>
	    </div>
	</div>
	<div class="rcss-p" style="display:none">
    	<div class="rcss-p-left">
        	<p>
            	<strong>姓名：</strong><s:property value="userName"/>
                <strong>意向工作地点：</strong><s:property value="provinceCode"/> <s:property value="cityCode"/> <s:property value="areaCode"/>
                <strong>学历：</strong><s:property value="education"/>
                <strong>工作年限：</strong><s:property value="workingLife"/><br/>
                <strong>年龄：</strong><s:property value="age"/>
                <strong>性别：</strong><s:if test='sex=="1"'>男</s:if><s:elseif test='sex=="0"'>女</s:elseif><s:else>不限</s:else>
                <strong>语言能力：</strong><s:property value="langCapa"/>
                <strong>掌握程度：</strong><s:property value="mastery"/>
                <strong>计算机能力：</strong><s:property value="computerGrade"/>
                <strong>顾问：</strong><s:if test='isAdviser=="1"'>是</s:if><s:else>否</s:else>
                <strong>工作性质：</strong><s:property value="jobNature"/>
		  </p>
        </div>
    	<div class="rcss-botton">
    		<a href="javascript:void(0)"><img src="<%=request.getContextPath()%>/images/excavate-search-botton1.gif" width="68" height="24" alt="邀请面试" onclick="return sendInterviewNotice(<s:property value="userId"/>);"/></a>
    		<a href="javascript:void(0)"><img src="<%=request.getContextPath()%>/images/excavate-search-botton2.gif" width="68" height="24" alt="查看博站" onclick="return linkBoStation(<s:property value="userId"/>);"/></a>
    	</div>
    </div>
</s:iterator>

     <s:hidden id="orderBy" name="peopleExcavateVo.orderBy" />
     <s:hidden id="showPattern" name="peopleExcavateVo.showPattern" />
     <s:hidden name="peopleExcavateVo.industryType" />
	 <s:hidden name="peopleExcavateVo.specializedType" />
	 <s:hidden name="peopleExcavateVo.competency" />
	 <s:hidden name="peopleExcavateVo.provinceCode"  />
	 <s:hidden name="peopleExcavateVo.cityCode"  />
	 <s:hidden name="peopleExcavateVo.areaCode" />
	 <s:hidden name="peopleExcavateVo.metier" />
	 <s:hidden name="peopleExcavateVo.education" />
	 <s:hidden name="peopleExcavateVo.workingLife"/>
	 <s:hidden name="peopleExcavateVo.age" />
	 <s:hidden name="peopleExcavateVo.sex" />
	 <s:hidden name="peopleExcavateVo.langCapa" />
	 <s:hidden name="peopleExcavateVo.mastery"/>
	 <s:hidden name="peopleExcavateVo.computerGrade"/>
	 <s:hidden name="peopleExcavateVo.isAdviser"/>
	 <s:hidden name="peopleExcavateVo.jobNature"/>
	 <s:hidden name="peopleExcavateVo.userInfoUpdateDate"/>
	 <s:hidden name="peopleExcavateVo.categoryIndex" />
     <s:hidden name="peopleExcavateVo.jobKeyWord"/>
     <s:hidden name="peopleExcavateVo.userId"/>
     <s:hidden name="peopleExcavateVo.ltWorkingLife"/>
     <s:hidden name="peopleExcavateVo.gtWorkingLife"/>
     <s:hidden name="peopleExcavateVo.gtAge"/>
     <s:hidden name="peopleExcavateVo.ltAge"/>
     <s:hidden name="peopleExcavateVo.companyName"/>
     <s:hidden name="peopleExcavateVo.excavate" value="0"/>

    <div class="qx">
   		<s:property value="pageInfo.htmlListTableFootInfo" escapeHtml="false"/>
	</div>

    <div class="num" onkeypress="if(event.keyCode==13||event.which==13){return false;}">
    	<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
    </div>
</s:form>
 <input type="hidden" id="contextPath" value="<%=request.getContextPath()%>"/>
<!--底部分-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	var showAbstract = $("#showAbstract").val();
	if(showAbstract == "1"){
		$(".rcss-p").show();
		$("#showPatternbt").attr("src","../images/abstract-zwbt2.gif");
		$("#showPatternzy").attr("src","../images/abstract-zwzy.gif");
	}
});
</script>
</body>
</html>