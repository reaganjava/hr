<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--猎证中心--证书详细信息</title>
	<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
	<jsp:include page="../common/JsAndCss.jsp"/>
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<s:include value="certificateCenterNav.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<div class="guwen-more">
  <div class="jobs-title"><strong>证书详细信息</strong></div>
  <table width="85%" border="0" cellspacing="0" cellpadding="0" class="table-p">
      <tr>
        <td width="40%">证书类型：<s:property value="personalCertVo.certType.name"/></td>
        <td width="60%">证书名称：<s:property value="personalCertVo.cert.name"/></td>
      </tr>
      <tr>
      	<td width="40%">注册状况：<s:property value="personalCertVo.registerStatus.name"/></td>
        <td width="60%">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：<s:property value="personalCertVo.specialField.name"/></td>
      </tr>
      <tr>
      	<td colspan="2">所在地区：<s:property value="personalCertVo.city.name"/><s:property value="personalCertVo.area.name"/></td>
      </tr>
      <tr>
      	<td colspan="2">发布日期：<s:property value="getText('formatDate_yyyy-MM-dd',{personalCertVo.submitDate})"/></td>
      </tr>
  </table>

	<div class="jobs-botton">
	   	<a href="#contactDiv" onclick="viewContact()"><img src="<%=request.getContextPath()%>/images/details-botton1.png" width="120" height="28" alt="查看联系方式"/></a>
	       <a href="javascript:addFavorite('<s:property value="personalCertVo.cert.name"/>')"><img src="<%=request.getContextPath()%>/images/details-botton2.png" width="120" height="28" alt="我要收藏"/></a>
	       <a href="javascript:clickClose()"><img src="<%=request.getContextPath()%>/images/details-botton3.png" width="92" height="28" alt="关闭"/></a>
	</div>
	<div class="jobs-wenxin-box2">
	 	<div class="jobs-wenxin">
	     	<div class="jobs-wenxin-left"><img src="<%=request.getContextPath()%>/images/wenxin-icon3.png" width="132" height="135" /></div>
	         <div class="jobs-wenxin-right2">
	        		<p><s:property value="personalCertVo.descp"/></p> 
	       </div>
	     </div>
	</div>
</div>
<div id="contactDiv" class="mid-border" style="display:none">
  <div class="mid-border">
    <h5><span onclick="closeContact()">X</span>查看联系方式</h5>
    <ul>
      <li>联&nbsp;&nbsp;系&nbsp;&nbsp;人：
        <input id="contact" name="contact" type="text" value="<s:property value='personalCertVo.contact'/>" readonly="readonly" />
      </li>
      <li>联系电话：
        <input id="telephone" name="telephone" type="text" value="<s:property value='personalCertVo.telephone'/>" readonly="readonly"/>
      </li>
      <li>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：
        <input id="cellPhone" name="cellPhone" type="text" value="<s:property value='personalCertVo.cellPhone'/>" readonly="readonly"/>
      </li>
      <li>E&nbsp;&nbsp;-&nbsp;&nbsp;mail：
        <input id="email" name="email" type="text" value="<s:property value='personalCertVo.email'/>" readonly="readonly"/>
      </li>
      <li>传&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;真：
        <input id="fax" name="fax" type="text" value="<s:property value='personalCertVo.fax'/>" readonly="readonly"/>
      </li>
    </ul>
  </div>
  <h5>&nbsp;</h5>
  <s:hidden id="personalCertId" name="personalCertVo.id"/>
</div>
<!--底部分-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
<script type="text/javascript">
function clickClose(){
	if(confirm("你确认要关闭页面吗？")){
		window.opener=null;
		window.open('','_self');
		window.close();
	}
}
function viewContact(){
	var personalCertId = document.getElementById("personalCertId").value;
	$.getJSON("../certificateCenter/certificateAction!viewPersonalCertContact.action?personalCertId="+personalCertId , function(data) {
		if("Y"==data){
			$("#contactDiv").show();
			window.location.href="#contactDiv";
		}else{
			if(equalsIgnoreCase(data,"permissionDenied")){
				alert("权限不够，请先完善博站资料.");
			}
			if(equalsIgnoreCase(data,"userTypeError")){
				alert("个人用户不能进行此操作，请确认账号信息.");
			}
			if(equalsIgnoreCase(data,"serviceOutOfDate")){
				alert("请确认已购买该服务，或服务已过期(可用次数不够).");
			}
			if(equalsIgnoreCase(data,"UNLOGON")){
					window.location.href = "<%=request.getContextPath()%>/homePage/homePageAction!init.action?goFrom=1";
				}
		}
	});
}
function closeContact(){
	$("#contactDiv").hide();
}
function equalsIgnoreCase(str1,str2){
	if(str1==null||str2==null){
		return false;
	}
	else{
		str1 = str1.toUpperCase();
		str2 = str2.toUpperCase();
		if(str1 == str2)
			return true;
		else
			return false;
	}
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
</script>
</body>
</html>