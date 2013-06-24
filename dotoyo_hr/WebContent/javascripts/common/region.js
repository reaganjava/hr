function setCity(cityId,hiddenCity){
	if(cityId!=null){
		document.getElementById(cityId).value='城市';
		document.getElementById(hiddenCity).value="";
		setArea('areaSearch','hiddenArea');
	}
}

function setArea(areaId,hiddenArea){
	if(areaId!=null){
		document.getElementById(areaId).value='城区';
		document.getElementById(hiddenArea).value="";
	}
}

function loadData(dataType,searchDown){
	var citySearch='citySearch';
	var areaSearch='areaSearch';
	if(dataType==citySearch){
		$.getJSON("../common/loadCity.action?provinceCode="+$("#hiddenProvince").val()+"&randomNum="+Math.random() , function(data) {
			var options="";
			data = eval('('+data+')');
			$.each(data, function(i, item) {				
				value = item.code;
				text = item.name;
				options = options + "<li><a href='javascript:void(0)' id=\""+value+"\""+" onclick=\"setValue(this,'citySearch','hiddenCity');setArea('areaSearch','hiddenArea');return false;\">"+text+"</a></li>";
			});
			
			$('#cityId').html(options);
			menuClick('#citySearch', searchDown, -74, 24);
			
		});
	}else{
		$.getJSON("../common/loadArea.action?cityCode="+$("#hiddenCity").val()+"&randomNum="+Math.random() , function(data) {
			var options="";
			data = eval('('+data+')');
			$.each(data, function(i, item) {				
				value = item.code;
				text = item.name;
				options = options + "<li><a href='javascript:void(0)' id=\""+value+"\""+" onclick=\"setValue(this,'areaSearch','hiddenArea');return false;\">"+text+"</a></li>";
			});
			
			$('#areaId').html(options);
			menuClick('#areaSearch', searchDown, -74, 24);
		});
	}
}

function setBaseData(iId,hId,dId,dataType){
	
	$.getJSON("../common/loadEssentialData.action?dataType="+dataType+"&"+"randomNum="+Math.random() , function(data) {
		var options="";
		data = eval('('+data+')');
		options = options + "<ul>";
		$.each(data, function(i, item) {				
			value = item.code;
			text = item.name;
			options = options + "<li><a href='javascript:void(0)' id=\""+value+"\""+" onclick=\"setValue(this,'"+iId+"','"+hId+"');return false;\">"+text+"</a></li>";
		});
		options = options + "</ul>";
		$(dId).html(options);
	});
}


function getDataFromParent(iId,hId,dId,dataType){
	var  dataTypeValue = document.getElementById(dataType).value;
	$.getJSON("loadEssentialData.action?dataType="+dataTypeValue+"&"+"randomNum="+Math.random() , function(data) {
		var options="";
		data = eval('('+data+')');
		options = options + "<ul>";
		$.each(data, function(i, item) {				
			value = item.code;
			text = item.name;
			options = options + "<li><a href='javascript:void(0)' id=\""+value+"\""+" onclick=\"setValue(this,'"+iId+"','"+hId+"');return false;\">"+text+"</a></li>";
		});
		options = options + "</ul>";
		$(dId).html(options);
	});

}


function setValue(searchDown,inputValue,hiddenValue){
	document.getElementById(inputValue).value=$(searchDown).text();
	document.getElementById(hiddenValue).value=$(searchDown).attr("id");
	document.getElementById(inputValue).focus();
	document.getElementById(inputValue).blur();
};

$(document).ready(function(){
	$("#province").change(function(){
		var provinceCode = $("#province option:selected").val();
		var url = "../common/loadCity.action?provinceCode="+provinceCode;
		$.getJSON(url,loadCity);
	});
	$("#city").change(function(){
		var cityCode = $("#city option:selected").val();
		var url = "../common/loadArea.action?cityCode="+cityCode;
		$.getJSON(url,loadArea);
	});
});
loadCity=function(data){
	var options = "";
	var defaultCityOption = "<option value=\"\">市</option>";
	var defaultAreaOption = "<option value=\"\">区</option>";
	var value = "";
	var text = "";
	data = eval('('+data+')');
	$.each(data,function(i,item){
		value = item.code;
		text = item.name;
		options = options + "<option value=\""+value+"\">"+text+"</option>";
	});
	$("#city").html(options);
	
	var defaultName = $("#province").val();
	if(defaultName == ""){
		$("#city").html(defaultCityOption);
		$("#area").html(defaultAreaOption);
	}
	
	var cityCode = $("#city option:selected").val();
	var url = "../common/loadArea.action?cityCode="+cityCode;
	$.getJSON(url,loadArea);
};
loadArea=function(data){
	var options = "";
	var defaultAreaOption = "<option value=\"\">区</option>";
	var value = "";
	var text = "";
	data = eval('('+data+')');
	$.each(data,function(i,item){
		value = item.code;
		text = item.name;
		options = options + "<option value=\""+value+"\">"+text+"</option>";
	});
	if(options != ""){
		$("#area").html(options);
	}
	else{
		$("#area").html(defaultAreaOption);
	}
};