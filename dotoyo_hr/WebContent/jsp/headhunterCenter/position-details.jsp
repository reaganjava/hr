<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-猎头中心-职位信息</title>
	<jsp:include page="/jsp/common/JsAndCss.jsp"></jsp:include>
	<link href="<%=request.getContextPath()%>/css/index-style.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/head.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<jsp:include page="../common/head.jsp"></jsp:include>
	<s:include value="headhunterCenterNav.jsp"/>
    <script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/jquery.query.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/jquery-form.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/headHunterCenter.js"></script>

<!--中间部分-->
<div class="position-details">
	<div class="details-title1"><strong>职位信息</strong></div>
    <div class="details-title1-content">
   	  <div class="details-title1-left">
       	<h3><s:property value="jobInfo.jobName"/></h3>
          <ul>
           	  <li>
           	  	<a href="#" onclick="return linkBoStation(<s:property value="jobInfo.userId"/>);return false;"><s:property value="jobInfo.companyName"/></a>
           	  </li>
              <li><img src="<%=request.getContextPath()%>/images/details-icon1.png" width="12" height="15" />行业类别：<s:property value="jobInfo.industryType"/></li>
              <li><img src="<%=request.getContextPath()%>/images/details-icon2.png" width="12" height="15" />工作地点：<s:property value="jobInfo.provinceCode"/> <s:property value="jobInfo.cityCode"/> <s:property value="jobInfo.areaCode"/></li>
              <li><img src="<%=request.getContextPath()%>/images/details-icon3.png" width="12" height="16" />招聘人数：<s:property value="jobInfo.recruitingNumber"/></li>
              <li><img src="<%=request.getContextPath()%>/images/details-icon4.png" width="12" height="15" />发布时间：<s:property value="getText('format.date',{jobInfo.jobIssuetDate})"/></li>
          </ul>
      </div>
      <div class="details-title1-right">
          <ul>
           	  <li class="details-xiangxi1">工作年限：<s:property value="jobInfo.workingLife"/></li>
              <li class="details-xiangxi2">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
              	<s:if test='jobInfo.sex=="1"'>男</s:if><s:elseif test='jobInfo.sex=="0"'>女</s:elseif><s:elseif test='sex=="2"'>不限</s:elseif>
              </li>
              <li class="details-xiangxi1">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;能：<s:property value="jobInfo.competency"/></li>
              <li class="details-xiangxi2">年龄要求：<s:property value="jobInfo.ageName"/></li>
              <li class="details-xiangxi1">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：<s:property value="jobInfo.specializedType"/></li>
              <li class="details-xiangxi2">工作性质：<s:property value="jobInfo.jobNature"/></li>
              <li class="details-xiangxi1">语言能力：<s:property value="jobInfo.langCapa"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="jobInfo.mastery"/></li>
              <li class="details-xiangxi2">顾&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;问：
              	<s:if test='jobInfo.isAdviser=="1"'>是</s:if><s:elseif test='jobInfo.isAdviser=="0"'>否</s:elseif>
             　　　　　</li>
              <li class="details-xiangxi1">学历要求：<s:property value="jobInfo.education"/></li>
              <li class="details-xiangxi2">计算机能力：<s:property value="jobInfo.computerGrade"/></li>
              <li class="details-xiangxi1">月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;薪：<s:property value="jobInfo.salary"/></li>
              <li class="details-xiangxi2">截止日期：<s:property value="getText('format.date',{jobInfo.jobExpiryDate})"/></li>
          </ul>
      </div>
    </div>
    <div class="details-title2"><strong>岗位职责</strong></div>
          <div class="details-title2-content">
    <s:textarea readonly="true"  id="jobResponsibility" name="jobInfo.jobResponsibility"  />
    </div>
    <div class="details-title3"><strong>任职要求</strong></div>
    <div class="details-title2-content">
    <s:textarea readonly="true"  id="jobRequirements" name="jobInfo.jobRequirements"  />
    </div>
   
    <div class="details-botton">
    	<a href="javascript:appliedJob('<s:property value="jobInfo.id"/>','<s:property value="jobInfo.userId"/>')">
    		<img src="<%=request.getContextPath()%>/images/details-icon5.png" width="97" height="32" onclick="return appliedJob('<s:property value="jobInfo.id"/>','<s:property value="jobInfo.userId"/>')"/>
    	</a>
        <a href="javascript:void(0)" onclick="return linkBoStation(<s:property value="jobInfo.userId"/>);"><img src="<%=request.getContextPath()%>/images/details-icon6.png" width="97" height="32" /></a>
        <a href="javascript:void(0)"><img src="<%=request.getContextPath()%>/images/details-icon8.png" width="69" height="32" onclick="addFavorite('<s:property value="jobInfo.jobName"/>'); return false;"/></a>
        <a href="javascript:void(0)"><img src="<%=request.getContextPath()%>/images/details-icon9.png" width="69" height="32" onclick="printer();return false;"/></a>
    </div>
</div>
<div class="details-bottom">
	<div class="details-title4"><strong>公司其他职位</strong></div>
    <div class="details-text details-text-bg">
         <ul>
             <li class="details1">职位名称</li>
             <li class="details2">工作地点</li>
             <li class="details3">行业</li>
             <li class="details4">职能分类</li>
             <li class="details5">发布时间</li>
         </ul>
    </div>
    <s:iterator value="recruitLtdJobList">
	    <div class="details-text">
	         <ul>
	             <li class="details1">
	             	<a href="<s:url action="headhunterCenterAction!getJobInfoDetail" namespace="/headhunterCenter">
                    <s:param name="jobId"><s:property value="id"/></s:param>
                    <s:param name="userId"><s:property value="userId"/></s:param></s:url>"><s:property value="jobName"/>
                    </a>
                 </li>
	             <li class="details2">
	             	<span style="width:120px;float:left" class="index_hid_css" title="<s:property value='provinceCode'/> <s:property value='cityCode'/> <s:property value='areaCode'/>">
	             		<s:property value="cityCode"/> <s:property value="areaCode"/>
	             	</span>
	             </li>
	             <li class="details3"><s:property value="industryType"/></li>
	             <li class="details4" title="<s:property value="competency"/>"><s:property value="competency"/></li>
	             <li class="details5"><s:property value="getText('format.date',{jobIssuetDate})"/></li>
	         </ul>
	    </div>
    </s:iterator>
</div>
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>"/>
<!--底部分-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
<script type="text/javascript">
function showRequest(formData, jqForm, options) {
    var userInfoDto = "<%=session.getAttribute("userInfoDto")%>";
    if(userInfoDto==null||userInfoDto=="null"){
        window.location.href='../homePage/homePageAction!init.action?goFrom=1';
    }
    return true;
}

function addFavorite(sTitle){
   try{
	   window.external.addFavorite(document.URL, sTitle);
   }catch(e){
       try{
           window.sidebar.addPanel(sTitle, document.URL, "");
       }catch (e){
           alert("加入收藏失败，请使用Ctrl+D进行添加");
       }
   }
}

function printer(){
	window.print();
}
</script>
</body>
</html>