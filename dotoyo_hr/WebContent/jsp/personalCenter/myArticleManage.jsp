<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-文章管理</title>
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
    	<div class="administrator-title"><strong>文章管理</strong></div>
	   <s:form id="pageFrom" name="pageFrom" method="POST" action="salonManageAction!toArticleManagePage.action">
	    <s:hidden name="goFrom" id="goFrom" value="1"/>
   	    <div class="inside-search">
        	<ul>
            	<li>标题：
            		<s:textfield id="subjectHid" name="salonSearchVo.subject" cssStyle="display:none" />
            		<input type="text" id="subject" value="<s:text name="salonSearchVo.subject"/>" size="12"/>
            	</li>
                <li>上传时间：
                	<input id="strStartDateHid" name="strStartDate" value="<s:property value="strStartDate"/>" style="display:none"/>
                	<input id="strStartDatex" readonly="readonly" value="<s:property value="strStartDate"/>" size="13" class="Wdate2" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'strStartDatex\')}'})"/>
                	&nbsp;&nbsp;
                    <input id="strEndDateHid" name="strEndDate" value="<s:property value="strEndDate"/>" style="display:none"/>
                    <input id="strEndDatex" readonly="readonly" value="<s:property value="strEndDate"/>" size="13" class="Wdate2" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'strStartDatex\')}'})"/>
                </li>
                <li>状态：
                	<s:select id="statusHid" name="salonSearchVo.status" list="#{null:'所有','1':'通过','0':'待审核','2':'不通过' }" listKey="key" listValue="value" cssStyle="display:none"/>
                	<s:select id="status" value="salonSearchVo.status" list="#{null:'所有','1':'通过','0':'待审核','2':'不通过' }" listKey="key" listValue="value"/>
                </li>
                <li>
                	<a href="#" onclick="
                	document.getElementById('subjectHid').value=document.getElementById('subject').value;
                	document.getElementById('strStartDateHid').value=document.getElementById('strStartDatex').value;
                	document.getElementById('strEndDateHid').value=document.getElementById('strEndDatex').value;
                	document.getElementById('statusHid').value=document.getElementById('status').value;
                	$('#pageFrom').submit();
                	"><img src="<%=request.getContextPath()%>/images/inside-botton.png" width="68" height="25" /></a>
                </li>
            </ul>
        </div>
        <div class="inside-tab">
   	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><input id="selected" name="selected" type="checkbox" value=""/></td>
                <td width="21%" height="40" align="left"><strong>标题</strong></td>
                <td width="12%" align="left"><strong>沙龙名称</strong></td>
                <td width="14%" align="left"><strong>上传时间</strong></td>
                <td width="6%" align="left"><strong>状态</strong></td>
                <td width="6%" align="left"><strong>经典</strong></td>
                <td width="6%" align="left"><strong>推荐</strong></td>
                <td width="6%" align="left"><strong>精华</strong></td>
                <td width="6%" align="left"><strong>浏览</strong></td>
                <td width="6%" align="left"><strong>好评</strong></td>
                <td width="6%" align="left"><strong>差评</strong></td>
                <td width="6%" align="left"><strong>操作</strong></td>
              </tr>
              <s:iterator value="articleList">
              <tr>
                <td width="5%"><input id="arrayIds" name="arrayIds" type="checkbox" value="<s:property value="id"/>"/></td>
                <td width="21%" height="40" align="left" title="<s:property value="subject"/>"><span style="width:140px;float:left" class="index_hid_css"><s:property value="subject"/></span></td>
                <td width="12%" align="left" title="<s:property value="salonSubject"/>"><span style="width:100px;float:left" class="index_hid_css"><s:property value="salonSubject"/></span></td>
                <td width="14%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{submitDate})"/></td>
                <td width="6%" align="left"><s:property value="articleStatus"/></td>
                <td width="6%" align="left"><s:property value="isExcellent"/></td>
                <td width="6%" align="left"><s:property value="isRecomment"/></td>
                <td width="6%" align="left"><s:property value="iscream"/></td>
                <td width="6%" align="left"><s:property value="browseCount"/></td>
                 <td width="6%" align="left"><s:property value="reputationCount"/></td>
                 <td width="6%" align="left"><s:property value="schlussgruppeCount"/></td>
                <td width="6%" align="left" class="inside-links"><a href="salonManageAction!toModifyArticlePage.action?salonArticleDto.id=<s:property value="id"/>&salonArticleDto.salonType=<s:property value="salonType"/>">修改</a></td>
              </tr>
              </s:iterator>
            </table>
		</div>
        <div class="qx">
           <s:property value="pageInfo.htmlListTableFootInfo" escapeHtml="false"/>
       </div>
       	<div class="shanchu" onclick="submitForm4ChangeAction(pageFrom,'arrayIds','salonManageAction!deleteArticle.action')">
       		删除
       	</div>
        <div class="num">
        		<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
       	</div>
       	</s:form>
  </div>
</div>
<script type="text/javascript">
function init(){
	$("#position_articleManage").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
}
</script>
</body>
</html>
