<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>${personalCertVo.cert.name}验证、查询、挂靠-猎证中心-大太阳建筑猎头网</title>
	<meta content="${personalCertVo.cert.name}相关信息查询，验证" name="description">
	<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
	<jsp:include page="../common/JsAndCss.jsp"/>
	<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
	<script src="<%=request.getContextPath()%>/jsp/certificateCenter/certificate.js"></script>
	
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<s:include value="certificateCenterNav.jsp"/>
<!--以上为头部分-->
<!--证书搜索~绝对定位-->
<div class="zs-down" id="showMenuID">

     <div class="zs-down1" id="certTypeDiv" style="display:none;">
        <ul>
            <s:iterator value="certificateTypeList">
	               <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'certTypeText','certTypeCode');setCert();"><s:property value="name"/></a></li>
	        </s:iterator>
        </ul>
     </div>
     <div class="jobs-down7" id="specialFieldDiv" style="display:none;">
    	  <ul>
    	    <s:iterator value="specialFieldList">
    	    	<s:if test='parentCode=="003"'>
    	    		<li class="specializedDiv" style="width:400px;"><label><strong><s:property value="name"/></strong></label></li>
    	    	</s:if>
    	    	<s:else>
    	    		<li style="width:145px;float:left" class="index_hid_css" title="<s:property value='name'/>">
    	    			<a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'specialFieldText','specialFieldCode');return false;"><s:property value="name"/></a>
    	    		</li>
    	    	</s:else>
    	  	</s:iterator>
		  </ul>
     </div>
     <div class="zs-down1" id="certDiv" style="display:none;">
		<ul id="certId">
			<s:iterator value="certList">
				<li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'certText','certCode')"><s:property value="name"/></a></li>
			</s:iterator>
		</ul>
     </div>
     <div class="zs-down2" id="searchDown2" style="display:none;">
		<ul>
		  	<s:iterator value="provinceList">
		           <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'province','hiddenProvince');setCity('#hiddenProvince','citySearch','hiddenCity','#hiddenCity','areaSearch','hiddenArea')"><s:property value="name"/></a></li>
		    </s:iterator>
		</ul>
     </div>
     <div class="zs-down2" id="searchDown3" style="display:none;">
    	<ul id="cityId">
    		<s:iterator value="cityList">
    			<li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'citySearch','hiddenCity');setArea();"><s:property value="name"/></a></li>
    		</s:iterator>
		</ul>
     </div>
     <div class="zs-down2" id="searchDown4" style="display:none;">
		<ul id="areaId">
			<s:iterator value="areaList">
				<li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'areaSearch','hiddenArea')"><s:property value="name"/></a></li>
			</s:iterator>
		</ul>
     </div>
     <div class="zs-down3" id="registerStatusDiv" style="display:none;">
    	  <ul>
    	  	<s:iterator value="registerStatusList">
    	  		 <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'registerStatusText','registerStatusCode')"><s:property value="name"/></a></li>
    	  	</s:iterator>
		  </ul>
     </div>
