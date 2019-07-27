<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑实验室</title>
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
     <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>编辑实验室</h5>
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
            	<form class="form-horizontal m-t" id="customerForm">
            		<input type="hidden" name="laboratoryId" id="laboratoryId" value="${laboratory.laboratoryId }">
            		<input type="hidden" name=quantity id="quantity" value="${laboratory.quantity }">
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">实验室位置：</label>
	                    <div class="col-sm-8">
	                        <input id="location" name="location" value="${laboratory.location }" placeholder="请输入实验室位置" type="text" class="form-control" aria-required="true">
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">房间号：</label>
	                    <div class="col-sm-8">
	                        <input id="roomId" name="roomId" value="${laboratory.roomId }" placeholder="请输入房间号" type="text" class="form-control" aria-required="true">
	                    </div>
	                </div>
	                <div class="form-group">
	                    <div class="col-sm-9 col-sm-offset-3">
	                    	<button class="btn btn-w-m btn-primary" type="submit"><i class="fa fa-check" aria-hidden="true"></i>&nbsp;保存</button>
	                    	<button class="btn btn-w-m btn-primary" type="button" onclick="resetting()"><i class="fa fa-repeat" aria-hidden="true"></i>&nbsp;重置</button>
	                    	<button class="btn btn-w-m btn-primary" type="button" onclick="cancel()"><i class="fa fa-reply" aria-hidden="true"></i>&nbsp;取消</button>
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
	        highlight: function (element) {
	            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
	        },
	        success: function (element) {
	            element.closest('.form-group').removeClass('has-error').addClass('has-success');
	        },
	        errorElement: "span",
	        errorPlacement: function (error, element) {
	            if (element.is(":radio") || element.is(":checkbox")) {
	                error.appendTo(element.parent().parent().parent());
	            } else {
	                error.appendTo(element.parent());
	            }
	        },
	        errorClass: "help-block m-b-none",
	        validClass: "help-block m-b-none"	
	    });
	  
	    $().ready(function () {
	        var icon = "<i class='fa fa-times-circle'></i> ";
	        $("#customerForm").validate({
	            rules: {
	            	location: {
	            		required: true,
	            		maxlength: 10
	            	},
	            	roomId: {
	            		required: true,
	            		maxlength: 5
	            	}
	            },
	            messages: {
	            	location: {
	            		required: icon + "请输入实验室位置",
	            		maxlength: icon + "实验室位置不能超过10个字符"
	            	},
	            	roomId: {
	            		required: icon + "请输入房间号",
	            		maxlength: icon + "房间号不能超过5个字符"
	            	}
	            },
	            submitHandler:function(form){
	            	$.post("manage/laboratory/saveLaboratory.shtml", decodeURIComponent($(form).serialize(),true), function(data){
	            		var result = JSON.parse(data);
	        			if(result.status == "success"){
	        				layer.msg('修改成功',{
	                			time: 2000,
	                			icon: 6
	                		});              		
	                		setTimeout(function(){
	                			location.href = "manage/laboratory/laboratoryListUI.shtml";
	                		},2000);
	        			}
	        		});
	            } 
	        });
	    });
	    var resetting = function(){
	    	var laboratoryId = $('#laboratoryId').val();
	    	$.ajax({
		        type: 'POST',
		        async: false,
		        url: 'manage/laboratory/getLaboratory.shtml',
		        data: {
		            "laboratoryId": laboratoryId,
		        },
		        success: function (data) {
		        	var result = data.data;
		        	$('#account').val(result.account);
		        	$('#mPassword').val(result.mPassword);
		        	$('#permission').val(result.permission);
		        },
		        error: function () {
		            alert("请求失败！重新操作");
		        },
		        dataType: 'json'
		    });	
	    }
	    var cancel = function(){
	    	history.go(-1);   	
	    }
    </script>
</body>
</html>