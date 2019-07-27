<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>设备日志</title>
    <!-- 引入 echarts.js -->
    <script src="style/js/echarts.min.js"></script>
</head>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 1100px;height:400px;"></div>
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
    <script type="text/javascript">

	$(document).ready(function(){ 
	
	 	$.ajax({
	        type: 'POST',
	        async: false,
	        url: 'manage/log/getLaboratorys.shtml',
	        data: {
	        },
	        success: function (data) {
	        	var laboratoryList = data.data;
	        	var laboratorys = new Array();
        		var quantity = new Array();
	        	for (var i = 0; i<laboratoryList.length; i++){
	        		var laboratory=laboratoryList[i].location+laboratoryList[i].roomId;
	        		laboratorys.push(laboratory);
	        		quantity.push(laboratoryList[i].quantity);
	        		console.log(laboratorys[i]);
	        	}
	        	console.log(laboratorys);
	        	var option = {
	    	            title: {
	    	                text: '实验室设备柱状图'
	    	            },
	    	            tooltip: {},
	    	            legend: {
	    	                data:['数量']
	    	            },
	    	            xAxis: {
	    	                data: laboratorys
	    	            },
	    	            yAxis: {},
	    	            series: [{
	    	                name: '数量',
	    	                type: 'bar',
	    	                data: quantity
	    	            }]
	    	        };
	        	// 使用刚指定的配置项和数据显示图表。
	            myChart.setOption(option);
	        },
	        error: function () {
	            alert("请求失败！重新操作");
	        },
	        dataType: 'json'
	    });
	});
	 var myChart = echarts.init(document.getElementById('main'));
    </script>
</body>
</html> 