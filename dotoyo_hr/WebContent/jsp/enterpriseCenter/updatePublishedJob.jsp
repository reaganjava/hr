<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-企业后台-职位信息修改</title>
	<jsp:include page="/jsp/common/processing.jsp" />
	<jsp:include page="/jsp/common/JsAndCss.jsp"></jsp:include>
	<link href="<%=request.getContextPath()%>/css/head.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/index-style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" />
</head>

<body>
	<jsp:include page="/jsp/common/head.jsp"></jsp:include>
	<s:include value="/jsp/headhunterCenter/headhunterCenterNav.jsp"/>
<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/jquery-form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js"></script>
<script>
    $(document).ready(function(){
    	$("#jobs").validationEngine();
    });
</script>
<!--中间部分-->
<s:form method="post" id="jobs" name="jobs" action="enterpriseCenterAction!saveUpdatePublishedJob.action">
<!--选择~绝对定位~-->
<div class="moban-down" id="showMenuID">
	<!--基本信息-->
     <div class="moban-down1" id="searchDown2" onmouseleave="menuHide(this)" style="display:none;">
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

     <div class="moban-down3" id="searchDown3" onmouseleave="menuHide(this)" style="display:none;">
     	<s:iterator value="competencyList">
        	<li style="width:200px;float:left" class="index_hid_css" title="<s:property value='name'/>">
        		<a href="#" id="<s:property value="code" />" onclick="setValue(this,'competency','hiddenCompetency')"><s:property value="name"/></a>
        	</li>
        </s:iterator>
     </div>

     <div class="moban-down1" id="searchDown4" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
     	 	<s:iterator value="specializedTypeList">
     	 	    <s:if test='parentCode=="003"'>
    	    		<li class="specializedDiv" style="width:700px;float:left" class="index_hid_css" title="<s:property value='name'/>"><label><strong><s:property value="name"/></strong></label></li>
    	    	</s:if>
    	    	<s:else>
    	    		<li style="width:145px;float:left" class="index_hid_css" title="<s:property value='name'/>">
    	    			<a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'specializedType','hiddenSpecializedType');return false;"><s:property value="name"/></a>
    	    		</li>
    	    	</s:else>
         	</s:iterator>
        </ul>
     </div>

     <div class="moban-down5" id="searchDown5" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
     	 	<s:iterator value="jobNatureList">
            	<li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'jobNature','hiddenJobNature')"><s:property value="name"/></a></li>
         	</s:iterator>
        </ul>
     </div>
     <div class="moban-down6" id="searchDown6" onmouseleave="menuHide(this)" style="display:none;">
    	  <ul>
			  <li><a id="0" href="javascript:void(0)" onclick="setValue(this,'isAdviser','hiddenisAdviser')">否</a></li>
              <li><a id="1" href="javascript:void(0)" onclick="setValue(this,'isAdviser','hiddenisAdviser')">是</a></li>
		  </ul>
     </div>
     <div class="moban-down7" id="searchDown7" onmouseleave="menuHide(this)" style="display:none;">
    	  <ul>
			 <s:iterator id="provinceList" value="provinceList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'province','hiddenProvince');setCity('citySearch','hiddenCity')"><s:property value="name"/></a></li>
            </s:iterator>
		  </ul>
     </div>
     <div class="moban-down7" id="searchDown8" onmouseleave="menuHide(this)" style="display:none;">
    	  <ul id="cityId">
		  </ul>
     </div>
     <div class="moban-down7" id="searchDown9" onmouseleave="menuHide(this)" style="display:none;">
    	  <ul id="areaId">
		  </ul>
     </div>

     <div class="moban-down8" id="searchDown10" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
   			<s:iterator value="salaryList">
           		<li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'salary','hiddenSalary')"><s:property value="name"/></a></li>
        	</s:iterator>
        </ul>
     </div>
     <!--具体要求-->
     <div class="moban-down6" id="searchDown11" onmouseleave="menuHide(this)" style="display:none;">
    	  <ul>
             <li><a id="2" href="javascript:void(0)" onclick="setValue(this,'sex','hiddenSex')">不限</a></li>
    	  	 <li><a id="0" href="javascript:void(0)" onclick="setValue(this,'sex','hiddenSex')">女</a></li>
             <li><a id="1" href="javascript:void(0)" onclick="setValue(this,'sex','hiddenSex')">男</a></li>
		  </ul>
     </div>

     <div class="moban-down8" id="searchDown12" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
     		<s:iterator value="educationList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'education','hiddenEducation')"><s:property value="name"/></a></li>
            </s:iterator>
        </ul>
     </div>

     <div class="moban-down8" id="searchDown13" onmouseleave="menuHide(this)" style="display:none;">
     	 <ul>
			<s:iterator value="workingLifeList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'workingLife','hiddenWorkingLife')"><s:property value="name"/></a></li>
            </s:iterator>
		  </ul>
     </div>

     <div class="moban-down8" id="searchDown14" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
		    <s:iterator value="langCapaList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'langCapa','hiddenLangCapa')"><s:property value="name"/></a></li>
            </s:iterator>
		</ul>
     </div>

     <div class="moban-down5" id="searchDown15" onmouseleave="menuHide(this)" style="display:none;">
     	 <ul id="masteryId">
		 </ul>
     </div>


     <div class="moban-down5" id="searchDown16" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
			 <s:iterator value="computerGradeList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'computerGrade','hiddenComputerGrade')"><s:property value="name"/></a></li>
            </s:iterator>
		</ul>
     </div>

     <!--职位过滤条件-->
     <div class="moban-down1" id="searchDown17" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
     		<s:iterator value="industrysList">
           		<s:if test='parentCode=="001"'>
    	    		<li class="specializedDiv" style="width:700px;"><label><strong><s:property value="name"/></strong></label></li>
    	    	</s:if>
    	    	<s:else>
    	    		<li style="width:100px;float:left" class="index_hid_css" title="<s:property value='name'/>">
    	    			<a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'filterIndustryType','hiddenFilterIndustryType');return false;"><s:property value="name"/></a>
    	    		</li>
    	    	</s:else>
        	</s:iterator>
        	<li class="specializedDiv" style="width:700px;"><label><strong>其他</strong></label></li>
        	<li style="width:100px;float:left" class="index_hid_css" title="不限">
        		<a href="javascript:void(0)" id="noLimit" onclick="setValue(this,'filterIndustryType','hiddenFilterIndustryType');return false;">不限</a>
        	</li>
        </ul>
     </div>

     <div class="moban-down1" id="searchDown18" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
     	 	<s:iterator value="specializedTypeList">
            	<s:if test='parentCode=="003"'>
    	    		<li class="specializedDiv" style="width:700px;float:left" class="index_hid_css" title="<s:property value='name'/>"><label><strong><s:property value="name"/></strong></label></li>
    	    	</s:if>
    	    	<s:else>
    	    		<li style="width:145px;float:left" class="index_hid_css" title="<s:property value='name'/>">
    	    			<a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'filterSpecializedType','hiddenFilterSpecializedType');return false;"><s:property value="name"/></a>
    	    		</li>
    	    	</s:else>
         	</s:iterator>
         	<li class="specializedDiv" style="width:700px;float:left" class="index_hid_css" title="其他"><label><strong>其他</strong></label></li>
         	<li style="width:145px;float:left" class="index_hid_css" title="不限"><a href="javascript:void(0)" id="noLimit" onclick="setValue(this,'filterSpecializedType','hiddenFilterSpecializedType');return fales;">不限</a></li>
        </ul>
     </div>

     <div class="moban-down5" id="searchDown19" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
     		<li><a href="javascript:void(0)" id="noLimit" onclick="setValue(this,'filterJobNature','hiddenFilterJobNature')">不限</a></li>
     	 	<s:iterator value="jobNatureList">
            	<li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'filterJobNature','hiddenFilterJobNature')"><s:property value="name"/></a></li>
         	</s:iterator>
        </ul>
     </div>

     <div class="moban-down8" id="searchDown20" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
     		<s:iterator value="educationList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'filterEducation','hiddenFilterEducation')"><s:property value="name"/></a></li>
            </s:iterator>
        </ul>
     </div>
     <div class="moban-down6" id="searchDown21" onmouseleave="menuHide(this)" style="display:none;">
    	  <ul>
    	  	 <li><a id="" href="javascript:void(0)" onclick="setValue(this,'filterSex','hiddenFilterSex')">不限</a></li>
			 <li><a id="0" href="javascript:void(0)" onclick="setValue(this,'filterSex','hiddenFilterSex')">女</a></li>
             <li><a id="1" href="javascript:void(0)" onclick="setValue(this,'filterSex','hiddenFilterSex')">男</a></li>
		  </ul>
     </div>
     
     <div class="moban-down8" id="searchDown22" onmouseleave="menuHide(this)" style="display:none;">
    	  <ul>
			 <s:iterator value="ageList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'age','hiddenAge')"><s:property value="name"/></a></li>
            </s:iterator>
		  </ul>
     </div>
