<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/css/system-manage.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/validateMessage.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/javascripts/common/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/javascripts/common/jquery-ui-1.7.2.custom.min.js"></script>
<script
	src="<%=request.getContextPath()%>/javascripts/common/accordion.js"></script>
<script
	src="<%=request.getContextPath()%>/javascripts/common/jquery.cookie.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/common.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/select.js"></script>
<script src="<%=request.getContextPath()%>/javascripts/common/jquery.validate.js"></script>

<script type="text/javascript">
/*
$(function(){
			//Main menu
			$(".nav li").mouseover(function(){
				$(".nav li").attr("class","nav-on");
				$(this).addClass("nav-out");
			});

			// Accordion
            $("#leftNav").accordion({
                header: "h3",
                collapsible: true,
				autoHeight: false,
                active: false,
				multipleMode: true
            });

			//Init active array
			var activeArr;
			if($.cookie("active_left_nav")!=null){
				activeArr = $.cookie("active_left_nav").replace(/(^\,*)|(\,*$)/g, "").split(",");
			}
			else{
				activeArr = new Array();
			}
			//Init left nav
			var activeA = $.cookie("active_left_nav_a");
			if(activeA != null){
				$("#leftNav a").removeClass("active");
				$("#leftNav a").eq(activeA).addClass("active");
			}
			if(activeArr.length>0)
			{
				$.each(activeArr,function(key,val){
					if(val!=""){
						$("#leftNav h3").eq(val).addClass("ui-state-active").next().addClass("ui-accordion-content-active").show();
					}
				});
			}
			//Set active array when click
			$("#leftNav h3").click(function(){
				var index = $("#leftNav h3").index($(this)[0]);
				if($(this).hasClass("ui-state-active")){
					//Add to array
					if($.inArray(index, activeArr)){
						activeArr.push(index);
					}
				}
				else{
					//Remove from array
					$.grep(activeArr,function(val,key){
						if(val==index){
							activeArr.splice(key, 1);
						}
					});
				}
				$.cookie("active_left_nav", activeArr.join(","));
			});

			$("#leftNav a").click(function(){
				$("#leftNav a").removeClass("active");
				var index = $("#leftNav a").index($(this)[0]);
				$(this).addClass("active");
				$.cookie("active_left_nav_a", index);
			});
        });
 */
$(function(){
	// Accordion
    $("#leftNav").accordion({
        header: "h3",
        collapsible: true,
		autoHeight: false,
        active: false,
		multipleMode: true
    });
 });
//submit form
function submitForm(formName){

	if(formName == null){
	  document.form.submit();
	}else{
      formName.submit();
	}
}
//go back
function goBack(){
	window.history.go(-1);
}

//submit batch choose action form
function submitFormChooseCheck(formName,checkBoxName){
	if(checkStatus(checkBoxName)){
	if(confirm("你确认要进行此操作吗?")){
	if(formName == null){
	  document.form.submit();
	}else{
      formName.submit();
	}
   }
 }else{
   alert("请选择最少一条记录");
 }
}
function clickSearch(){
	document.searchForm.submit();
}

//个人用户后台省、市、区三级联动（select标签）
$(document).ready(function(){
	$("#province").change(function(){
		var provinceCode = $("#province option:selected").val();
		var url = "<%=request.getContextPath()%>/common/loadCity.action?provinceCode="+provinceCode;
		$.getJSON(url,loadCity);
	});
	$("#city").change(function(){
		var cityCode = $("#city option:selected").val();
		var url = "<%=request.getContextPath()%>/common/loadArea.action?cityCode="+cityCode;
		$.getJSON(url,loadArea);
	});
	loadCity=function(data){
		var options = "<option value=\"\">城市</option>";
		var value = "";
		var text = "";
		data = eval('('+data+')');
		$.each(data,function(i,item){
			value = item.code;
			text = item.name;
			options = options + "<option value=\""+value+"\">"+text+"</option>";
		});
		$("#city").html(options);
		var cityCode = $("#city option:selected").val();
		var url = "<%=request.getContextPath()%>/common/loadArea.action?cityCode="+cityCode;
		$.getJSON(url,loadArea);
	};
	loadArea=function(data){
		var options = "<option value=\"\">城区</option>";
		var value = "";
		var text = "";
		data = eval('('+data+')');
		$.each(data,function(i,item){
			value = item.code;
			text = item.name;
			options = options + "<option value=\""+value+"\">"+text+"</option>";
		});
			$("#area").html(options);
	};
});

</script>