<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理--我提交的证书管理</title>
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
			<div class="administrator-title"><strong>已提交证书</strong></div>
			<div class="inside-search">
				<ul>
					<s:form id="searchForm" name="searchForm" method="post" action="personalCertManageAction!searchSubmitedCert.action">
						<li>证书名称：
							<s:textfield name="personalCertMap.certName" size="17"/>
						</li>
						<li>手机号码：
							<s:textfield name="personalCertMap.cellPhone" size="17"/>
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
				<s:form id="listForm" name="listForm" method="post" action="personalCertManageAction!editCertAttachStatus.action">
					<s:hidden name="personalCertMap.certName"/>
					<s:hidden name="personalCertMap.cellPhone"/>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="2%"><input id="selected" name="" type="checkbox" value="" /></td>
						
							<td width="3%" height="40" align="left"><strong>编号</strong></td>
							<td width="7%" height="40" align="left"><strong>证书名称</strong></td>
							<td width="9%" align="left"><strong>证书类型</strong></td>
							<td width="11%" align="left"><strong>所在地区</strong></td>
							<td width="9%" align="left"><strong>注册状况</strong></td>
							<td width="10%" align="left"><strong>专业</strong></td>
							<td width="9%" align="left"><strong>手机</strong></td>
							<td width="10%" align="left"><strong>证书状态</strong></td>
							<td width="12%"  align="left"><strong>提交日期</strong></td>
							<td width="9%"  align="left"><strong>浏览次数</strong></td>
							<td width="5%" align="left"><strong>操作</strong></td>
							<td width="4%" align="left">&nbsp;</td>
						</tr>
						<s:iterator value="personalCertList">
							<tr>
								<td width="2%"><input name="personalCertCheckBox" type="checkbox" value="<s:property value="id"/>" /></td>
								<td width="3%" height="40" align="left">
									<span style="width:70px;float:left" class="index_hid_css" title="<s:property value='cert.name'/>">
										<s:property value="id"/>
									</span>
								</td>
								<td width="7%" height="40" align="left">
									<span style="width:70px;float:left" class="index_hid_css" title="<s:property value='cert.name'/>">
										<s:property value="cert.name"/>
									</span>
								</td>
								<td width="9%" align="left">
									<span style="width:68px;float:left" class="index_hid_css" title="<s:property value='certType.name'/>">
										<s:property value="certType.name"/>
									</span>
								</td>
								<td width="11%" align="left">
									<span style="width:80px;float:left" class="index_hid_css" title="<s:property value='province.name'/><s:property value='city.name'/><s:property value='area.name'/>">
										<s:property value="city.name"/><s:property value="area.name"/>
									</span>
								</td>
								<td width="9%" align="left"><s:property value="registerStatus.name"/></td>
								<td width="10%" align="left">
									<span style="width:70px;float:left" class="index_hid_css" title="<s:property value='specialField.name'/>">
										<s:property value="specialField.name"/>
									</span>
								</td>
								<td width="9%" align="left">
									<span style="width:60px;float:left" class="index_hid_css" title="<s:property value='cellPhone'/>">
										<s:property value="cellPhone"/>
									</span>
								</td>
								<td width="10%" align="left">
									<s:if test='certStatus=="0"'>
										未挂靠
									</s:if>
									<s:if test='certStatus=="1"'>
										已挂靠
									</s:if>
									<s:if test='certStatus=="2"'>
										暂停挂靠
									</s:if>
								</td>
								<td width="12%" align="left"><s:property value="getText('formatDate_yyyy-MM-dd',{submitDate})"/></td>
								<td width="9%" align="center">
										<s:property value="@com.dotoyo.buildjob.certificateCenter.util.CertificateUtil@queryCertAccessHistoryCountByCertId(id)"/>
								</td>
								<td width="5%" align="left" class="inside-links">
									<a href="personalCertManageAction!viewPersonalCertDetail.action?personalCertId=<s:property value='id'/>">查看</a>
								</td>
								<td width="4%" align="left">
									<a href="personalCertManageAction!toEditPersonalCert.action?personalCertId=<s:property value='id'/>">修改</a>
								</td>
							</tr>
						</s:iterator>
					</table>
				</s:form>
			</div>
			<s:form  id="pageFrom" name="pageFrom" method="POST" action="personalCertManageAction!searchSubmitedCert.action">
				<s:hidden name="personalCertMap.certName"/>
				<s:hidden name="personalCertMap.cellPhone"/>
				<div class="qx">
					<s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
					<input id="SSS" name="" type="checkbox" value="" />
					<label for="SSS">&nbsp;&nbsp;全选</label>
				</div>
				<div class="system-botton">
					<ul>
						<li class="botton1"><a href="personalCertManageAction!toSubmitCert.action" title="增加">增加</a></li>
						<li class="botton2"><a href="javascript:deletePersonalCert()" title="删除" >删除</a></li>
						<li class="botton3"><a href="javascript:editCertAttachStatus('1')" title="设为挂靠">设为挂靠</a></li>
						<li class="botton3"><a href="javascript:editCertAttachStatus('0')" title="取消挂靠">取消挂靠</a></li>
						<li class="botton3"><a href="javascript:editCertAttachStatus('2')" title="暂停挂靠">暂停挂靠</a></li>
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
		function editCertAttachStatus(certStatus){
			if(checkStatus("personalCertCheckBox")){
				if(window.confirm("你确认要进行此操作吗？")){
				document.listForm.action = "personalCertManageAction!editCertAttachStatus.action?certStatus="+certStatus;
				document.listForm.submit();
				}
			}
			else{
				alert("请至少选择一条记录");
			}
		}
		function deletePersonalCert(){
			if(checkStatus("personalCertCheckBox")){
				if(window.confirm("你确认要进行此操作吗？")){
				document.listForm.action = "personalCertManageAction!deletePersonalCert.action";
				document.listForm.submit();	
				}
			}
			else{
				alert("请至少选择一条记录");
			}
		}
		function init(){
			$("#position_personalCertManage").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
			$("#position_submitedPersonalCert").addClass("active");
		}
	</script>
</body>
</html>