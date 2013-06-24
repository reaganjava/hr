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
function setCert(){
	$.getJSON("../certificateCenter/certificateAction!searchCert.action?certTypeCode="+$("#certTypeCode").val() , function(data) {
		var defaultOption = "<li><a href='javascript:void(0)' id=\""+""+"\""+" onclick=\"setValue(this,'certText','certCode')\">"+"不限"+"</a></li>";
		var options="";
		for(i=0;i<data.length;i++){
			value = data[i].code;
			text = data[i].name;
			options = options + "<li><a href='javascript:void(0)' id=\""+value+"\""+" onclick=\"setValue(this,'certText','certCode')\">"+text+"</a></li>";
		}
		$('#certId').html(defaultOption + options);
		var certTypeName = $("#certTypeText").val();
		if(certTypeName == "不限"){
			document.getElementById("certText").value= "不限";
			document.getElementById("certCode").value= "";
		}
		else{
			document.getElementById("certText").value= "请选择证书名称";
			document.getElementById("certCode").value= "";
		}
	});
}
function setCity(){
	$.getJSON("../common/loadCity.action?provinceCode="+$("#hiddenProvince").val()+"&randomNum="+Math.random() , function(data) {
		var defaultOption = "<li><a href='javascript:void(0)' id=\""+""+"\""+" onclick=\"setValue(this,'citySearch','hiddenCity');setArea();\">"+"不限"+"</a></li>";
		var options="";
		data = eval('('+data+')');
		$.each(data, function(i, item) {
			value = item.code;
			text = item.name;
			options = options + "<li><a href='javascript:void(0)' id=\""+value+"\""+" onclick=\"setValue(this,'citySearch','hiddenCity');setArea();\">"+text+"</a></li>";
		});
		$('#cityId').html(defaultOption + options);
		var provinceName = $("#provinceSearch").val();
		if(provinceName == "不限"){
			document.getElementById("citySearch").value= "不限";
			document.getElementById("hiddenCity").value= "";
		}
		else{
			document.getElementById("citySearch").value= "城市";
			document.getElementById("hiddenCity").value= "";
		}
		setArea();
	});
}
function setArea(){
	$.getJSON("../common/loadArea.action?cityCode="+$("#hiddenCity").val()+"&randomNum="+Math.random() , function(data) {
		var defaultOption = "<li><a href='javascript:void(0)' id=\""+""+"\""+" onclick=\"setValue(this,'areaSearch','hiddenArea')\">"+"不限"+"</a></li>";
		var options="";
		data = eval('('+data+')');
		$.each(data, function(i, item) {
			value = item.code;
			text = item.name;
			options = options + "<li><a href='javascript:void(0)' id=\""+value+"\""+" onclick=\"setValue(this,'areaSearch','hiddenArea')\">"+text+"</a></li>";
		});

		var cityName = $("#citySearch").val();
		if(cityName == "城市"){
			$('#areaId').html(options);
		}
		else{
			$('#areaId').html(defaultOption + options);
		}
		var cityName = $("#citySearch").val();
		if(cityName == "不限"){
			document.getElementById("areaSearch").value= "不限";
			document.getElementById("hiddenArea").value= "";
		}
		else{
			document.getElementById("areaSearch").value= "城区";
			document.getElementById("hiddenArea").value= "";
		}
	});
}
function setValue(searchDown,inputValue,hiddenValue){
	document.getElementById(inputValue).value=$(searchDown).text();
	document.getElementById(hiddenValue).value=$(searchDown).attr("id");
};