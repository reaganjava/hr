<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-评论管理</title>
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
    	<div class="administrator-title"><strong>评论管理</strong></div>
	   <s:form id="pageFrom" name="pageFrom" method="POST" action="salonManageAction!toCommentManagePage.action">
	    <s:hidden name="goFrom" id="goFrom" value="1"/>
   	    <div class="inside-search">
        	<ul>
            	<li>评论内容:
            		<s:textfield id="contentHid" name="salonSearchVo.content" cssStyle="display:none"/>
            		<input type="text" id="content" value="<s:text name="salonSearchVo.content"/>" size="14"/>
            	</li>
                <li>发表时间:
                	<s:textfield id="strStartDateHid" name="strStartDate" cssStyle="display:none"/>
                	<input id="strStartDatex" value="<s:text name="strStartDate"/>" size="14" class="Wdate2" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'strEndDatex\')}'})"/>

                	&nbsp;&nbsp;
                    <s:textfield id="strEndDateHid" name="strEndDate" cssStyle="display:none"/>
                    <input id="strEndDatex" value="<s:text name="strEndDate"/>" size="14" class="Wdate2" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'strStartDatex\')}'})"/>
                </li>
                <li>状态:
                	<s:select id="statusHid" name="salonSearchVo.status" list="#{null:'所有','1':'通过','0':'待审核','2':'不通过' }" listKey="key" listValue="value" cssStyle="display:none"/>
                	<s:select id="status" value="salonSearchVo.status" list="#{null:'所有','1':'通过','0':'待审核','2':'不通过' }" listKey="key" listValue="value"/>
                </li>
                <li><a href="#" onclick="
                document.getElementById('contentHid').value=document.getElementById('content').value;
                document.getElementById('strStartDateHid').value=document.getElementById('strStartDatex').value;
                document.getElementById('strEndDateHid').value=document.getElementById('strEndDatex').value;
                document.getElementById('statusHid').value=document.getElementById('status').value;
                $('#pageFrom').submit();"><img src="<%=request.getContextPath()%>/images/inside-botton.png" width="68" height="25" /></a></li>
            </ul>
        </div>
        <div class="inside-tab">
   	    <s:hidden name="goFrom" id="goFrom" value="1"/>
   	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><input id="selected" name="selected" type="checkbox" value=""/></td>
                <td width="12%" align="left"><strong>沙龙名称</strong></td>
                <td width="10%" align="left"><strong>评论类型</strong></td>
                <td width="21%" height="40" align="left"><strong>评论类型标题</strong></td>
                <td width="25%" align="left"><strong>评论内容</strong></td>
                <td width="12%" align="left"><strong>发表时间</strong></td>
                <td width="6%" align="left"><strong>状态</strong></td>
                <td width="6%" align="left"><strong>操作</strong></td>
              </tr>
              <s:iterator value="commentList">
              <tr>
                <td width="5%"><input id="arrayIds" name="arrayIds" type="checkbox" value="<s:property value="id"/>"/></td>
                <td width="12%" align="left" title="<s:property value="salonName"/>"><span style="width:100px;float:left" class="index_hid_css"><s:property value="salonName"/></span></td>
                <td width="10%" align="left"><s:property value="subjectType"/></td>
                <td width="21%" height="40" align="left" title="<s:property value="subjectName"/>"><span style="width:130px;float:left" class="index_hid_css"><s:property value="subjectName"/></span></td>
                <td width="25%" height="40" align="left" title="<s:property value="content"/>"><span style="width:150px;float:left" class="index_hid_css"><s:property value="content"/></span></td>
                <td width="12%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{submitDate})"/></td>
                <td width="6%" align="left"><s:property value="status"/></td>
                <td width="6%" align="left" class="inside-links"><a href="salonManageAction!toCommentModifyPage.action?commentDto.id=<s:property value="id"/>">修改</a></td>
              </tr>
              </s:iterator>
            </table>
		</div>
        <div class="qx">
           <s:property value="pageInfo.htmlListTableFootInfo" escapeHtml="false"/>
       </div>
        <div class="shanchu" onclick="submitForm4ChangeAction(pageFrom,'arrayIds','salonManageAction!deleteComment.action')">
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
	$("#position_commentManage").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
}
</script>
</body>
</html>
