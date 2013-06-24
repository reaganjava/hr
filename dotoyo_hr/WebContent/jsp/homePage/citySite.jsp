<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>${jobSearchVo.cityName}建筑师、建造师、监理师职位、人才信息-大太阳建筑猎头网</title>
	<meta content="${jobSearchVo.cityName}建筑师、${jobSearchVo.cityName}建造师、${jobSearchVo.cityName}监理师招聘、猎头、求职、人才信息 -大太阳建筑猎头网。" name="description">  
	<link href="../css/other.css" rel="stylesheet" type="text/css" />
	<jsp:include page="/jsp/common/JsAndCss.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/jsp/common/head.jsp"></jsp:include>
	<s:include value="/jsp/headhunterCenter/headhunterCenterNav.jsp"/>
<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
<!--搜索-->
<div class="head-ss">
	<s:form action="/search_main/" method="post" id="sJobForm" name="sJobForm" namespace="/headhunterCenter">
    	<div class="ss-left">
        	<div class="ss-zhiwei">
            	<ul>
                	<li class="ss0">行业：</li>
                	<li class="ss1">
	                	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#industrys', '#searchDown1')" />
	               	    <s:textfield id="industrys" name="jobSearchVo.industryName" value="选择行业类别" readonly="true"/>
	               	    <s:hidden id="hiddenIndustrys" name="jobSearchVo.industryType" />
	               	</li>
                    <li class="ss0">地区：</li>
                    <li class="ss2">
                    	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#province', '#searchDown2')" />
                    	<s:textfield id="province" name="jobSearchVo.provinceName" readonly="true"/>
                    	<s:hidden id="hiddenProvince" name="jobSearchVo.provinceCode" />
                    </li>
                    <li class="ss2">
                    	<img id="cityImage" src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="loadData('citySearch','#searchDown3')" />
                    	<s:textfield id="citySearch" name="jobSearchVo.cityName" readonly="true"/>
                    	<s:hidden id="hiddenCity" name="jobSearchVo.cityCode"/>
                    </li>
                    <li class="ss2">
                    	<img id="areaImage" src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="loadData('areaSearch','#searchDown4')" />
                    	<s:textfield id="areaSearch" name="jobSearchVo.areaName" value="城区" readonly="true"/>
                    	<s:hidden id="hiddenArea" name="jobSearchVo.areaCode"/>
                    </li>
                    <li class="ss0">职能：</li>
                	<li class="ss1">
	               		<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#competency', '#searchDown5')" />
               	    	<s:textfield id="competency" name="jobSearchVo.competencyName" value="选择职能类型" readonly="true"/>
	               	    <s:hidden id="hiddenCompetency" name="jobSearchVo.competency"/>
               	    </li>
                    <li class="ss3">
                    	<s:textfield id="keyword" name="jobSearchVo.keyWord" value="请输入关键字..." onfocus="keyWordsOnFocus(this)" onblur="keyWordsOnBlur(this)"/>
                    </li>
                </ul>
            </div>

            <div class="ss-botton">
            	<s:hidden name="jobSearchVo.advancedSearch" value="" id="aSearch"/>
           		<s:hidden id="searchType" name="jobSearchVo.searchType"/>
           		<input id="position" type="image" src="<%=request.getContextPath()%>/images/head-search.png"/>&nbsp;&nbsp;&nbsp;&nbsp;
               	<input id="company" type="image" src="<%=request.getContextPath()%>/images/head-search2.png"/>
               	<input id="aS" type="image" src="<%=request.getContextPath()%>/images/head-search3.png"/>
            </div>
      </div>
    </s:form>

    <div class="ss-right">
    	<a href="<%=request.getContextPath()%>/headhunterCenter/headhunterCenterAction!publishedPosts.action" target="_blank">
    		<img src="<%=request.getContextPath()%>/images/head-search4.png" width="91" height="28" alt="发布职位"/>
    	</a>
    </div>
