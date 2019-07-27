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
<title>修改密码</title>
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
				<h5>修改密码</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<form class="form-horizontal m-t" id="userForm">
					<div class="form-group">
						<label class="col-sm-3 control-label">原密码：</label>
						<div class="col-sm-8">
							<input id="password" name="password" placeholder="请输入原密码" type="password"
								class="form-control" aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">密码：</label>
						<div class="col-sm-8">
							<input id="newPassword" name="newPassword" placeholder="请输入密码"
								type="password" class="form-control" aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">确认密码：</label>
						<div class="col-sm-8">
							<input id="mPassword2" name="mPassword2" placeholder="请再次输入密码"
								equalTo="#newPassword" type="password" class="form-control"
								aria-required="true">
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
		$().ready(function() {
							var icon = "<i class='fa fa-times-circle'></i> ";
							$("#userForm").validate(
											{
												rules : {
													password : {
														required : true,
														isPassword: true
													},
													newPassword : {
														required : true,
														isPassword: true
													}
												},
												messages : {
													password : {
														required : icon + "请输入原密码",
														isPassword: icon + "密码为6-16位数字或字母"
													},
													newPassword : {
														required : icon + "请输入新密码",
														isPassword: icon + "密码为6-16位数字或字母"
													}
												},
												submitHandler : function(form) {
													$.post("customer/user/changePassword.shtml",decodeURIComponent($(form).serialize(),true),function(data) {
																		var result = JSON
																				.parse(data);
																		if (result.data == 0) {
																			layer.msg('修改密码成功',
																							{
																								time : 2000,
																								icon : 6
																							});
																			setTimeout(function() {
																						location.href = "customer/indexUI.shtml";
																					},
																					2000);
																		}else if(result.data == 1){
																			layer.msg('原密码错误',
																					{
																						time : 2000,
																						icon : 6
																					});
																	setTimeout(function() {
																				location.href = "customer/user/changePasswordUI.shtml";
																			},
																			2000);
																		}else{
																			layer.msg('新密码不能和原密码一样',
																					{
																						time : 2000,
																						icon : 6
																					});
																	setTimeout(function() {
																				location.href = "customer/user/changePasswordUI.shtml";
																			},
																			2000);
																		}
																
																	});
												}
											});
						});
		var cancel = function() {
		/* 	history.go(-1); */
			location.href = "customer/indexUI.shtml";
		}
	</script>
</body>
</html>