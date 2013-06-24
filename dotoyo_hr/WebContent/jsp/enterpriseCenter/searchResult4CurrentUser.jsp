<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理--企业线下人才需求信息列表</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
	<%String path = request.getContextPath();%>
	<script src="<%=path%>/javascripts/My97DatePicker/WdatePicker.js"></script>
</head>
<body onload="init()">
<jsp:include page="/jsp/common/top.jsp" />
<!--以上为头部分-->
<!--中间部分-->
<div class="content"><jsp:include page="left.jsp" />
	<div class="content-right">
		<div class="administrator-title"><strong>企业线下人才需求信息</strong></div>
		<s:form id="searchForm" name="searchForm" method="post" action="offlineSearchResultAction!viewSearchResult4CurrentUser.action">
			<div class="inside-search">
				<ul>
					<li>职位名称：
						<s:textfield name="offlineSearchResultDto.jobKeyWord" size="17"></s:textfield>
					</li>
					<li>职能名称：
						<s:textfield name="offlineSearchResultDto.competencyName" size="17"></s:textfield>
					</li>
					<li>星级指数：
						<s:select name="offlineSearchResultDto.categoryIndex" list="#{null:'所有','1':'1星','2':'2星','3':'3星','4':'4星','5':'5星' }" listKey="key" listValue="value"></s:select>
					</li>
					<li>
						<a href="javascript:clickSearch()">
							<img src="<%=path %>/images/inside-botton.png" width="68" height="25" />
						</a>
					</li>
				</ul>
			</div>
		</s:form>
		<div class="inside-tab">
			<s:form id="listForm" name="listForm" method="post">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="4%" align="center">
							<input id="selected" type="checkbox" value="" />
						</td>
						<td width="20%" height="40" align="left"><strong>职位名称</strong></td>
						<td width="19%" align="left"><strong>职能名称</strong></td>
						<td width="15%" align="left"><strong>行业类型</strong></td>
						<td width="10%" align="left"><strong>星级指数</strong></td>
						<td width="11%" align="left"><strong>更新日期</strong></td>
						<td width="11%" align="left"><strong>有效期至</strong></td>
						<td width="5%" align="left"><strong>操作</strong></td>
						<td width="5%" align="left"><strong>&nbsp;</strong></td>
					</tr>
					<s:iterator value="offlineSearchResultList">
						<tr>
							<td width="4%" align="center">
								<input name="searchResultCheckBox" type="checkbox" value="<s:property value='id'/>" />
							</td>
							<td width="20%" height="40" align="left">
								<span style="width:120px;float:left" class="index_hid_css" title="<s:property value='jobKeyWord'/>">
									<s:property value="jobKeyWord"/>
								</span>
							</td>
							<td width="19%" align="left">
								<span style="width:120px;float:left" class="index_hid_css" title="<s:property value='competencyName'/>">
									<s:property value="competencyName"/>
								</span>
							</td>
							<td width="15%" align="left"><s:property value="industryTypeName"/></td>
							<td width="10%" align="left">
								<s:property value="categoryIndex"/>
							</td>
							<td width="11%" align="left">
								<s:date name="userInfoUpdateDate" format="yyyy-MM-dd" />
							</td>
							<td width="11%" align="left">
								<s:date name="jobExpiryDate" format="yyyy-MM-dd" />
							</td>
							<td width="5%" align="left" class="inside-links">
								<a href="offlineSearchResultAction!toEditSearchResult.action?offlineSearchResultDto.id=<s:property value='id'/>">修改</a>
							</td>
							<td width="5%" align="left">
								<a href="offlineSearchResultAction!toViewSearchResult.action?offlineSearchResultDto.id=<s:property value='id'/>">查看</a>
							</td>
						</tr>
					</s:iterator>
				</table>
			</s:form>
		</div>
		<s:form  id="pageFrom" name="pageFrom" method="POST" action="offlineSearchResultAction!viewSearchResult4CurrentUser.action">
			<s:hidden name="offlineSearchResultDto.jobKeyWord"></s:hidden>
			<s:hidden name="offlineSearchResultDto.competencyName"></s:hidden>
			<s:hidden name="offlineSearchResultDto.categoryIndex"></s:hidden>
			<div class="qx">
				<s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false" />
				<input id="SSS" type="checkbox" value="" />
				<label for="SSS">&nbsp;&nbsp;全选</label>
			</div>
			<div class="system-botton3">
				<ul>
					<li class="botton1" onclick="deleteCertNeeds()">
						<a href="offlineSearchResultAction!toAddSearchResult.action" title="增加">增加</a>
					</li>
					<li class="botton3">
						<a href="javascript:deleteSearchResult(0)" class="openDiv" id="Div1" rel="question2" title="删除">
							删除
						</a>
					</li>
				</ul>
			</div>
			<div class="num"><s:property value="pageInfo.htmlPagingInfo" escapeHtml="false" /></div>
		</s:form>
	</div>
	<script type="text/javascript">
	function deleteSearchResult(){
		if(checkStatus("searchResultCheckBox")){
			if(window.confirm("你确认要进行此操作吗？")){
			document.listForm.action = "offlineSearchResultAction!deleteSearchResult.action";
			document.listForm.submit();
			}
		}
		else{
			alert("请至少选择一条记录");
		}
	}
	function init(){
		$("#position_offlineSearchResult").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
	}
	</script>
</div>
</body>
</html>
