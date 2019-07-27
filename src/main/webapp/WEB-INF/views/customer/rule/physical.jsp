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
<title>物理仪器室规章制度</title>
<link rel="shortcut icon" href="img/logo.png"/>
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<jsp:include page="../header.jsp" flush="true" />
<body style="background-image: url('img/rule1.jpg');background-position: 0px 50px;">
<div class="col-sm-7 col-sm-offset-3">
<h1 style="margin-top: 75px;">物理仪器室安全管理制度 </h1>
<h5 style="color:red">教学仪器设备是进行实验教学，提高教学质量不可缺少的条件，是学校的固定资产，要加强管理，爱护使用，充分发挥作用。物理实验室较其他实验室仪器设备多，在仪器管理和仪器保养、修理上更须加强管理，确保教学实验顺利进行。</h5> 
<ul>
<li>
一、实验室各项仪器设备要按要求统一分类、编号、入账，建立总账、分类账，低值易耗品帐，做到总账、分类账相符要求，仪器与橱上的目录卡片相符。设专人管理。 
</li>
<li>
二、仪器存放应定橱定位，做到分类科学、取用方便。要按仪器性能注意做好防尘、防压、防潮、防蛀、防霉、防磁等工作。 
</li>
<li>
三、使用仪器设备，必须办理借出手续，并按时归还。 
</li>
<li>
四、教师演示与学生实验需用的仪器由任课老师提前一周提出使用计划，填写实验申请，列出所需仪器明细，交实验老师给予准备。 
</li>
<li>
五、实验时要爱护仪器，严格按“使用说明书”的规定和要求操作。实验完毕，由实验老师对仪器验收后放回原处，并填写实验记录，由实验老师留存，以备检查。 
</li>
<li>
六、实验室专职工作人员，要了解各种仪器设备的性能、使用、维护保养及检查检验方法等，定期或按时检验仪器设备的完好性。经常擦试、打扫，保持仪器、设备及室内整洁卫生。 
</li>
<li>
七、注意安全，做好防失防盗工作。学期结束，全面清查，及时补充、修整、保证教学要求。
</li>
</ul>
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
</body>
</html>