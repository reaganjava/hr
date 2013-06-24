<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<div id="leftNav">
    	<ul>
            <li>
                <h3 id="position_zhaoping_h3">求职管理</h3>
                <div style="display:none;">
                      <a id="position_receivedApply" class="second-nav" tabindex="-1" href="personalCenterAction!myAppliedJobs.action">已申请的职位</a><span></span>
                      <a id="position_applyJobIntention" class="second-nav" tabindex="-1" href="personalCenterAction!viewApplyJobIntentionList.action">求职意向管理</a><span></span>
                      <a id="position_recommendation" class="second-nav" tabindex="-1" href="personalCenterAction!viewApplyRecommendation.action">成为线下推荐对象</a><span></span>
                      <a id="position_filterCompany" class="second-nav" tabindex="-1" href="filterCompanyAction!viewFilterCompany4LogginUser.action">公司屏蔽</a><span></span>
                      <h3 id="position_shortMessageManage">站内信管理</h3>
                      <ul>
                          <li><a id="position_receiveBox" href="shortMsgManageAction!viewRecieveShortMsgList.action">-&nbsp;&nbsp;收件箱</a></li>
                          <li><a id="position_autoReply" href="shortMsgManageAction!viewAutoShortMsgConfig.action">-&nbsp;&nbsp;收到面试邀请自动回复设置</a></li>
                      </ul>
                      <a id="position_receiveInterview" class="second-nav" tabindex="-1" href="receiveInterviewNoticeManageAction!viewInterviewNoticeList.action">面试通知</a><span></span>
              </div>
            </li>
            <li>
                <h3 id="position_personalCertManage">证书管理</h3>
                <ul style="display:none;">
                    <li><a id="position_submitedPersonalCert" href="personalCertManageAction!viewSubmitedCert.action">已提交证书管理</a></li>
                </ul>
            </li>
            <li>
                <h3 id="position_salonManage">发起的沙龙</h3>
                <ul style="display:none;">
                    <li><a id="position_online_salon" href="salonManageAction!myLaunchSalonList.action?salonInfoDto.salonType=<%=ApplicationConstant.SALON_TYPE_ONLINE%>">线上沙龙</a></li>
                    <li><a id="position_offline_salon" href="salonManageAction!myLaunchSalonList.action?salonInfoDto.salonType=<%=ApplicationConstant.SALON_TYPE_OFFLINE%>">线下沙龙</a></li>
                </ul>
            </li>
            <li>
                <h3 id="position_attendSalon">参与的沙龙</h3>
                <ul style="display:none;">
                    <li><a id="position_attendOnlineSalon" href="salonManageAction!myJoinSalonList.action?salonInfoDto.salonType=<%=ApplicationConstant.SALON_TYPE_ONLINE%>">线上沙龙</a></li>
                    <li><a id="position_attendOfflineSalon" href="salonManageAction!myJoinSalonList.action?salonInfoDto.salonType=<%=ApplicationConstant.SALON_TYPE_OFFLINE%>">线下沙龙</a></li>
                </ul>
            </li>
   			<li><h3 id="position_offlineSalonPicture"><a href="salonManageAction!toMediaListPage.action?salonMediaDto.mediaType=<%=ApplicationConstant.MEDIA_TYPE_PICTURE%>">线下沙龙图片库</a></h3></li>
            <li><h3 id="position_offlineSalonMedia"><a href="salonManageAction!toMediaListPage.action?salonMediaDto.mediaType=<%=ApplicationConstant.MEDIA_TYPE_VIDEO%>">线下沙龙视频库</a></h3></li>
            <li><h3 id="position_articleManage"><a href="salonManageAction!toArticleManagePage.action">文章管理</a></h3></li>
            <li><h3 id="position_commentManage"><a href="salonManageAction!toCommentManagePage.action">评论管理</a></h3></li>
           	<li>       <h3 id="position_pointManage">积分管理</h3>
                <ul style="display:none;">
                    <li><a id="position_pointDetail" href="<%=request.getContextPath()%>/personalCenter/personalCertManageAction!viewPersonPoint.action">积分情况</a></li>
                </ul>
            </li>
            <li>
                <h3 id="hunhead_service_manage_h3">猎头服务管理</h3>
                <ul style="display:none">
                    <li id="service_buy"><a href="<%=request.getContextPath()%>/personalCenter/headHuntServiceManageAction!buyServiceInit.action">购买套餐</a></li>
                    <li id="service_bought"><a href="<%=request.getContextPath()%>/personalCenter/headHuntServiceManageAction!boughtServiceInit.action">已购买的套餐</a></li>
                    <li id="service_expired"><a href="<%=request.getContextPath()%>/personalCenter/headHuntServiceManageAction!expiredServiceInit.action">已过期的套餐</a></li>
                </ul>
            </li>
            <li>
                <h3 id="position_personalCenter"><a tabindex="-1" href="personalCenterAction!init.action">会员中心</a></h3>
            </li>
            <!-- <li>
                <h3 id="position_editPassword"><a tabindex="-1" href="userAction!toEditPassword.action">修改密码</a></h3>
            </li> -->
            <li>
                <h3><a tabindex="-1" href="<s:url action='logonAction!logout.action' namespace='/homePage'></s:url>">退出系统</a></h3>
            </li>
        </ul>
    </div>