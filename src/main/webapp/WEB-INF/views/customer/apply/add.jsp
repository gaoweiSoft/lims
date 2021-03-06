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
<title>申请使用设备</title>
<link rel="shortcut icon" href="img/logo.png"/>
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
				<h5>申请使用设备</h5>
				<div class="ibox-tools">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<form class="form-horizontal m-t" id="managerForm">
					<div class="form-group">
						<label class="col-sm-3 control-label">实验室位置：</label>
						<div class="col-sm-8">
							<select id="location" name="location" class="form-control"
								aria-required="true" onclick="changeLoaction(this.value)"></select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">房间号：</label>
						<div class="col-sm-8">
							<select id="roomId" name="roomId" class="form-control" onclick="changeRoomId()"
								aria-required="true" ></select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">设备编号：</label>
						<div class="col-sm-8">
						<select id="equipmentId" name="equipmentId" class="form-control"
								aria-required="true" ></select>
						</div>
					</div>
				<div class="form-group">
						<label class="col-sm-3 control-label">开始时间：</label>
						<div class="col-sm-8">
							<input id="dateStart" name="dateStart" placeholder="请输入开始时间"
								type="text" class="form-control" aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">结束时间：</label>
						<div class="col-sm-8">
							<input id="dateEnd" name="dateEnd" placeholder="请输入结束时间"
								type="text" class="form-control" aria-required="true">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-9 col-sm-offset-3">
							<button class="btn btn-w-m btn-primary" type="submit">
								<i class="fa fa-check" aria-hidden="true"></i>&nbsp;提交
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
	<script src="style/layui/layui.js"></script>
	<script>
	$(document).ready(function(){    		
	 	$.ajax({
	        type: 'POST',
	        async: false,
	        url: 'manage/laboratory/getLaboratorys.shtml',
	        data: {
	        },
	        success: function (data) {
	        	var laboratorys = data.data;
	        	for (var i = 0; i<laboratorys.length; i++){
	        		$("#location").append('<option value="' + laboratorys[i] + '">' + laboratorys[i] + '</option>');
	        	}
	        },
	        error: function () {
	        	alert("请求失败！重新操作");
	        },
	        dataType: 'json'
	    });
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
	        	var laboratorys = data.data;
	        	$("#roomId").empty();
	        	for (var i = 0; i<laboratorys.length; i++){
	        		$("#roomId").append('<option value="' + laboratorys[i] + '">' + laboratorys[i] + '</option>');
	        	}
	        },
	        error: function () {
	        	alert("请求失败！重新操作");
	        },
	        dataType: 'json'
	    });    		
	}
	
	var changeRoomId = function(){ 
		var location = $('#location').val();
		var roomId = $('#roomId').val();
		$.ajax({
	        type: 'POST',
	        async: false,
	        url: 'manage/equipment/getEquipments.shtml',
	        data: {
	        	"location": location,
	        	"roomId": roomId
	        },
	        success: function (data) {
	        	var equipments = data.data;
	        	$("#equipmentId").empty();
	        	for (var i = 0; i<equipments.length; i++){
	        		$("#equipmentId").append('<option value="' + equipments[i] + '">' + equipments[i] + '</option>');
	        	}
	        },
	        error: function () {
	        	alert("请求失败！重新操作");
	        },
	        dataType: 'json'
	    });    		
	}
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
		$().ready(function() {
							var icon = "<i class='fa fa-times-circle'></i> ";
							$("#managerForm").validate(
											{
												rules : {
													location : {
														required : true
													},
													roomId : {
														required : true
													},
													equipmentId : {
														required : true
													},
													dateStart : {
														required : true
													},
													dateEnd : {
														required : true
													}
													
												},
												messages : {
													location : {
														required : icon + "请选择实验室位置"
													},
													roomId : {
														required : icon + "请选择房间号"
													},
													equipmentId : {
														required : icon + "请选择设备ID"
													},
													dateStart : {
														required : icon + "请选择开始日期",
													},
													dateEnd : {
														required : icon + "请选择结束日期",
													}
												},
												submitHandler : function(form) {
													$.post("customer/apply/saveApply.shtml",decodeURIComponent($(form).serialize(),true),function(data) {
																		var result = JSON.parse(data);
																		if (result.status == "success") {
																			layer.msg('申请成功',
																							{
																								time : 2000,
																								icon : 6
																							});
																			setTimeout(function() {
																						location.href = "customer/apply/applyListUI.shtml";
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
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  
			  var start = {
			    min: laydate.now()
				,format: 'YYYY-MM-DD hh:mm:ss'
			    ,max: '2099-06-16 23:59:59'
			    ,istoday: false
			    ,istime: true
			    ,choose: function(datas){
			      end.min = datas; //开始日选好后，重置结束日的最小日期
			      end.start = datas //将结束日的初始值设定为开始日
			    }
			  };
			  
			  var end = {
			    min: laydate.now()
				,format: 'YYYY-MM-DD hh:mm:ss'
			    ,max: '2099-06-16 23:59:59'
			    ,istoday: false
			    ,istime: true
			    ,choose: function(datas){
			      start.max = datas; //结束日选好后，重置开始日的最大日期
			    }
			  };
			  
			  document.getElementById('dateStart').onclick = function(){
			    start.elem = this;
			    laydate(start);
			  }
			  document.getElementById('dateEnd').onclick = function(){
			    end.elem = this
			    laydate(end);
			  }
			  
			});
	</script>
</body>
</html>