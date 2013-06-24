<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--猎头服务管理--购买套餐</title>
	<s:include value="/jsp/common/backgroundUserJsAndCss.jsp"/>
	<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
	<%String msgFlag = request.getParameter("msg"); %>
</head>
<body onload="init()">
<s:include value="/jsp/common/top.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<div class="content">
<s:if test="loginUserInfoDto.userType == 1">
<s:include value="/jsp/enterpriseCenter/left.jsp"/>
</s:if>
<s:else>
<s:include value="left.jsp"/>
</s:else>
   <div class="content-right">
    	<div class="administrator-title"><strong>套餐列表</strong></div>
	    <s:form id="pageFrom" name="pageFrom" method="post" action="headHuntServiceManageAction!searchService.action">
	        <div class="inside-search">
	        	<ul>
	            	<li><strong>套餐名称</strong>：
	            		<s:textfield id="serviceNameHid" name="buySearchDto.serviceName" size="17" maxLength="20" cssStyle="display:none"/>
	            		<input type="text" id="serviceName" value="<s:text name="buySearchDto.serviceName"/>" size="17" maxlength="20"/>
	            	</li>
	                <li><a href="#" onclick="
	                document.getElementById('serviceNameHid').value=document.getElementById('serviceName').value;
	                document.getElementById('pageFrom').submit()"><img src="<%=request.getContextPath()%>/images/inside-botton.png" width="68" height="25" /></a></li>
	            </ul>
	      	</div>
	        <div class="inside-tab">
	   	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="20%" height="40" align="left" nowrap="true"><strong>套餐名称&nbsp;</strong></td>
	                <td width="60%" align="left" nowrap="true"><strong>服务简介&nbsp;</strong></td>
	                <td width="10%" align="left" nowrap="true"><strong>服务价格&nbsp;</strong></td>
	                <td width="10%" align="left"><strong>操作&nbsp;</strong></td>
	              </tr>
	              <s:if test="buyServiceList!=null">
	              	<s:iterator value="buyServiceList" var="dto">
		              <tr>
		                <td width="20%" height="40" align="left" nowrap="true">
		                	<span style="width:120px;float:left" class="index_hid_css"><s:text name="serviceName"/></span>&nbsp;
		                </td>
		                <td width="60%" align="left" nowrap="true" title="<s:text name="intro"/>">
		                	<span style="width:440px;float:left" class="index_hid_css"><s:text name="intro"/></span>&nbsp;
		                </td>
		                <td width="10%" align="left" nowrap="true">
		                	<s:if test='priceStatus=="0"'>
		                		面议
		                	</s:if>
		                	<s:else>
		                		<s:text name="price"/>
		                	</s:else>
		                	&nbsp;
		                </td>
		                <td width="10%" align="left" nowrap="nowrap" class="inside-links">
		                	<a href="#" onclick="fastOrder('<s:text name="serviceCode"/>','<s:text name="price"/>','<s:text name="priceStatus"/>')">预定</a>&nbsp;
		                	<a href="#" onclick="beforeView('<s:text name="serviceCode"/>','<s:text name="price"/>','<s:text name="priceStatus"/>')">查看详情</a>&nbsp;
		                </td>
		              </tr>
	              </s:iterator>
	              </s:if>
	            </table>
			</div>
	        <div class="qx" >
	           <s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
	        </div>
			<div class="num">
			   <s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
			</div>
		</s:form>
    	<div style="display:none">
    		<s:form name="sysIncrementFormView" method="post" action="headHuntServiceManageAction!beforeView.action">
			<s:hidden name="buyDetailDto.serviceCode" id="view_id"/>
			<s:hidden name="buyDetailDto.price" id="price"/>
			<s:hidden name="buyDetailDto.priceStatus" id="priceStatus"/>
			<s:hidden name="decideExtensionFlag" value="0"/>
    		</s:form>
    		<s:form id="fastOrderForm" name="fastOrderForm" method="post" action="headHuntServiceManageAction!fastOrder.action">
				<s:hidden name="buyDetailDto.serviceCode" id="view_id_fastOrder"/>
				<s:hidden name="buyDetailDto.price" id="priceFastOrder"/>
				<s:hidden name="buyDetailDto.priceStatus" id="priceStatusFastOrder"/>
				<s:hidden name="decideExtensionFlag" value="0"/>
    		</s:form>
    	</div>
    	<input id="msg" type="hidden" value="<%=msgFlag%>" />
  </div>
</div>

</body>
</html>
<script type="text/javascript">
	function beforeView(){
		document.getElementById("view_id").value=arguments[0];
		document.getElementById("price").value=arguments[1];
		document.getElementById("priceStatus").value=arguments[2];
		document.getElementsByName("sysIncrementFormView")[0].submit();
	}
	function fastOrder(){
		if(confirm("你确认要进行此操作吗?")){
			document.getElementById("view_id_fastOrder").value=arguments[0];
			document.getElementById("priceFastOrder").value=arguments[1];
			document.getElementById("priceStatusFastOrder").value=arguments[2];
			document.getElementsByName("fastOrderForm")[0].submit();
		}
	}
function init(){
	$("#hunhead_service_manage_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
	$("#service_buy a").addClass("active");
	var msg = $("#msg").val();
	if(msg == "1"){
		alert("预定成功.");
	}
	else if(msg == "0"){
		alert("预定失败.");
	}
}
</script>