</div>
<!--中间部分-->
<div class="requirements-top-box">
	<div class="requirements-top-line">
	<s:form id="personalCertSearchForm" name="personalCertSearchForm" method="post" action="<%=request.getContextPath()%>/search_persionalcert/" >
        <div class="requirements-top">
          <div class="requirements-top-left">
        			<div class="zs-div">
                        <ul>
                            <li class="zs0">证书类型：</li>
                            <li class="zs1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#certTypeText', '#certTypeDiv')" />
                            	<s:if test="personalCertVo.certType.name==null||personalCertVo.certType.name==''">
                            		<input id="certTypeText" name="personalCertVo.certType.name" type="text" value="请选择证书类型" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="certTypeText" name="personalCertVo.certType.name" type="text" value="<s:property value='personalCertVo.certType.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="personalCertDto.certTypeCode==null||personalCertDto.certTypeCode==''">
                            		<input id="certTypeCode" name="personalCertDto.certTypeCode" type="text" value=""/>
                            	</s:if>
                            	<s:else>
                            		<input id="certTypeCode" name="personalCertDto.certTypeCode" type="text" value="<s:property value='personalCertDto.certTypeCode'/>"/>
                            	</s:else>
                            </li>
                        </ul>
                    </div>
                    <div class="zs-div">
                        <ul>
                            <li class="zs0">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</li>
                            <li class="zs1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#specialFieldText', '#specialFieldDiv')" />
                            	<s:if test="personalCertVo.specialField.name==null||personalCertVo.specialField.name==''">
                            		<input id="specialFieldText" name="personalCertVo.specialField.name" type="text" value="请选择专业职能" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="specialFieldText" name="personalCertVo.specialField.name" type="text" value="<s:property value='personalCertVo.specialField.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="personalCertDto.specialFieldCode==null||personalCertDto.specialFieldCode==''">
                            		<input id="specialFieldCode" name="personalCertDto.specialFieldCode" type="hidden" value=""/>
                            	</s:if>
                            	<s:else>
                            		<input id="specialFieldCode" name="personalCertDto.specialFieldCode" type="hidden" value="<s:property value='personalCertDto.specialFieldCode'/>"/>
                            	</s:else>
                           	</li>  
                        </ul>
                    </div>
					<div class="zs-div">
                        <ul>
                            <li class="zs0">证书名称：</li>
                            <li class="zs1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#certText', '#certDiv');" />
                            	<s:if test="personalCertVo.cert.name==null||personalCertVo.cert.name==''">
                            		<input id="certText" name="personalCertVo.cert.name" type="text" value="请选择证书名称" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="certText" name="personalCertVo.cert.name" type="text" value="<s:property value='personalCertVo.cert.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="personalCertDto.certCode==null||personalCertDto.certCode==''">
                            	    <input id="certCode" name="personalCertDto.certCode" type="hidden" value=""/>
                            	</s:if>
                            	<s:else>
                            		<input id="certCode" name="personalCertDto.certCode" type="hidden" value="<s:property value='personalCertDto.certCode'/>"/>
                            	</s:else>
                            </li>
                        </ul>
                    </div>
                    <div class="zs-div">
                        <ul>
                            <li class="zs0">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区：</li>
                            <li class="zs2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#province', '#searchDown2')" />
                            	<s:if test="personalCertVo.province.name==null||personalCertVo.province.name==''">
	                            	<input id="province" name="personalCertVo.province.name" type="text" value="省份" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="province" name="personalCertVo.province.name" type="text" value="<s:property value='personalCertVo.province.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="personalCertDto.provinceCode==null||personalCertDto.provinceCode==''">
                            		<input id="hiddenProvince" name="personalCertDto.provinceCode" type="hidden" value=""/>
                            	</s:if>
                            	<s:else>
                            		<input id="hiddenProvince" name="personalCertDto.provinceCode" type="hidden" value="<s:property value='personalCertDto.provinceCode'/>"/>
                            	</s:else>
                            </li>
                            <li class="zs2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#citySearch', '#searchDown3')" />
                            	<s:if test="personalCertVo.city.name==null||personalCertVo.city.name==''">
                            		<input id="citySearch" name="personalCertVo.city.name" type="text" value="城市" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="citySearch" name="personalCertVo.city.name" type="text" value="<s:property value='personalCertVo.city.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="personalCertDto.cityCode==null||personalCertDto.cityCode==''">
            						<input id="hiddenCity" name="personalCertDto.cityCode" type="hidden" value=""/>
            					</s:if>
            					<s:else>
            						<input id="hiddenCity" name="personalCertDto.cityCode" type="hidden" value="<s:property value='personalCertDto.cityCode'/>"/>
            					</s:else>
                            </li>
                            <li class="zs2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#areaSearch', '#searchDown4')" />
                            	<s:if test="personalCertVo.area.name==null||personalCertVo.area.name==''">
                            		<input id="areaSearch" name="personalCertVo.area.name" type="text" value="城区" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="areaSearch" name="personalCertVo.area.name" type="text" value="<s:property value='personalCertVo.area.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="personalCertDto.areaCode==null||personalCertDto.areaCode==''">
            						<input id="hiddenArea" name="personalCertDto.areaCode" type="hidden" value=""/>
            					</s:if>
            					<s:else>
            						<input id="hiddenArea" name="personalCertDto.areaCode" type="hidden" value="<s:property value='personalCertDto.areaCode'/>"/>
            					</s:else>
                            </li>
                        </ul>
                    </div>
                    <div class="zs-div">
                        <ul>
                            <li class="zs0">注册状况：</li>
                            <li class="zs1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#registerStatusText', '#registerStatusDiv')" />
                            	<s:if test="personalCertVo.registerStatus.name==null||personalCertVo.registerStatus.name==''">
                            		<input id="registerStatusText" name="personalCertVo.registerStatus.name" type="text" value="请选择注册类型" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="registerStatusText" name="personalCertVo.registerStatus.name" type="text" value="<s:property value='personalCertVo.registerStatus.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="personalCertDto.registerStatusCode==null||personalCertDto.registerStatusCode==''">
                            		<input id="registerStatusCode" name="personalCertDto.registerStatusCode" type="hidden" value=""/>
                            	</s:if>
                            	<s:else>
                            		<input id="registerStatusCode" name="personalCertDto.registerStatusCode" type="hidden" value="<s:property value='personalCertDto.registerStatusCode'/>"/>
                            	</s:else>
                            </li>
                        </ul>
                    </div>
                    <div class="zs-div">
                        <ul>
                            <li class="zs0">关&nbsp;&nbsp;键&nbsp;&nbsp;字：</li>
                            <li class="zs5">
                            	<s:if test="personalCertDto.descp==null||personalCertDto.descp==''">
                            		<input id="descp" name="personalCertDto.descp" type="text" value="请输入关键字..." onfocus="keyWordsOnFocus(this)" onblur="keyWordsOnBlur(this)"/>
                            	</s:if>
                            	<s:else>
                            		<input id="descp" name="personalCertDto.descp" type="text" value="<s:property value='personalCertDto.descp'/>" onfocus="keyWordsOnFocus(this)" onblur="keyWordsOnBlur(this)"/>
                            	</s:else>
                            </li>
                        </ul>
                    </div>
                              
          </div>
          <div class="requirements-top-right"><a href="javascript:document.personalCertSearchForm.submit()"><img src="<%=request.getContextPath()%>/images/requirements-botton.png" width="95" height="28" title="搜索"/></a>
          </div>
        </div>
        </s:form>
	</div>
