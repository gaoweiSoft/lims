<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>添加管理员</title>
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>添加管理员</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<form class="form-horizontal m-t" id="managerForm">
					<div class="form-group">
						<label class="col-sm-3 control-label">账号：</label>
						<div class="col-sm-8">
							<input id="account" name="account" placeholder="请输入管理员账号"
								type="text" class="form-control" aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">密码：</label>
						<div class="col-sm-8">
							<input id="mPassword" name="mPassword" placeholder="请输入密码"
								type="password" class="form-control" aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">确认密码：</label>
						<div class="col-sm-8">
							<input id="mPassword2" name="mPassword2" placeholder="请请再次输入密码"
								equalTo="#mPassword" type="password" class="form-control"
								aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">权限：</label>
						<div class="col-sm-8">
							<select id="permission" name="permission" class="form-control"
								aria-required="true" placeholder="请选择权限">
								<option value="0">普通管理员</option>
								<option value="1">超级管理员</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-9 col-sm-offset-3">
							<button class="btn btn-w-m btn-primary" type="submit">
								<i class="fa fa-check" aria-hidden="true"></i>&nbsp;保存
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
		jQuery.validator.addMethod("isPassword", function(value, element) {
	    	var length = value.length;
	    	var password = /^[a-zA-Z0-9]{6,16}$/;
	    	return this.optional(element) || ( password.test(value));
    	}, "请正确填写您的密码");
		jQuery.validator.addMethod("isAccount", function(value, element) {
	    	var length = value.length;
	    	var account = /^[a-zA-Z0-9]{4,10}$/;
	    	return this.optional(element) || (account.test(value));
    	}, "请正确填写您的账号");
		$().ready(function() {
							var icon = "<i class='fa fa-times-circle'></i> ";
							$("#managerForm").validate(
											{
												rules : {
													account : {
														required : true,
														isAccount: true
													},
													mPassword : {
														required : true,
														isPassword: true
													},
													permission : {
														required : true
													}
												},
												messages : {
													account : {
														required : icon + "请输入管理员账号",
														isAccount: icon + "账号为4-10位数字或字母"
													},
													mPassword : {
														required : icon + "请输入密码",
														isPassword: icon + "密码为6-10位数字或字母"
													},
													permission : {
														required : icon + "请选择权限",
													}
												},
												submitHandler : function(form) {
													$.post("manage/manager/saveManager.shtml",decodeURIComponent($(form).serialize(),true),function(data) {
																		var result = JSON.parse(data);
																		if (result.status == "success") {
																			layer.msg('添加成功',
																							{
																								time : 2000,
																								icon : 6
																							});
																			setTimeout(
																					function() {
																						location.href = "manage/manager/managerListUI.shtml";
																					},
																					2000);
																		}
																	});
												}
											});
						});
		var cancel = function() {
			history.go(-1);
		}
	</script>
</body>
</html>