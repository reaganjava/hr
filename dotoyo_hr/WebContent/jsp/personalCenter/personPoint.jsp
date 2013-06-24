<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--积分明细查询</title>
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
    	<div class="administrator-title"><strong>积分明细查询</strong></div>
        <div class="inside-tab">
   	    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="line">
              <tr>
                <td width="29%" height="40" align="left"><em></em><strong>现有积分</strong>：
                	<s:if test="loginUserInfoDto.point != null">
                		<s:text name="loginUserInfoDto.point"/>
                	</s:if>
                	<s:else>
                		0
                	</s:else>
                </td>
                <td align="left" class="tab-input"></td>
              </tr>
            </table>
  		</div>
  </div>
</div>
<script type="text/javascript">
function init(){
	$("#position_pointManage").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
	$("#position_pointDetail").addClass("active");
}
</script>
</body>
</html>
