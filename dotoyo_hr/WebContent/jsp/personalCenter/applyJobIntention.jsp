<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-系统管理-求职意向管理</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
	<script src="<%=request.getContextPath()%>/javascripts/common/jquery-form.js"></script>
</head>
<body onload="init()">
<jsp:include page="/jsp/common/top.jsp"></jsp:include>
<!--以上为头部分-->
<!--中间部分-->
<div class="content">
	<jsp:include page="left.jsp"></jsp:include>
    <div class="content-right">
    	<div class="administrator-title"><strong>求职意向管理</strong></div>
    <s:form id="searchForm" name="searchForm" method="post" action="personalCenterAction!viewApplyJobIntentionList.action">
        <div class="inside-search">
        	<ul>
            	<li>求职职位：<s:textfield name="applyJobInfoDto.expectedPosition" size="17"/></li>
                <li>状态：
		 			<s:select name="applyJobInfoDto.actStatus" list="#{null:'所有','I':'暂停','A':'发布' }" listKey="key" listValue="value"></s:select>
				</li>
                <li>
                	<a href="javascript:clickSearch();"><img src="<%=request.getContextPath()%>/images/inside-botton.png" width="68" height="25" /></a>
                </li>
            </ul>
        </div>
    </s:form>
    <s:form id="listForm" name="listForm" method="post">
    	<s:hidden name="applyJobInfoDto.expectedPosition"/>
		<s:hidden name="applyJobInfoDto.actStatus"/>
        <div class="inside-tab">
   	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%"><input id="selectAll_top" type="checkbox" value="" /></td>
                <td width="5%" height="40" align="left"><strong>编号</strong></td>
                <td width="15%" height="40" align="left"><strong>求职职位</strong></td>
                <td width="14%" align="left"><strong>职能</strong></td>
                <td width="13%" align="left"><strong>意向工作地点</strong></td>
                <td width="9%" align="left"><strong>是否顾问</strong></td>
                <td width="9%" align="left"><strong>工作性质</strong></td>
                <td width="10%" align="left"><strong>薪水</strong></td>
                <td width="5%" align="left"><strong>状态</strong></td>
                <td width="12%"  align="left"><strong>发布日期</strong></td>
                <td width="5%" align="left"><strong>操作</strong></td>
              </tr>
              <s:iterator id="iterator" value="applyJobInfoList">
	              <tr>
	                <td width="3%"><input name="applyJobInfoCheckBox" type="checkbox" value="<s:property value="id"/>" /></td>
	                <td width="5%"><s:property value="id"/></td>
	                <td width="15%" height="40" align="left">
		                <span style="width:110px;float:left" class="index_hid_css" title="<s:property value='expectedPosition'/>">
		                	<s:property value="expectedPosition"/>
		                </span>
	                </td>
	                <td width="14%" align="left">
		                <span style="width:105px;float:left" class="index_hid_css" title="<s:property value='function.name'/>">
		                	<s:property value="function.name"/>
		                </span>
	                </td>
	                <td width="13%" align="left" title="<s:property value='province.name'/><s:property value='city.name'/><s:property value='area.name'/>">
		                <span style="width:95px;float:left" class="index_hid_css">
		                	<s:property value="city.name"/><s:property value="area.name"/>
		                </span>
	                </td>
	                <td width="9%" align="left"><s:property value="isAdvisorStr"/></td>
	                <td width="9%" align="left"><s:property value="jobType.name"/></td>
	                <td width="10%" align="left"><s:property value="expectedSalary.name"/></td>
	                <td width="5%" align="left">
	                	<s:if test='actStatus=="A"'>
	                		发布
	                	</s:if>
						<s:else>
							暂停
						</s:else>
	                </td>
	                <td width="12%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{submitDate})"/></td>
	                <td width="5%" align="left" class="inside-links">
	                	<a href="personalCenterAction!toEditApplyJobInfo.action?applyJobInfoId=<s:property value="id"/>">
	                		修改
	                	</a>
	                </td>
	              </tr>
              </s:iterator>
            </table>
	</div>
</s:form>
<s:form  id="pageFrom" name="pageFrom" method="POST" action="personalCenterAction!viewApplyJobIntentionList.action">
		<s:hidden name="applyJobInfoDto.expectedPosition"/>
		<s:hidden name="applyJobInfoDto.actStatus"/>
		<div class="qx">
			<s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
			<input id="selectAll_bottom" type="checkbox" value="" /><label for="selectAll_bottom">&nbsp;&nbsp;全选</label>
		</div>
       	<div class="system-botton2">
        	<ul>
                <li class="botton1">
                	
                	<a href="<s:url namespace="/personalCenter" action="personalCenterAction!toAddApplyJobInfo.action"></s:url>" title="增加">增加</a>
                </li>
                <li class="botton2"><a href="javascript:clickDelete()" title="删除">删除</a></li>
                <li class="botton3"><a href="javascript:clickPause()" title="暂停">暂停</a></li>
                <li class="botton3"><a href="javascript:clickPublish()" title="发布">发布</a></li>
            </ul>
		</div>
        <div class="num">
        	<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
       	</div>
</s:form>
  </div>
</div>
<script type="text/javascript">
function clickSearch(){
	document.searchForm.submit();
}
$("#selectAll_top").click(function(){
	if($(this).attr("checked")) {
		 $(":checkbox").each(function(i){
			    $(this).attr("checked","checked");
			});
		
	}else{
		$(":checkbox").each(function(i){
		    $(this).removeAttr("checked");
		});
	}
});
$("#selectAll_bottom").click(function(){
	if($(this).attr("checked")) {
		 $(":checkbox").each(function(i){
			    $(this).attr("checked","checked");
			});
		
	}else{
		$(":checkbox").each(function(i){
		    $(this).removeAttr("checked");
		});
	}
});
function clickDelete(){
	if(checkStatus("applyJobInfoCheckBox")){
		if(window.confirm("你确认要进行此操作吗？")){
		document.listForm.action="personalCenterAction!deleteApplyJobIntention.action";
		document.listForm.submit();	
		}
	}
	else{
		alert("请至少选择一条记录");
	}
}
function clickPause(){
	if(checkStatus("applyJobInfoCheckBox")){
		if(window.confirm("你确认要进行此操作吗？")){
		document.listForm.action="personalCenterAction!pauseApplyJobIntention.action";
		document.listForm.submit();	
		}
	}
	else{
		alert("请至少选择一条记录");
	}
}
function clickPublish(){
	if(checkStatus("applyJobInfoCheckBox")){
		if(window.confirm("你确认要进行此操作吗？")){
		document.listForm.action="personalCenterAction!publishApplyJobIntention.action";
		document.listForm.submit();	
		}
	}
	else{
		alert("请至少选择一条记录");
	}
}
function init(){
	$("#position_zhaoping_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
	$("#position_applyJobIntention").addClass("active");
}
</script>
</body>
</html>