</div>
<!--搜索下拉菜单~绝对定位~-->
<div class="head-down" id="showMenuID">
    <div class="head-down1" id="searchDown1" onmouseleave="menuHide(this)" style="display:none;" >
        <ul>
        	<s:iterator value="industrysList">
        	    <s:if test='parentCode=="001"'>
    	    		<li class="specializedDiv" style="width:700px;"><label><strong><s:property value="name"/></strong></label></li>
    	    	</s:if>
    	    	<s:else>
    	    		<li style="width:100px;float:left" class="index_hid_css" title="<s:property value='name'/>">
    	    			<a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'industrys','hiddenIndustrys');return false;"><s:property value="name"/></a>
    	    		</li>
    	    	</s:else>
            </s:iterator>
        </ul>
    </div>
    <div class="head-down2" id="searchDown2" onmouseleave="menuHide(this)" style="display:none;">
    	<ul>
    		<s:iterator id="provinceList" value="provinceList">
                <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'province','hiddenProvince');setCity('citySearch','hiddenCity')"><s:property value="name"/></a></li>
            </s:iterator>
        </ul>
    </div>
    <div class="head-down3" id="searchDown3" onmouseleave="menuHide(this)" style="display:none;">
    	<ul id="cityId">
        </ul>
    </div>
    <div class="head-down4" id="searchDown4" onmouseleave="menuHide(this)" style="display:none;">
    	<ul id="areaId">
        </ul>
    </div>
    <div class="head-down5" id="searchDown5" onmouseleave="menuHide(this)" style="display:none;">
    	<ul>
    		<s:iterator value="competencyList">
           		<li style="width:200px;float:left" class="index_hid_css" title="<s:property value='name'/>">
           			<a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'competency','hiddenCompetency')"><s:property value="name"/></a>
           		</li>
        	</s:iterator>
        </ul>
    </div>
</div>
<!--中间部分-->
<div class="head-mid">
	<div class="head-left">
    	<div class="head-city">
			<s:iterator value="citySiteList">
				<s:if test='pic!=""&&pic!=null'>
        			<a href="/search/city_<s:property value="cityCode"/>-cityname_<s:property value="cityName"/>" > 
                    	<img src="<s:property value="citySiteImagePath"/>/<s:property value="pic"/>" width="104" height="85" alt="<s:property value="cityName"/>"/>
                    </a>
        		</s:if>
			</s:iterator>
        </div>

        <div class="hyfl">
        	<div class="hyfl-title"><strong>职能分类</strong></div>
            <div class="znfl">
            	<ul>
            		<s:iterator value="hotCompetencyList">
                    	<li><a href="/search/competency_<s:property value="code"/>-cityCode_<s:property value="jobSearchVo.cityCode"/>">
                     <s:property value="name"/></a></li>
                    </s:iterator>
                </ul>
            </div>
         </div>
           <div class="hyf2">
        	<div class="city-title"><span>热门城市职位</span></div>
            <div class="znfl">
            	<ul>
	            	<s:iterator value="citySiteHotJobList">
	                    <li><a href="<s:url action="homePageAction!loadCitySiteHotJobs.action" namespace="/homePage">
                    	<s:param name="jobSearchVo.id"><s:property value="id"/></s:param>
	                    <s:param name="jobSearchVo.cityCode"><s:property value="jobSearchVo.cityCode"/></s:param>
	                    <s:param name="jobSearchVo.cityName"><s:property value="jobSearchVo.cityName"/></s:param>
                    </s:url>"><s:property value="jobName" /></a></li>
	                </s:iterator>
                </ul>
            </div>

            <div class="city-title city-title2"><span>热门城市企业</span></div>
            <div class="qiye-hot">
            	<ul>
            		<s:iterator value="citySiteHotEnterpriseList">
                    	<li><a href="<s:property value="url" />"><s:property value="title"/></a></li>
                    </s:iterator>
                </ul>
            </div>
        </div>
    </div>
    <div class="head-right">
    	<div class="head-about"><a href="#"><img src="<%=request.getContextPath()%>/pic/head-about.png" width="340" height="220" alt="猎头中心介绍频道"/></a></div>
        <div class="tjqy">
        	<div class="tjqy-title"><strong>推荐企业</strong></div>
            <div class="tjqy-bottom">
            	<ul class="tjqy-pic">
            		<s:iterator value="imageAdList">
            			<li>
            				<script>callAdvert("155","60","<s:property value="fileServerURL"/>/<s:property value="imgName" />","<s:property value="url" />","<s:property value="title" />","<%=request.getContextPath()%>/images/test.gif");</script>
            			</li>
                    </s:iterator>
                </ul>
                <ul class="tjqy-font">
            		<s:iterator value="textAdList">
            			<li><a href="<s:property value="url" />"><s:property value="title" /></a></li>
                    </s:iterator>
                </ul>
            </div>
        </div>

    </div>
</div>
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>"/>
<!--底部分-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
<script type="text/javascript">
$(function(){
	$("#position").click(function(){
		$("#searchType").val("0");
	});

	$("#company").click(function(){
		$("#searchType").val("1");
	});

	$("#aS").click(function(){
		$("#aSearch").val("1");
	});
});
function showRequest(formData, jqForm, options) {
	if(checkStatus('jobCheckBoxed')==false) {
 		alert('请至少选中一个职位');
 		return false;
 	}
    return true;
}
function keyWordsOnFocus(obj){
	var text = obj.value;
	if(text=="请输入关键字..."){
			obj.value = "";
	}
}
function keyWordsOnBlur(obj){
	var text = obj.value;
	if(text==""){
		obj.value = "请输入关键字...";
	}
}
</script>
</body>
</html>
