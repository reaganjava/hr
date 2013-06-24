
//check input

$().ready(function() {
	//沙龙增加
	$("#addSalonForm").validate({
		rules: {
			'salonInfoDto.subject':{
				required:true,
				maxlength:20
			},
			'salonInfoDto.content':{
				maxlength:200
			}


	},
	messages: {
			'salonInfoDto.subject':{
				required:"请输入主题",
				maxlength:"输入的长度太长了"
			},
			'salonInfoDto.content':{
				maxlength:"输入的长度太长了"
			}
	}
});
	//上传图片或者视频
	$("#uploadMediaForm").validate();
	//修改文章(修改form)
	$("#modifyForm").validate();

	//评论
	$("#commentForm").validate({
		rules: {
			'commentDto.content':{
			required:true,
			maxlength:400
			}
	},
	messages: {
			'commentDto.content':{
				maxlength:"输入的评论太长了(400字)"
			}
	}
});
	//增加沙龙文章
	$("#addAirticleForm").validate({
		rules: {
			'salonArticleDto.content':{
			maxlength:2000
			}
	},
	messages: {
			'salonArticleDto.content':{
				maxlength:"输入的文章内容太长了(2000字)"
			}
	}
});
	//主办单位
	$("#hostUnitForm").validate();

	/**
	//用户登陆
	$("#userLogonForm").validate({
		rules: {
				'userInfo.userName':{
					required:true,
					email:true
				},
				'userInfo.password':{
					required:true
				},
				'captcha':{
					required:true
				}
		},
		messages: {
					'userInfo.userName':{
						required:"请输入帐号",
						email:"帐号格式错误"
					},
					'userInfo.password':{
						required:"请输入密码"
					},
					'captcha':{
						required:"请输入验证码"
					}
		}
	});
*/
	/**
	//用户注册
	$("#userRegisterForm").validate({
		rules: {
				'userInfo.userName':{
					required:true,
					email:true,
					remote:"userAction!isDuplicated.action?time="+new Date().getTime()
				},
				'userInfo.password':{
					required:true,
					minlength:6
				},
				'captcha':{
					required:true
				}
		},
		messages: {
					'userInfo.userName':{
						required:"请输入帐号",
						email:"帐号格式错误",
						remote:"帐号已存在"
					},
					'userInfo.password':{
						required:"请输入密码",
						minlength:"密码长度不够"
					},
					'captcha':{
						required:"请输入验证码"
					}
		}
	});
	*/

/**
	//猎证中心：用户提交个人证书
	$("#submitCertForm").validate({
		rules: {
				'personalCertDto.certTypeCode':{
					required:true
				},
				'personalCertDto.certCode':{
					required:true
				},
				'personalCertDto.provinceCode':{
					required:true
				},
				'personalCertDto.cityCode':{
					required:true
				},
				'personalCertDto.areaCode':{
					required:true
				},
				'personalCertDto.specialFieldCode':{
					required:true
				},
				'personalCertDto.registerStatusCode':{
					required:true
				},
				'personalCertDto.contact':{
					required:true
				},
				'personalCertDto.telephone':{
					required:true
				},
				'personalCertDto.cellPhone':{
					required:true
				},
				'personalCertDto.email':{
					required:true,
					email:true
				},
				'personalCertDto.fax':{
					required:true
				}
		},
		messages: {
				'personalCertDto.certTypeCode':{
					required:"请选择证书类型"
				},
				'personalCertDto.certCode':{
					required:"请选择证书名称"
				},
				'personalCertDto.provinceCode':{
					required:"请选择省份"
				},
				'personalCertDto.cityCode':{
					required:"请选择城市"
				},
				'personalCertDto.areaCode':{
					required:"请选择城区"
				},
				'personalCertDto.specialFieldCode':{
					required:"请选择专业"
				},
				'personalCertDto.registerStatusCode':{
					required:"请选择注册状况"
				},
				'personalCertDto.contact':{
					required:"请输入联系人"
				},
				'personalCertDto.telephone':{
					required:"请输入联系电话"
				},
				'personalCertDto.cellPhone':{
					required:"请输入手机号码"
				},
				'personalCertDto.email':{
					required:"请输入电子邮件",
					email:"电子邮件格式错误"
				},
				'personalCertDto.fax':{
					required:"请输入传真"
				}
		}
	});
	*/

	/**
	//修改密码
	jQuery.validator.addMethod("notEqualTo", function(value, element, param) {
		return value != $(param).val();
		}, $.validator.format("两次输入不能相同!"));


	$("#editPasswordForm").validate({
		rules: {
				oldPassword:{
					required:true,
					minlength:6,
					remote:"userAction!isOldPasswordCorrect.action?time="+new Date().getTime()
				},
				newPassword:{
					required:true,
					minlength:6,
					notEqualTo:"#oldPassword"
				}
		},
		messages: {
					oldPassword:{
						required:"请输入原始密码",
						minlength:"密码长度不够",
						remote:"原密码错误"
					},
					newPassword:{
						required:"请输入新密码",
						minlength:"密码长度不够"
					}
		}
	});
	*/

	/**
	//回复站内信
	$("#replyShortMsgForm").validate({
		rules: {
				'replyShortMessageDto.receiverUserName':{
					required:true
				},
				'replyShortMessageDto.title':{
					required:true
				},
				'replyShortMessageDto.message':{
					required:true
				}
		},
		messages: {
					'replyShortMessageDto.receiverUserName':{
						required:"请输入收件人用户名"
					},
					'replyShortMessageDto.title':{
						required:"请输入标题"
					},
					'replyShortMessageDto.message':{
						required:"请输入内容"
					}
		}
	});
	*/
});

