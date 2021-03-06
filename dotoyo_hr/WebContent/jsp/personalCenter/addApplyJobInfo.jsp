<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-我要求职</title>
	<%String path = request.getContextPath(); %>
	<jsp:include page="../common/JsAndCss.jsp"/>
	<link href="<%=path%>/css/people.css" rel="stylesheet" type="text/css" />
	<script src="<%=path%>/javascripts/common/select.js"></script>
	<script src="<%=path%>/javascripts/common/region.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js"></script>
	<script>
	    function beforeCall(form, options){
	       if($("#submitJobInfo").validationEngine('validate')){
	    	   form.submit();
	       }
	       return true;
	    }
	    
	    // Called once the server replies to the aja form validation request
	    function ajaxValidationCallback(status, form, json, options){
	    }
	    $(document).ready(function(){
	        $("#submitJobInfo").validationEngine({
	            ajaxFormValidation: true,
	            onAjaxFormComplete: ajaxValidationCallback,
	            onBeforeAjaxFormValidation: beforeCall,
	            validationEventTriggers:"blur",  //触发的事件  validationEventTriggers:"keyup blur",  
	              
	            success:false//为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false   
	        });
	    });
	</script>
</head>

<body>
	<jsp:include page="../common/head.jsp"/>
	<s:include value="/jsp/applyJobCenter/applyJobCenterNav.jsp"/>
	<!--以上为头部分-->
	<!--banner-->
	
	<!--搜索下拉菜单~绝对定位~-->
	<div class="jobs-down" id="showMenuID">
		<div class="jobs-down5" id="searchDown1" style="display:none;">
			<ul>
				<s:iterator value="functionList">
					<li style="width:200px;float:left" class="index_hid_css" title="<s:property value='name'/>">
						<a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'competency','competencyCode')"><s:property value="name"/></a>
					</li>
				</s:iterator>
			</ul>
		</div>
		<div class="jobs-down2" id="searchDown2" style="display:none;">
			<ul>
				<s:iterator id="provinceList" value="provinceList">
					<li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'province','hiddenProvince');setCity('citySearch','hiddenCity')"><s:property value="name"/></a></li>
				</s:iterator>
			</ul>
		</div>
		<div class="jobs-down3" id="searchDown3" style="display:none;">
			<ul id="cityId">
			</ul>
		</div>
		<div class="jobs-down4" id="searchDown4" style="display:none;">
			<ul id="areaId">
			</ul>
		</div>
		<div class="jobs-down1" id="searchDown6" style="display:none;">
			<ul>
				<s:iterator id="salaryList" value="salaryList">
					<li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'salary','expectedSalaryCode')"><s:property value="name"/></a></li>
				</s:iterator>
			</ul>
		</div>
	</div>
	<!--中间部分-->
	<s:form name="submitJobInfo" id="submitJobInfo" method="post" action="personalCenterAction!saveApplyJobInfo.action" theme="simple">
		<input id="submitJobInfoFlag" type="hidden" value="0"/>
		<div class="jobs-box" align="center">
			<div class="jobs-title"><strong>发布求职信息</strong></div>
			<div class="jobs-select">
				<div class="jobs-select-div">
					<ul>
						<li class="jobs0"><em>*</em>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;能：</li>
						<li class="jobs7">
							<img src="<%=path%>/images/search-down.png" width="21" height="22" onclick="menuClick('#competency', '#searchDown1')" />
							<input id="competency" name="competency" type="text" value="请选择目标职能" readonly="readonly" class="validate[custom[requiredSelected]]"/>
							<input id="competencyCode" name="applyJobInfoDto.functionCode" type="hidden" value=""/>
						</li>
					</ul>
				</div>
		         <div class="jobs-select-div">
		              <ul>
		                  <li class="jobs0"><em>*</em>意向职位：</li>
		                  <li class="jobs6">
		                  <input id="expectedPosition" name="applyJobInfoDto.expectedPosition" type="text" size="50" maxlength="50" class="validate[required]"/>
		                  </li>
		              </ul>
		         </div>
		         <div class="jobs-select-div">
		              <ul>
		                  <li class="jobs0"><em>*</em>意向工作地区：</li>
		                  <li class="jobs2">
		                  	<img src="<%=path%>/images/search-down.png" width="21" height="22" onclick="menuClick('#province', '#searchDown2')" />
		                  	<input id="province" name="" type="text" value="省份" readonly="readonly" class="validate[custom[region]]"/>
		                  	<input id="hiddenProvince" name="applyJobInfoDto.provinceCode" type="hidden" value=""/>
		                  </li>
		                  <li class="jobs2">
			                  <img src="<%=path%>/images/search-down.png" width="21" height="22" onclick="loadData('citySearch','#searchDown3')" />
			                  <input id="citySearch" name="" type="text" value="城市" readonly="readonly" class="validate[custom[region]]"/>
			                  <input id="hiddenCity" name="applyJobInfoDto.cityCode" type="hidden" value=""/>
		                  </li>
		                  <li class="jobs2">
			                  <img src="<%=path%>/images/search-down.png" width="21" height="22" onclick="loadData('areaSearch','#searchDown4')" />
			                  <input id="areaSearch" name="" type="text" value="城区" readonly="readonly"/>
			                  <input id="hiddenArea" name="applyJobInfoDto.areaCode" type="hidden" value=""/>
		                  </li>
		              </ul>
		         </div>
		         <div class="jobs-select-div">
		              <ul>
		                  <li class="jobs0"><em>*</em>意向月薪：</li>
		                  <li class="jobs7">
			                  <img src="<%=path%>/images/search-down.png" width="21" height="22" onclick="menuClick('#salary', '#searchDown6')" />
			                  <input id="salary" name="" type="text" value="请选择意向月薪" readonly="readonly" class="validate[custom[requiredSelected]]"/>
			                  <input id="expectedSalaryCode" name="applyJobInfoDto.expectedSalaryCode" type="hidden" value=""/>
		                  </li>
		              </ul>
		         </div>
		         <div class="jobs-select-div">
		              <ul>
		                  <li class="jobs0"><em>*</em>工作性质：</li>
		                  <s:iterator id="jobTypeList" value="jobTypeList" status="index">
		                  	<li><input <s:if test="#index.index==0">checked="checked"</s:if> id="<s:property value="code"/>" name="applyJobInfoDto.jobTypeCode" type="radio" value="<s:property value="code"/>" class="validate[required]"/>&nbsp;&nbsp;<label for="<s:property value="code"/>"><s:property value="name"/>&nbsp;&nbsp;&nbsp;</label></li>
		                  </s:iterator>
		              </ul>
		         </div>
		         <div class="jobs-select-div">
		              <ul>
		                  <li class="jobs0"><em>*</em>是否顾问：</li>
		                  <li><input checked="checked" id="isAdvisor_Y" name="applyJobInfoDto.isAdvisor" type="radio" value="Y" class="validate[required]"/>&nbsp;&nbsp;<label for="isAdvisor_Y">是</label></li>
		                  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="isAdvisor_N" name="applyJobInfoDto.isAdvisor" type="radio" value="N" class="validate[required]"/>&nbsp;&nbsp;<label for="isAdvisor_N">否</label></li>
		              </ul>
		         </div>
		         <div class="jobs-select-div">
		              <ul>
		                  <li class="jobs0">&nbsp;</li>
		                  <s:if test='#request.readOnly=="Y"'>
		                  	<li><input id="isApplyRecommendation" name="isApplyRecommendation" type="checkbox" value="Y" disabled="disabled"/>&nbsp;&nbsp;<label for="isApplyRecommendation">同时成为线下推荐对象</label></li>
		                  </s:if>
		                  <s:else>
		                  	<li><input id="isApplyRecommendation" name="isApplyRecommendation" type="checkbox" value="Y" />&nbsp;&nbsp;<label for="isApplyRecommendation">同时成为线下推荐对象</label></li>
		                  </s:else>
		              </ul>
		         </div>
		    </div>
		    <div class="jobs-botton">
		    	<a href="javascript:void(0)" onclick="return submitApplyJobInfo();"><img src="<%=path%>/images/jobs-tj.png" width="83" height="32" alt="提交"/></a>
		        <a href="javascript:resetApplyJobInfo()"><img src="<%=path%>/images/jobs-cz.png" width="83" height="32" alt="重置" /></a>
		        <a href="javascript:window.location.href='personalCenterAction!viewApplyJobIntentionList.action'"><img src="<%=path%>/images/salon-fh.png" width="83" height="32" alt="返回"/></a>
		    </div>
		    <div class="jobs-wenxin-box">
		    	<div class="jobs-wenxin">
		        	<div class="jobs-wenxin-left"><img src="<%=path%>/images/wenxin-icon.png" width="132" height="135" /></div>
		            <div class="jobs-wenxin-right">
		           		<p class="jobs-wenxin1">您发布的招聘信息需要建筑猎头人才网审核通过后，求职者才能搜索到。审核时间间隔一般在2小时左右，节假日除外。如需立即审核，您可致电0755-33396388或联系您的客户服务专员。</p>
		                <p class="jobs-wenxin2">为了保障供求双方建筑猎头人才网的权益，请您在发布招聘信息时遵守国家相关法律法规，不得发布虚假招聘信息，不得代其它单位招聘。</p>
		                <p class="jobs-wenxin3">招聘单位违反国家法律法规的，建筑猎头人才网有权立即停止您在本网所有服务，且不予退款。</p>
		            </div>
		        </div>
		    </div>
		</div>
	</s:form>
	<!--底部分-->
	<s:hidden id="actionMessage" name="actionMessage"></s:hidden>
	<jsp:include page="../common/bottom.jsp"/>
	<script type="text/javascript">
	$(document).ready(function(){
		var actionMessage = $("#actionMessage").val();
		if(actionMessage != ""){
			alert(actionMessage);
		}
	});
	var form = document.getElementById("submitJobInfo");
	function submitApplyJobInfo(){
		$("#submitJobInfo").submit();
		return false;
	}
	function resetApplyJobInfo(){
		form.reset();
	}
	function closeApplyJobWindow(){
		window.close();
	}
	</script>
</body>
</html>