<%@page import="com.dotoyo.buildjob.common.constant.ApplicationConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0);
%>
<s:include value="/html/homeHead.html"/>
<s:include value="/jsp/common/head.jsp"/>
<s:include value="homePageNav.jsp"/>
<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/region.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/jquery.query.js"></script>
	<div class="banner-line">
		<div class="banner-box">
			<div class="banner"><img src="<%=request.getContextPath()%>/images/banner.jpg" width="682" height="220" /></div>
			<s:if test='#session.userInfoDto==null'>
				<div class="login">
					<s:form id="userLogonForm" name="userLogonForm" method="post" action="logonAction!logon.action">
						<input id="userLogonFormFlag" type="hidden" value="0"/>
						<div class="login-title"></div>
						<s:if test='userInfo==null||userInfo.userName==null||userInfo.userName==""'>
						<div id="accountDiv" class="login-account">
							<s:textfield id="account" name="userInfo.userName"  cssClass="validate[custom[email]]"/>
						</div>
						</s:if>
						<s:else>
							<div id="accountDiv" class="login-input">
							<s:textfield id="account" name="userInfo.userName"  cssClass="validate[custom[email]]"/>
						</div>
						</s:else>
						<div id="passwordDiv" class="login-password">
							<input id="password" name="userInfo.password" type="password"" value="" class="validate[requiredPassword]"/>
						</div>
						<div class="yzm">
							<div id="yzmDiv" class="login-yzm">
								<input id="captcha" name="captcha" type="text" value="" class="validate[requiredYZM]"/>
							</div>
							<div class="yzm-pic">
								<img src="<%=request.getContextPath()%>/jcaptcha" onclick="changeImage(this)" alt="点击刷新" style="cursor: pointer;" id="kaptchaImage" width="80" height="20" />
							</div>
						</div>
						<div class="login-botton">
							<div class="l-botton">
								<input type="image" src="<%=request.getContextPath()%>/images/login-botton.png" style="width:101px;height:29"/>
							</div>
							<!--<div class="l-font"><a href="<%=request.getContextPath()%>/homePage/homePageAction!toUserRegister.action">还没有帐号？</a></div>-->
							<div class="l-font"><a href="http://passport.jzpt.com/reg.html">还没有帐号？</a></div>
						</div>
						<div class="login-wz" align="left"><!-- <a href="#">忘记密码？</a>| --><a href="<%=request.getContextPath()%>/services.jsp">猎头服务</a>|<a href="javascript:alert('请先登录')"><img src="<%=request.getContextPath()%>/images/bz-icon.jpg" width="17" height="13" />&nbsp;<strong>我的博站</strong></a></div>
					</s:form>
				</div>
			</s:if>
			<s:else>
				<s:if test='#session.userInfoDto.userType==null||#session.userInfoDto.userType==""'>
					<div class="login">
						<p>
							 欢迎您，<s:property value="#session.userInfoDto.userName"/>  再次光临猎头系统！<br />
							 <strong>今日提醒：</strong><br />
							 功能被限制！请尽快完善博站资料
						</p>
						<div class="login-botton">
						<div class="l-botton">
								<a href="http://bz.jzpt.com/member/manage/main.htm">
									<img src="<%=request.getContextPath()%>/images/login-botton2.png" width="101" height="29" />
								</a>
						</div>
						<div class="l-font2"><a href="logonAction!logout.action">退出登录</a></div>
						<!--<div class="l-font2"><a href="http://passport.jzpt.com/logout">退出登录</a></div>-->
						</div>
						<div class="login-wz"><a href="http://bz.jzpt.com/member/manage/main.htm">密码修改</a>|<a href="../personalCenter/headHuntServiceManageAction!buyServiceInit.action">猎头服务</a>|<a href="http://bz.jzpt.com/garea/website/index.htm?id=<s:property value='#session.userInfoDto.id'/>"><img src="<%=request.getContextPath()%>/images/bz-icon.jpg" width="17" height="13" />&nbsp;<strong>我的博站</strong></a></div>
					</div>
				</s:if>
				<s:else>
					<div class="login">
						<p>
							 欢迎您，<s:property value="#session.userInfoDto.userName"/>  再次光临猎头系统！<br />
							 <strong>今日提醒：</strong><br />
							<s:if test='#session.userInfoDto.userType=="0"'>
								您有<s:property value="notSeeInvite"/>个面试通知还未查看
							</s:if>
							<s:else>
								您有<s:property value="expireJobs"/>个职位即将到期
							</s:else>
						</p>
						<div class="login-botton">
						<div class="l-botton">
							<s:if test='#session.userInfoDto.userType==0'>
								<a href="<s:url action="personalCenterAction!init.action" namespace="/personalCenter"></s:url>">
									<img src="<%=request.getContextPath()%>/images/login-botton2.png" width="101" height="29" />
								</a>
							</s:if>
							<s:else>
								<a href="enterpriseCenterAction!init.action">
									<img src="<%=request.getContextPath()%>/images/login-botton2.png" width="101" height="29" />
								</a>
							</s:else>
						</div>
						<div class="l-font2"><a href="logonAction!logout.action">退出登录</a></div>
						<!--<div class="l-font2"><a href="http://passport.jzpt.com/logout">退出登录</a></div>-->
						</div>
						<!--<div class="login-wz"><a href="<s:url action='userAction!toEditPassword.action'/>">密码修改</a>|<a href="../personalCenter/headHuntServiceManageAction!buyServiceInit.action">猎头服务</a>|
						<a href="#"><img src="<%=request.getContextPath()%>/images/bz-icon.jpg" width="17" height="13" />&nbsp;<strong>我的博站</strong></a></div>-->
						<div class="login-wz"><a href="http://passport.jzpt.com/alterPassword.html?securityCode=${securityCode}&mail=<s:property value='#session.userInfoDto.userName'/>&userid=<s:property value='#session.userInfoDto.id'/>">密码修改</a>|<a href="../personalCenter/headHuntServiceManageAction!buyServiceInit.action">猎头服务</a>|
						<a href="http://bz.jzpt.com/garea/website/index.htm?id=<s:property value='#session.userInfoDto.id'/>"><img src="<%=request.getContextPath()%>/images/bz-icon.jpg" width="17" height="13" />&nbsp;<strong>我的博站</strong></a></div>
					</div>
				</s:else>
			</s:else>
			<s:hidden id="errorMessage" name="errorMessage"></s:hidden>
			<script type="text/javascript">
				$(document).ready(function(){
					if($("#account").val() != ""){
						$("#accountDiv").attr("class","login-input");
					}
					if($("#password").val() != ""){
						$("#passwordDiv").attr("class","login-input");
					}
					if($("#captcha").val() != ""){
						$("#yzmDiv").attr("class","yzm-left")
					}
					var errorMessage = $("#errorMessage").val();
					if(errorMessage!=null && errorMessage!= "")
						alert(errorMessage);
				});
			</script>
<s:include value="/html/homeBottom.html"/>
<s:include value="/jsp/common/bottom.jsp"/>
</body>
</html>
