<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--企业后台--证书需求修改</title>
	<link href="<%=request.getContextPath()%>/css/front-side.css" rel="stylesheet" type="text/css" />
	<jsp:include page="../common/JsAndCss.jsp"/>
	<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
	<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/template.css" type="text/css" media="screen" title="no title" charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/javascripts/validationEngine/css/validationEngine.jquery.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine-cn.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/javascripts/validationEngine/jquery.validationEngine.js"></script>
	<script>
	    function beforeCall(form, options){
	       if($("#submitCertNeedsForm").validationEngine('validate')){
	    	   form.submit();
	       }
	       return true;
	    }

	    // Called once the server replies to the aja form validation request
	    function ajaxValidationCallback(status, form, json, options){
	    }
	    $(document).ready(function(){
	        $("#submitCertNeedsForm").validationEngine({
	            ajaxFormValidation: true,
	            onAjaxFormComplete: ajaxValidationCallback,
	            onBeforeAjaxFormValidation: beforeCall,
	            validationEventTriggers:"blur",  //触发的事件  validationEventTriggers:"keyup blur",

	            success:false//为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
	        });
	    });
	</script>
</head>
<body>
<jsp:include page="../common/head.jsp"></jsp:include>
<s:include value="/jsp/certificateCenter/certificateCenterNav.jsp"/>
<!--以上为头部分-->
<!--搜索下拉菜单~绝对定位~-->
<div class="jobs-down" id="showMenuID">
    <div class="jobs-down1" id="certTypeDiv" style="display:none;">
        <ul>
            <s:iterator value="certificateTypeList">
	               <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'certTypeText','certTypeCode');setCert();"><s:property value="name"/></a></li>
	        </s:iterator>
        </ul>
    </div>
    <div class="jobs-down1" id="certDiv" style="display:none;">
		<ul id="certId">
			<s:iterator value="certList">
				<li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'certText','certCode')"><s:property value="name"/></a></li>
			</s:iterator>
		</ul>
    </div>
    <div class="jobs-down2" id="searchDown2" style="display:none;">
    	<ul>
	   	  	<s:iterator value="provinceList">
	               <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'province','hiddenProvince');setCity('citySearch','hiddenCity')"><s:property value="name"/></a></li>
	        </s:iterator>
		</ul>
    </div>
    <div class="jobs-down3" id="searchDown3" style="display:none;">
    	<ul id="cityId">
		</ul>
 	 </div>
    <div class="jobs-down4" id="searchDown4" style="display:none;">
    	<ul id="areaId">
		</ul>
  	</div>
	<div class="jobs-down6" id="specialFieldDiv" style="display:none;">
    	  <ul>
    	    <s:iterator value="specialFieldList">
    	    	<s:if test='parentCode=="003"'>
    	    		<li class="specializedDiv" style="width:650px;"><label><strong><s:property value="name"/></strong></label></li>
    	    	</s:if>
    	    	<s:else>
    	    		<li style="width:145px;float:left" class="index_hid_css" title="<s:property value='name'/>">
    	    			<a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'specialFieldText','specialFieldCode');return false;"><s:property value="name"/></a>
    	    		</li>
    	    	</s:else>
    	  	</s:iterator>
		  </ul>
    </div>
    <div class="jobs-down1" id="registerStatusDiv" style="display:none;">
    	  <ul>
    	  	<s:iterator value="registerStatusList">
    	  		 <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'registerStatusText','registerStatusCode')"><s:property value="name"/></a></li>
    	  	</s:iterator>
		  </ul>
    </div>
    <div class="jobs-down1" id="companySizeDiv" style="display:none;">
    	  <ul>
    	    <s:iterator value="companySizeList">
    	  		 <li><a href="javascript:void(0)" id="<s:property value="code" />" onclick="setValue(this,'companySizeText','companySizeCode')"><s:property value="name"/></a></li>
    	  	</s:iterator>
		  </ul>
    </div>

