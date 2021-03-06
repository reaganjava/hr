<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-系统管理-线下人才需求</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
	<%String path = request.getContextPath();%>
	<script src="<%=path%>/javascripts/My97DatePicker/WdatePicker.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js"></script>
	<script>
	    function beforeCall(form, options){
	       if($("#addOfflineSearchResultForm").validationEngine('validate')){
	    	   form.submit();
	       }
	       return true;
	    }

	    // Called once the server replies to the aja form validation request
	    function ajaxValidationCallback(status, form, json, options){
	    }
	    $(document).ready(function(){
	        $("#addOfflineSearchResultForm").validationEngine({
	            ajaxFormValidation: true,
	            onAjaxFormComplete: ajaxValidationCallback,
	            onBeforeAjaxFormValidation: beforeCall,
	            validationEventTriggers:"blur",  //触发的事件  validationEventTriggers:"keyup blur",
	            success:false//为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
	        });
	    });
	</script>
</head>
<body onload="init()">
	<jsp:include page="/jsp/common/top.jsp" />
	<!--以上为头部分-->
	<!--中间部分-->
	<div class="content">
		<jsp:include page="left.jsp" />
		<s:form id="addOfflineSearchResultForm" name="addOfflineSearchResultForm" method="post" action="offlineSearchResultAction!saveEditSearchResult.action">
			<s:hidden name="offlineSearchResultDto.id"></s:hidden>
			<div class="content-right">
				<div class="administrator-title"><strong>线下人才需求</strong></div>
				<div class="inside-tab">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="18%" height="40" align="right">
								<strong>行业类型</strong>：
							</td>
							<td width="22%" align="left">
								<s:select disabled="true"  name="peopleExcavateVo.industryType" list="industrysList" listKey="code" listValue="name" headerKey="" headerValue="请选择行业类型" cssClass="validate[required]"></s:select>
							</td>
							<td width="9%">&nbsp;</td>
							<td width="12%" align="right">
								<strong>专业类型</strong>：
							</td>
							<td width="39%" align="left">
								<s:select disabled="true" name="peopleExcavateVo.specializedType" list="specializedTypeList" listKey="code" listValue="name" headerKey="" headerValue="请选择专业类型" cssClass="validate[required]"></s:select>
							</td>
						</tr>
						<tr>
							<td height="40" align="right"><strong>职能名称</strong>：</td>
							<td align="left">
								<s:select disabled="true" name="peopleExcavateVo.competency" list="competencyList" listKey="code" listValue="name" headerKey="" headerValue="请选择职能" cssClass="validate[required]"></s:select>
							</td>
							<td>&nbsp;</td>
							<td align="right"><strong>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历</strong>：</td>
							<td align="left">
								<s:select disabled="true" name="peopleExcavateVo.education" list="educationList" listKey="code" listValue="name" headerKey="" headerValue="请选择学历"></s:select>
							</td>
						</tr>
						<tr>
							<td height="40" align="right"><strong>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;长</strong>：</td>
							<td align="left" class="tab-input">
								<s:textfield disabled="true" id="metier" name="peopleExcavateVo.metier" maxlength="30"></s:textfield>
							</td>
							<td>&nbsp;</td>
							<td align="right"><strong>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区</strong>：</td>
							<td align="left">
								<s:select disabled="true" name="peopleExcavateVo.provinceCode" id="province" list="provinceList" listKey="code" listValue="name" headerKey="" headerValue="省份" cssStyle="width:80px;" cssClass="validate[required]"></s:select>&nbsp;
								<s:select disabled="true" name="peopleExcavateVo.cityCode" id="city" list="cityList" listKey="code" listValue="name" headerKey="" headerValue="城市" cssStyle="width:80px;" cssClass="validate[required]"></s:select>&nbsp;
								<s:select disabled="true" name="peopleExcavateVo.areaCode" id="area" list="areaList" listKey="code" listValue="name" headerKey="" headerValue="城区" cssStyle="width:80px;" cssClass="validate[required]"></s:select>
							</td>
						</tr>
						<tr>
							<td height="40" align="right"><strong>工作年限</strong>：</td>
							<td align="left">
								<s:select disabled="true" name="peopleExcavateVo.workingLife" list="workingLifeList" listKey="code" listValue="name" headerKey="" headerValue="请选择工作年限"></s:select>
							</td>
							<td>&nbsp;</td>
							<td align="right"><strong>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄</strong>：</td>
							<td align="left" class="tab-input">
								<s:select disabled="true" id="age" name="peopleExcavateVo.age" list="ageList" listKey="code" listValue="name" headerKey="" headerValue="请选择"></s:select>
							</td>
						</tr>
						<tr>
							<td height="40" align="right"><strong>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</strong>：</td>
							<td align="left">
								<s:select disabled="true" name="peopleExcavateVo.sex" list="#{'':'不限','0':'女','1':'男'}"></s:select>
							</td>
							<td>&nbsp;</td>
							<td align="right"><strong>语言能力</strong>：</td>
							<td align="left">
								<s:select disabled="true" name="peopleExcavateVo.langCapa" list="langCapaList" listKey="code" listValue="name" headerKey="" headerValue="请选择语言能力"></s:select>
							</td>
						</tr>
						<tr>
							<td height="40" align="right"><strong>计算机能力</strong>：</td>
							<td align="left">
								<s:select disabled="true" name="peopleExcavateVo.computerGrade" list="computerGradeList" listKey="code" listValue="name" headerKey="" headerValue="请选择计算机能力"></s:select>
							</td>
							<td>&nbsp;</td>
							<td height="40" align="right"><strong>掌握程度</strong>：</td>
							<td align="left">
								<s:select disabled="true" name="peopleExcavateVo.mastery" list="masteryList" listKey="code" listValue="name" headerKey="" headerValue="掌握程度"></s:select>
							</td>
						</tr>
						<tr>
							<td height="40" align="right"><strong>顾&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;问</strong>：</td>
							<td align="left">
								<s:select disabled="true" name="peopleExcavateVo.isAdviser" list="#{'':'请选择','0':'否','1':'是'}"></s:select>
							</td>
							<td>&nbsp;</td>
							<td align="right"><strong>工作性质</strong>：</td>
							<td align="left">
								<s:select disabled="true" name="peopleExcavateVo.jobNature" list="jobNatureList" listKey="code" listValue="name" headerKey="" headerValue="工作性质"></s:select>
							</td>
						</tr>
						<tr>
							<td height="40" align="right"><strong>更新日期</strong>：</td>
							<td align="left">
								<s:select disabled="true" name="updateDate" list="#{'0':'请选择','3':'三天内','7':'一周内','14':'二周内','30':'一月内','60':'二月内','90':'三月内','180':'半年内'}"></s:select>
							</td>
							<td>&nbsp;</td>
							<td height="40" align="right"><strong>星级指数</strong>：</td>
							<td align="left">
								<s:select disabled="true" name="peopleExcavateVo.categoryIndex" list="#{'':'不限','1':'1星','2':'2星','3':'3星','4':'4星','5':'5星'}"></s:select>
							</td>
						</tr>
						<tr>
							<td height="40" align="right"><strong>职位关键字</strong>：</td>
							<td align="left" class="tab-input">
								<s:textfield disabled="true" name="peopleExcavateVo.jobKeyWord" maxlength="30"></s:textfield>
							</td>
							<td>&nbsp;</td>
							<td height="40" align="right"><strong>招聘人数</strong>：</td>
							<td align="left" class="tab-input">
								<s:if test="peopleExcavateVo.recruitingNumber==0">
									<input disabled="disabled" id="recruitingNumber" name="peopleExcavateVo.recruitingNumber" maxlength="5" type="text" value=""/>
								</s:if>
								<s:else>
									<s:textfield disabled="true" id="recruitingNumber" name="peopleExcavateVo.recruitingNumber" maxlength="5" cssClass="validate[custom[positiveInteger]]"></s:textfield>
								</s:else>
							</td>
						</tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="13%" align="right"><strong>有效期</strong>：</td>
							<td width="50%" align="left" class="tab-input">
							<input disabled="true" style="background:#fff url(<%=path %>/javascripts/My97DatePicker/skin/jobs-date2.png) right center no-repeat;" class='validate[required]' id="effDate" name="peopleExcavateVo.jobIssuetDate" type="text" value="<s:date name='peopleExcavateVo.jobIssuetDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'expDate\')}'})"/>&nbsp;&nbsp;至&nbsp;&nbsp;
							<input disabled="true" style="background:#fff url(<%=path %>/javascripts/My97DatePicker/skin/jobs-date2.png) right center no-repeat;" class='validate[required]' id="expDate" name="peopleExcavateVo.jobExpiryDate" type="text" value="<s:date name='peopleExcavateVo.jobExpiryDate' format='yyyy-MM-dd'/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'effDate\')}'})"/>
							</td>
							<td width="16%" height="70" align="right"></td>
							<td width="21%" align="left">
							</td>
						</tr>
						<tr>
							<td height="130" align="right"><strong>岗位职责</strong>：</td>
							<td colspan="4" align="left" class="tab-input">
								<s:textarea disabled="true" id="jobResponsibility" name="peopleExcavateVo.jobResponsibility" cssClass="validate[length[0,200]]"></s:textarea>
							</td>
						</tr>
						<tr>
							<td height="130" align="right"><strong>任职要求</strong>：</td>
							<td colspan="4" align="left" class="tab-input">
								<s:textarea disabled="true" id="jobRequirements" name="peopleExcavateVo.jobRequirements" cssClass="validate[length[0,200]]"></s:textarea>
							</td>
						</tr>
					</table>
				</div>
				<div class="system-botton3">
					<ul>
						<s:if test='#request.readOnly!="Y"'>
							<li class="botton1"><a href="javascript:submitWithValidate()" title="提交">提交</a></li>
						</s:if>
						<li class="botton1"><a href="javascript:goBack()" title="返回">返回</a></li>
					</ul>
				</div>
			</div>
		</s:form>
	</div>
	<script type="text/javascript">
		function submitWithValidate(){
			$("#addOfflineSearchResultForm").submit();
		}
		function init(){
			$("#position_offlineSearchResult").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
		}
	</script>
</body>
</html>

