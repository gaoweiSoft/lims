<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>审核用户记录</title>
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
                <h5>审核用户记录</h5>
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
	            	<a href="manage/user/userListUI.shtml" class="btn btn-w-m btn-info" type="button"><i class="fa fa-mail-reply" aria-hidden="true"></i>&nbsp;返回</a>
            	</div>
                <table id="allUserList" data-toggle="table"
					data-url="manage/user/getAllUserList.shtml"
					data-query-params=queryParams data-query-params-type="limit"
					data-pagination="true"
					data-side-pagination="server" data-pagination-loop="false">
					<thead>
						<tr>
							<th data-field="numberId">序号</th>
							<th data-field="number">学号/工号</th>
							<th data-field="sign">类型</th>
							<th data-field=college>学院</th>
							<th data-field="school">学校</th>
							<th data-field="uStatus">状态</th>
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
    	return ['<a class="btn btn-primary btn-xs" id="detail" type="button"><i class="fa fa-eye" aria-hidden="true"></i>&nbsp;详情</a>',
    			'&nbsp;&nbsp;',
    			'<a class="btn btn-primary btn-xs" id="reset" type="button"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i>&nbsp;重置密码</a>'].join('');
    };
    window.actionEvents = {	
    		'click #detail' : function(e, value, row, index) {
    			var number = row.number;
    			location.href = "manage/user/viewUserUI.shtml?number=" + number;
    		},
    		'click #reset' : function(e, value, row, index) {
    			layer.confirm('确定重置密码？', {
    				  btn: ['确定', '取消'] 
    				},
    				function(index){
    				    layer.close(index);
    				    $.ajax({
    				        type: 'POST',
    				        async: true,
    				        url: 'manage/user/resetUser.shtml',
    				        data: {
    				            "number": row.number          
    				        },
    				        success: function (data) {
    				        	layer.alert("密码重置为123456");
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