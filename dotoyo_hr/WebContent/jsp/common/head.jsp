<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">

</style>
<script type="text/javascript">
function changeMenu(obj)
{
	for(var i=1;i<=6;i++)
	{
		$("#menu0"+i).attr("class","nav-on");
	}

	$(obj).attr("class","nav-out");
}
//submit batch choose action form
function submitForm4ChangeActionCheckNull(formName,actionName){
	if(formName == null){
	  document.form.submit();
	}else{
	  formName.action=actionName;
      formName.submit();
	}
}
</script>

<div class="top">
	<div class="logo1"><img src="<%=request.getContextPath()%>/images/logo.png" width="152" height="88" alt="大太阳建筑网"/></div>
    <div class="logo2"><a href="#"><img src="<%=request.getContextPath()%>/images/logo2.png" width="147" height="55" alt="猎头，甄别模下的人才交流"/></a></div>
    <div class="top-right">
    	<s:include value="/html/common/TopAd.html"/>
        <div class="top-font">
        	<span>
        		<s:if test="#session.userInfoDto != null">
        			<s:property value="#session.userInfoDto.userName"/>，欢迎您！
        		</s:if>
        	</span>
        	<ul>
            	<!--  <li><a href="#">大太阳公益</a></li>-->
                <li><a href="<%=request.getContextPath()%>/help.jsp">帮助中心</a></li>
                <li><a href="<%=request.getContextPath()%>/services.jsp">增值服务</a></li>
               	<s:if test="#session.userInfoDto != null">
               		<s:if test='#session.userInfoDto.userType==null||#session.userInfoDto.userType==""'>
               		</s:if>
               		<s:else>
	               		<li>
	               			<s:if test='#session.userInfoDto.userType==0'>
								<a href="<s:url action="personalCenterAction!init.action" namespace="/personalCenter"></s:url>">
									会员中心
								</a>
							</s:if>
							<s:else>
								<a href="enterpriseCenterAction!init.action">
									会员中心
								</a>
							</s:else>
						</li>
               		</s:else>
               		<li><a href="<%=request.getContextPath()%>/homePage/logonAction!logout.action">退出</a></li>
               	</s:if>
               	<s:else>
                	<!--<li><a href="<%=request.getContextPath()%>/homePage/homePageAction!toUserRegister.action">注册</a></li>-->
                	<li><a href="http://passport.jzpt.com/reg.html">注册</a></li>
               		<li>
               		<!-- <a href="<%=request.getContextPath()%>/">登录</a>-->
               		<a href="http://passport.jzpt.com/login?service=http://hr.jzpt.com/">登录</a>
               		</li>
               	</s:else>
            </ul>
        </div>
    </div>
</div>