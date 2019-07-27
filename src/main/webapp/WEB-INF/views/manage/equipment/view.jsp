<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查看设备详情</title>
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
     <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>查看设备详情</h5>
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
	            	<a href="manage/equipment/equipmentListUI.shtml" class="btn btn-w-m btn-info" type="button"><i class="fa fa-mail-reply" aria-hidden="true"></i>&nbsp;返回</a>
            	</div>
            	<form class="form-horizontal m-t" id="userForm">
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">设备编号：</label>
	                    <div class="col-sm-5">
	                        <input id="equipmentId" name="equipmentId" value="${equipment.equipmentId }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">生产商：</label>
	                    <div class="col-sm-5">
	                        <input id="manufacturer" name="manufacturer" value="${equipment.manufacturer }"type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                <div class="form-group">
	                    <label class="col-sm-3 control-label">投入使用日期：</label>
	                    <div class="col-sm-5">
	                        <input id="time" name="time" value="${equipment.time }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">设备类型：</label>
	                    <div class="col-sm-5">
	                        <input id="type" name="type" value="${equipment.type }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	               <div class="form-group">
	                    <label class="col-sm-3 control-label">使用状态：</label>
	                    <div class="col-sm-5">
	                        <input id="status" name="status" value="${equipment.status }" type="text" class="form-control" disabled>
	                    </div>
	                </div> 
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">实验室位置：</label>
	                    <div class="col-sm-5">
	                        <input id="major" name="major" value="${equipment.location }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">房间号：</label>
	                    <div class="col-sm-5">
	                        <input id="roomId" name="roomId" value="${equipment.roomId }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                 <div class="form-group">
	                    <label class="col-sm-3 control-label">型号：</label>
	                    <div class="col-sm-5">
	                        <input id="version" name="version" value="${equipment.version }" type="text" class="form-control" disabled>
	                    </div>
	                </div>
	                <div class="form-group">
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
</body>
</html>