<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-猎头中心-发布职位</title>
	<jsp:include page="/jsp/common/processing.jsp" />
	<jsp:include page="/jsp/common/JsAndCss.jsp"></jsp:include>
	<link href="<%=request.getContextPath()%>/css/head.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/css/index-style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" />
</head>

<body>
	<jsp:include page="/jsp/common/head.jsp"></jsp:include>
	<s:include value="headhunterCenterNav.jsp"/>
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
<s:form action="headhunterCenterAction!releaseJob.action" method="post" id="jobs" name="jobs" namespace="headhunterCenterAction" >
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
        		<a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'competency','hiddenCompetency');return false;"><s:property value="name"/></a>
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
            	<li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'jobNature','hiddenJobNature');return false;"><s:property value="name"/></a></li>
         	</s:iterator>
        </ul>
     </div>
     <div class="moban-down6" id="searchDown6" onmouseleave="menuHide(this)" style="display:none;">
    	  <ul>
			  <li><a id="0" href="javascript:void(0)" onclick="setValue(this,'isAdviser','hiddenisAdviser');return false;">否</a></li>
              <li><a id="1" href="javascript:void(0)" onclick="setValue(this,'isAdviser','hiddenisAdviser');return false;">是</a></li>
		  </ul>
     </div>
     <div class="moban-down7" id="searchDown7" onmouseleave="menuHide(this)" style="display:none;">
    	  <ul>
			 <s:iterator id="provinceList" value="provinceList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'province','hiddenProvince');setCity('citySearch','hiddenCity');return false;"><s:property value="name"/></a></li>
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
           		<li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'salary','hiddenSalary');return false;"><s:property value="name"/></a></li>
        	</s:iterator>
        </ul>
     </div>
     <!--具体要求-->
     <div class="moban-down6" id="searchDown11" onmouseleave="menuHide(this)" style="display:none;">
    	  <ul>
             <li><a id="2" href="javascript:void(0)" onclick="setValue(this,'sex','hiddenSex');return false;">不限</a></li>
    	  	 <li><a id="0" href="javascript:void(0)" onclick="setValue(this,'sex','hiddenSex');return false;">女</a></li>
             <li><a id="1" href="javascript:void(0)" onclick="setValue(this,'sex','hiddenSex');return false;">男</a></li>
		  </ul>
     </div>

     <div class="moban-down8" id="searchDown12" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
     		<s:iterator value="educationList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'education','hiddenEducation');return false;"><s:property value="name"/></a></li>
            </s:iterator>
        </ul>
     </div>

     <div class="moban-down8" id="searchDown13" onmouseleave="menuHide(this)" style="display:none;">
     	 <ul>
			<s:iterator value="workingLifeList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'workingLife','hiddenWorkingLife');return false;"><s:property value="name"/></a></li>
            </s:iterator>
		  </ul>
     </div>

     <div class="moban-down8" id="searchDown14" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
		    <s:iterator value="langCapaList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'langCapa','hiddenLangCapa');setMastery();return false;"><s:property value="name"/></a></li>
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
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'computerGrade','hiddenComputerGrade');return false;"><s:property value="name"/></a></li>
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
        	<li style="width:100px;float:left" class="index_hid_css" title="不限"><a href="javascript:void(0)" id="noLimit" onclick="setValue(this,'filterIndustryType','hiddenFilterIndustryType');return false;">不限</a></li>
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
     		<li><a href="javascript:void(0)" id="noLimit" onclick="setValue(this,'filterJobNature','hiddenFilterJobNature');return false;">不限</a></li>
     	 	<s:iterator value="jobNatureList">
            	<li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'filterJobNature','hiddenFilterJobNature');return false;"><s:property value="name"/></a></li>
         	</s:iterator>
        </ul>
     </div>

     <div class="moban-down8" id="searchDown20" onmouseleave="menuHide(this)" style="display:none;">
     	<ul>
     		<s:iterator value="educationList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'filterEducation','hiddenFilterEducation');return false;"><s:property value="name"/></a></li>
            </s:iterator>
        </ul>
     </div>
     <div class="moban-down6" id="searchDown21" onmouseleave="menuHide(this)" style="display:none;">
    	  <ul>
             <li><a id="2" href="javascript:void(0)" onclick="setValue(this,'filterSex','hiddenFilterSex');return false;">不限</a></li>
			 <li><a id="0" href="javascript:void(0)" onclick="setValue(this,'filterSex','hiddenFilterSex');return false;">女</a></li>
             <li><a id="1" href="javascript:void(0)" onclick="setValue(this,'filterSex','hiddenFilterSex');return false;">男</a></li>
		  </ul>
     </div>

      <div class="moban-down8" id="searchDown22" onmouseleave="menuHide(this)" style="display:none;">
    	  <ul>
			 <s:iterator value="ageList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'age','hiddenAge');return false;"><s:property value="name"/></a></li>
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
                            	<s:textfield id="jobName" maxlength="18" name="jobInfo.jobName" cssClass="validate[required,custom[filteringSpecialChar]]"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0"><em>*</em>工作性质：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#jobNature', '#searchDown5')" />
                            	<s:textfield  id="jobNature" value="请选择" readonly="true" cssClass="validate[custom[requiredSelected]]"/>
                                <s:hidden id="hiddenJobNature" name="jobInfo.jobNature" value="" />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0"><em>*</em>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;能：</li>
                            <li class="fbzw1">
                           	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#competency', '#searchDown3')" />
                           		<s:textfield id="competency" value="请选择职能" readonly="true" cssClass="validate[custom[requiredSelected]]"/>
                                <s:hidden id="hiddenCompetency" name="jobInfo.competency" value="" />
                           	</li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0"><em>*</em>招聘人数：</li>
                            <li class="fbzw5">
                            	<s:textfield maxlength="5" id="recruitingNumber" name="jobInfo.recruitingNumber" cssClass="validate[required,custom[positiveInteger]]" />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                         <ul>
                            <li class="fbzw0"><em>*</em>行业类型：</li>
                            <li class="fbzw1"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#industryType', '#searchDown2')" />
                                <s:textfield id="industryType" value="请选择行业类型" readonly="true" cssClass="validate[custom[requiredSelected]]"/>
                                <s:hidden id="hiddenIndustryType" name="jobInfo.industryType" value="" />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0"><em>*</em>顾&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;问：</li>
                            <li class="fbzw6">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#isAdviser', '#searchDown6')" />
                            	<s:textfield  id="isAdviser" readonly="true" cssClass="validate[required]"/>
                                <s:hidden id="hiddenisAdviser" name="jobInfo.isAdviser" />
                            </li>
                        </ul>
                    </div>

                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0"><em>*</em>专业类型：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#specializedType', '#searchDown4')" />
                            	<s:textfield id="specializedType" value="请选择专业类型" readonly="true" cssClass="validate[custom[requiredSelected]]"/>
                                <s:hidden id="hiddenSpecializedType" name="jobInfo.specializedType" value="" />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0"><em>*</em>工作地区：</li>
                            <li class="fbzw2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#province', '#searchDown7')" />
                            	<s:textfield id="province" value="省份" readonly="true" cssClass="validate[custom[region]]"/>
                    			<s:hidden id="hiddenProvince" name="jobInfo.provinceCode"  value=""/>
                            </li>
                            <li class="fbzw2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="loadData('citySearch','#searchDown8')" />
                            	<s:textfield id="citySearch" value="城市" readonly="true" cssClass="validate[custom[region]]"/>
                    			<s:hidden id="hiddenCity" name="jobInfo.cityCode" value="" />
                            </li>
                            <li class="fbzw2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="loadData('areaSearch','#searchDown9')" />
                            	<s:textfield id="areaSearch" value="城区" readonly="true"/>
                    			<s:hidden id="hiddenArea" name="jobInfo.areaCode" value=""/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;薪：</li>
                            <li class="fbzw1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#salary', '#searchDown10')" />
                            	<s:textfield id="salary" value="请选择" readonly="true"/>
                    			<s:hidden id="hiddenSalary" name="jobInfo.salary" value=""/>
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
                            	<s:textfield id="age" value="请选择" readonly="true"/>
                    			<s:hidden id="hiddenAge" name="jobInfo.age" value=""/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</li>
                            <li class="fbzw2">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#sex', '#searchDown11')" />
                            	<s:textfield id="sex" readonly="true"/>
                    			<s:hidden id="hiddenSex" name="jobInfo.sex" value="2"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">学历要求：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#education', '#searchDown12')" />
                            	<s:textfield id="education" value="请选择" readonly="true"/>
                    			<s:hidden id="hiddenEducation" name="jobInfo.education" value=""/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0">工作年限：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#workingLife', '#searchDown13')" />
                            	<s:textfield id="workingLife"  value="请选择" readonly="true"/>
                    			<s:hidden id="hiddenWorkingLife" name="jobInfo.workingLife"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">语言能力：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#langCapa', '#searchDown14')" />
                            	<s:textfield id="langCapa"  value="请选择" readonly="true"/>
                    			<s:hidden id="hiddenLangCapa" name="jobInfo.langCapa" value=""/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0">掌握程度：</li>
                            <li class="fbzw1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="loadMastery();" />
                            	<s:textfield id="mastery" value="请选择" readonly="true"/>
                    			<s:hidden id="hiddenMastery" name="jobInfo.mastery" value=""/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">计算机能力：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#computerGrade', '#searchDown16')" />
                            	<s:textfield id="computerGrade" value="请选择" readonly="true"/>
                    			<s:hidden id="hiddenComputerGrade" name="jobInfo.computerGrade" value=""/>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="jobs-middle2">
            	<ul>
                    <li class="jobs5"><em>*</em>岗位职责&nbsp;&nbsp;
                    	<s:textarea id="jobResponsibility" name="jobInfo.jobResponsibility" cssClass="validate[required,length[0,2000]]" />
                    </li>
                    <li class="jobs5"><em>*</em>任职要求&nbsp;&nbsp;
                    	<s:textarea id="jobRequirements" name="jobInfo.jobRequirements" cssClass="validate[required,length[0,2000]]"/>
                    </li>
                </ul>
            </div>
        	</div>
          
            
          <div class="jobs-title jobs-title-bg3"><strong>发布设置</strong></div>

          <div class="jobs-fb">
               <ul>
               	   <li class="jobs7"><em>*</em>发布日期：
               	   		<input  id="jobIssuetDate" name="jobInfo.jobIssuetDate" type="text" size="12" class="validate[required]" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-{%d}',maxDate:'#F{$dp.$D(\'jobExpiryDate\')}'})"/>
               	   	</li>
                   <li class="jobs7"><em>*</em>有效期至：
                   		<input id="jobExpiryDate" name="jobInfo.jobExpiryDate" type="text" size="12" class="validate[required]" readonly="readonly" onclick="chooseExpDate()"/>


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
                            	<s:textfield id="filterIndustryType" value="请选择行业类型" readonly="true"/>
                                <s:hidden id="hiddenFilterIndustryType" name="jobInfo.filterIndustryType"  value="" />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;长：</li>
                            <li class="fbzw5">
                            	<s:textfield maxlength="18"  id="filterMetier" name="jobInfo.filterMetier" />
                            </li>
                        </ul>
                    </div>
					<div class="fbzw-div">
					    <ul>
                            <li class="fbzw0">专业类型：</li>
                            <li class="fbzw1"><img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#filterSpecializedType', '#searchDown18')" />
                                <s:textfield id="filterSpecializedType" value="请选择专业类型" readonly="true"/>
                                <s:hidden id="hiddenFilterSpecializedType" name="jobInfo.filterSpecializedType"   value="" />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0">工作性质：</li>
                            <li class="fbzw1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#filterJobNature', '#searchDown19')" />
                            	<s:textfield  id="filterJobNature" value="请选择" readonly="true"/>
                                <s:hidden id="hiddenFilterJobNature" name="jobInfo.filterJobNature" />
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">工作年限：</li>
                            <li class="fbzw3">大于&nbsp;&nbsp;</li>
                            <li class="fbzw4"><s:textfield id="filtergtWorkingLife" name="jobInfo.filtergtWorkingLife" maxlength="2"/></li>
                            <li class="fbzw3">小于&nbsp;&nbsp;</li>
                            <li class="fbzw4"><s:textfield id="filterltWorkingLife" name="jobInfo.filterltWorkingLife" maxlength="2"/></li>
                        </ul>
                    </div>
                    <div class="fbzw-div2">
                        <ul>
                            <li class="fbzw0">最低学历：</li>
                            <li class="fbzw1">
                            <img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#filterEducation', '#searchDown20')"  />
                            	<s:textfield id="filterEducation" value="请选择" readonly="true"/>
                                <s:hidden id="hiddenFilterEducation" name="jobInfo.filterEducation"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</li>
                            <li class="fbzw2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#filterSex', '#searchDown21')" />
                            	<s:textfield id="filterSex" readonly="true"/>
                    			<s:hidden id="hiddenFilterSex" name="jobInfo.filterSex" value="2"/>
                            </li>
                        </ul>
                    </div>
                    <div class="fbzw-div">
                        <ul>
                            <li class="fbzw0">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</li>
                            <li class="fbzw3">大于&nbsp;&nbsp;</li>
                            <li class="fbzw4"><s:textfield id="filtergtAge" name="jobInfo.filtergtAge"  maxlength="3"/></li>
                            <li class="fbzw3">小于&nbsp;&nbsp;</li>
                            <li class="fbzw4"><s:textfield id="filterltAge" name="jobInfo.filterltAge" maxlength="3"/></li>
                        </ul>
                    </div>
        	</div>

            <div class="head-jobs-botton">
              <a href="javascript:void(0)"><%--发布职位 --%>
	          	<input id="saveAndPublish" type="image" src="<%=request.getContextPath()%>/images/head-jobs-botton2.png" />
	          </a>
	          <a href="javascript:void(0)">
	          	<img id="postPreview" src="<%=request.getContextPath()%>/images/head-jobs-botton1.png" width="109" height="32" />
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
	           		<p class="wenxin1">您发布的招聘信息需要建筑猎头人才网审核通过后，求职者才能搜索到。审核时间间隔一般在2小时左右，节假日除外。如需立即审核，您可致电0755－98898989或联系您的客户服务专员。</p>
	                <p class="wenxin2">为了保障供求双方建筑猎头人才网的权益，请您在发布招聘信息时遵守国家相关法律法规，不得发布虚假招聘信息，不得代其它单位招聘。</p>
	                <p class="wenxin3">招聘单位违反国家法律法规的，建筑猎头人才网有权立即停止您在本网所有服务，且不予退款。</p>
	           </div>
	    	</div>
    </div>
