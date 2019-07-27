<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath %>">
    <link rel="shortcut icon" href="img/logo.png"/>
    <link href="style/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="style/css/index.css" rel="stylesheet">
    <script src="style/bootstrap/js/html5shiv.min.js"></script>
    <script src="style/bootstrap/js/respond.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default top_bottom" role="navigation">
    <div class="container-fluid">
        <div class="navbar-headert">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="img/main-logo.png" alt="SEATTLE website template" style="margin-top: -10px"></a>
        </div>
        <div class="collapse navbar-collapse font_style" id="bs-example-navbar-collapse1">

            <ul class="nav navbar-nav  pull-right">
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="请输入搜索的设备信息">
                    </div>
                    <button type="submit" class="btn btn-info font_style" >搜索</button>
                </form>
                <li class="dropdown">
                    <a href="customer/indexUI.shtml" >首页</a>
                </li>
                <li class="dropdown ">
                    <a href="JavaScript:void(0)" class="dropdown-toggle " data-toggle="dropdown">设备管理</a>
                    <ul class="dropdown-menu dropdown" role="menu">
                        <li><a href="JavaScript:void(0)">设备报修</a></li>
                        <li><a href="JavaScript:void(0)">申请使用设备</a></li>
                        <li><a href="JavaScript:void(0)">查询设备信息</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="JavaScript:void(0)" class="dropdown-toggle" data-toggle="dropdown">实验室介绍</a>
                    <ul class="dropdown-menu dropdown" role="menu">
                        <li><a href="JavaScript:void(0)">数字电路实验室</a></li>
                        <li><a href="JavaScript:void(0)">模拟电路实验室</a></li>
                        <li><a href="JavaScript:void(0)">EDA实验室</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="JavaScript:void(0)" class="dropdown-toggle" data-toggle="dropdown">规章制度</a>
                    <ul class="dropdown-menu dropdown" role="menu">
                         <li><a href="JavaScript:void(0)">物理仪器室</a></li>
                        <li><a href="JavaScript:void(0)">生物仪器室</a></li>
                        <li><a href="JavaScript:void(0)">化学实验室</a></li>
                         <li><a href="JavaScript:void(0)">实验室守则</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="JavaScript:void(0)" class="dropdown-toggle " data-toggle="dropdown">用户管理</a>
                    <ul class="dropdown-menu dropdown" role="menu">
                        <li><a href="JavaScript:void(0)">修改密码</a></li>
                        <li><a href="JavaScript:void(0)">修改个人信息</a></li>
                        <li><a href="JavaScript:void(0)">注销用户</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a id="close" name="close" href="JavaScript:void(0)" >退出</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
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
$("a[name='close']").click(function (){
	layer.confirm('确定退出系统吗？', {
		  btn: ['确定', '取消'] 
		},
		function(index){
		    layer.close(index);
		    window.opener=null;  
			window.open('','_self');  
			window.close();  
  		}, 
  		function(){
  			layer.msg('取消操作');
		}
	);    	
});
</script>
</body>
</html>