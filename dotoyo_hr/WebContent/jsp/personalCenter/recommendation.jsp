<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理--线下推荐对象管理</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
</head>
<body onload="init()">
	<jsp:include page="/jsp/common/top.jsp" />
	<!--以上为头部分-->
	<!--中间部分-->
	<div class="content">
		<jsp:include page="left.jsp" />
		<div class="content-right">
			<div class="administrator-title"><strong>线下推荐对象管理</strong></div>
			<div class="inside-tab">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="15%" height="40" align="left"><strong>求职职位</strong></td>
						<td width="14%" align="left"><strong>意向工作地点</strong></td>
						<td width="9%" align="left"><strong>是否顾问</strong></td>
						<td width="10%" align="left"><strong>工作性质</strong></td>
						<td width="11%" align="left"><strong>薪水</strong></td>
						<td width="10%" align="left"><strong>求职时间</strong></td>
						<td width="10%"  align="left"><strong>审核状态</strong></td>
						<td width="11%"  align="left"><strong>面试情况</strong></td>
						<td width="5%" align="left"><strong>操作</strong></td>
						<td width="5%" align="left">&nbsp;</td>
					</tr>
					<s:iterator value="recommendationList">
					<tr>
						<td width="15%" height="40" align="left">
							<span style="width:110px;float:left" class="index_hid_css" title="<s:property value='expectedPosition'/>">
								<s:property value="expectedPosition"/>
							</span>
						</td>
						<td width="14%" align="left" title="<s:property value='province.name'/><s:property value='city.name'/><s:property value='area.name'/>">
							<span style="width:105px;float:left" class="index_hid_css">
								<s:property value="city.name"/><s:property value="area.name"/>
							</span>
						</td>
						<td width="9%" align="left">
							<s:if test='isAdvisor=="Y"'>
							是
							</s:if>
							<s:else>
							否
							</s:else>
						</td>
						<td width="10%" align="left">
							<s:property value="jobType.name"/>
						</td>
						<td width="11%" align="left">
							<s:property value="expectedSalary.name" />
						</td>
						<td width="10%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{submitDate})"/></td>
						<td width="10%" align="left">
							<s:if test='verifyStatus=="0"'>
								正在审核
							</s:if>
							<s:if test='verifyStatus=="2"'>
								审核通过
							</s:if>
							<s:if test='verifyStatus=="3"'>
								审核失败
							</s:if>
						</td>
						<td width="11%" align="left">
							<s:if test='interviewStatus=="0"'>
								未面试
							</s:if>
							<s:if test='interviewStatus=="1"'>
								面试通过
							</s:if>
							<s:if test='interviewStatus=="2"'>
								面试失败
							</s:if>
						</td>
						<s:if test='interviewStatus=="0"'>
							<td width="5%" align="left" class="inside-links">
								<a href="personalCenterAction!toEditRecommendation.action?recommendationId=<s:property value="id"/>">
									修改
								</a>
							</td>
							<td width="5%" align="left" class="inside-links">
								<a onclick="return clickDelete();" href="personalCenterAction!deleteRecommendation.action?recommendationId=<s:property value="id"/>">
									删除
								</a>
							</td>
						</s:if>
						<s:else>
							<td width="5%" align="left" class="inside-links">
								<a href="javascript:void(0)" onclick="alert('已面试，不可修改！')">修改</a>
							</td>
							<td width="5%" align="left" class="inside-links">
								<a href="javascript:void(0)" onclick="alert('已面试，不可删除！')">删除</a>
							</td>
						</s:else>
					</tr>
				</s:iterator>
				</table>
			</div>
			<s:if test='recommendationList.size()==0'>
				<div class="shanchu" onclick="javascript:window.location.href = 'personalCenterAction!toAddRecommendation.action'">申请</div>
			</s:if>
		</div>
	</div>
	<script type="text/javascript">
		function clickDelete(){
			if(window.confirm("确认删除？")){
				return true;
			}
			else{
				return false;
			}
		}
		function init(){
			$("#position_zhaoping_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
			$("#position_recommendation").addClass("active");
		}
	</script>
</body>
</html>