<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>申请设备记录</title>
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>申请设备记录</h5>
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
            	<div class="col-sm-6 float-left">	
	            	<a href="manage/apply/applyListUI.shtml" class="btn btn-w-m btn-info" type="button"><i class="fa fa-mail-reply" aria-hidden="true"></i>&nbsp;返回</a>
            	</div>
                <table id="allApplyList" data-toggle="table"
					data-url="manage/apply/getAllApplyList.shtml"
					data-query-params=queryParams data-query-params-type="limit"
					data-pagination="true"
					data-side-pagination="server" data-pagination-loop="false">
					<thead>
						<tr>
							<th data-field="applyId">序号</th>
							<th data-field="location">实验室位置</th>
							<th data-field="roomId">房间号</th>
							<th data-field="equipmentId">设备编号</th>
							<th data-field="dateStart">开始日期</th>
							<th data-field="dateEnd">结束日期</th>
							<th data-field="aStatus">状态</th>
						</tr>
					</thead>
				</table>
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
    <!-- Bootstrap table -->
    <script src="js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script>
		    function queryParams(params) {
		    	var temp = {
		    		      limit: 10,
		    		      offset: params.offset,
		    		    };
		        return temp;
		    };
    </script>
</body>
</html>