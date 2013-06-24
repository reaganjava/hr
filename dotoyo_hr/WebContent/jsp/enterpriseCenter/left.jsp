<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<div id="leftNav">
    	<ul>
        	<li>
                <h3 id="position_manage_h3">职位管理</h3>
                <ul style="display:none">
                    <li>
                    	 <a href="<%=request.getContextPath()%>/headhunterCenter/headhunterCenterAction!publishedPosts.action" target="_blank">新增职位</a>
                    </li>
                    <li id="position_published"><a href="enterpriseCenterAction!getMyPublishingJobs.action">发布中的职位</a></li>
                    <li id="position_suspend"><a href="enterpriseCenterAction!getMySuspendJobs.action">暂停的职位</a></li>
                    <li id="position_willexpired"><a href="enterpriseCenterAction!getIsAboutToExpireJobs.action">即将到期的职位</a></li>
                    <li id="position_ended"><a href="enterpriseCenterAction!getCompleteJobs.action">已结束的职位</a></li>
                </ul>
            </li>
            <li>
				<h3 id="position_zhaoping_h3"><a tabindex="-1" href="#">招聘管理</a></h3>
                <div  style="display:none">
                    <a id="position_zhaoping_received" class="second-nav" tabindex="-1" href="<s:url action='applicationsReceivedAction!applicationsReceiveds.action'></s:url>">收到的申请</a><span></span>
                    <a id="position_send_interview" class="second-nav" tabindex="-1" href="sendInterviewNoticeManageAction!viewInterviewNoticeList.action">查看已发送邀请</a><span></span>
                    <h3 id="position_shortMessageManage">站内信管理</h3>
                    <ul>
                        <li><a id="position_receiveBox" href="shortMsgManageAction!viewRecieveShortMsgList.action">-&nbsp;&nbsp;收件箱</a> </li>
                        <li><a id="position_autoReply" href="shortMsgManageAction!viewAutoShortMsgConfig.action">-&nbsp;&nbsp;职位申请自动回复设置</a> </li>
                    </ul>
              </div>
            </li>
            <li>
                <h3 id="position_offlineSearchResult"><a tabindex="-1" href="offlineSearchResultAction!viewSearchResult4CurrentUser.action">线下人才需求</a></h3>
            </li>
            <li>
                <h3 id="position_certNeeds">证书管理</h3>
                <ul style="display:none">
                    <li><a href="certNeedsManageAction!toAddCertNeeds.action">新增证书需求</a></li>
                    <li><a id="position_submitedCertNeeds" href="certNeedsManageAction!viewSubmitedCertNeedsList.action">发布中的证书需求</a></li>
                    <li><a id="position_pausedCertNeeds" href="certNeedsManageAction!viewPausedCertNeedsList.action">暂停的证书需求管理</a></li>
                    <li><a id="position_expiringCertNeeds" href="certNeedsManageAction!viewExpiringCertNeedsList.action">即将到期的证书需求管理</a></li>
                    <li><a id="position_expiredCertNeeds" href="certNeedsManageAction!viewExpiredCertNeedsList.action">已结束证书需求管理</a></li>
                </ul>
            </li>
            <li>
                <h3 id="position_salonManage">发起的沙龙</h3>
                <ul style="display:none">
                    <li><a id="position_online_salon" href="salonManageAction!myLaunchSalonList.action?salonInfoDto.salonType=<%=ApplicationConstant.SALON_TYPE_ONLINE%>">线上沙龙</a></li>
                    <li><a id="position_offline_salon" href="salonManageAction!myLaunchSalonList.action?salonInfoDto.salonType=<%=ApplicationConstant.SALON_TYPE_OFFLINE%>">线下沙龙</a></li>
                </ul>
            </li>
            <li>
                <h3 id="position_attendSalon">参与的沙龙</h3>
                <ul style="display:none">
                    <li><a id="position_attendOnlineSalon" href="salonManageAction!myJoinSalonList.action?salonInfoDto.salonType=<%=ApplicationConstant.SALON_TYPE_ONLINE%>">线上沙龙</a></li>
                    <li><a id="position_attendOfflineSalon" href="salonManageAction!myJoinSalonList.action?salonInfoDto.salonType=<%=ApplicationConstant.SALON_TYPE_OFFLINE%>">线下沙龙</a></li>
                </ul>
            </li>
   			<li><h3 id="position_offlineSalonPicture"><a href="salonManageAction!toMediaListPage.action?salonMediaDto.mediaType=<%=ApplicationConstant.MEDIA_TYPE_PICTURE%>">线下沙龙图片库</a></h3></li>
            <li><h3 id="position_offlineSalonMedia"><a href="salonManageAction!toMediaListPage.action?salonMediaDto.mediaType=<%=ApplicationConstant.MEDIA_TYPE_VIDEO%>">线下沙龙视频库</a></h3></li>
            <li><h3 id="position_articleManage"><a href="salonManageAction!toArticleManagePage.action">文章管理</a></h3></li>
            <li><h3 id="position_commentManage"><a href="salonManageAction!toCommentManagePage.action">评论管理</a></h3></li>

           	<li>
                <h3 id="position_pointManage">积分管理</h3>
                <ul style="display:none">
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
                <h3 id="position_enterpriseCenter"><a tabindex="-1" href="<s:url action='enterpriseCenterAction!init.action' namespace='/enterpriseCenter'></s:url>">会员中心</a></h3>
            </li>
            <li>
                <h3 id="position_editPassword"><a tabindex="-1" href="userAction!toEditPassword.action">修改密码</a></h3>
            </li>
            <li>
                <h3><a tabindex="-1" href="<s:url action='logonAction!logout.action' namespace='/homePage'></s:url>">退出系统</a></h3>
            </li>
        </ul>
    </div>