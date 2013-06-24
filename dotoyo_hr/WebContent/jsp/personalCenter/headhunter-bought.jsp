<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--猎头服务管理--已购买的套餐</title>
	<s:include value="/jsp/common/backgroundUserJsAndCss.jsp"/>
	<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
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
    	<div class="administrator-title"><strong>已购买的套餐</strong></div>
	     <s:form id="pageFrom" name="pageFrom" method="post" action="headHuntServiceManageAction!searchBought.action">
	        <div class="inside-search">
	        	<ul>
	            	<li><strong>套餐名称:</strong>
	            		<s:textfield id="serviceNameHid" name="boughtSearchDto.serviceName" size="11" maxLength="20" cssStyle="display:none"/>
	            		<input type="text" id="serviceName" size="10" maxlength="20" value="<s:text name="boughtSearchDto.serviceName"/>"/>
	            	</li>
	                <li>购买日期:
	                	<s:textfield  id="fromOrderDateHid" name="boughtSearchDto.fromOrder" size="7" cssStyle="display:none"/>
	                	<input type="text" class="Wdate2" id="fromOrderDate" value="<s:text name="boughtSearchDto.fromOrder"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'toOrderDate\')}'})" size="11" style="height:15px;"/>
	                		至
	                	<s:textfield  id="toOrderDateHid" name="boughtSearchDto.toOrder"  cssStyle="display:none"/>
	                	<input type="text" class="Wdate2" id="toOrderDate" value="<s:text name="boughtSearchDto.toOrder"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'fromOrderDate\')}'})" size="11" style="height:15px;"/>
	                </li>
	                <li><a href="#" onclick="
	                document.getElementById('serviceNameHid').value=document.getElementById('serviceName').value;
	                document.getElementById('fromOrderDateHid').value=document.getElementById('fromOrderDate').value;
	                document.getElementById('toOrderDateHid').value=document.getElementById('toOrderDate').value;
	                document.getElementById('pageFrom').submit()"><img src="<%=request.getContextPath()%>/images/inside-botton.png" width="68" height="25" /></a></li>
	            </ul>
	        </div>
	        <div class="inside-tab">
	   	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	              	<td width="5%"><input id="selected" name="selected" type="checkbox" value=""/></td>
	                <td width="14%" height="40" align="left" nowrap="true"><strong>套餐名称&nbsp;</strong></td>
	                <td width="9%" align="left" nowrap="nowrap"><strong>服务状态&nbsp;<strong></td>
	                <td width="9%" align="left" nowrap="nowrap"><strong>支付状态&nbsp;<strong></td>
	                <td width="11%" align="left"><strong>支付金额&nbsp;<strong></td>
	                <td width="14%" align="left"><strong>购买日期&nbsp;<strong></td>
	                <td width="14%" align="left"><strong>服务开始日期&nbsp;<strong></td>
	                <td width="14%" align="left"><strong>服务结束日期&nbsp;<strong></td>
	                <td width="10%" align="left">&nbsp;</td>
	              </tr>
	              <s:if test="boughtList!=null">
	              	<s:iterator value="boughtList" var="dto">
		              <tr>
		              	<td width="5%">
		              		<s:if test="serviceStatus == 0">
		              			<input type="checkbox" disabled="disabled" name="selectAlls" value="<s:text name="resId"/>"/>
		              		</s:if>
		              		<s:else>
								<input type="checkbox" name="selectAlls" value="<s:text name="resId"/>"/>
							</s:else>
						</td>
		                <td width="14%" height="40" align="left" title="<s:text name="serviceName"/>">
		                	<span style="width:80px;float:left" class="index_hid_css"><s:text name="serviceName"/></span>&nbsp;
		                </td>
		                <td width="9%" align="left" >
		                	<s:if test="serviceStatus == 1">
		                		已过期
		                	</s:if>
		                	<s:elseif test="serviceStatus == 2">
		                		续期
		                	</s:elseif>
		                	<s:elseif test="serviceStatus == 0">
		                		有效
		                	</s:elseif>
		                	<s:elseif test="serviceStatus == 3">
		                		无效
		                	</s:elseif>
		                </td>
		                <td width="9%" align="left" ><s:text name="statusName"/></td>
		                <td width="11%" align="left" >
		                	<s:if test='priceStatus == "0"'>
		                		面议
		                	</s:if>
		                	<s:else>
		                		<s:text name="price"/>
		                	</s:else>
		                </td>
		                <td width="14%" align="left"  title="<s:date name="orderDate" format="yyyy-MM-dd HH:mm"/>"><s:date name="orderDate" format="yyyy-MM-dd"/>&nbsp; </td>
		                <td width="14%" align="left"  title="<s:date name="startDate" format="yyyy-MM-dd HH:mm"/>"><s:date name="startDate" format="yyyy-MM-dd"/>&nbsp; </td>
		                <td width="14%" align="left"  title="<s:date name="endDate" format="yyyy-MM-dd HH:mm"/>"><s:date name="endDate" format="yyyy-MM-dd"/>&nbsp; </td>
		                <td width="10%" align="left"  nowrap="nowrap">
		                	<s:if test="(serviceStatus == 1 || serviceStatus == 0) && extensionFlag != 2">
		                		<a href="#" onclick="extension('<s:text name="resId"/>')">续期</a>
		                		<a href="#" onclick="decideExtension('<s:text name="resId"/>','<s:text name="serviceCode"/>','<s:text name="price"/>','<s:text name="priceStatus"/>')">商定续期</a>
		                	</s:if>
	                		<s:if test="(serviceStatus == 2 || serviceStatus == 3) && canEdit">
	                			<a href="#" onclick="alert('支付连接')">支付</a>
	                		</s:if>
		                </td>
		              </tr>
	              </s:iterator>
	              </s:if>
	            </table>
			</div>
	        <div class="qx" >
	           <s:property value="pageInfo.htmlListTableFootInfo" escapeHtml="false"/>
	        </div>
	       	<div class="shanchu" onclick="submitForm4ChangeAction(pageFrom,'selectAlls','headHuntServiceManageAction!remove.action');return false;" title="删除">删除</div>
			<div class="num">
			   <s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
			</div>
			<s:hidden id="extension_id" name="extensionOrderId"/>
			<s:hidden id="extension_resId" name="extensionResId"/>
			<s:hidden name="decideExtensionFlag" value="1"/>
			<s:hidden name="buyDetailDto.serviceCode" id="view_id"/>
			<s:hidden name="buyDetailDto.price" id="price"/>
			<s:hidden name="buyDetailDto.priceStatus" id="priceStatus"/>
		</s:form>

  </div>
</div>
<script type="text/javascript">
	function extension()
	{
		document.getElementById("extension_resId").value=arguments[0];
		submitForm4ChangeActionCheck(document.getElementById("pageFrom"),"headHuntServiceManageAction!extension.action");
	}
	function decideExtension(){
		document.getElementById("extension_resId").value=arguments[0];
		document.getElementById("view_id").value = arguments[1];
		document.getElementById("price").value = arguments[2];
		document.getElementById("priceStatus").value = arguments[3];
		submitForm4ChangeActionCheckNull(document.getElementById("pageFrom"),"headHuntServiceManageAction!beforeView.action");
	}
function init(){
	$("#hunhead_service_manage_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
	$("#service_bought a").addClass("active");
}
</script>
</body>
</html>
