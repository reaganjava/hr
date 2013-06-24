(function($) {
	$.fn.validationEngineLanguage = function() {
	};
	$.validationEngineLanguage = {
		newLang : function() {
			$.validationEngineLanguage.allRules = {
				"required" : { // Add your regex rules here, you can take telephone as an example
					"regex" : "none",
					"alertText" : "* 非空选项.",
					"alertTextCheckboxMultiple" : "* 请选择一个单选框.",
					"alertTextCheckboxe" : "* 请选择一个复选框."
				},

				"length" : {
					"regex" : "none",
					"alertText" : "* 长度必须在 ",
					"alertText2" : " 至 ",
					"alertText3" : " 之间."
				},
				// bluespring添加 区间效验
				"region" : {
					"regex" : "none",
					"alertText" : "* 取值必须在 ",
					"alertText2" : " 至 ",
					"alertText3" : " 之间."
				},
				"maxCheckbox" : {
					"regex" : "none",
					"alertText" : "* 最多选择 ",
					"alertText2" : " 项."
				},
				"minCheckbox" : {
					"regex" : "none",
					"alertText" : "* 至少选择 ",
					"alertText2" : " 项."
				},
				"confirm" : {
					"regex" : "none",
					"alertText" : "* 两次输入不一致,请重新输入."
				},
				"notEqual" : {
					"regex" : "none",
					"alertText" : "* 两次输入不能相同,请重新输入."
				},
				"telephone" : {
					"regex" : "/^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/",
					"alertText" : "* 请输入有效的电话号码,如:010-29292929."
				},
				"nullCheckS" : {
					"regex" : "/[^ ]/g",
					"alertText" : "* 此项不能为空."
				},
				"checkNullRelatedS" :{
					"regex" : "none",
					"alertText1" : "* 此项是关联项",
					"alertText2" : " ,此项不能为空."
				},
				"clearPromp" :{
					"regex" : "none",
					"alertText" : " 此项不能为空."
				},
				"isCheckImg" : {
					"regex" : "none",
					"alertText" : "* 文件格式限制,只能是图片."
				},
				"isCheckVedio" : {
					"regex" : "none",
					"alertText" : "* 文件格式限制,只能是视频格式的文件."
				},
				"isImg" : {
					"regex" : "/^(.+\.(JPEG|jpeg|JPG|jpg|GIF|gif|BMP|bmp|PNG|png))$/",
					"alertText" : "* 文件格式限制,只能是图片."
				},
				"isFlash" : {
					"regex" : "/^(.+\.(swf))$/",
					"alertText" : "* 文件格式限制,只能是flash."
				},
				"isImgFlash" : {
					"regex" : "/^(.+\.(JPEG|jpeg|JPG|jpg|GIF|gif|BMP|bmp|PNG|png|swf))$/",
					"alertText" : "* 文件格式限制,只能是flash或者图片."
				},
				"isVedio" : {
					"regex" : "/^(.+\.(flv|FLV|asf|ASF|wma|WMA|wmv|WMV|avi|AVI|wav|WAV|mpeg|MPEG|rm|RM))$/",
					"alertText" : "* 文件格式限制,只能是视频格式的文件."
				},
				"positionMoreThan8" : {
					"regex" : "/^[a-zA-Z0-9\-]{9,20}$/",
					"alertText" : "* 请选择具体位置."
				},
				"mobilephone" : {
					"regex" : "/(^0?[1][358][0-9]{9}$)/",
					"alertText" : "* 请输入有效的手机号码."
				},
				"email" : {
					"regex" : /^[a-zA-Z0-9_\.\-]+\@([a-zA-Z0-9\-]+\.)+[a-zA-Z0-9]{2,4}$/,
					"alertText" : "* 请输入有效的邮件地址."
				},
				"emails" : {
					"regex" : "none",
					"alertText" : "* 请输入有效的邮件地址，多个邮件以;隔开."
				},

				"date" : {
					"regex" : "/^(19[0-9]{2}|2[0-9]{3})-(0[1-9]|1[012])-([123]0|[012][1-9]|31)$/",
					"alertText" : "* 请输入有效的日期,如:2010-01-01."
				},
				"datetime" : {
					"regex" : "/^(19[0-9]{2}|2[0-9]{3})-(0[1-9]|1[012])-([123]0|[012][1-9]|31) ([01][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/",
					"alertText" : "* 请输入有效的日期时间,如:2010-01-01 12:12:01."
				},
				"ip" : {
					"regex" : "/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/",
					"alertText" : "* 请输入有效的IP."
				},
				"chinese" : {
					"regex" : "/^[\u4e00-\u9fa5]+$/",
					"alertText" : "* 请输入中文."
				},
				"url" : {
					"regex" : "/^(http(s)?|ftp|telnet|news|rtsp|mms)(:)[/\/\a-zA-Z0-9_!~*'().&=+$%-]+$/",
					"alertText" : "* 请输入有效的网址."
				},
				"zipcode" : {
					"regex" : "/^[1-9]\d{5}$/",
					"alertText" : "* 请输入有效的邮政编码."
				},
				"onlyNumber" : {
					"regex" : "/^[0-9]+$/",
					"alertText" : "* 请输入数字."
				},
				"onlyLetter" : {
					"regex" : "/^[a-zA-Z]+$/",
					"alertText" : "* 请输入英文字母."
				},
				"noSpecialCaracters" : {
					"regex" : "/^[0-9a-zA-Z]+$/",
					"alertText" : "* 请输入英文字母和数字."
				},
				"ajaxUser" : {
					"file" : "validateAjaxUser",
					"alertTextOk" : "* 帐号可以使用.",
					"alertTextLoad" : "* 检查中, 请稍后...",
					"alertText" : "* 帐号不能使用."
				},
				"ajaxName" : {
					"file" : "validateUser.php",
					"extraData" : "eric", //其他的参数
					"alertTextOk" : "* This name is available",
					"alertTextLoad" : "* Loading, please wait",
					"alertText" : "* This name is already taken"
				},
				"ajaxServiceCode" : {
					"file" : "sys/serviceNameMainAction!checkIsExisted.action",
					"extraData" : "err", //其他的参数
					"alertTextOk" : "* This name is available",
					"alertTextLoad" : "* Loading, please wait",
					"alertText" : "* This name is already taken"
				},
				"validate2fields" : {
					"nname" : "validate2fields",
					"alertText" : "* You must have a firstname and a lastname"
				},
				 // DOTOYO rules
                "requiredSelected": {
                	"regex": /^(?!请选择)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]|[\/\/]+$/,
                    "alertText": "* 请选择.",
                    "alertTextCheckboxMultiple": "* Please select an option",
                    "alertTextCheckboxe": "* This checkbox is required"
                },
                "region": {
                	"regex": /^(?![省份城市城区])(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/,
                    "alertText": "* 非空选项.",
                    "alertTextCheckboxMultiple": "* Please select an option",
                    "alertTextCheckboxe": "* This checkbox is required"
                },
                "emailOrEmpty":{//不填或者填入电子邮件地址
                	"regex": /^$|^[a-zA-Z0-9_\.\-]+\@([a-zA-Z0-9\-]+\.)+[a-zA-Z0-9]{2,4}$/,
                    "alertText": "* 电子邮件格式错误"
                },
                "positiveInteger":{//非负整数
                	"regex": /^[1-9][\d]*$/,
                    "alertText": "* 请输入大于0的整数"
                },
                "filteringSpecialChar4":{//只含有汉字、字母
                	"regex": /^(?!_)(?!.*?_$)[a-zA-Z\u4e00-\u9fa5]+$/,
                    "alertText": "* 输入限制[汉字、字母]."
                },
				"cellPhoneOrEmpty" : {
					"regex" : "/^$|(^0?[1][358][0-9]{9}$)/",
					"alertText" : "* 请输入有效的手机号码."
				},
				"telephoneOrEmpty" : {
					"regex" : "/^$|^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/",
					"alertText" : "* 请输入有效的电话号码,如:010-29292929."
				},
                "filteringSpecialChar":{//只含有汉字、数字、字母
                	"regex": /^(?!_)(?!.*?_$)[\w\s\u4e00-\u9fa5]+$/,
                    "alertText": "* 输入限制[汉字、数字、字母]."
                },
				"faxOrEmpty" : {
					"regex" : "/^$|^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/",
					"alertText" : "* 请输入有效的传真号码,如:010-29292929."
				},
				"passwordRegister" : {
					"regex" : "none",
					"alertText" : "* 密码长度必须在 ",
					"alertText2" : " 至 ",
					"alertText3" : " 之间."
				},
				"requiredYZM" : {
					"regex" : "none",
					"alertText" : "* 请输入验证码. "
				},
				"requiredPassword" : {
					"regex" : "none",
					"alertText" : "* 请输入密码. "
				},
                "age":{//非负整数
                	"regex": /^$|^[1-9][\d]*$/,
                    "alertText": "* 请输入有效年龄."
                },
                "positiveIntegerOrEmpty":{//非负整数
                	"regex": /^$|^[1-9][\d]*$/,
                    "alertText": "* 请输入大于0的整数"
                }
                
			};
		}
	};
	$.validationEngineLanguage.newLang();
})(jQuery);
