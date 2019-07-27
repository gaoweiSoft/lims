<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<base href="<%=basePath%>">
<title>修改个人信息</title>
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<jsp:include page="../header.jsp" flush="true" />
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>修改个人信息</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<form class="form-horizontal m-t" id="userForm">
					<div class="form-group">
						<label class="col-sm-3 control-label">姓名：</label>
						<div class="col-sm-8">
							<input id="username" name="username" placeholder="请输入姓名" type="text"
								class="form-control" aria-required="true"value="${user.username }" >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">邮箱：</label>
						<div class="col-sm-8">
							<input id="mail" name="mail" placeholder="请输入邮箱"
								type="text" class="form-control" aria-required="true" value="${user.mail }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">电话号：</label>
						<div class="col-sm-8">
							<input id="tel" name="tel" placeholder="请输入邮箱" type="text"
								class="form-control" aria-required="true" value="${user.tel }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">性别：</label>
						<div class="col-sm-8">
							<select class="form-control" id="sex" name="sex" value="${user.sex }"
								aria-required="true">
								<option value="0">男</option>
								<option value="1">女</option>
							</select>
						</div>
					</div>
					<%-- <div class="form-group">
						<label class="col-sm-3 control-label">密码：</label>
						<div class="col-sm-8">
							<input id="password" name="password" placeholder="请输入密码"
								type="password" class="form-control" aria-required="true" value="${user.password }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">确认密码：</label>
						<div class="col-sm-8">
							<input id="mPassword2" name="mPassword2" placeholder="请再次输入密码"
								equalTo="#password" type="password" class="form-control" value="${user.password }"
								aria-required="true">
						</div>
					</div> --%>
					<div class="form-group">
						<label class="col-sm-3 control-label">类型：</label>
						<div class="col-sm-8">
							<select class="form-control" id="sign" name="sign" value="${user.sign }"
								aria-required="true">
								<option value="0">学生</option>
								<option value="1">教师</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">学号/工号：</label>
						<div class="col-sm-8">
							<input id="number" name="number" placeholder="请输入学号/工号" value="${user.number }"
								type="text" class="form-control" aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">班级：</label>
						<div class="col-sm-8">
							<input id="uClass" name="uClass" placeholder="请输入班级" type="text" value="${user.uClass }"
								class="form-control" aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">学校：</label>
						<div class="col-sm-8">
							<input id="school" name="school" placeholder="请输入学校" type="text" value="${user.school }"
								class="form-control" aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">学院：</label>
						<div class="col-sm-8">
							<input id="college" name="college" placeholder="请输入学院" value="${user.college }"
								type="text" class="form-control" aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">专业：</label>
						<div class="col-sm-8">
							<input id="major" name="major" placeholder="请输入专业" type="text" value="${user.major }"
								class="form-control" aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-9 col-sm-offset-3">
							<button class="btn btn-w-m btn-primary" type="submit">
								<i class="fa fa-check" aria-hidden="true"></i>&nbsp;保存
							</button>
							<button class="btn btn-w-m btn-primary" type="button"
								onclick="resetting()">
								<i class="fa fa-reply" aria-hidden="true"></i>&nbsp;重置
							</button>
							<button class="btn btn-w-m btn-primary" type="button"
								onclick="cancel()">
								<i class="fa fa-reply" aria-hidden="true"></i>&nbsp;取消
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" flush="true" />
	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<!-- layer javascript -->
	<script src="js/plugins/layer/layer.min.js"></script>
	<!-- 自定义js -->
	<script src="js/content.js?v=1.0.0"></script>
	<!-- jQuery Validation plugin javascript-->
	<script src="js/plugins/validate/jquery.validate.min.js"></script>
	<script src="js/plugins/validate/messages_zh.min.js"></script>
	<script>
	$(document).ready(function(){
    	resetting();
    });
		$.validator.setDefaults({
			highlight : function(element) {
				$(element).closest('.form-group').removeClass('has-success')
						.addClass('has-error');
			},
			success : function(element) {
				element.closest('.form-group').removeClass('has-error')
						.addClass('has-success');
			},
			errorElement : "span",
			errorPlacement : function(error, element) {
				if (element.is(":radio") || element.is(":checkbox")) {
					error.appendTo(element.parent().parent().parent());
				} else {
					error.appendTo(element.parent());
				}
			},
			errorClass : "help-block m-b-none",
			validClass : "help-block m-b-none"
		});
		jQuery.validator.addMethod("isEMail", function(value, element) {
	    	var length = value.length;
	    	 var email = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	    	return this.optional(element) || ( email.test(value));
    	}, "请正确填写您的邮箱");
		jQuery.validator.addMethod("isMobile", function(value, element) {
	    	var length = value.length;
	    	var mobile = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8]))\d{8}$/;
	    	return this.optional(element) || (length == 11 && mobile.test(value));
    	}, "请正确填写您的手机号码");
		$().ready(
						function() {
							var icon = "<i class='fa fa-times-circle'></i> ";
							$("#userForm")
									.validate(
											{
												rules : {
													username : {
														required : true,
														maxlength : 6
													},
													mail : {
														required : true,
														isEMail :  true
													},
													tel : {
														required : true,
														isMobile : true
													},
													sign : {
														required : true
													},
													sex : {
														required : true
													},
													number : {
														required : true
													},
													uClass : {
														required : true
													},
													school : {
														required : true
													},
													college : {
														required : true
													},
													major : {
														required : true
													}
												},
												messages : {
													username : {
														required : icon + "请输入姓名",
														maxlength : icon + "姓名不能超过6个字符"
													},
													mail : {
														required : icon + "请输入邮箱",
														isEMail : icon + "请输入符合标准的邮箱"
													},
													tel : {
														required : icon + "请输入电话号",
														isMobile : icon + "请输入符合标准的电话号"
													},
													sign : {
														required : icon + "请选择类型"
													},
													sex : {
														required : icon + "请选择性别"
													},
													number : {
														required : icon + "请输入学号/工号",
													},
													uClass : {
														required : icon + "请输入班级",
													},
													school : {
														required : icon + "请选择学校",
													},
													college : {
														required : icon + "请选择学院",
													},
													major : {
														required : icon + "请选择专业",
													}
												},
												submitHandler : function(form) {
													$.post("customer/user/saveUser.shtml",decodeURIComponent($(form).serialize(),true),
																	function(data) {
																		var result = JSON.parse(data);
																		if (result.status == "success") {
																			layer.msg('修改成功',
																							{
																								time : 2000,
																								icon : 6
																							});
																			setTimeout(function() {
																						location.href = "customer/indexUI.shtml";
																					},
																					2000);
																		}
																	});
												}
											});
						});
		var cancel = function() {
			/* history.go(-1); */
			location.href = "customer/indexUI.shtml";
		}
		var resetting = function(){
	    	var number = $('#number').val();
	    	$.ajax({
		        type: 'POST',
		        async: false,
		        url: 'customer/user/getUser.shtml',
		        data: {
		            "number": number,
		        },
		        success: function (data) {
		        	var result = data.data;
		        	$('#number').val(result.number);
		        	$('#username').val(result.username);
		        	$('#mail').val(result.mail);
		        	$('#tel').val(result.tel);	
		        	$('#sign').val(result.sign);
		        	$('#sex').val(result.sex);
		        	$('#uClass').val(result.uClass);
		        	$('#school').val(result.school);
		        	$('#college').val(result.college);
		        	$('#major').val(result.major);
		        },
		        error: function () {
		            alert("请求失败！重新操作");
		        },
		        dataType: 'json'
		    });	
	    }
	</script>
</body>
</html>