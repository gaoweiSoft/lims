<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑设备信息</title>
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
     <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>编辑设备信息</h5>
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
            	<form class="form-horizontal m-t" id="equipmentForm">
            	<input type="hidden" name="eId" id="eId" value="${equipment.eId }">
            		<div class="form-group">
	                    <label class="col-sm-3 control-label">设备编号：</label>
	                    <div class="col-sm-5">
	                        <input id="equipmentId" name="equipmentId" value="${equipment.equipmentId }" type="text" class="form-control" >
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">生产商：</label>
	                    <div class="col-sm-5">
	                        <input id="manufacturer" name="manufacturer" value="${equipment.manufacturer }"type="text" class="form-control" >
	                    </div>
	                </div>
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">设备类型：</label>
	                    <div class="col-sm-5">
	                         <select id="type" name="type" class="form-control" 
								aria-required="true" >
								<option value="计算机">计算机</option>
								<option value="硬件">硬件</option>
								<option value="物理">物理</option>
								<option value="化学">化学</option>
							</select>
	                    </div>
	                </div>
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">实验室位置：</label>
	                    <div class="col-sm-5">
	                        <select id="location" name="location" class="form-control"
								aria-required="true" onclick="changeLoaction(this.value)"></select>
	                    </div>
	                </div>
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">房间号：</label>
	                    <div class="col-sm-5">
	                        <select id="roomId" name="roomId" class="form-control"
								aria-required="true" ></select>
	                    </div>
	                </div>
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">型号：</label>
	                    <div class="col-sm-5">
	                        <input id="version" name="version" value="${equipment.version }" type="text" class="form-control" >
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
    $(document).ready(function(){
    	 	$.ajax({
		        type: 'POST',
		        async: false,
		        url: 'manage/laboratory/getLaboratorys.shtml',
		        data: {
		        },
		        success: function (data) {
		        	var equipments = data.data;
		        	$("#roomId").append('<option value="' + "${equipment.roomId }" + '">' + "${equipment.roomId }" + '</option>');
		        	for (var i = 0; i<equipments.length; i++){
		        		$("#location").append('<option value="' + equipments[i] + '">' + equipments[i] + '</option>');
		        	}
		        },
		        error: function () {
		            alert("请求失败！重新操作");
		        },
		        dataType: 'json'
		    });
    	 	resetting();
    });
    var changeLoaction = function(value){    		
		$.ajax({
	        type: 'POST',
	        async: false,
	        url: 'manage/laboratory/getLaboratorys.shtml',
	        data: {
	        	value : value
	        },
	        success: function (data) {
	        	var equipments = data.data;
	        	$("#roomId").empty();
	        	for (var i = 0; i<equipments.length; i++){
	        		$("#roomId").append('<option value="' + equipments[i] + '">' + equipments[i] + '</option>');
	        	}
	        },
	        error: function () {
	            alert("请求失败！重新操作");
	        },
	        dataType: 'json'
	    });    		
	}
	
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
	        $("#equipmentForm").validate({
	            rules: {
	            	equipmentId: {
	            		required: true,
	            		maxlength: 20
	            	},
	            	manufacturer: {
	            		required: true,
	            		maxlength: 10
	            	},
	            	type: {
	                    required: true,
	                    maxlength: 30
	                },
	                location: {
	                    required: true,
	                    maxlength: 30
	                },
	                roomId: {
	                    required: true,
	                    maxlength: 30
	                },
	                version: {
	                    required: true,
	                    maxlength: 30
	                }
	            },
	            messages: {
	            	equipmentId: {
	            		required: icon + "请输入供应商的名称",
	            		maxlength: icon + "供应商的名称不能超过20个字符"
	            	},
	            	manufacturer: {
	            		required: icon + "请输入供应商的联系人",
	            		maxlength: icon + "供应商的联系人不能超过10个字符"
	            	},
	                type: {
	                    required: icon + "请输入供应商的地址",
	                    maxlength: icon + "供应商的地址不能超过30个字符"
	                },
	                location: {
	                    required: icon + "请输入供应商的地址",
	                    maxlength: icon + "供应商的地址不能超过30个字符"
	                },
	                roomId: {
	                    required: icon + "请输入供应商的地址",
	                    maxlength: icon + "供应商的地址不能超过30个字符"
	                },
	                version: {
	                    required: icon + "请输入供应商的地址",
	                    maxlength: icon + "供应商的地址不能超过30个字符"
	                }
	            },
	            submitHandler:function(form){
	            	$.post("manage/equipment/saveEquipment.shtml", decodeURIComponent($(form).serialize(),true), function(data){
	            		var result = JSON.parse(data);
	        			if(result.status == "success"){
	        				layer.msg('修改成功',{
	                			time: 2000,
	                			icon: 6
	                		});              		
	                		setTimeout(function(){
	                			location.href = "manage/equipment/equipmentListUI.shtml";
	                		},2000);
	        			}
	        		});
	            } 
	        });
	    });
	    var resetting = function(){
	    	var eId = $('#eId').val();
	    	$.ajax({
		        type: 'POST',
		        async: false,
		        url: 'manage/equipment/getEquipment.shtml',
		        data: {
		            "eId": eId,
		        },
		        success: function (data) {
		        	var result = data.data;
		        	$('#equipmentId').val(result.equipmentId);
		        	$('#manufacturer').val(result.manufacturer);
		        	$('#time').val(result.time);
		        	$('#type').val(result.type);	
		        	$('#status').val(result.status);
		        	$('#location').val(result.location);
		        	$('#roomId').val(result.roomId);
		        	$('#version').val(result.version);
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