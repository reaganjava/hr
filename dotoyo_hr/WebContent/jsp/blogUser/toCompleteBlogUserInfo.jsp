<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>完善博站资料</title>
<script src="<%=request.getContextPath()%>/javascripts/common/jquery.js"></script>
</head>
<body>
<br />
<br />
<br />
<br />
<s:form method="post" action="blogUserAction!saveUpdateBlogUserInfo.action">
<table align="center">
<tr>
	<td align="right">公司名称（真实姓名）：</td>
	<td><s:textfield name="blogUserInfoDto.companyName" maxlength="40"></s:textfield></td>
</tr>
<tr>
	<td align="right">意向职位：</td>
	<td><s:textfield name="blogUserInfoDto.expectedPosition" maxlength="40"></s:textfield></td>
</tr>
<tr>
	<td align="right">专长：</td>
	<td><s:textfield name="blogUserInfoDto.metier" maxlength="40"></s:textfield></td>
</tr>
<tr>
	<td align="right">年龄：</td>
	<td><s:textfield name="blogUserInfoDto.age" maxlength="40"></s:textfield></td>
</tr>
<tr>
	<td align="right">性别：</td>
	<td><s:select name="blogUserInfoDto.sex" list="#{'0':'女','1':'男'}">
</s:select></td>
</tr>
<tr>
	<td align="right">是否顾问：</td>
	<td><s:select name="blogUserInfoDto.isAdviser" list="#{'0':'否','1':'是'}">
</s:select></td>
</tr>
<tr>
	<td align="right">用户类型：</td>
	<td><s:select name="blogUserInfoDto.userType" list="#{'0':'个人用户','1':'企业用户'}">
</s:select></td>
</tr>
<tr>
	<td align="right">行业类型：</td>
	<td><s:select name="blogUserInfoDto.industryType" list="industrysList" listKey="code" listValue="name">
</s:select></td>
</tr>
<tr>
	<td align="right">专业类型：</td>
	<td><s:select name="blogUserInfoDto.specializedType" list="specializedTypeList" listKey="code" listValue="name">
</s:select></td>
</tr>
<tr>
	<td align="right">省份：</td>
	<td><s:select id="province" name="blogUserInfoDto.provinceCode" list="provinceList" listKey="code" 
		listValue="name" headerKey="" headerValue="省份" style="width:100px;">
</s:select></td>
</tr>
<tr>
	<td align="right">城市：</td>
	<td><s:select id="city" name="blogUserInfoDto.cityCode" list="cityList" listKey="code" 
		listValue="name" headerKey="" headerValue="城市" style="width:100px;">
</s:select></td>
</tr>
<tr>
	<td align="right">城区：</td>
	<td><s:select id="area" name="blogUserInfoDto.areaCode" list="areaList" listKey="code" 
		listValue="name" headerKey="" headerValue="城区" style="width:100px;">
</s:select></td>
</tr>
<tr>
	<td align="right">职能：</td>
	<td><s:select name="blogUserInfoDto.competency" list="competencyList" listKey="code" listValue="name">
</s:select></td>
</tr>
<tr>
	<td align="right">学历：</td>
	<td><s:select name="blogUserInfoDto.education" list="educationList" listKey="code" listValue="name">
</s:select></td>
</tr>
<tr>
	<td align="right">工作性质：</td>
	<td><s:select name="blogUserInfoDto.jobNature" list="jobNatureList" listKey="code" listValue="name">
</s:select></td>
</tr>
<tr>
	<td align="right">语言能力：</td>
	<td><s:select name="blogUserInfoDto.langCapa" list="langCapaList" listKey="code" listValue="name">
</s:select></td>
</tr>
<tr>
	<td align="right">掌握程度：</td>
	<td><s:select name="blogUserInfoDto.mastery" list="masteryList" listKey="code" listValue="name">
</s:select></td>
</tr>
<tr>
	<td align="right">计算机等级：</td>
	<td><s:select name="blogUserInfoDto.computerGrade" list="computerGradeList" listKey="code" listValue="name">
</s:select></td>
</tr>
<tr>
	<td align="right">星级指数：</td>
	<td>
		<s:select name="blogUserInfoDto.categoryIndex" list="#{'1':'1星','2':'2星','3':'3星','4':'4星','5':'5星'}">
		</s:select>
	</td>
</tr>
<tr>
	<td align="right">工作年限：</td>
	<td>
		<s:textfield name="blogUserInfoDto.workingLife"></s:textfield>	
	</td>
</tr>

</table>
<p align="center"><input type="submit" value="保存"/></p>
</s:form>
<script type="text/javascript">
$(document).ready(function(){
	$("#province").change(function(){
		var provinceCode = $("#province option:selected").val();
		var url = "<%=request.getContextPath()%>/common/loadCity.action?provinceCode="+provinceCode;
		$.getJSON(url,loadCity);
	});
	$("#city").change(function(){
		var cityCode = $("#city option:selected").val();
		var url = "<%=request.getContextPath()%>/common/loadArea.action?cityCode="+cityCode;
		$.getJSON(url,loadArea);
	});
	loadCity=function(data){
		var options = "<option value=\"\">城市</option>";
		var value = "";
		var text = "";
		data = eval('('+data+')');
		$.each(data,function(i,item){
			value = item.code;
			text = item.name;
			options = options + "<option value=\""+value+"\">"+text+"</option>";
		});
		$("#city").html(options);
		var cityCode = $("#city option:selected").val();
		var url = "<%=request.getContextPath()%>/common/loadArea.action?cityCode="+cityCode;
		$.getJSON(url,loadArea);
	};
	loadArea=function(data){
		var options = "<option value=\"\">城区</option>";
		var value = "";
		var text = "";
		data = eval('('+data+')');
		$.each(data,function(i,item){
			value = item.code;
			text = item.name;
			options = options + "<option value=\""+value+"\">"+text+"</option>";
		});
			$("#area").html(options);
	};
});
</script>
</body>
</html>