</div>
</s:form>
<!--底部分-->
<jsp:include page="/jsp/common/bottom.jsp"></jsp:include>
<script type="text/javascript">
function checknum(obj)
{
	var regu = "^[0-9]+$";
	var re = new RegExp(regu);
	if (!obj.search(re) != -1) {
        alert("非法数字");
  		obj.value="";
        obj.focus();
        return false;
     }
}  

function isNumber(s){
	var regu = "^[0-9]+$";
	var re = new RegExp(regu);
	if (s.search(re) != -1) {
	return true;
	} else {
	return false;
	}
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

function chooseExpDate(){
	var effDate = $("#jobIssuetDate").val();
	if(effDate == "" || effDate == null){
		WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-{%d}'});	
	}
	else{
		WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'jobIssuetDate\')}'});	
	}
}
function setMastery(){
	$("#mastery").val("请选择");
	$("#hiddenMastery").val("");
}
function loadMastery(){
	var langCapaCode = $("#hiddenLangCapa").val();
	$.getJSON("<%=request.getContextPath()%>/common/loadMastery.action?langCapaCode="+langCapaCode , function(data) {
		var options="";
		for(i=0;i<data.length;i++){
			value = data[i].code;
			text = data[i].name;
			options = options + "<li><a href='javascript:void(0)' id=\""+value+"\""+" onclick=\"setValue(this,'mastery','hiddenMastery');return false;\">"+text+"</a></li>";
		}
		$('#masteryId').html(options);
	});	
	menuClick("#mastery", "#searchDown15");
}
$(function(){
	$("#postPreview").click(function(){
		window.open('<%=request.getContextPath()%>/jsp/headhunterCenter/postPreview.jsp','_blank','width=900,height=600,menubar=no,toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes');
	});

	$("#cancel").click(function(){
		if(confirm("你确认要关闭页面吗？")){
			window.opener=null;
			window.open('','_self');
			window.close();
		}
	});
});

</script>
</body>
</html>