</div>

<div class="head-jobs">
    	<div class="head-jobs-top">
            <div class="jobs-title jobs-title-bg1"><strong>基本信息</strong></div>
            <div class="fbzw-box">
					<div class="fbzw-div">
                        <ul>
                            <li class="fbzw0"><em>*</em>职位名称：</li>
                            <li class="fbzw5">
                            	<s:textfield id="jobName" name="jobInfo.jobName" cssClass="validate[required,custom[filteringSpecialChar]]" maxlength="18"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0"><em>*</em>工作性质：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#jobNature', '#searchDown5')" />
                            	<s:textfield  id="jobNature" name="jobInfo.jobNatureName" cssClass="validate[custom[requiredSelected]]" readonly="true"/>
                                <s:hidden id="hiddenJobNature" name="jobInfo.jobNature"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0"><em>*</em>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;能：</li>
                            <li class="fbzw1">
                           	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#competency', '#searchDown3')" />
                           		<s:textfield id="competency" name="jobInfo.competencyName" cssClass="validate[custom[requiredSelected]]" readonly="true"/>
                                <s:hidden id="hiddenCompetency" name="jobInfo.competency"/>
                           	</li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0"><em>*</em>招聘人数：</li>
                            <li class="fbzw5">
                            	<s:textfield id="recruitingNumber" name="jobInfo.recruitingNumber"  cssClass="validate[required,custom[positiveInteger]]"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0"><em>*</em>行业类型：</li>
                            <li class="fbzw1"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#industryType', '#searchDown2')" />
                                <s:textfield id="industryType" name="jobInfo.industryName" cssClass="validate[custom[requiredSelected]]" readonly="true"/>
                                <s:hidden id="hiddenIndustryType" name="jobInfo.industryType"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0"><em>*</em>顾&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;问：</li>
                            <li class="fbzw6">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#isAdviser', '#searchDown6')" />
	                            <s:if test='jobInfo.isAdviser=="1"' >
	                            	<s:textfield  id="isAdviser" value="是" readonly="true"/>
	                            </s:if>
	              				<s:elseif test='jobInfo.isAdviser=="0"'>
	              					<s:textfield  id="isAdviser" value="否" readonly="true"/>	
	              				</s:elseif>
                                <s:hidden id="hiddenisAdviser" name="jobInfo.isAdviser"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0"><em>*</em>专业类型：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#specializedType', '#searchDown4')" />
                            	<s:textfield id="specializedType" name="jobInfo.specializedName" cssClass="validate[custom[requiredSelected]]" readonly="true"/>
                                <s:hidden id="hiddenSpecializedType" name="jobInfo.specializedType"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0"><em>*</em>工作地区：</li>
                            <li class="fbzw2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#province', '#searchDown7')" />
                            	<s:textfield id="province" name="jobInfo.provinceName" cssClass="validate[custom[region]]" readonly="true"/>
                    			<s:hidden id="hiddenProvince" name="jobInfo.provinceCode"/>
                            </li>
                            <li class="fbzw2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="loadData('citySearch','#searchDown8')" />
                            	<s:textfield id="citySearch" name="jobInfo.cityName" cssClass="validate[custom[region]]" readonly="true"/>
                    			<s:hidden id="hiddenCity" name="jobInfo.cityCode"/>
                            </li>
                            <li class="fbzw2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="loadData('areaSearch','#searchDown9')" />
                            	<s:textfield id="areaSearch" name="jobInfo.areaName" readonly="true"/>
                    			<s:hidden id="hiddenArea" name="jobInfo.areaCode"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;薪：</li>
                            <li class="fbzw1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#salary', '#searchDown10')" />
                            	<s:textfield id="salary" name="jobInfo.salaryName" readonly="true"/>
                    			<s:hidden id="hiddenSalary" name="jobInfo.salary" />
                            </li>
                        </ul>
                    </div>
        	</div>
          <div class="jobs-title jobs-title-bg2"><strong>具体要求</strong></div>
          <div class="fbzw-box">
				<div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</li>
                            <li class="fbzw1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#age', '#searchDown22')" />
                            	<s:textfield id="age" readonly="true" name="jobInfo.ageName"/>
                    			<s:hidden id="hiddenAge" name="jobInfo.age"/>
							</li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</li>
                            <li class="fbzw2">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#sex', '#searchDown11')" />
	                            <s:if test='jobInfo.sex=="1"'>
	                            	<s:textfield id="sex" value="男" readonly="true"/>
	                            </s:if>
	                            <s:elseif test='jobInfo.sex=="0"'>
	                            	<s:textfield id="sex" value="女" readonly="true"/>
	                            </s:elseif>
				              	<s:elseif test='jobInfo.sex=="2"' >
				              		<s:textfield id="sex" value="不限" readonly="true"/>
				              	</s:elseif>
                    			<s:hidden id="hiddenSex" name="jobInfo.sex"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">学历要求：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#education', '#searchDown12')" />
                            	<s:textfield id="education" name="jobInfo.educationName" readonly="true"/>
                    			<s:hidden id="hiddenEducation" name="jobInfo.education" />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0">工作年限：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#workingLife', '#searchDown13')" />
                            	<s:textfield id="workingLife"  name="jobInfo.workingLifeName" readonly="true"/>
                    			<s:hidden id="hiddenWorkingLife" name="jobInfo.workingLife"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">语言能力：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#langCapa', '#searchDown14')" />
                            	<s:textfield id="langCapa" name="jobInfo.langCapaName" readonly="true"/>
                    			<s:hidden id="hiddenLangCapa" name="jobInfo.langCapa" />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0">掌握程度：</li>
                            <li class="fbzw1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="loadMastery();" />
                            	<s:textfield id="mastery" name="jobInfo.masteryName" readonly="true"/>
                    			<s:hidden id="hiddenMastery" name="jobInfo.mastery" />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">计算机能力：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#computerGrade', '#searchDown16')" />
                            	<s:textfield id="computerGrade" name="jobInfo.computerGradeName" readonly="true"/>
                    			<s:hidden id="hiddenComputerGrade" name="jobInfo.computerGrade" />
                            </li>
                        </ul>
                    </div>
        	</div>
          <div class="jobs-middle2">
            	<ul>
                    <li class="jobs5"><em>*</em>岗位职责&nbsp;&nbsp;
                    	<s:textarea id="jobResponsibility" name="jobInfo.jobResponsibility" cssClass="validate[required,length[0,2000]]"/>
                    </li>
                    <li class="jobs5"><em>*</em>任职要求&nbsp;&nbsp;
                    	<s:textarea id="jobRequirements" name="jobInfo.jobRequirements" cssClass="validate[required,length[0,2000]]"/>
                    </li>
                </ul>
            </div>
          <div class="jobs-title jobs-title-bg3"><strong>发布设置</strong></div>
          <div class="jobs-fb">
               <ul>
               	   <li class="jobs7"><em>*</em>发布日期：
               	   		<input  id="jobIssuetDate" name="jobInfo.jobIssuetDate"
               	   		type="text" size="20" class="validate[required]" 
               	   		onclick="WdatePicker({dateFmt:'yyyy-MM-dd',errDealMode:1,maxDate:'#F{$dp.$D(\'jobExpiryDate\')}',minDate:'%y-%M-{%d}'})" value="<s:property value="@com.dotoyo.buildjob.common.util.DateUtil@getFormatDateByFormat(jobInfo.jobIssuetDate,'yyyy-MM-dd')"/>" readonly="readonly"/>
               	   	</li>
                   <li class="jobs7"><em>*</em>有效期至：
                   		<input id="jobExpiryDate" class="validate[required]" name="jobInfo.jobExpiryDate" 
                   		type="text" size="20" value="<s:property value="@com.dotoyo.buildjob.common.util.DateUtil@getFormatDateByFormat(jobInfo.jobExpiryDate,'yyyy-MM-dd')"/>" 
                   		onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'jobIssuetDate\')}'})" readonly="readonly"/>
                   </li>
               </ul>
      	  </div>
          <div class="jobs-title jobs-title-bg3"><strong>职位过滤条件</strong></div>
          <div class="fbzw-box">
          			<div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">行业类型：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#filterIndustryType', '#searchDown17')"  />
                            	
                            	<s:if test='jobInfo.filterIndustryType=="noLimit"'>
                            		<s:textfield id="filterIndustryType" name="jobInfo.filterIndustryName" value="不限" readonly="true"/>
                            	</s:if>
                            	<s:else>
                            		<s:textfield id="filterIndustryType" name="jobInfo.filterIndustryName" readonly="true"/>
                            	</s:else>
                                <s:hidden id="hiddenFilterIndustryType" name="jobInfo.filterIndustryType"   />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;长：</li>
                            <li class="fbzw5">
                            	<s:textfield maxlength="50" id="filterMetier" name="jobInfo.filterMetier" />
                            </li>
                        </ul>
                    </div>
					<div class="fbzw-div">
					    <ul>
                            <li class="fbzw0">专业类型：</li>
                            <li class="fbzw1"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#filterSpecializedType', '#searchDown18')" />
                                
                                <s:if test='jobInfo.filterSpecializedType=="noLimit"'>
                                	  <s:textfield id="filterSpecializedType" name="jobInfo.filterSpecializedName" value="不限" readonly="true"/>
                                </s:if>
                                <s:else>
                                	<s:textfield id="filterSpecializedType" name="jobInfo.filterSpecializedName" readonly="true"/>
                                </s:else>
                                <s:hidden id="hiddenFilterSpecializedType" name="jobInfo.filterSpecializedType"    />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0">工作性质：</li>
                            <li class="fbzw1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#filterJobNature', '#searchDown19')" />
                            	<s:if test='jobInfo.filterJobNature=="noLimit"'>
                            		<s:textfield  id="filterJobNature" name="jobInfo.filterJobNatureName" value="不限" readonly="true"/>
                            	</s:if>
                            	<s:else>
                            		<s:textfield  id="filterJobNature" name="jobInfo.filterJobNatureName" readonly="true"/>
                            	</s:else>
                                <s:hidden id="hiddenFilterJobNature" name="jobInfo.filterJobNature" />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">工作年限：</li>
                            <li class="fbzw3">大于&nbsp;&nbsp;</li>
                            <li class="fbzw4"><s:textfield name="jobInfo.filtergtWorkingLife"/></li>
                            <li class="fbzw3">小于&nbsp;&nbsp;</li>
                            <li class="fbzw4"><s:textfield name="jobInfo.filterltWorkingLife"/></li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0">最低学历：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#filterEducation', '#searchDown20')"  />
                            	<s:textfield id="filterEducation" name="jobInfo.filterEducationName" readonly="true"/>
                                <s:hidden id="hiddenFilterEducation" name="jobInfo.filterEducation"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</li>
                            <li class="fbzw2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#filterSex', '#searchDown21')" />
                            	 <s:if test='jobInfo.filterSex=="1"' >
                            	 	<s:textfield id="filterSex" value="男" readonly="true"/>
                            	 </s:if><s:elseif test='jobInfo.filterSex=="0"'>
                            	 	<s:textfield id="filterSex" value="女" readonly="true"/>
                            	 </s:elseif>
                            	 <s:else>
                            	 	<s:textfield id="filterSex" value="不限" readonly="true"/>
                            	 </s:else>
                    			<s:hidden id="hiddenFilterSex" name="jobInfo.filterSex"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</li>
                            <li class="fbzw3">大于&nbsp;&nbsp;</li>
                            <li class="fbzw4"><s:textfield name="jobInfo.filtergtAge"/></li>
                            <li class="fbzw3">小于&nbsp;&nbsp;</li>
                            <li class="fbzw4"><s:textfield name="jobInfo.filterltAge" /></li>
                        </ul>
                    </div>
        	</div>

            <div class="head-jobs-botton">
	          <a href="javascript:void(0)">
	          	<img id="postPreview" src="<%=request.getContextPath()%>/images/head-jobs-botton1.png" width="109" height="32" />
	          </a>
	          <a href="javascript:void(0)"><%--保存修改 --%>
	          	<input id="saveAndPublish" type="image" src="<%=request.getContextPath()%>/images/head-jobs-botton6.png" />
	          </a>
	          <a href="javascript:void(0)">
	          	<img id="cancel" src="<%=request.getContextPath()%>/images/head-jobs-botton3.png" width="79" height="32" onclick="$('#jobs').resetForm()"/>
	          </a>
              <a href="javascript:void(0)">
              	<img src="<%=request.getContextPath()%>/images/head-jobs-botton5.png" width="79" height="32" onclick="$('#jobs').resetForm()"/>
              </a>
          	</div>

	      	<div class="wenxin-box">
	      	   <div class="wenxin">
	           		<p class="wenxin1">您发布的招聘信息需要建筑猎头人才网审核通过后，求职者才能搜索到。审核时间间隔一般在2小时左右，节假日除外。如需立即审核，您可致电0755－98898989或联系您你的客户服务专员。</p>
	                <p class="wenxin2">为了保障供求双方建筑猎头人才网的权益，请您在发布招聘信息时遵守国家相关法律法规，不得发布虚假招聘信息，不得代其它单位招聘。</p>
	                <p class="wenxin3">招聘单位违反国家法律法规的，建筑猎头人才网有权立即停止您在本网所有服务，且不予退款。</p>
	           </div>
	    	</div>
    </div>
