<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
function sendInterviewNotice(jobId){
	var jurl = "applyJobCenter!sendInterviewNotice.action?jobId="+jobId;
	$.ajax({
		url:jurl,
		type:'post',
		dataType:'json',
		error:function(){
			alert("发送面试通知失败");
		},
		success:function(json){
			if(json=="success"){
				alert("发送面试通知成功");	
			}
			if(json=="serviceOutOfDate"){
				alert("请确认已购买该服务，或服务已过期(可用次数不够).");
			}
			if(json=="permissionDenied"){
				alert("权限不够，请先完善博站资料.");
			}
			if(json=="userTypeError"){
				alert("个人用户不能进行此操作，请确认账号信息.");
			}
			if(json=="UNLOGON"){
				window.location.href = "<%=request.getContextPath()%>/homePage/homePageAction!init.action?goFrom=1";
			}
		}
	}
			);
	return false;
}
</script>