</div>
<!--中间部分-->
<div class="guwen-more">
<s:form name="submitCertNeedsForm" id="submitCertNeedsForm" method="post" action="certNeedsManageAction!saveEditCertNeeds.action">
	<input id="submitCertNeedsFormFlag" type="hidden" value="0"/>
  <div class="jobs-title"><strong>证书信息</strong></div>
    <div class="jobs-select">
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>证书类型：</li>
          <li class="jobs1">
          	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" <s:if test='#request.readOnly != "Y"'> onclick="menuClick('#certTypeText', '#certTypeDiv')" </s:if> />
            <s:if test="certNeedsVo.certType.name==null||certNeedsVo.certType.name==''">
           		<input id="certTypeText" name="certNeedsVo.certType.name" type="text" value="请选择证书类型" readonly="readonly" class="validate[custom[requiredSelected]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
           	</s:if>
           	<s:else>
           		<input id="certTypeText" name="certNeedsVo.certType.name" type="text" value="<s:property value='certNeedsVo.certType.name'/>" readonly="readonly" class="validate[custom[requiredSelected]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
           	</s:else>
           	<s:if test="certNeedsDto.certTypeCode==null||certNeedsDto.certTypeCode==''">
           		<input id="certTypeCode" name="certNeedsDto.certTypeCode" type="hidden" value=""/>
           	</s:if>
           	<s:else>
           		<input id="certTypeCode" name="certNeedsDto.certTypeCode" type="hidden" value="<s:property value='certNeedsDto.certTypeCode'/>"/>
           	</s:else>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>证书名称：</li>
          <li class="jobs1">
          	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" <s:if test='#request.readOnly != "Y"'> onclick="menuClick('#certText', '#certDiv')" </s:if>/>
  			<s:if test="certNeedsVo.cert.name==null||certNeedsVo.cert.name==''">
	       		<input id="certText" name="certNeedsVo.cert.name" type="text" value="请选择证书名称" readonly="readonly" class="validate[custom[requiredSelected]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
	       	</s:if>
	       	<s:else>
	       		<input id="certText" name="certNeedsVo.cert.name" type="text" value="<s:property value='certNeedsVo.cert.name'/>" readonly="readonly" class="validate[custom[requiredSelected]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
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
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>挂证地区：</li>
         <li class="jobs2">
         	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" <s:if test='#request.readOnly != "Y"'>  onclick="menuClick('#province', '#searchDown2')" </s:if> />
 			<s:if test="certNeedsVo.province.name==null||certNeedsVo.province.name==''">
            	<input id="province" name="certNeedsVo.province.name" type="text" value="省份" readonly="readonly" class="validate[custom[region]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
           	</s:if>
           	<s:else>
           		<input id="province" name="certNeedsVo.province.name" type="text" value="<s:property value='certNeedsVo.province.name'/>" readonly="readonly" class="validate[custom[region]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
           	</s:else>
           	<s:if test="certNeedsDto.provinceCode==null||certNeedsDto.provinceCode==''">
           		<input id="hiddenProvince" name="certNeedsDto.provinceCode" type="hidden" value=""/>
           	</s:if>
           	<s:else>
           		<input id="hiddenProvince" name="certNeedsDto.provinceCode" type="hidden" value="<s:property value='certNeedsDto.provinceCode'/>"/>
           	</s:else>
          </li>
          <li class="jobs2">
          	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" <s:if test='#request.readOnly != "Y"'>  onclick="loadData('citySearch','#searchDown3')" </s:if>  />
  			 <s:if test="certNeedsVo.city.name==null||certNeedsVo.city.name==''">
            		<input id="citySearch" name="certNeedsVo.city.name" type="text" value="城市" readonly="readonly" class="validate[custom[region]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
            </s:if>
       		 <s:else>
           		 <input id="citySearch" name="certNeedsVo.city.name" type="text" value="<s:property value='certNeedsVo.city.name'/>" readonly="readonly" class="validate[custom[region]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
       		 </s:else>
        	<s:if test="certNeedsDto.cityCode==null||certNeedsDto.cityCode==''">
				<input id="hiddenCity" name="certNeedsDto.cityCode" type="hidden" value=""/>
			</s:if>
			<s:else>
				<input id="hiddenCity" name="certNeedsDto.cityCode" type="hidden" value="<s:property value='certNeedsDto.cityCode'/>"/>
			</s:else>
          </li>
          <li class="jobs2">
          	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" <s:if test='#request.readOnly != "Y"'>  onclick="loadData('areaSearch','#searchDown4')" </s:if>/>
 			<s:if test="certNeedsVo.area.name==null||certNeedsVo.area.name==''">
             		<input id="areaSearch" name="certNeedsVo.area.name" type="text" value="城区" readonly="readonly" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
             </s:if>
             <s:else>
             		<input id="areaSearch" name="certNeedsVo.area.name" type="text" value="<s:property value='certNeedsVo.area.name'/>" readonly="readonly" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
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
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</li>
          <li class="jobs1">
          	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" <s:if test='#request.readOnly != "Y"'>  onclick="menuClick('#specialFieldText', '#specialFieldDiv')"  </s:if> />
   			<s:if test="certNeedsVo.specialField.name==null||certNeedsVo.specialField.name==''">
           		<input id="specialFieldText" name="certNeedsVo.specialField.name" type="text" value="请选择专业职能" readonly="readonly" class="validate[custom[requiredSelected]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
           	</s:if>
           	<s:else>
           		<input id="specialFieldText" name="certNeedsVo.specialField.name" type="text" value="<s:property value='certNeedsVo.specialField.name'/>" readonly="readonly" class="validate[custom[requiredSelected]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
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
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>注册状况：</li>
          <li class="jobs1">
          	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" <s:if test='#request.readOnly != "Y"'>  onclick="menuClick('#registerStatusText', '#registerStatusDiv')"  </s:if>  />
           <s:if test="certNeedsVo.registerStatus.name==null||certNeedsVo.registerStatus.name==''">
           		<input id="registerStatusText" name="certNeedsVo.registerStatus.name" type="text" value="请选择注册类型" readonly="readonly" class="validate[custom[requiredSelected]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
           	</s:if>
           	<s:else>
           		<input id="registerStatusText" name="certNeedsVo.registerStatus.name" type="text" value="<s:property value='certNeedsVo.registerStatus.name'/>" readonly="readonly" class="validate[custom[requiredSelected]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
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
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>证书需求数：</li>
          <li class="jobs6">
            <input id="amount" name="certNeedsDto.certNeedsAmount" type="text" value="<s:property value='certNeedsDto.certNeedsAmount'/>" class="validate[custom[positiveInteger]]" maxlength="5" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>发布日期：</li>
          <li class="jobs7">
          	<input class="validate[required]" disabled="disabled"  id="effDate"  type="text" value="<s:date name='certNeedsDto.effDate' format='yyyy-MM-dd'/>"  <s:if test='#request.readOnly != "Y"'>  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-{%d}',maxDate:'#F{$dp.$D(\'expDate\')}'})"  </s:if> <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
         	<s:hidden name="certNeedsDto.effDate"></s:hidden>
		  </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>有效期至：</li>
          <li class="jobs7">
          <input class='validate[required]' id="expDate" name="certNeedsDto.expDate" type="text" value="<s:date name='certNeedsDto.expDate' format='yyyy-MM-dd'/>" <s:if test='#request.readOnly != "Y"'>  onclick="chooseExpDate()"  </s:if> <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if> /></li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>单位规模：</li>
          <li class="jobs1">
          	<img src="<%=request.getContextPath()%>/images/search-down.png" width="21" height="22" <s:if test='#request.readOnly != "Y"'>  onclick="menuClick('#companySizeText', '#companySizeDiv')"  </s:if>/>
            <s:if test="certNeedsVo.companySize.name==null||certNeedsVo.companySize.name==''">
            	<input id="companySizeText" name="" type="text" value="请选择单位规模" readonly="readonly" class="validate[custom[requiredSelected]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
            </s:if>
            <s:else>
            	<input id="companySizeText" name="" type="text" value="<s:property value='certNeedsVo.companySize.name'/>" readonly="readonly" class="validate[custom[requiredSelected]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
            </s:else>
            <s:if test="certNeedsVo.companySize.code==null||certNeedsVo.companySize.code==''">
            	<input id="companySizeCode" name="certNeedsDto.companySizeCode" type="hidden" value=""/>
            </s:if>
            <s:else>
            	<input id="companySizeCode" name="certNeedsDto.companySizeCode" type="hidden" value="<s:property value='certNeedsVo.companySize.code'/>"/>
            </s:else>
          </li>
        </ul>
      </div>

    </div>
  <div class="jobs-title2"><strong>联系方式</strong></div>
    <div class="jobs-select">
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>联&nbsp;&nbsp;系&nbsp;&nbsp;人：</li>
          <li class="jobs6">
            <input id="contact" name="certNeedsDto.contact" type="text" value="<s:property value='certNeedsDto.contact'/>" class="validate[required],custom[filteringSpecialChar4]" maxlength="20" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0"><em>*</em>联系电话：</li>
          <li class="jobs6">
            <input id="telephone" name="certNeedsDto.telephone" type="text" value="<s:property value='certNeedsDto.telephone'/>" class="validate[required,custom[telephone]]" maxlength="20" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</li>
          <li class="jobs6">
            <input id="cellPhone" name="certNeedsDto.cellPhone" type="text" value="<s:property value='certNeedsDto.cellPhone'/>" class="validate[custom[cellPhoneOrEmpty]]" maxlength="20" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0">E&nbsp;&nbsp;-&nbsp;&nbsp;mail：</li>
          <li class="jobs6">
            <input id="email" name="certNeedsDto.email" type="text" value="<s:property value='certNeedsDto.email'/>" class="validate[custom[emailOrEmpty]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
          </li>
        </ul>
      </div>
      <div class="jobs-select-div">
        <ul>
          <li class="jobs0">传&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;真：</li>
          <li class="jobs6">
            <input id="fax" name="certNeedsDto.fax" type="text" value="<s:property value='certNeedsDto.fax'/>" maxlength="20" class="validate[custom[faxOrEmpty]]" <s:if test='#request.readOnly == "Y"'> disabled="disabled" </s:if>/>
          </li>
        </ul>
      </div>
    </div>
  <div class="jobs-title3"><strong>其他要求</strong></div>
  <div class="jobs-select">
  <s:if test='#request.readOnly == "Y"'>
   <s:textarea id="descp" name="certNeedsDto.descp" cssClass="validate[length[0,200]]" disabled="true"></s:textarea>
   </s:if>
   <s:else>
   	<s:textarea id="descp" name="certNeedsDto.descp" cssClass="validate[length[0,200]]"></s:textarea>
   </s:else>
  </div>
    <div class="jobs-botton">
    	<s:if test='#request.readOnly != "Y"'>
	    	<a href="#" onclick="return clickSubmit();"><img src="<%=request.getContextPath()%>/images/jobs-tj.png" width="83" height="32" alt="提交"/></a>
	    	<a href="javascript:clickReset()"><img src="<%=request.getContextPath()%>/images/jobs-cz.png" width="83" height="32" alt="重置"/></a>
        	<a href="javascript:clickReturn()"><img src="<%=request.getContextPath()%>/images/salon-fh.png" width="83" height="32" alt="返回"/></a>
        </s:if>
        <s:else>
			<a href="javascript:clickReturn()"><img src="<%=request.getContextPath()%>/images/salon-fh2.png" width="83" height="32" alt="返回"/></a>
        </s:else>
	</div>
	<s:hidden id="actionMessage" name="actionMessage"></s:hidden>
	<input id="from" type="hidden" name="from" value="${from}"/>
	<s:hidden name="certNeedsDto.id"></s:hidden>
	<s:hidden name="certNeedsDto.isIndeed"></s:hidden>
	<s:hidden name="certNeedsDto.userId"></s:hidden>
	<s:hidden name="certNeedsDto.submitDate"></s:hidden>
	<s:hidden name="certNeedsDto.certNeedsStatus"></s:hidden>
	</s:form>
    <div class="jobs-wenxin-box">
    	<div class="jobs-wenxin">
        	<div class="jobs-wenxin-left"><img src="<%=request.getContextPath()%>/images/wenxin-icon2.png" width="132" height="135" /></div>
            <div class="jobs-wenxin-right">
           		<p class="jobs-wenxin1">您发布的招聘信息需要建筑猎头人才网审核通过后，求职者才能搜索到。审核时间间隔一般在2小时左右，节假日除外。如需立即审核，您可致电0755－98898989或联系您你的客户服务专员。</p>
                <p class="jobs-wenxin2">为了保障供求双方建筑猎头人才网的权益，请您在发布招聘信息时遵守国家相关法律法规，不得发布虚假招聘信息，不得代其它单位招聘。</p>
                <p class="jobs-wenxin3">招聘单位违反国家法律法规的，建筑猎头人才网有权立即停止您在本网所有服务，且不予退款。</p>
            </div>
        </div>
    </div>
