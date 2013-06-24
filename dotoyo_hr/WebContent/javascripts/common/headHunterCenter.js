$(function(){
	// 更多搜索条件隐藏 打开
	$("#moreCondition").hide();
	$("#norm").hide();

	$("#more").click(function(){
		$("#moreCondition").show();
		$("#more").hide();
		$("#norm").show();
		$("#advancedSearch1").val("1");
		$("#advancedSearch2").val("1");
	});
	$("#norm").click(function(){
		$("#moreCondition").hide();
		$("#norm").hide();
		$("#more").show();
		$("#advancedSearch1").val("0");
		$("#advancedSearch2").val("0");
	});

	// 初始页面排序条件高亮
	if($("#orderBy").val()=="orderByJobKeyWord"){
		$("#orderByJobKeyWord").attr("src","../images/abstract-axgd.gif");
	}else{
		$("#orderByJobIssuetDate").attr("src","../images/abstract-afbsj.gif");
	}

	// 标题与摘要
	$("#showPatternzy").click(function(){
		$("#showAbstract1").val("1");
		$("#showAbstract2").val("1");
		$(".abstract-text-p").show();
		$("#showPatternbt").attr("src","../images/abstract-zwbt2.gif");
		$("#showPatternzy").attr("src","../images/abstract-zwzy.gif");
	});
	$("#showPatternbt").click(function(){
		$("#showAbstract1").val("0");
		$("#showAbstract2").val("0");
		$(".abstract-text-p").hide();
		$("#showPatternbt").attr("src","../images/abstract-zwbt.gif");
		$("#showPatternzy").attr("src","../images/abstract-zwzy2.gif");
	});

	// 标题与详细
	$(".abstract-text4").click(function(){
		if($(this).parent().parent().next().attr("style").indexOf("none")>0){
			$(this).parent().parent().next().show();
		}else{
			$(this).parent().parent().next().hide();
		}
	});

	//搜索类型的改变
	$(function () {
	if($("#searchType").val()=="0"){
		$("#position").attr("src","../images/abstract-botton1.png");
		$("#company").attr("src","../images/abstract-botton2.png");
	}else if($("#searchType").val()=="1"){
		$("#position").attr("src","../images/abstract-botton11.png");
		$("#company").attr("src","../images/abstract-botton22.png");
	}
	});
	$("#company").click(function(){
		$("#searchType").val("1");// 企业搜索
	});

	$("#position").click(function(){
		$("#searchType").val("0");// 职位搜索
	});


	// 排序图标更换
	$("#orderByJobKeyWord").click(function(){
		$("#orderBy").val($("#orderByJobKeyWord").attr("id"));

		$("#orderByJobKeyWord").attr("src","../images/abstract-axgd.gif");
		$("#orderByJobIssuetDate").attr("src","../images/abstract-afbsj2.gif");
	});
	$("#orderByJobIssuetDate").click(function(){
		$("#orderBy").val($("#orderByJobIssuetDate").attr("id"));

		$("#orderByJobKeyWord").attr("src","../images/abstract-axgd2.gif");
		$("#orderByJobIssuetDate").attr("src","../images/abstract-afbsj.gif");
	});

	$("#jobCheckBox").click(function(){
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

    $("input[type='checkbox']").not("#jobCheckBox").click(function(){
	   $("#jobCheckBox").attr('checked',$("input[type='checkbox']").not("#jobCheckBox").length==$("input:checked").not("#jobCheckBox").length);
    });
});

function keyWordsOnFocus(obj){
	var text = obj.value;
	if(text=="请输入关键字...")
		{
			obj.value = "";
		}
	}
function keyWordsOnBlur(obj){
	var text = obj.value;
	if(text==""){
		obj.value = "请输入关键字...";
	}
}

function linkBoStation(userId){
	var rootPath = $("#rootPath").val();
	var jurl;
	if(rootPath!=null&&rootPath!=""){
		jurl = rootPath+"/headhunterCenter/headhunterCenterAction!linkBoStation.action?userId="+userId;
	}
	else{
		jurl = "headhunterCenterAction!linkBoStation.action?userId="+userId;
	}
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
			}else if(json=="error"){
				alert("请确认已购买该服务，或服务是否已过期，可用次数为0.");
			}else{
				alert("成功链接到博站...");
			}
		}
	});
	return false;
}



function appliedJob(jobId,userId){
	var jurl = "headhunterCenterAction!appliedJob.action?jobId="+jobId+"&userId="+userId;
	$.ajax({
		url:jurl,
		type:'post',
		dataType:'json',
		error:function(json){
			alert("职位申请失败");
		},
		success:function(json){
			if(json=="UNLOGON"){
				window.location.href = $("#contextPath").val()+"/homePage/homePageAction!init.action?goFrom=1";
			}else if(json=="userTypeError"){
				alert("企业用户不能进行此操作，请确认账号信息!");
			}else{
				alert("职位申请成功");
			}
		}
	});
	return false;
}

$(document).ready(function() {
    var options = {
            url:'headhunterCenterAction!fastBatchAppliedJob.action',// target element(s) to be updated with server response
   beforeSubmit:showRequest,
        success:showResponse
     };

    // bind to the form's submit event
    $('#pageFrom').submit(function() {
      	$(this).ajaxSubmit(options);
      		return false;
    });
});

// post-submit callback
function showResponse(responseText, statusText)  {
	if(responseText=="UNLOGON"){
		window.location.href = $("#contextPath").val()+"/homePage/homePageAction!init.action?goFrom=1";
	}else if(responseText=="userTypeError"){
		alert("企业用户不能进行此操作，请确认账号信息!");
	}else{
		alert("职位申请成功");
	}
	$(":checkbox").each(function(i){
	    $(this).removeAttr("checked");
	});
}

