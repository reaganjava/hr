<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-猎头中心-职位预览</title>
	<jsp:include page="/jsp/common/JsAndCss.jsp"></jsp:include>
	<link href="<%=request.getContextPath()%>/css/index-style.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/head.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<jsp:include page="/jsp/common/head.jsp"></jsp:include>
	<s:include value="headhunterCenterNav.jsp"/>
<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
<!--中间部分-->    
<div class="position-details">
	<div class="details-title1"><strong>职位详细</strong></div>
    <div class="details-title1-content">
   	  <div class="details-title1-left">
       	<h3><label id="jobName" ></label></h3>
          <ul>
           	  <li><s:property value="jobInfo.companyName"/></li>
              <li><img src="<%=request.getContextPath()%>/images/details-icon1.png" width="12" height="15" />行业类别：<label id="industryType" ></label></li>
              <li><img src="<%=request.getContextPath()%>/images/details-icon2.png" width="12" height="15" />工作地点：<label id="provinceCode" ></label></li>
              <li><img src="<%=request.getContextPath()%>/images/details-icon3.png" width="12" height="16" />招聘人数：<label id="recruitingNumber" ></label></li>
              <li><img src="<%=request.getContextPath()%>/images/details-icon4.png" width="12" height="15" />发布时间：<label id="jobIssuetDate" ></label></li>
          </ul>
      </div>
      <div class="details-title1-right">
          <ul>
           	  <li class="details-xiangxi1">工作年限：<label id="workingLife" ></label></li>
              <li class="details-xiangxi2">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<label id="sex" ></label></li>
              <li class="details-xiangxi1">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;能：<label id="competency" ></label></li>
              <li class="details-xiangxi2">年龄要求：<label id="age" ></label></li>
              <li class="details-xiangxi1">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：<label id="specializedType" ></label></li>
              <li class="details-xiangxi2">工作性质：<label id="jobNature" ></label></li>
              <li class="details-xiangxi1">语言能力：<label id="langCapa" ></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label id="mastery" ></label></li>
              <li class="details-xiangxi2">顾&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;问：<label id="isAdviser" ></label></li>
              <li class="details-xiangxi1">学历要求：<label id="education" ></label></li>
              <li class="details-xiangxi2">计算机能力：<label id="computerGrade"></label></li>
              <li class="details-xiangxi1">月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;薪：<label id="salary" ></label></li>
              <li class="details-xiangxi2">截止日期：<label id="jobExpiryDate" ></label></li>
          </ul>
      </div>
    </div>
    <div class="details-title2"><strong>岗位职责</strong></div>
    	<div class="details-title2-content">
    	<s:textarea readonly="true"  id="jobResponsibility" name="jobResponsibility"  />
    </div>
    <div class="details-title3"><strong>任职要求</strong></div>
     	<div class="details-title2-content">
     	<s:textarea readonly="true" id="jobRequirements" name="jobRequirements"  />
    </div>
    <div class="details-title3"><strong>过滤条件</strong></div>
	<div class="details-title3-content">
         <ul>
            <li><img src="<%=request.getContextPath()%>/images/china-zjjj-icon.png" width="12" height="12" />行业类型：<label id="filterIndustryType" ></label></li>
            <li><img src="<%=request.getContextPath()%>/images/china-zjjj-icon.png" width="12" height="12" />专业类型：<label id="filterSpecializedType" ></label></li>
            <li><img src="<%=request.getContextPath()%>/images/china-zjjj-icon.png" width="12" height="12" />专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;长：<label id="filterMetier" ></label></li>
            <li><img src="<%=request.getContextPath()%>/images/china-zjjj-icon.png" width="12" height="12" />工作性质：<label id="filterJobNature" ></label></li>
            <li><img src="<%=request.getContextPath()%>/images/china-zjjj-icon.png" width="12" height="12" />工作年限：大于<label id="filtergtWorkingLife" ></label> 小于<label id="filterltWorkingLife" ></label></li>
            <li><img src="<%=request.getContextPath()%>/images/china-zjjj-icon.png" width="12" height="12" />最低学历：<label id="filterEducation" ></label></li>
            <li><img src="<%=request.getContextPath()%>/images/china-zjjj-icon.png" width="12" height="12" />性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<label id="filterSex" ></label></li>
            <li><img src="<%=request.getContextPath()%>/images/china-zjjj-icon.png" width="12" height="12" />年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：大于<label id="filtergtAge" ></label> 小于<label id="filterltAge" ></label></li>
         </ul>
      </div> 
     