</div>
<s:hidden name="jobInfo.id"></s:hidden>
<s:hidden id="fromReq" name="fromReq"></s:hidden>
</s:form>

<!--底部分-->
<jsp:include page="/jsp/common/bottom.jsp"></jsp:include>
<script type="text/javascript">
$(function(){
	$("#postPreview").click(function(){
		window.open('<%=request.getContextPath()%>/jsp/headhunterCenter/postPreview.jsp','_blank','width=900,height=600,menubar=no,toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes');
	});

	$("#cancel").click(function(){
		window.close();
	});
	
	if($("#fromReq").val()==1){
		$("#jobIssuetDate").attr("disabled","disabled");
		$("#jobIssuetDate").removeAttr("class");
	}
	
	comparisonDate();
});

function comparisonDate(){
	var d, s="";      
    d = new Date();   
    s += d.getYear()+"-";
    if(d.getMonth()>9){
    	s += (d.getMonth()+1)+"-";        
    }else{
    	s += "0" +(d.getMonth()+1)+"-";
    }
    if(d.getDate()>9){
    	s += d.getDate();      
    }else{
    	s += "0" +d.getDate();
    }
    
    if($("#jobIssuetDate").val()<s){
    	$("#jobIssuetDate").attr("disabled","disabled");
    	$("#jobIssuetDate").removeAttr("class");
    }
}
function loadMastery(){
	var langCapaCode = $("#hiddenLangCapa").val();
	$.getJSON("<%=request.getContextPath()%>/common/loadMastery.action?langCapaCode="+langCapaCode , function(data) {
		var options="";
		for(i=0;i<data.length;i++){
			value = data[i].code;
			text = data[i].name;
			options = options + "<li><a href='javascript:void(0)' id=\""+value+"\""+" onclick=\"setValue(this,'mastery','hiddenMastery')\">"+text+"</a></li>";
		}
		$('#masteryId').html(options);
	});	
	menuClick("#mastery", "#searchDown15");
}


