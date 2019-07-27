<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查看用户详情</title>
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
     <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>查看用户详情</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="col-sm-12 float-left">	
	            	<a href="javascript:void(0)" onclick="cancel()" class="btn btn-w-m btn-info" type="button"><i class="fa fa-mail-reply" aria-hidden="true"></i>&nbsp;返回</a>
            	</div>
            	<form class="form-horizontal m-t" id="userForm">
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">学号/工号：</label>
	                    <div class="col-sm-5">
	                        <input id="number" name="number" value="${user.number }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">姓名：</label>
	                    <div class="col-sm-5">
	                        <input id="username" name="username" value="${user.username }"type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">电话号：</label>
	                    <div class="col-sm-5">
	                        <input id="tel" name="tel" value="${user.tel }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">邮箱：</label>
	                    <div class="col-sm-5">
	                        <input id="mail" name="mail" value="${user.mail }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                  <div class="form-group">
	                    <label class="col-sm-3 control-label">性别：</label>
	                    <div class="col-sm-5">
	                        <input id="sex" name="sex" value="${user.sex }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	               <div class="form-group">
	                    <label class="col-sm-3 control-label">班级：</label>
	                    <div class="col-sm-5">
	                        <input id="uClass" name="uClass" value="${user.uClass }" type="text" class="form-control" disabled>
	                    </div>
	                </div> 
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">专业：</label>
	                    <div class="col-sm-5">
	                        <input id="major" name="major" value="${user.major }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">学院：</label>
	                    <div class="col-sm-5">
	                        <input id="college" name="college" value="${user.college }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">学校：</label>
	                    <div class="col-sm-5">
	                        <input id="school" name="school" value="${user.school }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">类型：</label>
	                    <div class="col-sm-5">
	                        <input id="sign" name="sign" value="${user.sign }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">状态：</label>
	                    <div class="col-sm-5">
	                        <input id="uStatus" name="uStatus" value="${user.uStatus }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                <div class="form-group">
	                    <div class="col-sm-9 col-sm-offset-3">
	                    	<button class="btn btn-w-m btn-primary" id="agree" type="button"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>&nbsp;同意</button>
	                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    	<button class="btn btn-w-m btn-primary" id="refuse" type="button"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i>&nbsp;拒绝</button>
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
    $("#agree").click(function (){
    	layer.confirm('确定同意该用户？', {
			  btn: ['确定', '取消'] 
			},
			function(index){
			    layer.close(index);
			    $.ajax({
			        type: 'POST',
			        async: true,
			        url: 'manage/user/agreeUser.shtml',
			        data: {
			            "number": $("#number").val()          
			        },
			        success: function (data) {
			        	window.location.href="manage/user/userListUI.shtml";				        	 
			        },
			        error: function () {
			            alert("系统出现问题，请联系管理员");
			        },
			        dataType: 'json'
			    });
	  		}, 
	  		function(){
	  			layer.msg('取消操作');
			}
		);    	
    });
    $("#refuse").click(function (){
    	layer.confirm('确定拒绝该用户？', {
			  btn: ['确定', '取消'] 
			},
			function(index){
			    layer.close(index);
			    $.ajax({
			        type: 'POST',
			        async: true,
			        url: 'manage/user/refuseUser.shtml',
			        data: {
			            "number": $("#number").val()          
			        },
			        success: function (data) {
			        	window.location.href="manage/user/userListUI.shtml";				        	 
			        },
			        error: function () {
			            alert("系统出现问题，请联系管理员");
			        },
			        dataType: 'json'
			    });
	  		}, 
	  		function(){
	  			layer.msg('取消操作');
			}
		);    	
    });	
    var cancel = function(){
    	history.go(-1);   	
    }
    </script>
</body>
</html>