</div>
<!--底部分-->
<jsp:include page="/jsp/common/bottom.jsp"></jsp:include>
<script type="text/javascript">
$(function(){
	$("#jobName").text(window.opener.document.getElementById("jobName").value);
	$("#industryType").text(window.opener.document.getElementById("industryType").value=='请选择行业类型'?"":window.opener.document.getElementById("industryType").value);
	var region="";
	//$("#cityCode").text(window.opener.document.getElementById("citySearch").value=='城市'?"":window.opener.document.getElementById("citySearch").value);
	//$("#areaCode").text(window.opener.document.getElementById("areaSearch").value=='城区'?"":window.opener.document.getElementById("areaSearch").value);
	region=(window.opener.document.getElementById("province").value=='省份'?"":window.opener.document.getElementById("province").value)+" "+
			(window.opener.document.getElementById("citySearch").value=='城市'?"":window.opener.document.getElementById("citySearch").value)+" "+
					(window.opener.document.getElementById("areaSearch").value=='城区'?"":window.opener.document.getElementById("areaSearch").value);
	$("#provinceCode").text(region);
	$("#provinceCode").attr("title",region);
	$("#competency").text(window.opener.document.getElementById("competency").value=='请选择职能'?"":window.opener.document.getElementById("competency").value);
    
	$("#specializedType").text(window.opener.document.getElementById("specializedType").value=='请选择专业类型'?"":window.opener.document.getElementById("specializedType").value);
	$("#jobNature").text(window.opener.document.getElementById("jobNature").value=='请选择'?"":window.opener.document.getElementById("jobNature").value);
	$("#isAdviser").text(window.opener.document.getElementById("isAdviser").value);
	
	$("#education").text(window.opener.document.getElementById("education").value=='请选择'?"":window.opener.document.getElementById("education").value);
	$("#computerGrade").text(window.opener.document.getElementById("computerGrade").value=='请选择'?"":window.opener.document.getElementById("computerGrade").value);
	$("#salary").text(window.opener.document.getElementById("salary").value=='请选择'?"":window.opener.document.getElementById("salary").value);
	
	$("#jobExpiryDate").text(window.opener.document.getElementById("jobExpiryDate").value);
	$("#jobResponsibility").text(window.opener.document.getElementById("jobResponsibility").value);
	$("#jobRequirements").text(window.opener.document.getElementById("jobRequirements").value);

	$("#workingLife").text(window.opener.document.getElementById("workingLife").value=='请选择'?"":window.opener.document.getElementById("workingLife").value);
	$("#langCapa").text(window.opener.document.getElementById("langCapa").value=='请选择'?"":window.opener.document.getElementById("langCapa").value);
	$("#mastery").text(window.opener.document.getElementById("mastery").value=='请选择'?"":window.opener.document.getElementById("mastery").value);
	
	$("#age").text(window.opener.document.getElementById("age").value=='请选择'?"":window.opener.document.getElementById("age").value);
	$("#sex").text(window.opener.document.getElementById("sex").value);
	$("#jobIssuetDate").text(window.opener.document.getElementById("jobIssuetDate").value);
	$("#recruitingNumber").text(window.opener.document.getElementById("recruitingNumber").value);
	
	$("#filterIndustryType").text(window.opener.document.getElementById("filterIndustryType").value=='请选择行业类型'?"":window.opener.document.getElementById("filterIndustryType").value);
	$("#filterSpecializedType").text(window.opener.document.getElementById("filterSpecializedType").value=='请选择专业类型'?"":window.opener.document.getElementById("filterSpecializedType").value);
	$("#filterMetier").text(window.opener.document.getElementById("filterMetier").value);
	$("#filterJobNature").text(window.opener.document.getElementById("filterJobNature").value=='请选择'?"":window.opener.document.getElementById("filterJobNature").value);
	$("#filtergtWorkingLife").text(window.opener.document.getElementById("filtergtWorkingLife").value);
	$("#filterltWorkingLife").text(window.opener.document.getElementById("filterltWorkingLife").value);
	$("#filterEducation").text(window.opener.document.getElementById("filterEducation").value=='请选择'?"":window.opener.document.getElementById("filterEducation").value);
	
	$("#filterSex").text(window.opener.document.getElementById("filterSex").value);
	$("#filtergtAge").text(window.opener.document.getElementById("filtergtAge").value);
	$("#filterltAge").text(window.opener.document.getElementById("filterltAge").value);
});

</script>
</body>
</html>