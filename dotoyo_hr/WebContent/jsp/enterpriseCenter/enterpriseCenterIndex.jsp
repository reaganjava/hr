<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<%@ page import="com.dotoyo.buildjob.common.util.DateUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>大太阳建筑猎头--系统管理--企业首页</title>
	<jsp:include page="/jsp/common/backgroundUserJsAndCss.jsp" />
</head>

<body onload="init()">
<jsp:include page="/jsp/common/top.jsp"></jsp:include>

<div class="content">
<jsp:include page="left.jsp"></jsp:include>
<div class="content-right">
    	<div class="jbxx">
    		<div class="jbxx-title"><strong>基本信息</strong></div>
            <div class="message">
            	<div class="message-left"><img src="<%=request.getContextPath()%>/pic/system-photo1.jpg" width="150" height="150" /></div>
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
                        <li>状态：<s:if test="loginUserInfoDto.status==1">
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
                    	<li>您有<s:property value="expireJobs"/>个职位即将到期。<a href="<s:url action="enterpriseCenterAction!getIsAboutToExpireJobs.action">
                </s:url>">查看即将到期的职位</a></li>
                        <li>您有<s:property value="expiringCertNeedsAmount" />个证书需求即将到期。<a href="certNeedsManageAction!viewExpiringCertNeedsList.action">查看即将到期需求</a></li>
                        <li>
                        	今日收到<s:property value="applyJobCountToday"/>份应聘简历
                        	<a href="<s:url action="applicationsReceivedAction!applicationsReceiveds.action?jobSearchVo.applyJobQueryType=0"></s:url>">查看应聘简历</a>
                        </li>
                    </ul>
                </div>
                <div class="today-right">
                	<h2>招聘情况</h2>
                    <ul>
                    	<li>您有<s:property value="recruitingJobs"/>个职位正在招聘中，还可以发布<s:property value="remainPublishJobs"/>个。<a href="<s:url action="enterpriseCenterAction!getMyPublishingJobs.action">
                </s:url>">查看已发布职位</a></li>
                        <li>您最近三个月共收到<s:property value="trimester"/>份应聘简历。<a href="<s:url action="applicationsReceivedAction!applicationsReceiveds.action?jobSearchVo.applyJobQueryType=1">
                </s:url>">查看应聘简历</a></li>
                    </ul>
                </div>
            </div>
            <div class="today">
            	<div class="today-left">
                    <h3>证书挂靠情况</h3>
                    <ul>
                    	<li>您有<s:property value="submitCertNeedsAmount"/>个证书需求正在挂靠中，还可以发布<s:property value="remainPublishCertNeeds"/>个。<a href="certNeedsManageAction!viewSubmitedCertNeedsList.action">查看已发布证书挂靠需求</a></li>
                    </ul>
                </div>
                <div class="today-right">
                    <h3>猎头服务</h3>
                    <ul>
                    	<!-- <li>您还有<s:property value="notYetPaidOrders"/>个等待支付的订单。<a href="<s:url action="headHuntServiceManageAction!boughtServiceInit.action" namespace="/personalCenter">
                </s:url>">等待付款的订单</a></li>-->
                        <li>您有<s:property value="aboutToExpireOrders"/>个服务还有三天即将到期。<a href="<s:url action="headHuntServiceManageAction!boughtServiceInit.action" namespace="/personalCenter">
                </s:url>">已购买的服务</a></li>
                    </ul>
                </div>
            </div>
      </div>
        <div class="system-botton">
        	<ul>
            	<li class="botton1"><a href="<s:url action="headhunterCenterAction!publishedPosts.action" namespace="/headhunterCenter">
                </s:url>" target="_blank"" title="发布职位信息">发布职位信息</a></li>
                <li class="botton2"><a href="<s:url action="peopleExcavateAction!initIndex.action" namespace="/peopleExcavate">
                </s:url>" target="_blank" title="人才挖掘">人才挖掘</a></li>
                <li class="botton3"><a target="_blank" href="<s:url action="certificateAction!toSubmitCertNeeds.action" namespace="/certificateCenter">
                </s:url>" title="发布证书需求">发布证书需求</a></li>
                <li class="botton3"><a href="<s:url action="<%=request.getContextPath()%>/search_persionalcert/">
                </s:url>" title="证书搜索">证书搜索</a></li>
                <li class="botton3"><a href="<s:url action="<%=request.getContextPath()%>/">
                </s:url>" title="返回首页">返回首页</a></li>
            </ul>
        </div>
        <div class="add"><a href="#"><img src="<%=request.getContextPath()%>/pic/system-add.jpg" width="781" height="70" /></a></div>
  </div>
</div>
<script type="text/javascript">
function init(){
	$("#position_enterpriseCenter").addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
}
</script>
</body>
</html>