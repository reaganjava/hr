//**************************************** check **************************************/
//*** 只能输入整型数字 **//
function isLongNumber(){
	if(arguments.length > 0){
		return /^[0-9]*$/.test(arguments[0]);
	}
	return false;
}
//*** 只能输入n位的数字**//
/**
** arguments[0] : number
** arguments[1] : n
**/
function equalsNumber(){
	if(arguments.length >= 2){
		if(!isLongNumber(arguments[0]) || !isLongNumber(arguments[1])){
			return false;
		}
		return eval("/^d{" + arguments[1] + "}$/").test(arguments[0]);
	}
	return false;
}
//*** 只能输入至少n位的数字**//
/**
** arguments[0] : number
** arguments[1] : n
**/
function moreThanNumber(){
	if(arguments.length >= 2){
		if(!isLongNumber(arguments[0]) || !isLongNumber(arguments[1])){
			return false;
		}
		return eval("/^d{" + arguments[1] + ",}$/").test(arguments[0]);
	}
	return false;
}
//*** 只能输入m到n位的数字**//
/**
** arguments[0] : number
** arguments[1] : m
** arguments[2] : n
**/
function betweenNumber(){
	if(arguments.length >= 3){
		if(!isLongNumber(arguments[0]) || !isLongNumber(arguments[1]) || !isLongNumber(arguments[2])){
			return false;
		}
		return eval("/^d{" + arguments[1] + "," + arguments[2] + "}$/").test(arguments[0]);
	}
}

//*********************************** event ********************************************//
var beforeOnkeyDownValue;
//**保留原有值**//
function beforeOnkeyDown(){
	beforeOnkeyDownValue = arguments[0].value;
}
//*** check 文本值，不是long number 还原原有值***//
function checkLongNumber(){
	if(arguments.length == 0) return;
	if(!isLongNumber(arguments[0].value)){
		arguments[0].value = beforeOnkeyDownValue;
	}
}
limitNumber = function (e) {
    if ($.browser.msie) {
        if ( ((event.keyCode > 47) && (event.keyCode < 58)) ||
              (event.keyCode == 8) ) {
            return true;
        } else {
            return false;
        }
    } else {
        if ( ((e.which > 47) && (e.which < 58)) ||
              (e.which == 8) ) {
            return true;
        } else {
            return false;
        }
    }
}

//小写英文
//<input onkeypress = "return regInput(this, /^[a-z]*$/, String.fromCharCode(event.keyCode))"
//onpaste = "return regInput(this, /^[a-z]*$/, window.clipboardData.getData('Text'))"
//ondrop = "return regInput(this, /^[a-z]*$/, event.dataTransfer.getData('Text'))"
//style="ime-mode:Disabled"><br>
//大写英文
//<input onkeypress = "return regInput(this, /^[A-Z]*$/, String.fromCharCode(event.keyCode))"
//onpaste = "return regInput(this, /^[A-Z]*$/, window.clipboardData.getData('Text'))"
//ondrop = "return regInput(this, /^[A-Z]*$/, event.dataTransfer.getData('Text'))"
//style="ime-mode:Disabled">
//任意数字
//<input onkeypress = "return regInput(this, /^[0-9]*$/, String.fromCharCode(event.keyCode))"
//onpaste = "return regInput(this, /^[0-9]*$/, window.clipboardData.getData('Text'))"
//ondrop = "return regInput(this, /^[0-9]*$/, event.dataTransfer.getData('Text'))"
//style="ime-mode:Disabled"><br>
//限制两位小数
//<input onkeypress = "return regInput(this, /^\d*\.?\d{0,2}$/,
//String.fromCharCode(event.keyCode))"
//onpaste = "return regInput(this, /^\d*\.?\d{0,2}$/,
//window.clipboardData.getData('Text'))"
//ondrop = "return regInput(this, /^\d*\.?\d{0,2}$/,
//event.dataTransfer.getData('Text'))"
//style="ime-mode:Disabled">
function regInput(obj, reg, inputStr)
{
	if(inputStr == "") return true;
	if ($.browser.msie) {
		var docSel = document.selection.createRange();
		if (docSel.parentElement().tagName != "INPUT") return false;
		oSel = docSel.duplicate();
		oSel.text = "";
		var srcRange = obj.createTextRange();
		oSel.setEndPoint("StartToStart", srcRange);
		var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length);
		return reg.test(str);
	} else{
		return reg.test(inputStr);
	}
}
function limitNumberOnkeyPress(obj,e){
	if ($.browser.msie) {
		return regInput(obj, /^[0-9]*$/, String.fromCharCode(e.keyCode));
	}else{
		return regInput(obj, /^[0-9]*$/, String.fromCharCode(e.which));
	}
}
function limitNumberOnpaste(obj){
	return regInput(obj, /^[0-9]*$/, window.clipboardData.getData('Text'));
}
function limitNumberOndrop(obj,e){
	return regInput(obj, /^[0-9]*$/, event.dataTransfer.getData('Text'));
}
//**继承**//
function init(){

}
//** initialized method**//
function beforeInit(){
	initstatus();
	//继承
	init();
}
//** 每次刷新清空 **//
function initstatus(){
	// Accordion
    $("#leftNav").accordion({
        header: "h3",
        collapsible: true,
		autoHeight: false,
        active: false,
		multipleMode: true
    });
}
function changeMenu(){

}