<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.util.DateUtil"%>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
	<link type="image/x-icon" href="/images/dotoyo.ico" rel="shortcut icon">
</head>
<body onload="init()">
<jsp:include page="/jsp/common/top.jsp"></jsp:include>
<!--以上为头部分-->
<!--中间部分-->
<div class="content">
	<jsp:include page="left.jsp"></jsp:include>
    <div class="content-right">
    	<div class="jbxx">
    		<div class="jbxx-title"><strong>基本信息</strong></div>
            <div class="message">
            	<div class="message-left"><img src="<%=request.getContextPath()%>/pic/system-photo2.jpg" width="150" height="150" /></div>
                <div class="message-right">
                	<ul>
                		<li>用户名：<s:property value="loginUserInfoDto.userName"/></li>
                        <li>电话：</li>
                        <li>行业：<s:property value="blogUserinfo.industryName"/></li>
                        <li>手机：</li>
                        <li>专业：<s:property value="blogUserinfo.specializedName"/></li>
                        <li>专长：<s:property value="blogUserinfo.metier" /></li>
                        <li>传真：</li>
                        <li>积分：<s:property value="loginUserInfoDto.point"/></li>
                        <li>状态：
                        	<s:if test="loginUserInfoDto.status==1">
                        		正常
                        	</s:if>
                        	<s:else>
                        		停用
                        	</s:else>
                        </li>
                        <li>上次登录日期：<s:property value="getText('formatDate_yyyy-MM-dd',{loginUserInfoDto.lastLoginDate})"/></li>
                    </ul>
                </div>
            </div>
            <div class="today-title"><span>今日提醒</span><em><%=DateUtil.getCurrentDateString("yyyy-MM-dd")%></em></div>
            <div class="today">
            	<div class="today-left">
                	<h1>特别提醒</h1>
                    <ul>
                    	<li>今日新增<s:property value="newJobs"/>个期望相关职位。<a href="personalCenterAction!viewNewJobs.action" target="_blank">查看相关职位</a></li>
                        <li>今日新增<s:property value="todayCertNeeds"/>个证书需求。<a href="<s:url action="certificateAction!moreCertNeeds.action" namespace="/certificateCenter">
                </s:url>">查看相关证书需求</a></li>
                		<li>
                			您有<s:property value="notSeeInvite"/>个面试通知还未查看
                			<a href="receiveInterviewNoticeManageAction!viewInterviewNoticeList.action?interviewNoticeDto.status=0">查看收到的面试通知</a>
                		</li>
                    </ul>
                </div>
                <div class="today-right">
                	<h2>猎头服务</h2>
                    <ul>
                    	<!-- <li>您还有<s:property value="notYetPaidOrders"/>个待支付的订单。<a href="headHuntServiceManageAction!boughtServiceInit.action">等待付款的订单</a></li> -->
                        <li>您有<s:property value="aboutToExpireOrders"/>个服务还有三天即将到期。<a href="headHuntServiceManageAction!boughtServiceInit.action">已购买的服务</a></li>
                    </ul>
                </div>
            </div>
      </div>
        <div class="system-botton">
        	<ul>
            	<li class="botton1"><a href="<s:url action="/search_main/" >
                </s:url>" title="职位搜索">职位搜索</a></li>
                <li class="botton1"><a target="_blank" href="<s:url action="applyJobCenter!toApplyJob.action" namespace="/applyJobCenter">
                </s:url>" title="发布求职信息">发布求职信息</a></li>
                <li class="botton2"><a target="_blank" href="<s:url action="certificateAction!toSubmitCert.action" namespace="/certificateCenter">
                </s:url>" title="发布证书信息">发布证书信息</a></li>
                <li class="botton3"><a href="<s:url action="/search_needscert/">
                </s:url>" title="证书需求搜索">证书需求搜索</a></li>

                <li class="botton3"><a href="<s:url action="homePageAction!init.action" namespace="/homePage">
                </s:url>" title="返回首页">返回首页</a></li>
            </ul>
        </div>
        <div class="add"><a href="#"><img src="<%=request.getContextPath()%>/pic/system-add.jpg" width="781" height="70" /></a></div>
  </div>
</div>
<script type="text/javascript">
function init(){
	$("#position_personalCenter").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
}
</script>
</body>
</html>