<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理--公司屏蔽设置</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
</head>
<body onload="init()">
	<jsp:include page="/jsp/common/top.jsp" />
	<!--以上为头部分-->
	<!--中间部分-->
	<div class="content">
		<jsp:include page="left.jsp" />
		<div class="content-right">
			<s:form id="form" name="form" method="post" action="filterCompanyAction!updateFilterCompany.action">
				<s:hidden name="filterCompanyDto.id"></s:hidden>
				<div class="administrator-title"><strong>公司屏蔽设置</strong></div>
				<div class="inside-tab">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="inside-tab">
						<tr>
							<td width="41%" height="40" align="right">第一家公司：</td>
							<td width="59%" align="left" class="tab-input">
								<s:textfield id="company1" name="filterCompanyDto.companyName1" size="30" maxlength="100"/>
							</td>
						</tr>
						<tr>
							<td width="41%" height="40" align="right">第二家公司：</td>
							<td width="59%" align="left" class="tab-input">
								<s:textfield id="company2" name="filterCompanyDto.companyName2" size="30" maxlength="100"/>
							</td>
						</tr>
						<tr>
							<td width="41%" height="40" align="right">第三家公司：</td>
							<td width="59%" align="left" class="tab-input">
								<s:textfield id="company3" name="filterCompanyDto.companyName3" size="30" maxlength="100"/>
							</td>
						</tr>
						<tr>
							<td width="41%" height="40" align="right">第四家公司：</td>
							<td width="59%" align="left" class="tab-input">
								<s:textfield id="company4" name="filterCompanyDto.companyName4" size="30" maxlength="100"/>
							</td>
						</tr>
						<tr>
							<td width="41%" height="40" align="right">第五家公司：</td>
							<td width="59%" align="left" class="tab-input">
								<s:textfield id="company5" name="filterCompanyDto.companyName5" size="30" maxlength="100"/>
							</td>
						</tr>
					</table>
				</div>
				<div class="shanchu" onclick="saveFilterCompany();">
					保存
				</div>
				<s:hidden id="actionMessage" name="actionMessage"></s:hidden>
			</s:form>
		</div>
	</div>
	<script type="text/javascript">
	function checkDuplicatedFilterCompany(){
		var company1 = $("#company1").val();
		var company2 = $("#company2").val();
		var company3 = $("#company3").val();
		var company4 = $("#company4").val();
		var company5 = $("#company5").val();
		if(company1 == company2 && company2 != ""){
			return true;
		}
		if(company1 == company3 && company3 != ""){
			return true;
		}
		if(company1 == company4 && company4 != ""){
			return true;
		}
		if(company1 == company5 && company5 != ""){
			return true;
		}
		if(company2 == company3 && company3 != ""){
			return true;
		}
		if(company2 == company4 && company4 != ""){
			return true;
		}
		if(company2 == company5 && company5 != ""){
			return true;
		}
		if(company3 == company4 && company4 != ""){
			return true;
		}
		if(company3 == company5 && company5 != ""){
			return true;
		}
		if(company4 == company5 && company5 != ""){
			return true;
		}
		return false;
	}
	function saveFilterCompany(){
		if(checkDuplicatedFilterCompany()){
			if(window.confirm("检测到重复公司名称，是否继续保存?")){
				$("#form").submit();
			}
		}
		else{
			$("#form").submit();
		}
	}
	function init(){
		$("#position_zhaoping_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
		$("#position_filterCompany").addClass("active");
		showActionMessage();
	}
	function showActionMessage(){
		var actionMessage = $("#actionMessage").val();
		if(actionMessage != ""){
			alert(actionMessage);
		}
	}
	</script>
	
</body>
</html>