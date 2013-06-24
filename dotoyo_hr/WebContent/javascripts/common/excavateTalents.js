$(function(){
	if($("#orderBy").val()=="jobKeyWord"){
		$("#jobKeyWord").attr("src","../images/excavate-search-zwmc.gif");
	}else if($("#orderBy").val()=="categoryIndex"){
		$("#categoryIndex").attr("src","../images/excavate-search-xjzs.gif");
	}else if($("#orderBy").val()=="workingLife"){
		$("#workingLife").attr("src","../images/excavate-search-gznx.gif");
	}else{
		$("#userInfoUpdateDate").attr("src","../images/excavate-search-gxsj.gif");
	}
	
	// 标题与摘要
	$("#showPatternzy").click(function(){
		$("#showAbstract").val("1");
		$(".rcss-p").show();
		$("#showPatternbt").attr("src","../images/abstract-zwbt2.gif");
		$("#showPatternzy").attr("src","../images/abstract-zwzy.gif");
	});
	
	$("#showPatternbt").click(function(){
		$("#showAbstract").val("0");
		$(".rcss-p").hide();
		$("#showPatternbt").attr("src","../images/abstract-zwbt.gif");
		$("#showPatternzy").attr("src","../images/abstract-zwzy2.gif");
	});
	
	// 标题与详细
	$(".rcss4").click(function(){
		if($(this).parent().parent().parent().next().attr("style").indexOf("none")>0){
			$(this).parent().parent().parent().next().show();
		}else{
			$(this).parent().parent().parent().next().hide();
		}
	});
	
	// 排序图标更换 
	$("#jobKeyWord").click(function(){
		$("#orderBy").val($("#jobKeyWord").attr("id"));
		$("#jobKeyWord").attr("src","../images/excavate-search-zwmc.gif");
		$("#categoryIndex").attr("src","../images/excavate-search-xjzs2.gif");
		$("#workingLife").attr("src","../images/excavate-search-gznx2.gif");
		$("#userInfoUpdateDate").attr("src","../images/excavate-search-gxsj2.gif");
	});
	$("#categoryIndex").click(function(){
		$("#orderBy").val($("#categoryIndex").attr("id"));
		$("#jobKeyWord").attr("src","../images/excavate-search-zwmc2.gif");
		$("#categoryIndex").attr("src","../images/excavate-search-xjzs.gif");
		$("#workingLife").attr("src","../images/excavate-search-gznx2.gif");
		$("#userInfoUpdateDate").attr("src","../images/excavate-search-gxsj2.gif");
	});
	$("#workingLife").click(function(){
		$("#orderBy").val($("#workingLife").attr("id"));
		$("#jobKeyWord").attr("src","../images/excavate-search-zwmc2.gif");
		$("#categoryIndex").attr("src","../images/excavate-search-xjzs2.gif");
		$("#workingLife").attr("src","../images/excavate-search-gznx.gif");
		$("#userInfoUpdateDate").attr("src","../images/excavate-search-gxsj2.gif");
		
	});
	$("#userInfoUpdateDate").click(function(){
		$("#orderBy").val($("#userInfoUpdateDate").attr("id"));
		$("#jobKeyWord").attr("src","../images/excavate-search-zwmc2.gif");
		$("#categoryIndex").attr("src","../images/excavate-search-xjzs2.gif");
		$("#workingLife").attr("src","../images/excavate-search-gznx2.gif");
		$("#userInfoUpdateDate").attr("src","../images/excavate-search-gxsj.gif");
	});
	
	
	$("#talentCheckBox").click(function(){
		if($(this).attr("checked")) {
			 $(":checkbox").each(function(i){
				    $(this).attr("checked","checked");
				});
			
		}else{
			$(":checkbox").each(function(i){
			    $(this).removeAttr("checked");
			});
		}
	});
		
    $("input[type='checkbox']").not("#talentCheckBox").click(function(){
	   $("#talentCheckBox").attr('checked',$("input[type='checkbox']").not("#talentCheckBox").length==$("input:checked").not("#talentCheckBox").length);
    });
});

function sendInterviewNotice(talentId){
	var jurl = "peopleExcavateAction!sendInvitedInterviewing.action?talentId="+talentId;
	$.ajax({
		url:jurl,
		type:'post',
		dataType:'json',
		error:function(){
			alert("发送面试通知失败");
		},
		success:function(json){
			if(json=="UNLOGON"){
				window.location.href = $("#contextPath").val()+"/homePage/homePageAction!init.action?goFrom=1";
			}else if(json=="userTypeError"){
				alert("个人用户不能进行此操作，请确认账号信息!");
			}else if(json=="success"){
				alert("发送面试通知成功!");
			}else{
				alert("请确认已购买该服务，或服务是否已过期，可用次数为0.");
			}
		}
	});
	return false;
}

function showOrderBy(orderBy){
	$("#orderBy").val($(orderBy).attr("id"));
	// 提交表单
	document.pageFrom.submit();
}

$(document).ready(function() { 
    var options = { 
            url:'peopleExcavateAction!fastBatchApply.action', 
   beforeSubmit:showRequest,
        success:showResponse
     }; 
 
    // bind to the form's submit event 
    $('#pageFrom').submit(function() { 
      	$(this).ajaxSubmit(options); 
      		return false; 
    }); 
}); 
function showRequest(formData, jqForm, options) { 
	if(checkStatus('talentCheckBoxed')==false) {
		alert('请至少选中一份简历');
		return false;
	}
    return true; 
} 
 
// post-submit callback 
function showResponse(responseText, statusText)  { 
	if(responseText=="UNLOGON"){
		window.location.href = $("#contextPath").val()+"/homePage/homePageAction!init.action?goFrom=1";
	}else if(responseText=="userTypeError"){
		alert("个人用户不能进行此操作，请确认账号信息!");
	}else if(responseText=="success"){
		alert("发送面试通知成功!");
	}else{
		alert('请确认已购买该服务，或服务是否已过期，可用次数小于'+responseText);
	}
	$(":checkbox").each(function(i){
	    $(this).removeAttr("checked");
	});
} 

function linkBoStation(userId){
	var jurl = "peopleExcavateAction!linkBoStation.action?userId="+userId;
	$.ajax({
		url:jurl,
		type:'post',
		dataType:'json',
		error:function(json){
			alert("链接博站失败");
		},
		success:function(json){
			if(json=="UNLOGON"){
				window.location.href = $("#contextPath").val()+"/homePage/homePageAction!init.action?goFrom=1";
			}else if(json=="success"){
				alert("成功链接到博站...");
			}else{
				alert("请确认已购买该服务，或服务是否已过期，可用次数为0.");
			}
		}
	});
	return false;
}