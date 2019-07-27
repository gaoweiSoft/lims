<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员列表</title>
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
                <h5>管理员列表</h5>
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
	            	<a href="manage/manager/managerEditUI.shtml" class="btn btn-w-m btn-info" type="button"><i class="fa fa-plus" aria-hidden="true"></i>&nbsp;新增</a>
            	</div>
            	<div class="col-sm-3 col-sm-offset-3 float-right">	
	            	<div class="input-group">
	                    <input type="text" id="search" name="search" class="form-control" placeholder="请输入管理员账号"> 
	                    <span class="input-group-btn"> 
	                    	<button type="button" onclick="search()" class="btn btn-primary">搜索</button> 
	                   	</span>
	                </div>
                </div>
                <table id="managerList" data-toggle="table"
					data-url="manage/manager/getManagerList.shtml"
					data-query-params=queryParams data-query-params-type="limit"
					data-pagination="true"
					data-side-pagination="server" data-pagination-loop="false">
					<thead>
						<tr>
							<th data-field="numberId">序号</th>
							<th data-field="account">账号</th>
							<th data-field="mPassword">密码</th>
							<th data-field="permission">权限</th>
							<th data-field="action" data-formatter="actionFormatter"
								data-events="actionEvents">操作</th>
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
	    function actionFormatter(value, row, index) {	    	
	    	return ['<a class="btn btn-primary btn-xs" id="edit" type="button"><i class="fa fa-paste" aria-hidden="true"></i>&nbsp;编辑</a>',
	    			'&nbsp;&nbsp;',
	    			'<a class="btn btn-primary btn-xs" id="delete" type="button"><i class="fa fa-trash" aria-hidden="true"></i>&nbsp;删除</a>'].join('');
	    };
	    window.actionEvents = {	    		
	    		'click #edit' : function(e, value, row, index) {
	    			var managerId = row.managerId;
	    			location.href = "manage/manager/managerEditUI.shtml?managerId=" + managerId;
	    		},
	    		'click #delete' : function(e, value, row, index) {
	    			layer.confirm('确定删除该管理员？', {
	    				  btn: ['确定', '取消'] 
	    				},
	    				function(index){
	    				    layer.close(index);
	    				    $.ajax({
	    				        type: 'POST',
	    				        async: true,
	    				        url: 'manage/manager/deleteManager.shtml',
	    				        data: {
	    				            "managerId": row.managerId          
	    				        },
	    				        success: function (data) {
	    				        	location.replace(location.href); 				        	 
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
	    		},
	    	};
		    function search(){
				$('#managerList').bootstrapTable('refresh', "manage/manager/getManagerList.shtml");
			};
		    function queryParams(params) {
		    	var search = $('#search').val();
		    	var temp = {
		    		      limit: 10,
		    		      offset: params.offset,
		    		      account: search
		    		    };
		        return temp;
		    };
    </script>
</body>
</html>