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
	        url: 'manage/log/getTypes.shtml',
	        data: {
	        },
	        success: function (data) {
	        	var typeMapList = data.data;
	        	var type = new Array();
	        	for (var i = 0; i<typeMapList.length; i++){
	        		var typeMap=typeMapList[i];
	        		for(var key in typeMap){
	        			if(key=="name"){
	        				type.push(typeMap[key]);
	        				}
	        		}
	        	}
	          	var option = {
	          		    title : {
	          		        text: '设备类型饼图',
	          		        subtext: '不同种类设备的比例',
	          		        x:'center'
	          		    },
	          		    tooltip : {
	          		        trigger: 'item',
	          		        formatter: "{a} <br/>{b} : {c} ({d}%)"
	          		    },
	          		    legend: {
	          		        orient: 'vertical',
	          		        left: 'left',
	          		        data: type
	          		    },
	          		    series : [
	          		        {
	          		            name: '设备类型',
	          		            type: 'pie',
	          		            radius : '70%',
	          		            center: ['50%', '60%'],
	          		            data:typeMapList,
	          		            itemStyle: {
	          		                emphasis: {
	          		                    shadowBlur: 10,
	          		                    shadowOffsetX: 0,
	          		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	          		                }
	          		            }
	          		        }
	          		    ]
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