</div>


<!--底部分-->
<jsp:include page="../common/bottom.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	var actionMessage = $("#actionMessage").val();
	if(actionMessage != ""){
		alert(actionMessage);
	}
});
function setCert(){
	$.getJSON("../certificateCenter/certificateAction!searchCert.action?certTypeCode="+$("#certTypeCode").val() , function(data) {
		var options="";
		for(i=0;i<data.length;i++){
			value = data[i].code;
			text = data[i].name;
			if(i==0){
				document.getElementById("certText").value=text;
				document.getElementById("certCode").value=value;
			}
			options = options + "<li><a href='javascript:void(0)' id=\""+value+"\""+" onclick=\"setValue(this,'certText','certCode')\">"+text+"</a></li>";
		}
		$('#certId').html(options);
	});
}
var form = document.getElementById("submitCertNeedsForm");
function clickSubmit(){
	$("#submitCertNeedsForm").submit();
	return false;
}
function clickReset(){
	form.reset();
}
function clickReturn(){
	var from = $("#from").val();
	if (from == "SubmitedCertNeeds"){
		window.location.href = "certNeedsManageAction!viewSubmitedCertNeedsList.action";
		return false;
	}
	if (from == "PausedCertNeeds"){
		window.location.href = "certNeedsManageAction!viewPausedCertNeedsList.action";
		return false;
	}
	if (from == "ExpiringCertNeeds"){
		window.location.href = "certNeedsManageAction!viewExpiringCertNeedsList.action";
		return false;
	}
	if (from == "ExpiredCertNeeds"){
		window.location.href = "certNeedsManageAction!viewExpiredCertNeedsList.action";
		return false;
	}
}
function chooseExpDate(){
	var effDate = $("#effDate").val();
	if(effDate == "" || effDate == null){
		WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-{%d}'});
	}
	else{
		WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'effDate\')}'});
	}
}
</script>
</body>
</html>