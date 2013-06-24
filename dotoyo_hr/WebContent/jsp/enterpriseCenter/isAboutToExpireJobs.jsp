<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头-企业后台</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
	<script src="<%=request.getContextPath()%>/javascripts/My97DatePicker/WdatePicker.js"></script>
</head>

<body onload="init()">
<jsp:include page="/jsp/common/top.jsp"></jsp:include>

<div class="content">
<jsp:include page="left.jsp"></jsp:include>
<div class="content-right">
    	<div class="administrator-title"><strong>即将到期的职位</strong></div>
    	<s:form  id="pageFrom" name="pageFrom" method="POST" action="enterpriseCenterAction!getIsAboutToExpireJobs.action">
        <div class="inside-search">
        	<ul>
            	<li>职位名称：<input type="text" id="jobNameFalse" name="jobNameFalse" size="17" value="<s:property value='jobName'/>"/></li>
                <li>职位有效期：
                <input  id="jobIssuetDateFalse" name="jobIssuetDateFalse" type="text" size="18" value="<s:date name='jobIssuetDate' format='yyyy-MM-dd'/>" class="Wdate2" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',errDealMode:1,maxDate:'#F{$dp.$D(\'jobExpiryDateFalse\')}'})"/>&nbsp;至&nbsp;
                <input id="jobExpiryDateFalse" class='Wdate2' name="jobExpiryDateFalse" value="<s:date name='jobExpiryDate' format='yyyy-MM-dd'/>" type="text" size="18" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'jobIssuetDateFalse\')}'})"/></li>
                <li id="inside-search-input" onclick="setSearchValue()">
               		<input type="image" src="<%=request.getContextPath()%>/images/inside-botton.png"/>
                </li>
            </ul>
        </div>
        <s:hidden id="jobName" name="jobName"></s:hidden>
        <s:hidden id="jobIssuetDate" name="jobIssuetDate"></s:hidden>
        <s:hidden id="jobExpiryDate" name="jobExpiryDate"></s:hidden>
        <div class="inside-tab">
   	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="4%"><input id="selected" name="selected" type="checkbox" /></td>
                <td width="22%" height="40" align="left"><strong>职位名称</strong></td>
                <td width="12%" align="left"><strong>开始时间</strong></td>
                <td width="11%" align="left"><strong>结束时间</strong></td>
                <td width="13%" align="left"><strong>到期剩余天数</strong></td>
                <td width="14%" align="left"><strong>最后修改时间</strong></td>
                <td width="6%" align="left"><strong>操作</strong></td>
                <td width="8%" align="left">&nbsp;</td>
              </tr>
              <s:iterator value="enterprisePublishedJobList">
              <tr>
                <td width="4%"><input name="myPublishedJobs" type="checkbox" value="<s:property value="id"/>" /></td>
                <td width="22%" height="40" align="left"><s:property value="jobName"/></td>
                <td width="12%" align="left"><s:property value="getText('format.date',{jobIssuetDate})"/></td>
                <td width="11%" align="left"><s:property value="getText('format.date',{jobExpiryDate})"/></td>
                <td width="13%" align="left"><s:property value="daysRemainingMaturity"/></td>
                <td width="14%" align="left"><s:property value="getText('format.date',{lastUpdateTime})"/></td>
                <td width="6%" align="left" class="inside-links"><a href="<s:url action="enterpriseCenterAction!modifyMyPublishedJob">
	                    <s:param name="jobId"><s:property value="id"/></s:param>
	                    <s:param name="fromReq">1</s:param>
	            </s:url>" target="_blank">修改</a></td>
                <td width="8%" align="left"><a href="<s:url action="personalCenterAction!lookJobInfoDetail" namespace="/personalCenter">
	                    <s:param name="jobId"><s:property value="id"/></s:param></s:url>" target="_blank">查看</a></td>
              </tr>
              </s:iterator>
        </table>
		</div>
	    <div class="qx">
			<s:property value="pageInfo.htmlListTableFootInfo" escapeHtml="false"/>
		</div>

        <div class="system-botton3">
	    	<ul>
	            <li class="botton1"><a href="javascript:void(0)" title="删除" onclick="changeMyPublishingJobs('myPublishedJobs');return false;">删除</a></li>
	            <li class="botton3"><a href="javascript:void(0)" class="openDiv" id="Div1" rel="question2" title="延长发布" )">延长发布</a></li>
	        </ul>
	    </div>

     	<div class="num">
      		<s:property value="pageInfo.htmlPagingInfo" escapeHtml="false"/>
   	  	</div>

	     <div class="mid-border" id="question2" style="display:none; ">
	        <h5><span class="close">X</span>延长职位发布时间</h5>
	        <ul>
	          <li>延长时间到：
	            <input type="text" name="extendedReleaseDateOfJob" size="20" class="Wdate"
	            readonly="readonly"
	            value="<s:property value='extendationDate'/>"
	            onclick="WdatePicker({isShowClear:false,dateFmt:'yyyy-MM-dd',errDealMode:1,minDate:'<s:property value="extendationDate"/>'})"/>
	          </li>
	          <li><a href="#"><img onclick="extendedReleaseDate()" src="<%=request.getContextPath()%>/images/ycsj.png" width="81" height="28" alt="延长时间"/></a></li>
	        </ul>
	      </div>
      </s:form>
  </div>
