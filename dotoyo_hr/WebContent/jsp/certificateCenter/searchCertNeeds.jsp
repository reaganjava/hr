<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--猎证中心--证书需求搜索</title>
	<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
	<jsp:include page="../common/JsAndCss.jsp"/>
	<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
	<script src="<%=request.getContextPath()%>/jsp/certificateCenter/certificate.js"></script>
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<s:include value="certificateCenterNav.jsp"/>
<!--以上为头部分-->
<!--证书需求搜索~绝对定位-->
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
     <div class="zs-down3" id="companySizeDiv" style="display:none;">
    	  <ul>
    	    <s:iterator value="companySizeList">
    	  		 <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'companySizeText','companySizeCode')"><s:property value="name"/></a></li>
    	  	</s:iterator>
		  </ul>
     </div>
     
</div>
<!--中间部分-->
<div class="requirements-top-box">
	<div class="requirements-top-line">
	<s:form id="certNeedsSearchForm" name="certNeedsSearchForm" method="post" action="/search_needscert/">
        <div class="requirements-top">
          <div class="requirements-top-left">
        			<div class="zs-div">
                        <ul>
                            <li class="zs0">证书类型：</li>
                            <li class="zs1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#certTypeText', '#certTypeDiv')" />
                            	<s:if test="certNeedsVo.certType.name==null||certNeedsVo.certType.name==''">
                            		<input id="certTypeText" name="certNeedsVo.certType.name" type="text" value="请选择证书类型" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="certTypeText" name="certNeedsVo.certType.name" type="text" value="<s:property value='certNeedsVo.certType.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="certNeedsDto.certTypeCode==null||certNeedsDto.certTypeCode==''">
                            		<input id="certTypeCode" name="certNeedsDto.certTypeCode" type="text" value=""/>
                            	</s:if>
                            	<s:else>
                            		<input id="certTypeCode" name="certNeedsDto.certTypeCode" type="text" value="<s:property value='certNeedsDto.certTypeCode'/>"/>
                            	</s:else>
                            </li>
                        </ul>
                    </div>
                    <div class="zs-div">
                        <ul>
                            <li class="zs0">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</li>
                            <li class="zs1">
								<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#specialFieldText', '#specialFieldDiv')" />
                            	<s:if test="certNeedsVo.specialField.name==null||certNeedsVo.specialField.name==''">
                            		<input id="specialFieldText" name="certNeedsVo.specialField.name" type="text" value="请选择专业职能" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="specialFieldText" name="certNeedsVo.specialField.name" type="text" value="<s:property value='certNeedsVo.specialField.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="certNeedsDto.specialFieldCode==null||certNeedsDto.specialFieldCode==''">
                            		<input id="specialFieldCode" name="certNeedsDto.specialFieldCode" type="hidden" value=""/>
                            	</s:if>
                            	<s:else>
                            		<input id="specialFieldCode" name="certNeedsDto.specialFieldCode" type="hidden" value="<s:property value='certNeedsDto.specialFieldCode'/>"/>
                            	</s:else>
                            </li>  
                        </ul>
                    </div>
					<div class="zs-div">
                        <ul>
                            <li class="zs0">证书名称：</li>
                            <li class="zs1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#certText', '#certDiv');" />
                            	<s:if test="certNeedsVo.cert.name==null||certNeedsVo.cert.name==''">
                            		<input id="certText" name="certNeedsVo.cert.name" type="text" value="请选择证书名称" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="certText" name="certNeedsVo.cert.name" type="text" value="<s:property value='certNeedsVo.cert.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="certNeedsDto.certCode==null||certNeedsDto.certCode==''">
                            	    <input id="certCode" name="certNeedsDto.certCode" type="hidden" value=""/>
                            	</s:if>
                            	<s:else>
                            		<input id="certCode" name="certNeedsDto.certCode" type="hidden" value="<s:property value='certNeedsDto.certCode'/>"/>
                            	</s:else>
                           	</li>
                        </ul>
                    </div>
                    <div class="zs-div">
                        <ul>
                            <li class="zs0">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区：</li>
                            <li class="zs2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#province', '#searchDown2')" />
                            	<s:if test="certNeedsVo.province.name==null||certNeedsVo.province.name==''">
	                            	<input id="province" name="certNeedsVo.province.name" type="text" value="省份" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="province" name="certNeedsVo.province.name" type="text" value="<s:property value='certNeedsVo.province.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="certNeedsDto.provinceCode==null||certNeedsDto.provinceCode==''">
                            		<input id="hiddenProvince" name="certNeedsDto.provinceCode" type="hidden" value=""/>
                            	</s:if>
                            	<s:else>
                            		<input id="hiddenProvince" name="certNeedsDto.provinceCode" type="hidden" value="<s:property value='certNeedsDto.provinceCode'/>"/>
                            	</s:else>
                            </li>
                            <li class="zs2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#citySearch', '#searchDown3')" />
                            	<s:if test="certNeedsVo.city.name==null||certNeedsVo.city.name==''">
                            		<input id="citySearch" name="certNeedsVo.city.name" type="text" value="城市" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="citySearch" name="certNeedsVo.city.name" type="text" value="<s:property value='certNeedsVo.city.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="certNeedsDto.cityCode==null||certNeedsDto.cityCode==''">
            						<input id="hiddenCity" name="certNeedsDto.cityCode" type="hidden" value=""/>
            					</s:if>
            					<s:else>
            						<input id="hiddenCity" name="certNeedsDto.cityCode" type="hidden" value="<s:property value='certNeedsDto.cityCode'/>"/>
            					</s:else>
                            </li>
                            <li class="zs2">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#areaSearch', '#searchDown4')" />
                            	<s:if test="certNeedsVo.area.name==null||certNeedsVo.area.name==''">
                            		<input id="areaSearch" name="certNeedsVo.area.name" type="text" value="城区" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="areaSearch" name="certNeedsVo.area.name" type="text" value="<s:property value='certNeedsVo.area.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="certNeedsDto.areaCode==null||certNeedsDto.areaCode==''">
            						<input id="hiddenArea" name="certNeedsDto.areaCode" type="hidden" value=""/>
            					</s:if>
            					<s:else>
            						<input id="hiddenArea" name="certNeedsDto.areaCode" type="hidden" value="<s:property value='certNeedsDto.areaCode'/>"/>
            					</s:else>
                            </li>
                        </ul>
                    </div>
                    <div class="zs-div">
                        <ul>
                            <li class="zs0">注册状况：</li>
                            <li class="zs1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#registerStatusText', '#registerStatusDiv')" />
                            	<s:if test="certNeedsVo.registerStatus.name==null||certNeedsVo.registerStatus.name==''">
                            		<input id="registerStatusText" name="certNeedsVo.registerStatus.name" type="text" value="请选择注册类型" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="registerStatusText" name="certNeedsVo.registerStatus.name" type="text" value="<s:property value='certNeedsVo.registerStatus.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="certNeedsDto.registerStatusCode==null||certNeedsDto.registerStatusCode==''">
                            		<input id="registerStatusCode" name="certNeedsDto.registerStatusCode" type="hidden" value=""/>
                            	</s:if>
                            	<s:else>
                            		<input id="registerStatusCode" name="certNeedsDto.registerStatusCode" type="hidden" value="<s:property value='certNeedsDto.registerStatusCode'/>"/>
                            	</s:else>
                            </li>
                        </ul>
                    </div>
                    <div class="zs-div">
                        <ul>
                            <li class="zs0">关&nbsp;&nbsp;键&nbsp;&nbsp;字：</li>
                            <li class="zs5">
                            	<s:if test="certNeedsDto.descp==null||certNeedsDto.descp==''">
                            		<input id="descp" name="certNeedsDto.descp" type="text" value="请输入关键字..." onfocus="keyWordsOnFocus(this)" onblur="keyWordsOnBlur(this)"/>
                            	</s:if>
                            	<s:else>
                            		<input id="descp" name="certNeedsDto.descp" type="text" value="<s:property value='certNeedsDto.descp'/>" onfocus="keyWordsOnFocus(this)" onblur="keyWordsOnBlur(this)"/>
                            	</s:else>
                            </li>
                        </ul>
                    </div>
                    <div class="zs-div">
                        <ul>
                            <li class="zs0">单位规模：</li>
                            <li class="zs1">
                            	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" onclick="menuClick('#companySizeText', '#companySizeDiv')" />
                            	<s:if test="certNeedsVo.companySize.name==null||certNeedsVo.companySize.name==''">
                            		<input id="companySizeText" name="certNeedsVo.companySize.name" type="text" value="请选择单位规模" readonly="readonly"/>
                            	</s:if>
                            	<s:else>
                            		<input id="companySizeText" name="certNeedsVo.companySize.name" type="text" value="<s:property value='certNeedsVo.companySize.name'/>" readonly="readonly"/>
                            	</s:else>
                            	<s:if test="certNeedsDto.companySizeCode==null||certNeedsDto.companySizeCode==''">
                            		<input id="companySizeCode" name="certNeedsDto.companySizeCode" type="hidden" value=""/>
                            	</s:if>
                            	<s:else>
                            		<input id="companySizeCode" name="certNeedsDto.companySizeCode" type="hidden" value="<s:property value='certNeedsDto.companySizeCode'/>"/>
                            	</s:else>
                            </li>
                        </ul>
                    </div>
                              
          </div>
          <div class="requirements-top-right"><br /><br /><a href="javascript:document.certNeedsSearchForm.submit();"><img src="<%=request.getContextPath()%>/images/requirements-botton.png" width="95" height="28" title="搜索"/></a>
          </div>
        </div>
   </s:form>
	</div>
