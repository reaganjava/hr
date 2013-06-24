<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
	<div class="add"><a href="<%=request.getContextPath()%>/advertisement/advertisementManageAction!getAdvertisementList.action"><img src="<%=request.getContextPath()%>/pic/bottom-add.png" width="980" height="77" /></a></div>
	<div class="bottom">
	  	<a href="<%=request.getContextPath()%>/about.jsp">关于我们</a>|
    	<a href="<%=request.getContextPath()%>/contact-us.jsp"">联系我们</a>|
    	<a href="#">在线培训</a>|
    	<a href="http://passport.jzpt.com/reg.html">免费注册</a>|

    	<s:if test='#session.userInfoDto==null'>
	    	<a href="javascript:alert('请先登陆.')">
				用户中心
			</a>|
    	</s:if>
    	<s:else>
    	<s:if test='#session.userInfoDto.userType==null||#session.userInfoDto.userType==""'>
					<a href="javascript:alert('请先完善博站资料')">
						用户中心
					</a>|
    	</s:if>
    	<s:else>
			<s:if test='#session.userInfoDto.userType==0'>
				<a href="<s:url action="personalCenterAction!init.action" namespace="/personalCenter"></s:url>">
					用户中心
				</a>|
			</s:if>
			<s:else>
				<a href="enterpriseCenterAction!init.action">
					用户中心
				</a>|
			</s:else>
    	</s:else>
    	</s:else>
    	<a href="<%=request.getContextPath()%>/legal-notices.jsp">法律声明</a>|
    	<a href="#">意见反馈</a>|
		<a href="#">在线客服</a>|
   		<a href="javascript:addHome();">
		设为首页</a>
	    <br />
	    深圳大太阳网络科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;粤ICP备10009347号&nbsp;&nbsp;&nbsp;&nbsp;增值电信业务经营许可证：粤B2-20100358
	</div>
	<div class="bottom-links">
		<a target="_blank" href="http://www.sznet110.gov.cn/webrecord/innernet/Welcome.jsp?bano=4403101010155"><img src="<%=request.getContextPath()%>/images/bottom-logo1.png" width="108" height="42" alt="公共信息安全网络监察"/></a>
		<a target="_blank" href="http://www.hd315.gov.cn/beian/view.asp?bianhao=0272000112400002"><img src="<%=request.getContextPath()%>/images/bottom-logo2.png" width="108" height="42"  alt="经营性网站备案信息"/></a>
		<a target="_blank" href="http://net.china.cn/chinese/index.htm"><img src="<%=request.getContextPath()%>/images/bottom-logo3.png" width="108" height="42" alt="不良信息举报中心"/></a></div>
</div>
<div style="display:none;"><script src="http://s84.cnzz.com/stat.php?id=4208539&web_id=4208539" language="JavaScript"></script></div>
<input type="hidden" id="homePageURL" value="<s:text name='homePageURL'/>"/>
<script type="text/javascript">
var homePageURL = $("#homePageURL").val();
function addHome(){
    if (document.all){
        document.body.style.behavior='url(#default#homepage)';
          document.body.setHomePage(window.location.href);
    }else if (window.sidebar){
        if(window.netscape){
            try{
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }catch (e){
                alert( "该操作被浏览器拒绝，如果想启用该功能，请在地址栏内输入 about:config,然后将项 signed.applets.codebase_principal_support 值该为true" );
            }
        }
        var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components. interfaces.nsIPrefBranch);
        prefs.setCharPref('browser.startup.homepage',window.location.href);
    }else{
        alert('您的浏览器不支持自动自动设置首页, 请使用浏览器菜单手动设置!');
    }
}
</script>

