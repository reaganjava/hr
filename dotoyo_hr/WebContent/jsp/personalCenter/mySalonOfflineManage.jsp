<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-我发起的线下沙龙</title>
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
      	<s:form id="pageFrom" name="pageFrom" method="POST" action="salonManageAction!searchSalon.action">
   	 	<s:hidden name="salonInfoDto.salonType" id="salonInfoDto.salonType"/>
    	<div class="administrator-title"><strong>我发起的沙龙[线下沙龙]</strong></div>
        <div class="inside-search">
        	<ul>
            	<li>名称:
            		<s:hidden id="subjectHid" name="salonSearchVo.subject"/>
            		<input type="text" id="subject" value="<s:text name="salonSearchVo.subject"/>" size="12"/>
            	</li>
                <li>起止日期:
                	<s:hidden id="strStartDateHid" name="strStartDate" />
                	<input id="strStartDatex" value="<s:property value="strStartDate"/>" size="11" class="Wdate2" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'strEndDatex\')}'})"/>
                </li>
                <li>
                	<s:hidden id="strEndDateHid" name="strEndDate"/>
                	<input id="strEndDatex" value="<s:property value="strEndDate"/>" size="11" class="Wdate2" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'strStartDatex\')}'})"/>
                </li>
                <li>主办方:
                	<s:hidden id="sponsorHid" name="salonSearchVo.sponsor"/>
                	<input type="text" id="sponsor" value="<s:text name="salonSearchVo.sponsor"/>" size="12"/>
                </li>
	            <li><a href="#" onclick="
	           	document.getElementById('subjectHid').value=document.getElementById('subject').value;
	           	document.getElementById('strStartDateHid').value=document.getElementById('strStartDatex').value;
	           	document.getElementById('strEndDateHid').value=document.getElementById('strEndDatex').value;
	           	document.getElementById('sponsorHid').value=document.getElementById('sponsor').value;
	            document.getElementById('pageFrom').submit()"><img src="<%=request.getContextPath()%>/images/results-list-botton.png" /></a>
	            </li>
            </ul>
        </div>
        <div class="inside-tab">
   	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><input id="selected" name="selected" type="checkbox" value=""/></td>
               <td width="11%" align="left"><strong>沙龙名称</strong></td>
                <td width="10%" height="40" align="left"><strong>主办方</strong></td>
                <td width="6%" align="left"><strong>组织者</strong></td>
                <td width="6%" align="center""><strong>人数</strong></td>
                <td width="11%" align="left"><strong>开始日期</strong></td>
                <td width="11%"  align="left"><strong>截止日期</strong></td>
                <td width="15%" align="left"><strong>地点</strong></td>
                <td width="10%"  align="left"><strong>状态</strong></td>
                <td width="5%" align="left"><strong>操作</strong></td>
                <td width="5%" align="left">&nbsp;</td>
              </tr>
             <s:iterator value="salonList">
              <tr>
                <td width="5%"><input id="arrayIds" name="arrayIds" type="checkbox" value="<s:property value="id"/>"/></td>
                <td width="11%" align="left" title="<s:property value="subject"/>"><span style="width:90px;float:left" class="index_hid_css"><s:property value="subject"/></span></td>
                <td width="10%" height="40" align="left" title="<s:property value="sponsor"/>">
                	<span style="width:110px;float:left" class="index_hid_css"><s:property value="sponsor"/></span>
                </td>
                <td width="6%" align="left" title="<s:property value="userName"/>"><span style="width:70px;float:left" class="index_hid_css"><s:property value="userName"/></span></td>
                <td width="6%" align="center"><s:property value="salonAttendCount"/></td>
                <td width="11%" align="left" nowrap="nowrap"><s:property value="getText('formatDate_yyyy-MM-dd',{startDate})"/></td>
                <td width="11%" align="left" nowrap="nowrap"><s:property value="getText('formatDate_yyyy-MM-dd',{endDate})"/>&nbsp;</td>
                <td width="15%" align="left" class="inside-links" title="<s:property value="location"/>"><span style="width:100px;float:left" class="index_hid_css"><s:property value="location"/></span></td>
                <td width="10%" align="left" >
                    <s:if test='audiFlag=="0"'>
                		待审核
                	</s:if>
                	<s:elseif test='audiFlag=="1"'>
                		审核通过
                	</s:elseif>
                	<s:elseif test='audiFlag=="2"'>
                		审核不通过
                	</s:elseif>
                </td>
                <td width="5%" align="left" class="inside-links">
                 <a href="salonAction!toOffLineSalonDetail.action?salonInfoDto.id=<s:property value="id"/>" target="_blank">查看</a>
                </td>
                <td width="5%" align="left">
                <a href="salonManageAction!toUpdatePage.action?salonInfoDto.id=<s:property value="id"/>">修改</a>
                </td>
              </tr>
            </s:iterator>
            </table>
	</div>
     <div class="qx">
         <s:property value="pageInfo.htmlListTableFootInfo" escapeHtml="false"/>
     </div>
       	<div class="system-botton3">
        	<ul>
                <li class="botton1"><a href="salonManageAction!toLaunchPage.action?salonInfoDto.salonType=<%=ApplicationConstant.SALON_TYPE_OFFLINE%>" title="发起沙龙">发起沙龙</a></li>
                <li class="botton3"><a href="javascript:submitForm4ChangeAction(document.getElementById('pageFrom'),'arrayIds','salonManageAction!deleteSalon.action')" title="删除">删除</a></li>
            </ul>
		</div>
        <div class="num">
    	<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
     </div>

</s:form>
  </div>


</div>
<script type="text/javascript">
function init(){
	$("#position_salonManage").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
	$("#position_offline_salon").addClass("active");
}
</script>
</body>
</html>