<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>大太阳建筑猎头-创业沙龙-沙龙搜索结果</title>
<s:include value="/jsp/common/JsAndCss.jsp"/>
<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<s:include value="/jsp/common/head.jsp"/>
<s:include value="innovationSalonNav.jsp"/>
<!--以上为头部分-->
<!--中间部分-->
<s:form  id="pageFrom" name="pageFrom" method="POST" action="salonSearchAction!searchSalon.action">
<s:hidden id="salonSearchVo.salonType" name="salonSearchVo.salonType"/>
<s:hidden id="salonSearchVo.isExcellent" name="salonSearchVo.isExcellent"/>
<s:hidden id="salonSearchVo.oldSalonFlag" name="salonSearchVo.oldSalonFlag"/>
<s:hidden name="salonSearchVo.userName"/>
<s:hidden name="salonSearchVo.content"/>
<div class="index-login-box">
  <div class="jobs-title"><strong>
  <s:if test="(salonSearchVo.oldSalonFlag == null || salonSearchVo.oldSalonFlag == '') && (salonSearchVo.isExcellent == null || salonSearchVo.isExcellent == '')">
  	沙龙搜索
  </s:if>
  <s:elseif test="salonSearchVo.isExcellent != null && salonSearchVo.isExcellent != ''">
  	经典沙龙搜索
  </s:elseif>
  <s:elseif test="salonSearchVo.oldSalonFlag != null && salonSearchVo.oldSalonFlag != ''">
        往届沙龙搜索
  </s:elseif>
  </strong>
  <span>
  	<s:if test="salonSearchVo.userName != null && salonSearchVo.userName != ''">
  		当前搜索条件:沙龙发起人[
  		<s:text name="salonSearchVo.userName"/>
  		]
  		&nbsp;
  	</s:if>
  	<s:if test="salonSearchVo.subject!=null && salonSearchVo.subject!=''">
  		当前搜索条件:沙龙名称[
  		<s:text name="salonSearchVo.subject"/>
  			]
  	</s:if>
  	<s:if test="salonSearchVo.content!=null && salonSearchVo.content!=''">
  		当前搜索条件:沙龙简介[
  			<s:text name="salonSearchVo.content"/>
  			]
	</s:if>
  </span>
  </div>
  <div class="results-list">
       <ul>
           <li class="results0">沙龙名称：</li>
           <li class="results1">
           		
           		<input type="text" id="salonSearchVo.subject" name="salonSearchVo.subject" value="<s:text name="salonSearchVo.subject"/>"/>
           </li>
            <s:if test="(salonSearchVo.salonType==0) ">
           <li class="results0">主办方：</li>
           <li class="results1">
           		<s:textfield id="sponsorHid" name="salonSearchVo.sponsor" cssStyle="display:none"/>
           		<input type="text" id="sponsor" value="<s:text name="salonSearchVo.sponsor"/>"/>
           </li>
             </s:if>
           <li class="results0">起止时间：</li>
           <li class="results1">
           		<s:hidden id="strStartDateHid"  name="strStartDate" />
           		<input id="strStartDatex"  size="15" value="<s:property value="strStartDate"/>" class="Wdate2" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'strEndDatex\')}'})"/>
           	</li>
           <li class="results0"></li>

           <li class="results1">
           		<s:hidden id="strEndDateHid" name="strEndDate" />
           		<input id="strEndDatex" size="15" value="<s:property value="strEndDate"/>" class="Wdate2" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'strStartDatex\')}'})"/>
           	</li>

           <li><a href="#" onclick="clickSearch();return false;"><img src="<%=request.getContextPath()%>/images/results-list-botton.png" /></a>
           </li>
       </ul>
  </div>
  <div class="results-list-tab">
<table width="100%" border="0" cellspacing="0" cellpadding="0" >

              <tr>
                <td width="16%" height="40" align="left"><strong>沙龙名称</strong></td>
                 <s:if test="(salonSearchVo.salonType==0) ">
                <td width="12%" align="left"><strong>主办方</strong></td>
                </s:if>
                <td width="13%" align="left"><strong>组织者</strong></td>
                <td width="8%" align="left"><strong>总人数</strong></td>
                <td width="10%"  align="left"><strong>开始日期</strong></td>
                <td width="10%" align="left"><strong>截止日期</strong></td>
                <s:if test="(salonSearchVo.salonType==0) ">
                <td width="20%" align="left"><strong>地点</strong></td>
                </s:if>
                <td width="7%" align="left"><strong>方式</strong></td>
              </tr>

           <s:iterator value="salonList">
              <tr>
                <td width="16%" height="40" align="left">
                <s:if test="salonType == 1">
                <a href="salonAction!toSalonDetail.action?salonInfoDto.id=<s:property value="id"/>" target="_blank"><s:property value="subject"/>
                </a>
                </s:if>
                <s:else>
                <a href="salonAction!toOffLineSalonDetail.action?salonInfoDto.id=<s:property value="id"/>" target="_blank"><s:property value="subject"/>
                </a>
                </s:else>
                </td>
                <s:if test="(salonSearchVo.salonType==0) ">
                <td width="12%" align="left">
                	<span style="width:120px;float:left" class="index_hid_css" title="<s:property value='sponsor'/>">
                		<s:property value="sponsor"/>
                	</span>
                </td>
                </s:if>
                
                <td width="13%" align="left"><s:property value="userName"/></td>
                <td width="8%" align="left"><s:property value="salonAttendCount"/></td>
                <td width="10%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{startDate})"/></td>
                <td width="10%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{endDate})"/></td>
              <s:if test="(salonSearchVo.salonType==0) ">
                <td width="20%" align="left"><span style="width:140px;float:left" class="index_hid_css"><s:property value="location"/></span></td>
                </s:if>
                <td width="7%" align="left"><s:property value="salonTypeText"/></td>
              </tr>
            </s:iterator>

            </table>
  </div>

</div>
<div class="qx">
     <s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
</div>
<div class="num">
      <s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
</div>
</s:form>
<s:include value="/jsp/common/bottom.jsp"/>
<script type="text/javascript">
function clickSearch(){

	if(document.getElementById('strStartDateHid')!=null&&document.getElementById('strStartDatex')!=null){
		document.getElementById('strStartDateHid').value=document.getElementById('strStartDatex').value;
	}
	if(document.getElementById('strEndDateHid')!=null&&document.getElementById('strEndDatex')!=null){
		document.getElementById('strEndDateHid').value=document.getElementById('strEndDatex').value;
	}
	if(document.getElementById('sponsorHid')!=null&&document.getElementById('sponsor')!=null){
		document.getElementById('sponsorHid').value=document.getElementById('sponsor').value;
	}
    document.getElementById('pageFrom').submit();
}
</script>
</body>
</html>
