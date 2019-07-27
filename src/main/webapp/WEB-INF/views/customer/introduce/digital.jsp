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
<title>数字电路实验室</title>
<link rel="shortcut icon" href="img/logo.png"/>
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<jsp:include page="../header.jsp" flush="true" />
<body>
<div class="col-sm-7 col-sm-offset-2">
<h4>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
该实验室主要为电子信息科学与技术和计算机科学与技术专业学生服务，开设数字电路实验课程，后期改建加入嵌入式实验课程及电子设计自动化实验课程，其中数字电路实验属于基础课程，嵌入式实验及电子设计自动化属于专业基础课程。
</h4> 
<br/>    
<img src="img/数字1.jpg"style="margin-left: 50px;">
<h4>
<br/> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
该实验室用于学习组合逻辑电路和时序逻辑电路的设计，建立基础的数字逻辑思维，进行各种编码及解码的设计，实现理论和实践相结合、硬件与软件接结合、单元电路与系统相结合的过度，并进行数字电子芯片的设计、FPGA及CPLD的设计以及单片机外围的电路设计等多个领域的科研项目,也作为学生课外作品制作及学生毕业设计场地，培养的学生在各种大型比赛中获得了优异的成绩。
</h4>
<br/>  
<img src="img/数字2.jpg" style="margin-left: 50px;">
<h4 style="margin-bottom: 100px;">
<br/>  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
数字电路实验按照专业基础，利用现成芯片及布线自主设计，完成实验目标的方式开出12个相应的实验。嵌入式课程则从系统设计、移植及外部工程等不同方向开设实验课程，旨在完成自动化检测及控制等功能。电子设计自动化（EDA）实验课程是在数字电路的基础上，通过软件完成硬件的布线，让软件自动化地完成时序、逻辑等排布方式，烧录到芯片中，让芯片完成特定的硬解码功能。
</h4>
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