</div>
<script type="text/javascript">
function changeMyPublishingJobs(checkboxName){
	if(checkStatus(checkboxName)==false) {
		alert('请至少选中一个职位');
	}else{
		if(window.confirm("你确认要进行此操作吗？")){
		document.pageFrom.action='enterpriseCenterAction!deleteMyPublishedJob.action?requestType=3';
		document.pageFrom.method='post';
		document.pageFrom.submit();
		}
	}
}

function extendedReleaseDate(){
	document.pageFrom.action='enterpriseCenterAction!extendedReleaseDate.action';
	document.pageFrom.method='post';
	document.pageFrom.submit();
}

</script>

<script type="text/javascript">
        function fOpenDiv(rel, isModel, modelColor, modelOpacity) {
            isModel = isModel || false;
            modelColor = modelColor || '#ff0000';
            modelOpacity = modelOpacity || '0.3';
            popDivID = '#' + $(rel).attr('rel');
            var popDiv = $(popDivID);
            if (popDiv.html() == null) return;

            function createLayer(mColor,mOpacity) {
                $('<div id="pBox" style="position:absolute;width:100%;height:100%;top:0px;left:0px;z-index:3;">&nbsp;</div>').prependTo('body');
                $('#pBox').css({ opacity: mOpacity, backgroundColor: mColor, height: $(document).height().toString() + 'px' });
            }

            if (isModel) {
                createLayer(modelColor,modelOpacity);
            }

            var t = ($(window).height() - popDiv.height()) / 2 + $(document).scrollTop();
            var l = ($(window).width() - popDiv.width()) / 2;
            popDiv.css({ 'opacity': '0.1', 'z-index': '5', 'top': t.toString() + 'px', 'left': l.toString() + 'px', 'position': 'absolute' }).slideDown('fast').fadeTo("fast", 1);

            function reSetPopDiv() {
                var qt = ($(window).height() - popDiv.height()) / 2 + $(document).scrollTop();
                var ql = ($(window).width() - popDiv.width()) / 2;
                popDiv.css({ top: qt.toString() + 'px', left: ql.toString() + 'px' });

           }
            $(window).scroll(function() { reSetPopDiv(); });
            $(window).resize(function() { reSetPopDiv(); });

            $('.close').click(function() {
                popDiv.css({ "opacity": "1" }).slideUp('fast');
                $('#pBox').remove();
            });
        }

        $(document).ready(function() {
            $('.openDiv').click(function() {
            	if(checkStatus("myPublishedJobs")==false) {
            		alert('请至少选中一个职位');
            	}else{
            		if(window.confirm("你确认要进行此操作吗？")){
                	fOpenDiv(this, true, '#ffffff', '0.1');
            		}
            	}
            });
        });
function init(){
	$("#position_manage_h3").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
	$("#position_willexpired a").addClass("active");
}
function setSearchValue(){
	var jobName = $("#jobNameFalse").val();
	$("#jobName").val(jobName);
    var  jobIssuetDate = $("#jobIssuetDateFalse").val();
    $("#jobIssuetDate").val(jobIssuetDate);
    var  jobExpiryDate = $("#jobExpiryDateFalse").val();
    $("#jobExpiryDate").val(jobExpiryDate);
}
    </script>

</body>
</html>