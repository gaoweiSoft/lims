<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
    
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <base href="<%=basePath %>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, user-scale=no">
    <title>用户登录</title>
    <link rel="shortcut icon" href="img/logo.png"/>
    <link href="style/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="style/css/login.css" rel="stylesheet"/>
    <script type="text/javascript" src="style/js/login.js"></script>
    <script src="style/bootstrap/js/html5shiv.min.js"></script>
    <script src="style/bootstrap/js/respond.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div id="dd" class="form-group">
        <p>欢迎登录</p>
        <form id="form" method="post">

            <div id="div1" class="form-group">
                <input type="text" class="form-control " name="number" id="number" placeholder="请输入工号/学号"/>
                <span id="span1"></span>
                <!--<span class="help-block">请输入正确的手机号/邮箱/学号/工号</span>-->
            </div>
            <div id="warn"></div>
            <div id="div2" class="form-group">
                <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码"/>
                <span id="span2"></span>
                <!--<span class="help-block">请输入6-10位由数字和字母！</span>-->
            </div>
            <div id="warn1"></div>
            <div class="form-group has-success has-feedback">
                <button type="button" class="btn btn-block btn1 login" id="check">登录</button>
            </div>
        </form>
        <p class="login"><a href="customer/user/userAddUI.shtml">立即注册</a>&nbsp;|&nbsp;<a href="JavaScript:void(0)"id="forget">忘记密码</a></p>
    </div>
</div>
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <!-- layer javascript -->
    <script src="js/plugins/layer/layer.min.js"></script>
    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
<script>

$("#forget").click(function (){
	layer.alert("请联系管理员重置密码");
}); 

$("#check").click(function (){
	if (check()){
		$.ajax({
	        type: 'POST',
	        async: true,
	        url: 'customer/login/checkUser.shtml',
	        data: {
	            "number": $("#number").val(), 
	            "password": $("#password").val()
	        },
	        success: function (data) {
	        	if(data==0){
	        		layer.msg('用户不存在，请重新输入',
							{
								time : 1000,
								icon : 6
							});
			         setTimeout(function() {
						  location.href = "customer/loginUI.shtml";
					},
					2000);
	        	}else if(data==1){
	        		layer.msg('密码错误，请重新输入',
							{
								time : 1000,
								icon : 6
							});
			         setTimeout(function() {
						  location.href = "customer/loginUI.shtml";
					},
					2000);
	        	}else if(data==2){
	        		window.location.href="customer/indexUI.shtml";	
	        	}
	        },
	        error: function () {
	        	layer.alert("系统出现问题，请联系管理员");
	        },
	        dataType: 'json'
	    });
	}
}); 
    $(function () {
        $(window).resize();
    });
    $(window).resize(function () {
        $("#dd").css({
            position: "absolute",
            left: ($(window).width() - $("#dd").outerWidth()) / 6,
            top: ($(window).height() - $("#dd").outerHeight()) / 2
        });
    });
</script>
</body>
</html>