</div>
<!---->
<div class="guwen-more">
     <div class="jobs-title"><strong>证书搜索</strong></div>
     <div class="people-text people-text-bg1">
          <ul>
              <li class="requirements1">编号</li>
              <li class="requirements2">证书类型</li>
              <li class="requirements3">证书名称</li>
              <li class="requirements4">注册状况</li>
              <li class="requirements5">专业</li>
              <li class="requirements6">所在地区</li>
              <li class="requirements7">发布时间</li>
          </ul>
     </div>
<s:iterator value="personalCertSearchResult">
	<div class="requirements-box">
	    <div class="requirements" >
	         <ul>
	              <li class="requirements1"><s:property value="id"/></li>
	              <li class="requirements2"><s:property value="certType.getName()"/></li>
	              <li class="requirements3"><a target="_blank" href="<%=request.getContextPath()%>/certificateCenter/certificateAction!viewPersonalCertDetail.action?id=<s:property value="id"/>"><s:property value="cert.getName()"/></a></li>
	              <li class="requirements4"><s:property value="registerStatus.getName()"/></li>
	              <li class="requirements5"><s:property value="specialField.getName()"/></li>
	              <li class="requirements6" title="<s:property value="province.name"/><s:property value="city.name"/><s:property value="area.name"/>">
	              	<span style="width:120px;float:left" class="index_hid_css">
	              		<s:property value="province.getName()"/><s:property value="city.getName()"/><s:property value="area.getName()"/>
	              	</span>
	              </li>
	              <li class="requirements7"><s:property value="getText('formatDate_yyyy-MM-dd',{submitDate})"/></li>
	         </ul>
	    </div>
	    <div class="requirements-p">
	    	<div class="requirements-p-left">
	    		<table>
	    			<tr>
	    				<td class="descpTitle"><strong>补充说明：</strong></td>
	    				<td>
				    		<span style="width:600px;float:left" class="index_hid_css" title="<s:property value='descp'/>">
				          		<s:property value="descp"/> 
				          	</span>
	    				</td>
	    			</tr>
	    		</table>
	        </div>
	    	<div class="requirements-botton"><a target="_blank" href="<%=request.getContextPath()%>/certificateCenter/certificateAction!viewPersonalCertDetail.action?id=<s:property value="id"/>"><img src="<%=request.getContextPath()%>/images/requirements-botton1.gif" width="68" height="24" alt="查看详细"/></a></div>
	    </div>
	</div>
</s:iterator>                  
</div>
<s:form  id="pageFrom" name="pageFrom" method="POST" action="<%=request.getContextPath()%>/search_persionalcert/">
	<s:hidden name="personalCertVo.certType.name"/>
	<s:hidden name="personalCertDto.certTypeCode"/>
	<s:hidden name="personalCertVo.specialField.name"/>
	<s:hidden name="personalCertDto.specialFieldCode"/>
	<s:hidden name="personalCertVo.cert.name"/>
	<s:hidden name="personalCertDto.certCode"/>
	<s:hidden name="personalCertVo.province.name"/>
	<s:hidden name="personalCertDto.provinceCode"/>
	<s:hidden name="personalCertVo.city.name"/>
	<s:hidden name="personalCertDto.cityCode"/>
	<s:hidden name="personalCertVo.area.name"/>
	<s:hidden name="personalCertDto.areaCode"/>
	<s:hidden name="personalCertVo.registerStatus.name"/>
	<s:hidden name="personalCertDto.registerStatusCode"/>
	<s:hidden name="personalCertDto.descp"/>
	<div class="qx">
		<s:property value="pageInfo.htmlListTableFootInfoNoAllCheck" escapeHtml="false"/>
	</div>
	<div class="num">
		<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
	</div>
</s:form>

<!--底部分-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
</html>