</div>
<!---->
<!--中间部分-->
<div class="guwen-more">
     <div class="jobs-title"><strong>证书需求搜索</strong></div>
     <div class="people-text people-text-bg1">
          <ul>
              <li class="requirements1">编号</li>
              <li class="requirements2">证书类型</li>
              <li class="requirements5">证书名称</li>
              <li class="requirements5">挂证地区</li>
              <li class="requirements8">需求数量</li>
              <li class="requirements7">发布时间</li>
          </ul>
     </div>
	<s:iterator value="certNeedsSearchResult">
		<div class="requirements-box">
		    <div class="requirements" >
		         <ul>
		              <li class="requirements1"><s:property value="id"/></li>
		              <li class="requirements2"><s:property value="certType.name"/></li>
		              <li class="requirements5"><a target="_blank" href="certificateAction!viewCertNeedsDetail.action?certNeedsId=<s:property value="id"/>&userId=<s:property value="userId"/>"><s:property value="cert.getName()"/></a></li>
		              <li class="requirements5" title="<s:property value="province.name"/><s:property value="city.name"/><s:property value="area.name"/>">
		              <span style="width:250px;float:left" class="index_hid_css">
		              	<s:property value="province.name"/><s:property value="city.name"/><s:property value="area.name"/>
		              </span>
		              </li>
		              <li class="requirements8"><s:property value="certNeedsAmount"/></li>
		              <li class="requirements7"><s:property value="getText('formatDate_yyyy-MM-dd',{effDate})"/></li>
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
		    	<div class="requirements-botton"><a target="_blank" href="certificateAction!viewCertNeedsDetail.action?certNeedsId=<s:property value="id"/>&userId=<s:property value="userId"/>"><img src="<%=request.getContextPath()%>/images/requirements-botton1.gif" width="68" height="24" alt="查看详细"/></a></div>
		    </div>
		</div>
	</s:iterator>            
</div>
<s:form  id="pageFrom" name="pageFrom" method="POST" action="/search_needscert/">
	<s:hidden name="certNeedsVo.certType.name"/>
	<s:hidden name="certNeedsDto.certTypeCode"/>
	<s:hidden name="certNeedsVo.specialField.name"/>
	<s:hidden name="certNeedsDto.specialFieldCode"/>
	<s:hidden name="certNeedsVo.cert.name"/>
	<s:hidden name="certNeedsDto.certCode"/>
	<s:hidden name="certNeedsVo.province.name"/>
	<s:hidden name="certNeedsDto.provinceCode"/>
	<s:hidden name="certNeedsVo.city.name"/>
	<s:hidden name="certNeedsDto.cityCode"/>
	<s:hidden name="certNeedsVo.area.name"/>
	<s:hidden name="certNeedsDto.areaCode"/>
	<s:hidden name="certNeedsVo.registerStatus.name"/>
	<s:hidden name="certNeedsDto.registerStatusCode"/>
	<s:hidden name="certNeedsDto.descp"/>
	<s:hidden name="certNeedsVo.companySize.name"/>
	<s:hidden name="certNeedsDto.companySizeCode"/>
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