<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-系统管理-证书需求管理</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
	<%String path = request.getContextPath(); %>
</head>
<body onload="init()">
	<jsp:include page="/jsp/common/top.jsp" />
	<!--以上为头部分-->
	<!--中间部分-->
	<div class="content">
		<jsp:include page="left.jsp" />
		<div class="content-right">
			<div class="administrator-title"><strong>证书需求管理</strong></div>
			<div class="inside-search">
				<ul>
					<s:form id="searchForm" name="searchForm" method="post" action="certNeedsManageAction!viewSubmitedCertNeedsList.action">
						<li>证书名称：
							<s:textfield name="certNeedsMap.certName" size="8"/>
						</li>
						<li>证书类型：
							<s:textfield name="certNeedsMap.certTypeName" size="8"/>
						</li>
						<li>专业：
							<s:textfield name="certNeedsMap.specialFieldName" size="8"/>
						</li>
					</s:form>
					<li>
						<a href="javascript:clickSearch()">
							<img src="<%=path %>/images/inside-botton.png" width="68" height="25" />
						</a>
					</li>
				</ul>
			</div>
			<div class="inside-tab">
				<s:form id="listForm" name="listForm" method="post">
					<input type="hidden" name="from" value="SubmitedCertNeeds" />
					<s:hidden name="certNeedsMap.certTypeName"></s:hidden>
					<s:hidden name="certNeedsMap.certName"></s:hidden>
					<s:hidden name="certNeedsMap.specialFieldName"></s:hidden>
					<s:hidden name="certNeedsMap.certNeedsStatus"></s:hidden>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="3%" align="center"><input id="selected" type="checkbox" value="" /></td>
							<td width="5%" align="left"><strong>编号</strong></td>
							<td width="12%" align="left"><strong>证书名称</strong></td>
							<td width="10%" height="40" align="left"><strong>证书类型</strong></td>
							<td width="12%" align="left"><strong>挂证地区</strong></td>
							<td width="10%" align="left"><strong>注册状况</strong></td>
							<td width="10%" align="left"><strong>专业</strong></td>
							<td width="9%" align="left"><strong>需求状态</strong></td>
							<td width="9%" align="left"><strong>浏览次数</strong></td>
							<td width="11%" align="left"><strong>发布日期</strong></td>
							<td width="5%" align="left"><strong>操作</strong></td>
							<td width="4%" align="left">&nbsp;</td>
						</tr>
						<s:iterator value="certNeedsList">
							<tr>
								<td width="3%" align="center" valign="middle"><input name="certNeedsCheckBox" type="checkbox" value="<s:property value="id"/>" /></td>
								<td width="5%" align="left"><s:property value="id"/></td>
								<td width="12%" align="left" title="<s:property value='cert.name'/>">
									<span style="width:90px;float:left" class="index_hid_css">
				                    	<s:property value="cert.name"/>
				                    </span>
								</td>
								<td width="10%" height="40" align="left"><s:property value="certType.name"/></td>
								<td width="12%" align="left" title="<s:property value='province.name'/><s:property value='city.name'/><s:property value='area.name'/>">
									<span style="width:90px;float:left" class="index_hid_css">
				                    	<s:property value="city.name"/><s:property value="area.name"/>
				                    </span>
								</td>
								<td width="10%" align="left"><s:property value="registerStatus.name"/></td>
								<td width="10%" align="left" title="<s:property value='specialField.name'/>">
									<span style="width:90px;float:left" class="index_hid_css">
				                    	<s:property value="specialField.name"/>
				                    </span>
								</td>
								<td width="9%" align="left" class="inside-links">
									<s:if test='certNeedsStatus=="0"'>
										未猎证
									</s:if>
									<s:elseif test='certNeedsStatus=="1"'>
										已猎证
									</s:elseif>
									<s:else>
										暂停猎证
									</s:else>
								</td>
								<td width="9%" align="left" class="inside-links"><s:property value="@com.dotoyo.buildjob.certificateCenter.util.CertificateUtil@queryCertNeedsAccessHistoryCountByCertNeedsId(id)"/></td>
								<td width="11%" align="left" class="inside-links"><s:date name="effDate" format="yyyy-MM-dd"></s:date></td>
								<td width="5%" align="left" class="inside-links">
									<a href="certNeedsManageAction!toEditCertNeeds.action?certNeedsId=<s:property value='id'/>&from=SubmitedCertNeeds">修改</a>
								</td>
								<td width="4%" align="left"><a href="certNeedsManageAction!viewCertNeedsDetail.action?certNeedsId=<s:property value='id'/>&from=SubmitedCertNeeds">查看</a></td>
							</tr>
						</s:iterator>
					</table>
				</s:form>
			</div>
			<s:form  id="pageFrom" name="pageFrom" method="POST" action="certNeedsManageAction!viewSubmitedCertNeedsList.action">
				<s:hidden name="certNeedsMap.certTypeName"></s:hidden>
				<s:hidden name="certNeedsMap.certName"></s:hidden>
				<s:hidden name="certNeedsMap.specialFieldName"></s:hidden>
				<s:hidden name="certNeedsMap.certNeedsStatus"></s:hidden>
				<div class="qx">
					<s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
					<input id="SSS" name="" type="checkbox" value="" />
					<label for="SSS">&nbsp;&nbsp;全选</label>
				</div>
				<div class="system-botton">
					<ul>
						<li class="botton1"><a href="certNeedsManageAction!toAddCertNeeds.action" title="增加">增加</a></li>
						<li class="botton2"><a href="javascript:deleteCertNeeds()" title="删除">删除</a></li>
						<li class="botton3"><a href="javascript:editCertNeedsStatus(2)" title="暂停猎证">暂停猎证</a></li>
						<li class="botton3"><a href="javascript:editCertNeedsStatus(0)" title="未猎证">未猎证</a></li>
						<li class="botton3"><a href="javascript:editCertNeedsStatus(1)" title="已猎证">已猎证</a></li>
					</ul>
				</div>
				<div class="num">
					<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
				</div>
			</s:form>
		</div>
	</div>
	<script type="text/javascript">
		function deleteCertNeeds(){
			if(checkStatus("certNeedsCheckBox")){
				if(window.confirm("你确认要进行此操作吗？")){
				document.listForm.action = "certNeedsManageAction!deleteCertNeeds.action";
				document.listForm.submit();
				}
			}
			else{
				alert("请至少选择一条记录");
			}
		}
		function editCertNeedsStatus(certNeedsStatus){
			if(checkStatus("certNeedsCheckBox")){
				if(window.confirm("你确认要进行此操作吗？")){
				document.listForm.action = "certNeedsManageAction!editCertNeedsStatus.action?certNeedsStatus="+certNeedsStatus;
				document.listForm.submit();
				}
			}
			else{
				alert("请至少选择一条记录");
			}
		}
		function clickSearch(){
			document.searchForm.submit();
		}
		function init(){
			$("#position_certNeeds").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
			$("#position_submitedCertNeeds").addClass("active");
		}
	</script>
</body>
</html>