$("input[name='jobInfo.filtergtAge']").keyup(function(){   
    var tmptxt=$(this).val();   
    $(this).val(tmptxt.replace(/\D|^0/g,''));   
}).bind("paste",function(){   
    var tmptxt=$(this).val();   
    $(this).val(tmptxt.replace(/\D|^0/g,''));   
}).css("ime-mode", "disabled");  
$("input[name='jobInfo.filterltAge']").keyup(function(){   
    var tmptxt=$(this).val();   
    $(this).val(tmptxt.replace(/\D|^0/g,''));   
}).bind("paste",function(){   
    var tmptxt=$(this).val();   
    $(this).val(tmptxt.replace(/\D|^0/g,''));   
}).css("ime-mode", "disabled"); 
$("input[name='jobInfo.filtergtWorkingLife']").keyup(function(){   
    var tmptxt=$(this).val();   
    $(this).val(tmptxt.replace(/\D|^0/g,''));   
}).bind("paste",function(){   
    var tmptxt=$(this).val();   
    $(this).val(tmptxt.replace(/\D|^0/g,''));   
}).css("ime-mode", "disabled"); 
$("input[name='jobInfo.filterltWorkingLife']").keyup(function(){   
    var tmptxt=$(this).val();   
    $(this).val(tmptxt.replace(/\D|^0/g,''));   
}).bind("paste",function(){   
    var tmptxt=$(this).val();   
    $(this).val(tmptxt.replace(/\D|^0/g,''));   
}).css("ime-mode", "disabled"); 
</script>
</body>
</html>
