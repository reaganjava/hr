function menuClick(sender, searchdown, xoffset, yoffset) {
	$(searchdown).css("left", $(sender).offset().left - 5);
	$(searchdown).css("top",
			$(sender).offset().top + $(sender).outerHeight() + 2);
	$(searchdown).show();
}
function menuHide(sender) {
	$(sender).fadeOut("slow");
}

function hideElement(element) {
	$(element).hide();
}

function showElement(element) {
	$(element).show();
}
function textCounter(field,maxlimit) {
	if (field.value.length > maxlimit)
	field.value = field.value.substring(0,maxlimit);
}
// 翻页

function gotoPage(pageNum,voName) {
	// alert("go to page number is 1==="+pageNum);
	if (checkRate(pageNum)) {
		alert("你输入的页码有误!");
		return false;
	}else{
		document.getElementById(voName+".currentPageNum").value = pageNum;
		document.getElementById("fromFlagId").value ="1";

		//alert("===="+document.getElementById("fromFlagId").value);
		// $("#pageInfo.currentPageNum").val(pageNum);
		// alert("go to page number is 2==="+pageNum);
		// alert($("#pageFrom").attr("action"));
		// alert("currentPageNum==="+document.getElementById(voName+".currentPageNum").value);
		document.pageFrom.submit();
		// alert("go to page number is 3==="+pageNum);
	}
}
//正整数判断
function checkRate(input)
{
     var re = /^[1-9]+[0-9]*]*$/;
     if (!re.test(input)) return true;
}
// 直接跳到第几页
function directGotoPage() {
	var pageNum = document.getElementById("gotoPageNum").value;
	var totalPageNum = document.getElementById("totalPageNumId").value;
	document.getElementById("fromFlagId").value ="1";
	// alert("直接跳到===" + pageNum);
	// alert("一共有多少页===" + totalPageNum);

	if (checkRate(pageNum)) {
		alert("你输入的页码有误!");
		return false;
	}else
	{
		if (parseInt(pageNum) <= parseInt(totalPageNum)) {
			document.getElementById(arguments[0]+".currentPageNum").value = pageNum;
			document.pageFrom.submit();
		} else {
			alert("你输入的是要跳到第 " + pageNum + "页,但最多只有" + totalPageNum + "页");
			return false;
		}
	}
}

function absolutePoint(element) {
	var result = {
		x : element.offsetLeft,
		y : element.offsetTop
	};
	element = element.offsetParent;
	while (element) {
		result.x += element.offsetLeft;
		result.y += element.offsetTop;
		element = element.offsetParent;
	}
	return result;
}

//全选操作
$(function(){
	$("#selected").click(function(){
		if($(this).attr("checked")) {
			 $(":checkbox").each(function(i){
			 		if(!this.disabled){
				    	$(this).attr("checked","checked");
				    }
				});

		}else{
			$(":checkbox").each(function(i){
				if(!this.disabled){
					$(this).removeAttr("checked");
				}
			});
		}
	});
	$("input[type='checkbox']").not("#selected").click(function(){
		   $("#selected").attr('checked',$("input[type='checkbox']").not("#selected").length==$("input:checked").not("#selected").length);
	});

	$("#SSS").click(function(){
		if($(this).attr("checked")) {
			 $(":checkbox").each(function(i){
			 	if(!this.disabled){
				    $(this).attr("checked","checked");
				  }
				});

		}else{
			$(":checkbox").each(function(i){
				if(!this.disabled){
					$(this).removeAttr("checked");
				}
			});
		}
	});
	$("input[type='checkbox']").not("#SSS").click(function(){
	   $("#SSS").attr('checked',$("input[type='checkbox']").not("#SSS").length==$("input:checked").not("#SSS").length);
	});
});



$(document).mouseup(function() {
	$(".head-down div").hide();
});
$(document).mouseup(function() {
	$(".park-down div").hide();
});
$(document).mouseup(function() {
	$(".china-down div").hide();
});
$(document).mouseup(function() {
	$(".salon-down div").hide();
});
$(document).mouseup(function() {
	$(".search-down div").hide();
});
$(document).mouseup(function() {
	$(".abstract-down div").hide();
});
$(document).mouseup(function() {
	$(".jobs-down div").hide();
});
$(document).mouseup(function() {
	$(".moban-down div").hide();
});
$(document).mouseup(function() {
	$(".excavate-down div").hide();
});
$(document).mouseup(function() {
	$(".zs-down div").hide();
});


//判断复选框至少有一条记录被选中
function checkStatus(checkboxName){
	var checkbox = document.getElementsByName(checkboxName);
	var checked = false;
	if(checkbox==null){//不存在任何记录
		checked = false;
	}
	else{
		var len = checkbox.length;
		if(len==null){//只有一条记录
			if(checkbox.checked){
				checked = true;
			}
		}
		else{//有多条记录存在
			for(i=0;i<len;i++){
				if(checkbox[i].checked){
					checked = true;
					break;
				}
			}
		}
	}

	return checked;
}

//message alert
function noLogonMsg(){
 alert("请先登录!");
}
/**
* 加载广告
**/
function callAdvert(){
	var html = "";

	if(arguments.length == 2){
		html += "<a href=\""+arguments[0]+"\">"+arguments[1]+"</a>";
		document.write(html);
		return;
	}
	if(arguments.length != 6) return;

	if(arguments[2].toLowerCase().indexOf(".swf") >0){
		html += "<div style=\"position:relative;\">\n";
		html += "<div style=\"z-index:1\">\n";
		html += "<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0\" width=\""+arguments[0]+"\" height=\""+arguments[1]+"\">\n";
		html += "<param name=\"movie\" value=\""+arguments[2]+"\">\n";
		html += "<param name=\"wmode\" value=\"transparent\">\n";
		html += "<embed src=\""+arguments[2]+"\" quality=\"high\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" width=\""+arguments[0]+"\" height=\""+arguments[1]+"\" wmode=\"transparent\"></embed>\n";
		html += "</object>\n";
		html += "</div>\n";
		html += "<div style=\"position:absolute;top:0px;left:0px;z-index:2;\">\n";
		html += "<a href=\""+arguments[3]+"\" target=\"_blank\" title=\""+arguments[4]+"\">\n";
		html += "<img src=\""+arguments[5]+"\" width=\""+arguments[0]+"\" height=\""+arguments[1]+"\" border=\"0\" /></a>\n";
		html += "</div>\n";
		html += "</div>\n";
	}else{

		html += "<a href=\""+arguments[3]+"\"><img src=\""+arguments[2]+"\" width=\""+arguments[0]+"\" height=\""+arguments[1]+"\" title=\""+arguments[4]+"\"/></a>\n";
	}
	//alert(html);
	document.write(html);
}

