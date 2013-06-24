<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-个人后台-线下推荐对象修改</title>
	<%String path = request.getContextPath(); %>
	<link href="<%=path%>/css/people.css" rel="stylesheet" type="text/css" />
	<jsp:include page="../common/JsAndCss.jsp"/>
	<script src="<%=path%>/javascripts/common/select.js"></script>
	<script src="<%=path%>/javascripts/common/region.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js"></script>
	<script>
	    function beforeCall(form, options){
	       if($("#submitRecommendationForm").validationEngine('validate')){
	    	   form.submit();
	       }
	       return true;
	    }
	    
	    // Called once the server replies to the aja form validation request
	    function ajaxValidationCallback(status, form, json, options){
	    }
	    $(document).ready(function(){
	        $("#submitRecommendationForm").validationEngine({
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
${failMessage}
<jsp:include page="../common/head.jsp"></jsp:include>
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
<s:form name="submitRecommendationForm" id="submitRecommendationForm" method="post" action="personalCenterAction!saveEditRecommendation.action" theme="simple">
<s:hidden name="recommendationDto.id"></s:hidden>
<input id="submitRecommendationFormFlag" type="hidden" value="0"/>
<div class="jobs-box" align="center">
  <div class="jobs-title"><strong>线下推荐对象修改</strong></div>
    <div class="jobs-select">
         <div class="jobs-select-div">
              <ul>
              		<li class="jobs0"><em>*</em>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;能：</li>
					<li class="jobs7">
						<img src="<%=path%>/images/search-down.png" width="21" height="22" onclick="menuClick('#competency', '#searchDown1')" />
						<s:if test="recommendationVo.function.name==null||recommendationVo.function.name==''">
							<input id="competency" name="competency" type="text" value="请选择目标职能" readonly="readonly" class="validate[custom[requiredSelected]]"/>
						</s:if>
						<s:else>
							<input id="competency" name="competency" type="text" value="<s:property value='recommendationVo.function.name'/>" readonly="readonly" class="validate[custom[requiredSelected]]"/>
						</s:else>
						<s:if test="recommendationVo.function.code==null||recommendationVo.function.code==''">
							<input id="competencyCode" name="recommendationDto.functionCode" type="hidden" value=""/>
						</s:if>
						<s:else>
							<input id="competencyCode" name="recommendationDto.functionCode" type="hidden" value="<s:property value='recommendationVo.function.code'/>"/>
						</s:else>
					</li>
              </ul>
         </div>
         <div class="jobs-select-div">
              <ul>
                  <li class="jobs0"><em>*</em>意向职位：</li>
                  <li class="jobs6">
                  	<input id="expectedPosition" name="recommendationDto.expectedPosition" type="text" size="50" maxlength="50" class="validate[required]" value="<s:property value='recommendationVo.expectedPosition'/>"/>
                  </li>
              </ul>
         </div>
         <div class="jobs-select-div">
              <ul>
                  <li class="jobs0"><em>*</em>意向工作地区：</li>
                  <li class="jobs2">
                  	<img src="<%=path%>/images/search-down.png" width="21" height="22" onclick="menuClick('#province', '#searchDown2')" />
                  	<s:if test="recommendationVo.province.name==null||recommendationVo.province.name==''">
                  		<input id="province" name="" type="text" value="省份" readonly="readonly" class="validate[custom[region]]"/>
                  	</s:if>
                  	<s:else>
                  		<input id="province" name="" type="text" value="<s:property value='recommendationVo.province.name'/>" readonly="readonly" class="validate[custom[region]]"/>
                  	</s:else>
                  	<s:if test="recommendationVo.province.code==null||recommendationVo.province.code==''">
                  		<input id="hiddenProvince" name="recommendationDto.provinceCode" type="hidden" value=""/>
                  	</s:if>
                  	<s:else>
                  		<input id="hiddenProvince" name="recommendationDto.provinceCode" type="hidden" value="<s:property value='recommendationVo.province.code'/>"/>
                  	</s:else>
                  </li>
                  <li class="jobs2">
	                  <img src="<%=path%>/images/search-down.png" width="21" height="22" onclick="loadData('citySearch','#searchDown3')" />
	                  <s:if test="recommendationVo.city.name==null||recommendationVo.city.name==''">
	                  	<input id="citySearch" name="" type="text" value="城市" readonly="readonly" class="validate[custom[region]]"/>
	                  </s:if>
	                  <s:else>
	                  	<input id="citySearch" name="" type="text" value="<s:property value='recommendationVo.city.name'/>" readonly="readonly" class="validate[custom[region]]"/>
	                  </s:else>
	                  <s:if test="recommendationVo.city.code==null||recommendationVo.city.code==''">
	                  	<input id="hiddenCity" name="recommendationDto.cityCode" type="hidden" value=""/>
	                  </s:if>
	                  <s:else>
	                  	<input id="hiddenCity" name="recommendationDto.cityCode" type="hidden" value="<s:property value='recommendationVo.city.code'/>"/>
	                  </s:else>
	                  
                  </li>
                  <li class="jobs2">
	                  <img src="<%=path%>/images/search-down.png" width="21" height="22" onclick="loadData('areaSearch','#searchDown4')" />
	                  <s:if test="recommendationVo.area.name==null||recommendationVo.area.name==''">
	                  	<input id="areaSearch" name="" type="text" value="城区" readonly="readonly"/>
	                  </s:if>
	                  <s:else>
	                  	<input id="areaSearch" name="" type="text" value="<s:property value='recommendationVo.area.name'/>" readonly="readonly"/>
	                  </s:else>
	                  <s:if test="recommendationVo.area.code==null||recommendationVo.area.code==''">
	                  	<input id="hiddenArea" name="recommendationDto.areaCode" type="hidden" value=""/>
	                  </s:if>
	                  <s:else>
	                  	<input id="hiddenArea" name="recommendationDto.areaCode" type="hidden" value="<s:property value='recommendationVo.area.code'/>"/>
	                  </s:else>
                  </li>
              </ul>
         </div>
         <div class="jobs-select-div">
              <ul>
                  <li class="jobs0"><em>*</em>意向月薪：</li>
                  <li class="jobs7">
	                  <img src="<%=path%>/images/search-down.png" width="21" height="22" onclick="menuClick('#salary', '#searchDown6')" />
	                  <s:if test="recommendationVo.expectedSalary.name==null||recommendationVo.expectedSalary.name==''">
	                  	<input id="salary" name="" type="text" value="请选择意向月薪" readonly="readonly" class="validate[custom[requiredSelected]]"/>
	                  </s:if>
	                  <s:else>
	                  	<input id="salary" name="" type="text" value="<s:property value='recommendationVo.expectedSalary.name'/>" readonly="readonly" class="validate[custom[requiredSelected]]"/>
	                  </s:else>
	                  <s:if test="recommendationVo.expectedSalary.code==null||recommendationVo.expectedSalary.code==''">
	                  	<input id="expectedSalaryCode" name="recommendationDto.expectedSalaryCode" type="hidden" value=""/>
	                  </s:if>
	                  <s:else>
	                  	<input id="expectedSalaryCode" name="recommendationDto.expectedSalaryCode" type="hidden" value="<s:property value='recommendationVo.expectedSalary.code'/>"/>
	                  </s:else>
	                  
                  </li>
              </ul>
         </div>
         <div class="jobs-select-div">
              <ul>
                  <li class="jobs0"><em>*</em>工作性质：</li>
                  <li>
	             	<s:radio name="recommendationDto.jobTypeCode" list="jobTypeList" listKey="code" listValue="name">
	             	</s:radio>
	             </li>
              </ul>
         </div>
         <div class="jobs-select-div">
              <ul>
                  <li class="jobs0"><em>*</em>是否顾问：</li>
                  <li>
                  	<s:radio name="recommendationDto.isAdvisor" list="#{'Y':'是','N':'否' }" listKey="key" listValue="value">
            			</s:radio>
            		</li>
              </ul>
         </div>
    </div>
    <div class="jobs-botton">
    	<a href="#" onclick="return submitApplyRecommendation();"><img src="<%=path%>/images/jobs-tj.png" width="83" height="32" alt="提交"/></a>
        <a href="javascript:document.submitRecommendationForm.reset()"><img src="<%=path%>/images/jobs-cz.png" width="83" height="32" alt="重置"/></a>
        <a href="javascript:clickReturn()"><img src="<%=path%>/images/salon-fh.png" width="83" height="32" alt="返回"/></a>
    </div>
    <div class="jobs-wenxin-box">
    	<div class="jobs-wenxin">
        	<div class="jobs-wenxin-left"><img src="<%=path%>/images/wenxin-icon.png" width="132" height="135" /></div>
            <div class="jobs-wenxin-right">
           		<p class="jobs-wenxin1">您发布的招聘信息需要建筑猎头人才网审核通过后，求职者才能搜索到。审核时间间隔一般在2小时左右，节假日除外。如需立即审核，您可致电0755－98898989或联系您你的客户服务专员。</p>
                <p class="jobs-wenxin2">为了保障供求双方建筑猎头人才网的权益，请您在发布招聘信息时遵守国家相关法律法规，不得发布虚假招聘信息，不得代其它单位招聘。</p>
                <p class="jobs-wenxin3">招聘单位违反国家法律法规的，建筑猎头人才网有权立即停止您在本网所有服务，且不予退款。</p>
            </div>
        </div>
    </div>
</div>
</s:form>

<!--底部分-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
<script type="text/javascript">
	function submitApplyRecommendation(){
		$('#submitRecommendationForm').submit();
		return false;
	}
	function clickReturn(){
		window.location.href = "personalCenterAction!viewApplyRecommendation.action";
	}
</script>
</body>
</html>