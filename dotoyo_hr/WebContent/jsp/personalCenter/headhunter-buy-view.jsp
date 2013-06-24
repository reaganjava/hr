<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--猎头服务管理--购买套餐</title>
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
    	<div class="administrator-title"><strong>套餐详情</strong></div>
	        <div class="inside-tab">
	   	    	<table style="TABLE-LAYOUT: fixed" width="100%" border="0" cellspacing="0" cellpadding="0" class="inside-tab">
	              <tr>
	                <td width="29%" height="40" align="right"><strong>套餐编码</strong>：</td>
	                <td  width="71%" align="left" class="tab-input">
	                	<s:if test="buyDetailDto.nameMaintainanceDto.serviceCode != null">
	                		<s:text name="buyDetailDto.nameMaintainanceDto.serviceCode" />
	                	</s:if>
	                	<FONT color="red"><s:text name="msg"/></FONT>
	                </td>
	              </tr>
	              <tr>
	                <td width="29%" height="40" align="right"><strong>套餐名称</strong>：</td>
	                <td align="left" class="tab-input">
	                	<s:if test="buyDetailDto.nameMaintainanceDto.serviceName != null">
	                		<s:text name="buyDetailDto.nameMaintainanceDto.serviceName"/>
	                	</s:if>
	                </td>
	              </tr>
	              <tr>
	                <td width="29%" height="40" align="right"><strong>服务项目</strong>：</td>
	                <td align="left">
	                	<s:if test="buyDetailDto.advertSettingDto != null">
	                		<s:text name="buyDetailDto.advertSettingDto.itemName"/>
	                	</s:if>
	                	<s:if test="buyDetailDto.hangCardSettingDto != null">
	                		<s:text name="buyDetailDto.hangCardSettingDto.itemName"/>
	                	</s:if>
	                	<s:if test="buyDetailDto.huntCardSettingDto != null">
	                		<s:text name="buyDetailDto.huntCardSettingDto.itemName"/>
	                	</s:if>
	                	<s:if test="buyDetailDto.recruitSettingDto != null">
	                		<s:text name="buyDetailDto.recruitSettingDto.itemName"/>
	                	</s:if>
	                	<s:if test="buyDetailDto.talentsFoundSettingDto != null">
	                		<s:text name="buyDetailDto.talentsFoundSettingDto.itemName"/>
	                	</s:if>
	                	<s:if test="buyDetailDto.talentsFoundOfflineSettingDto != null">
	                		<s:text name="buyDetailDto.talentsFoundOfflineSettingDto.itemName"/>
	                	</s:if>
	                </td>
	              </tr>
	              <tr>
	                <td width="29%" height="40" align="right"><strong>可用天数</strong>：</td>
	                <td align="left" class="tab-input">
	                	<s:if test="buyDetailDto.nameMaintainanceDto.usableDays != null">
	                		<s:text name="buyDetailDto.nameMaintainanceDto.usableDays"/>
	                	</s:if>
	                </td>
	         	 </tr>
	              <tr>
	                <td width="29%" height="40" align="right"><strong>服务简介</strong>：</td>
	                <td style="LEFT: 0px; WIDTH: 100%; WORD-WRAP: break-word" align="left" >
	                	<s:if test="buyDetailDto.nameMaintainanceDto.serviceIntro != null">
							<s:text name="buyDetailDto.nameMaintainanceDto.serviceIntro"/>
						</s:if>
	                </td>
	              </tr>
	              <tr>
	                <td width="29%" height="40" align="right"><strong>服务价格</strong>：</td>
	                <td align="left">
	                	<s:if test='buyDetailDto.priceStatus=="0"'>
	                		面议
	                	</s:if>
	                	<s:elseif test='buyDetailDto.priceStatus=="1"'>
	                		<s:text name="buyDetailDto.price"/>
	                	</s:elseif>
	                </td>
	              </tr>
	              <tr>
	                <td width="29%" height="40" align="right" valign="top"><strong>服务设置</strong>：</td>
	                <td align="left">
	                	<s:if test="buyDetailDto.advertSettingDto != null">
	                		<strong>广告位</strong>:
	                		<s:text name="buyDetailDto.advertSettingDto.advertisingName"/> &nbsp;<br/>
	                	</s:if>
	                	<s:if test="buyDetailDto.hangCardSettingDto != null">
	                		<strong>证书提交个数</strong>:
	                		<s:text name="buyDetailDto.hangCardSettingDto.countOfSubmit"/> &nbsp;<br/>
	                	</s:if>
	                	<s:if test="buyDetailDto.huntCardSettingDto != null">
	                		<strong>查看联系方式次数</strong>:
	                		<s:text name="buyDetailDto.huntCardSettingDto.timesOfLookup"/> &nbsp;
	                		<strong>提交证书需求个数</strong>:
	                		<s:text name="buyDetailDto.huntCardSettingDto.timesOfSubmitCertNeeds"/> &nbsp;<br/>
	                	</s:if>
	                	<s:if test="buyDetailDto.recruitSettingDto != null">
                			<strong>发布职位次数</strong>:
	                			<s:text name="buyDetailDto.recruitSettingDto.timesOfPublicPosition"/> &nbsp;
	                		<strong>邀请面试次数</strong>:
	                			<s:text name="buyDetailDto.recruitSettingDto.timesOfLookupInvite"/> &nbsp;
	                		<strong>查看博站次数</strong>:
	                			<s:text name="buyDetailDto.recruitSettingDto.timesOfLookupBlog"/><br/>
	                	</s:if>
	                	<s:if test="buyDetailDto.talentsFoundSettingDto != null">
	                		<strong>可搜索的次数</strong>:
	                		<s:text name="buyDetailDto.talentsFoundSettingDto.timesOfSearch"/> &nbsp;
	                		<strong>可搜索字段</strong>:
	                		<s:text name="buyDetailDto.talentsFoundSettingDto.fieldsOfSearchName"/><br/>
	                	</s:if>
	                	<s:if test="buyDetailDto.talentsFoundOfflineSettingDto != null">
	                		<strong>线下可搜索的次数</strong>:
	                		<s:text name="buyDetailDto.talentsFoundOfflineSettingDto.timesOfSearch"/> &nbsp;
	                		<strong>线下可搜索字段</strong>:
	                		<s:text name="buyDetailDto.talentsFoundOfflineSettingDto.fieldsOfSearchName"/> &nbsp;
	                	</s:if>
	                </td>
	              </tr>
	            </table>
			</div>
			<s:form id="sysOrderFM" name="sysOrderFM" method="post" action="headHuntServiceManageAction!order.action">
				<s:hidden name="buyDetailDto.serviceCode"/>
				<s:hidden name="buyDetailDto.price"/>
				<s:hidden name="buyDetailDto.priceStatus"/>
		       	<div class="system-botton3">
		        	<ul>
		        		<s:if test="decideExtensionFlag==0">
		        			<li class="botton1" style="text-align:center"><a href="#" onclick="submitForm4ChangeActionCheck(document.getElementById('sysOrderFM'),'headHuntServiceManageAction!fastOrder.action');" title="预定">预定</a></li>
		        		</s:if>
		        		<s:else>
		                	<li class="botton1" style="text-align:center"><a href="#" onclick="submitForm4ChangeActionCheck(document.getElementById('sysOrderFM'),'headHuntServiceManageAction!decideExtension.action');" title="商定续费">商定续费</a></li>
		                </s:else>
		                <li class="botton3" style="text-align:center"><a href="<%=request.getContextPath()%>/personalCenter/headHuntServiceManageAction!cancelBuy.action" title="取消">取消</a></li>
		            </ul>
		        </div>
	        </s:form>
  		</div>
	</div>
</body>
<script type="text/javascript">
function init(){
	$("#hunhead_service_manage_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
	$("#service_buy a").addClass("active");
}
</script>
</html>
