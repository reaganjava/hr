<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--我参与的线上沙龙</title>
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
      	<s:form id="pageFrom" name="pageFrom" method="POST" action="salonManageAction!searchMyJoinSalonList.action">
   	 	<s:hidden name="salonInfoDto.salonType" id="salonInfoDto.salonType"/>
    	<div class="administrator-title"><strong>我参与的沙龙[线上沙龙]</strong></div>
        <div class="inside-search">
        	<ul>
            	<li>名称：
            		<s:hidden id="subjectHid" name="salonSearchVo.subject"/>
            		<input type="text" id="subject" value="<s:text name="salonSearchVo.subject"/>" size="12"/>
            	</li>
                <li>起止日期：
                	<s:hidden id="strStartDateHid" name="strStartDate" />
                	<input id="strStartDatex" value="<s:property value="strStartDate"/>" size="15" class="Wdate2" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'strEndDatex\')}'})"/>
                </li>
                <li>
                	<s:hidden id="strEndDateHid" name="strEndDate"/>
                	<input id="strEndDatex" value="<s:property value="strEndDate"/>" size="15" class="Wdate2" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'strStartDatex\')}'})"/>
                </li>
	            <li><a href="#" onclick="
	           	document.getElementById('subjectHid').value=document.getElementById('subject').value;
	           	document.getElementById('strStartDateHid').value=document.getElementById('strStartDatex').value;
	           	document.getElementById('strEndDateHid').value=document.getElementById('strEndDatex').value;
	            document.getElementById('pageFrom').submit()"><img src="<%=request.getContextPath()%>/images/results-list-botton.png" /></a>
	            </li>
            </ul>
        </div>
        <div class="inside-tab">

   	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><input id="selected" name="selected" type="checkbox" value=""/></td>
                <td width="25%" height="40" align="left"><strong>沙龙名称</strong></td>
                <td width="20%" align="left"><strong>组织者</strong></td>
                <td width="10%" align="left"><strong>参加人数</strong></td>
                <td width="13%" align="left"><strong>开始日期</strong></td>
                <td width="13%"  align="left"><strong>截止日期</strong></td>
                <td width="6%" align="left"><strong>操作</strong></td>
                <td width="11%" align="left">&nbsp;</td>
              </tr>
             <s:iterator value="salonList">
              <tr>
                <td width="5%"><input id="arrayIds" name="arrayIds" type="checkbox" value="<s:property value="id"/>"/></td>
                <td width="25%" height="40" align="left" title="<s:property value="subject"/>"><span style="width:150px;float:left" class="index_hid_css"><s:property value="subject"/></span></td>
                <td width="20%" align="left"><s:property value="userName"/></td>
                <td width="10%" align="left"><s:property value="salonAttendCount"/></td>
                <td width="13%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{startDate})"/></td>
                <td width="13%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{endDate})"/></td>
                <td width="6%" align="left" class="inside-links">
                  <a href="salonAction!toSalonDetail.action?salonInfoDto.id=<s:property value="id"/>" target="_blank">查看</a>
                </td>
                 <td width="11%" align="left"><a href="salonManageAction!mySalonArticleList.action?salonMediaDto.salonId=<s:property value="id"/>" target="_blank">本人观点</a></td>
              </tr>
            </s:iterator>
            </table>
	</div>
     <div class="qx">
         <s:property value="pageInfo.htmlListTableFootInfo" escapeHtml="false"/>
     </div>
       	<div class="shanchu"><a href="javascript:submitForm4ChangeAction(document.getElementById('pageFrom'),'arrayIds','salonManageAction!cancelJoinSalon.action')" title="取消参与">取消参与</a></div>
        <div class="num">
    	<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
     </div>

</s:form>
  </div>


</div>
<script type="text/javascript">
function init(){
	$("#position_attendSalon").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
	$("#position_attendOnlineSalon").addClass("active");
}
</script>
</body>
</html>