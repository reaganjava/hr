<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--猎证中心--证书需求信息</title>
	<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
	<jsp:include page="../common/JsAndCss.jsp"/>
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<s:include value="certificateCenterNav.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<div class="guwen-more">
  <div class="jobs-title"><strong>证书需求信息</strong></div>
  <table width="85%" border="0" cellspacing="0" cellpadding="0" class="table-p">
      <tr>
        <td width="40%">证书类型：<s:property value="certNeedsVo.certType.name"/></td>
        <td width="60%">证书名称：<s:property value="certNeedsVo.cert.name"/></td>
        
      </tr>
      <tr>
      	<td width="40%">注册状况：<s:property value="certNeedsVo.registerStatus.name"/></td>
        <td width="60%">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：<s:property value="certNeedsVo.specialField.name"/></td>
      </tr>
      <tr>
        <td colspan="2">挂证地区：<s:property value="certNeedsVo.city.name"/><s:property value="certNeedsVo.area.name"/></td>
      </tr>
      <tr>
      	<td width="40%">发布日期：<s:property value="getText('formatDate_yyyy-MM-dd',{certNeedsVo.submitDate})"/></td>
        <td width="60%">有效期至：<s:property value="getText('formatDate_yyyy-MM-dd',{certNeedsVo.expDate})"/></td>
      </tr>
      <tr>
      	<td width="40%" >证书需求数：<s:property value="certNeedsVo.certNeedsAmount"/></td>
        <td width="60%">单位规模：<s:property value="certNeedsVo.companySize.name"/></td>
      </tr>
  </table>

	<div class="jobs-botton">
	  	<a href="#contactDiv" onclick="viewContact()"><img src="<%=request.getContextPath()%>/images/details-botton1.png" width="120" height="28" alt="查看联系方式"/></a>
	      <a href="javascript:addFavorite('<s:property value="certNeedsVo.cert.name"/>')">
	      	<img src="<%=request.getContextPath()%>/images/details-botton2.png" width="120" height="28" alt="我要收藏"/>
	      </a>
	      <a href="#" onclick="clickClose()"><img src="<%=request.getContextPath()%>/images/details-botton3.png" width="92" height="28" alt="关闭"/></a>
	</div>
    <div class="jobs-wenxin-box2">
    	<div class="jobs-wenxin">
        	<div class="jobs-wenxin-left"><img src="<%=request.getContextPath()%>/images/wenxin-icon3.png" width="132" height="135" /></div>
            <div class="jobs-wenxin-right2">
           		<p><s:property value="certNeedsVo.descp"/></p> 
          </div>
        </div>
  </div>
</div>
<div id="contactDiv" class="mid-border" style="display:none">
  <div class="mid-border">
    <h5><span onclick="closeContact()">X</span>查看联系方式</h5>
    <ul>
      <li>联&nbsp;&nbsp;系&nbsp;&nbsp;人：
        <input id="contact" name="contact" type="text" value="<s:property value='certNeedsVo.contact'/>" readonly="readonly" />
      </li>
      <li>联系电话：
        <input id="telephone" name="telephone" type="text" value="<s:property value='certNeedsVo.telephone'/>" readonly="readonly"/>
      </li>
      <li>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：
        <input id="cellPhone" name="cellPhone" type="text" value="<s:property value='certNeedsVo.cellPhone'/>" readonly="readonly"/>
      </li>
      <li>E&nbsp;&nbsp;-&nbsp;&nbsp;mail：
        <input id="email" name="email" type="text" value="<s:property value='certNeedsVo.email'/>" readonly="readonly"/>
      </li>
      <li>传&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;真：
        <input id="fax" name="fax" type="text" value="<s:property value='certNeedsVo.fax'/>" readonly="readonly"/>
      </li>
    </ul>
  </div>
  <h5>&nbsp;</h5>
</div>
<div class="guwen-more">
     <div class="jobs-title"><strong>相关证书需求信息</strong></div>
  <div class="people-text people-text-bg1">
          <ul>
              <li class="requirements1">编号</li>
              <li class="requirements2">证书类型</li>
              <li class="requirements3">证书名称</li>
              <li class="requirements4">注册状况</li>
              <li class="requirements5">专业</li>
              <li class="requirements6">所在地区</li>
              <li class="requirements7">发布时间</li>
          </ul>
     </div>
<div class="requirements-box">
<s:iterator value="certNeedsList">
    <div class="requirements" >
         <ul>
              <li class="requirements1"><s:property value="id"/></li>
              <li class="requirements2">
              	<s:property value="certType.getName()"/>
              </li>
              <li class="requirements3"><a href="certificateAction!viewCertNeedsDetail.action?certNeedsId=<s:property value="id"/>&userId=<s:property value="userId"/>"><s:property value="cert.getName()"/></a></li>
              <li class="requirements4"><s:property value="registerStatus.name"/></li>
              <li class="requirements5"><s:property value="specialField.name"/></li>
              <li class="requirements6" title="<s:property value='province.getName()'/><s:property value='city.getName()'/><s:property value='area.getName()'/>">
	              <span style="width:100px;float:left" class="index_hid_css">
	              	<s:property value="city.getName()"/><s:property value="area.getName()"/>
	              </span>
              </li>
              <li class="requirements7"><s:property value="getText('formatDate_yyyy-MM-dd',{effDate})"/></li>
         </ul>
    </div>
    <div class="requirements-p">
    	<div class="requirements-p-left">
    		<table>
    			<tr>
    				<td class="descpTitle"><strong>补充说明：</strong></td>
    				<td>
			    		<span style="width:600px;float:left" class="index_hid_css" title="<s:property value='descp'/>">
			          		<s:property value="descp"/> 
			          	</span>
    				</td>
    			</tr>
    		</table>
        </div>
    	<div class="requirements-botton"><a href="certificateAction!viewCertNeedsDetail.action?certNeedsId=<s:property value="id"/>&userId=<s:property value="userId"/>"><img src="<%=request.getContextPath()%>/images/requirements-botton1.gif" width="68" height="24" alt="查看详细"/></a></div>
    </div>
</s:iterator>
</div>                 
</div>
<s:form  id="pageFrom" name="pageFrom" method="POST" action="certificateAction!viewCertNeedsDetail.action">
	<s:hidden id="certNeedsId" name="certNeedsId"/>
	<s:hidden name="userId"/>
   <div class="qx">
   		<s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
   </div>
   <div class="num">
   		<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
   </div>
</s:form>
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
	var certNeedsId = document.getElementById("certNeedsId").value;
	$.getJSON("../certificateCenter/certificateAction!viewCertNeedsContact.action?certNeedsId="+certNeedsId , function(data) {
		if("Y"==data){
			$("#contactDiv").show();
			window.location.href="#contactDiv";
		}else{
			if(equalsIgnoreCase(data,"permissionDenied")){
				alert("权限不够，请完善博站资料.");
			}
			if(equalsIgnoreCase(data,"userTypeError")){
				alert("企业用户不能进行此操作，请确认账号信息.");
			}
			if(equalsIgnoreCase(data,"UNLOGON")){
				window.location.href = "<%=request.getContextPath()%>/homePage/homePageAction!init.action?goFrom=1";
			}
		}
	});
}
function closeContact(){
	$("#contactDiv").hide();
	window.location.href="#";
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