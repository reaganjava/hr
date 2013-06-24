<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-企业后台</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
	<script type="text/javascript">
		function init(){
			$("#position_zhaoping_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
			$("#position_zhaoping_received").addClass("active");
		}
	</script>
	<style>
		.rcss-p{width:100%;padding:0px 15px 0px 10px; font-size:14px;}
		.rcss-p-left{float:left;width:100%;font-size:12px;color:#666; line-height:30px;height:126px;padding-left:10px;text-align:left;}
		.rcss-p-left p strong{font-weight:normal;color:#000;}
	</style>
</head>

<body onload="init()">
<jsp:include page="/jsp/common/top.jsp"></jsp:include>
<!--中间部分-->
<div class="content">
	<jsp:include page="left.jsp"></jsp:include>
    <div class="content-right">
    	<div class="administrator-title"><strong>职位申请详情</strong></div>
    	<s:form  id="pageFrom" name="pageFrom" method="POST" action="applicationsReceivedAction!detailsOfJobApplications.action">
    	<s:hidden id="showAbstract" name="showAbstract"></s:hidden>
    	<div class="inside-search2">
        	<ul>
            	<li>申请人姓名:<s:textfield name="blogUser.userName" size="12"/></li>
            	<li>专长:<s:textfield name="blogUser.metier" size="12"/></li>
            	<li>状态:<s:select list="appStatusMap" name="blogUser.status" value="blogUser.status"></s:select></li>
                <li id="inside-search-input"><input type="image" src="<%=request.getContextPath()%>/images/inside-botton.png" /></li>
            </ul>
      	</div>
        <div class="inside-search" style="line-height:30px;">
            <ul>
            	<li>显示：</li>
            	<li><a id="showPatternbt" href="javascript:void(0)" onclick="showPatternbt();">标题显示</a></li>
            	<li><a id="showPatternzy" href="javascript:void(0)" onclick="showPatternzy();">摘要显示</a></li>
            	<li>&nbsp;</li>
            </ul>
        	<ul>
            	<li>排序：</li>
            	<li><a href="javascript:void(0)" onclick="orderDisplay('categoryIndex');return false;">星级指数</a></li>
            	<li><a href="javascript:void(0)" onclick="orderDisplay('applicationDate');return false;">申请时间</a></li>
            </ul>
        </div>
        <div class="inside-tab">
        <s:hidden name="jobId"></s:hidden>
        <s:hidden name="applyJobQueryType"></s:hidden>
   	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="2%" align="left"><input id="selected" name="selected" type="checkbox" /></td>
                <td width="12%" align="left"><strong>申请人</strong></td>
                <td width="8%" align="left"><strong>发布求职</strong></td>
                <td width="8%" align="left"><strong>更新时间</strong></td>
                <td width="5%" align="left"><strong>新信息</strong></td>
                <td width="8%" align="left"><strong>星级指数</strong></td>
                <td width="9%" align="left"><strong>状态</strong></td>
                <td width="8%" align="left"><strong>申请时间</strong></td>
              </tr>
              <s:iterator value="jobApplicationDetailList">
	              <tr>
	              	<td width="2%" align="left"><input name="candidates" type="checkbox" value="<s:property value="id"/>-<s:property value="userId"/>" /></td>
	                <td width="12%" align="left">
	                	<a 	style="width:140px;float:left" class="index_hid_css"
	                		onclick="javascript:linkBoStation(<s:property value="id"/>,<s:property value="userId"/>);" 
	                		href="javascript:void(0)"
	                		title="<s:property value='userName'/>"
	                	>
	                		<s:property value="userName"/>
	                	</a>
	               	</td>
	                <td width="8%" align="left">
	                	<s:if test="havePublished>0">
	                		是
	                	</s:if>
	                	<s:else>
	                		否
	                	</s:else>
	                </td>
	                <td width="8%" align="left">
	                	<span style="width:120px;float:left" class="index_hid_css" title="<s:property value='userInfoUpdateDate'/>">
	                    	<s:property value="userInfoUpdateDate"/>
	                    </span>
	                </td>
	                <td width="5%" align="left">
	                	<a href="shortMsgManageAction!viewRecieveShortMsgList.action?shortMessageDto.status=0&shortMessageDto.senderId=<s:property value='userId'/>"><s:text name="newMsgCount"/></a>
	                </td>
	                <td width="8%" height="40" align="left"><s:property value="categoryIndex"/></td>
	                <td width="9%" align="left">
	                	<s:if test='status=="2"'>
	                		已发面试邀请
	                	</s:if>
	                	<s:elseif test='status=="0"'>
	                		未查看
	                	</s:elseif>
	                	<s:elseif test='status=="1"'>
	                		已查看未邀请
	                	</s:elseif>
	                </td>
	                <td width="8%" align="left" onclick="showSingle(this);" class="showSingle">
	                	<s:property value="getText('formatDate_yyyy-MM-dd',{applicationDate})"/>
	                	<img  src="<%=request.getContextPath()%>/images/abstract-text-icon.gif" width="7" height="12" />
	                </td>
	              </tr>
	              <tr class="abstractInfo" style="display:none;">
	              	<td colspan="8">
						<div class="rcss-p" >
					    	<div class="rcss-p-left">
					        	<p>
					            	<strong>姓名：</strong><s:property value="companyName"/>&nbsp;&nbsp;&nbsp;&nbsp;
					            	<strong>专长：</strong><s:property value="metier"/>&nbsp;&nbsp;&nbsp;&nbsp;
					            	<strong>专业：</strong><s:property value="specializedType"/>&nbsp;&nbsp;&nbsp;&nbsp;
					            	<br />
					            	<strong>意向职位：</strong><s:property value="expectedPosition"/>&nbsp;&nbsp;&nbsp;&nbsp;
					                <strong>意向工作地点：</strong><s:property value="provinceCode"/> <s:property value="cityCode"/> <s:property value="areaCode"/>&nbsp;&nbsp;&nbsp;&nbsp;
					                <strong>学历：</strong><s:property value="education"/>&nbsp;&nbsp;&nbsp;&nbsp;
					                <br/>
					                <strong>人才编号：</strong><s:property value="id"/>&nbsp;&nbsp;&nbsp;&nbsp;
					                <strong>工作年限：</strong><s:property value="workingLife"/>&nbsp;&nbsp;&nbsp;&nbsp;
					                <strong>职能：</strong><s:property value="competency"/>
					                <strong>行业：</strong><s:property value="industryType"/>&nbsp;&nbsp;&nbsp;&nbsp;
					                <strong>年龄：</strong><s:property value="age"/>&nbsp;&nbsp;&nbsp;&nbsp;
					                <strong>性别：</strong><s:if test='sex=="1"'>男</s:if><s:elseif test='sex=="0"'>女</s:elseif><s:else>不限</s:else>&nbsp;&nbsp;&nbsp;&nbsp;
					                <br/>
					                <strong>语言能力：</strong><s:property value="langCapa"/>&nbsp;&nbsp;&nbsp;&nbsp;
					                <strong>掌握程度：</strong><s:property value="mastery"/>&nbsp;&nbsp;&nbsp;&nbsp;
					                <strong>计算机能力：</strong><s:property value="computerGrade"/>&nbsp;&nbsp;&nbsp;&nbsp;
					                <strong>顾问：</strong><s:if test='isAdviser=="Y"'>是</s:if><s:else>否</s:else>&nbsp;&nbsp;&nbsp;&nbsp;
					                <strong>工作性质：</strong><s:property value="jobNature"/>
							  </p>
					        </div>
					    </div>
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
                <li class="botton1"><a href="#" title="删除" onclick="removeCandidates('candidates');return false;">删除</a></li>
                <li class="botton2"><a href="#" title="发送面试邀请" onclick="interviewInvite('candidates');return false;">发送面试邀请</a></li>
            </ul>
		</div>
	    <div class="num">
	    	<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
	    </div>
	    </s:form>
	</div>
</div>
<script type="text/javascript">
function removeCandidates(checkboxName){
	if(checkStatus(checkboxName)==false) {
		alert('请至少选中一条记录');
	}else{
		if(window.confirm("你确认要进行此操作吗？")){
			document.pageFrom.action='applicationsReceivedAction!removeCandidates.action';
			document.pageFrom.method='post';
			document.pageFrom.submit();
		}
	}
}

function interviewInvite(checkboxName){
	var checkbox = document.getElementsByName(checkboxName);
	var n=0;
	for(i=0;i<checkbox.length;i++){
		if(checkbox[i].checked){
			++n;
		}
	}
	if(checkStatus(checkboxName)==false) {
		alert('请至少选中一条记录');
	}else{
		if(window.confirm("你确认要进行此操作吗？")){
			var jurl = "applicationsReceivedAction!userAuthenticationService.action?checked="+n;
			$.ajax({
				url:jurl,
				type:'post',
				dataType:'json',
				success:function(json){
					if(json!="0"){
						alert("该服务可用次数已小于"+json+"次!");
					}else{
						document.pageFrom.action='applicationsReceivedAction!interviewInvite.action?status=2';
						document.pageFrom.method='post';
						document.pageFrom.submit();
					}
				}
			});
			return false;
		}
	}
}
function linkBoStation(appId,userId){
	var jurl = "applicationsReceivedAction!linkBoStation.action?appIds="+appId+"&status=1";
	$.ajax({
		url:jurl,
		type:'post',
		dataType:'json',
		error:function(json){
			alert("链接博站失败");
		},
		success:function(json){
			if(json=="1"){
				alert("成功链接到博站...");
				location.reload();
			}else{
				alert("链接博站失败");
			}
		}
	});
	return false;
}

function orderDisplay(columnName){
	document.pageFrom.action='applicationsReceivedAction!detailsOfJobApplications.action?columnName='+columnName;
	document.pageFrom.method='post';
	document.pageFrom.submit();
}

// 标题与摘要
function showPatternzy(){
	$("#showAbstract").val("1");
	$(".abstractInfo").show();
	return false;
}
function showPatternbt(){
	$("#showAbstract").val("0");
	$(".abstractInfo").hide();
	return false;
}
$(document).ready(function(){
	var showAbstract = $("#showAbstract").val();
	if(showAbstract == "1"){
		$(".abstractInfo").show();
	}
});
function showSingle(obj){
	
	if($(obj).parent().next().attr("style").indexOf("none")>0){
		$(obj).parent().next().show();				
	}
	else{
		$(obj).parent().next().hide();
	}
}
</script>
</body>
</html>