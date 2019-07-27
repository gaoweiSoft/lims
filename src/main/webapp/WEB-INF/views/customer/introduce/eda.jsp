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
<title>EDA电路实验室</title>
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
EDA实验室主要是面向理工类学生开设可编程器件原理与应用、单片机原理与应用、DSP技术和嵌入式系统等相关课程实验，同时也承担着电子竞赛培训、本科生的学年论文、课程论文和毕业设计等任务，每年暑假对学生进行开放。
</h4>      
<h4>
<br/>  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
EDA实验室主要有EDA实验箱、DSP实验开发系统、 单片机实验箱D、ARM7嵌入式系统实验箱、计算机和示波器各45套，总价值约90万元。实验时要求学生单人独立完成实验。
</h4>
<br/>  
<img src="img/EDA.jpg" style="margin-left: 50px;">
<h4 style="margin-bottom: 100px;">
<br/> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
基本组合电路设计、基本时序电路的设计、设计含异步清0和同步时钟使能的加法计数器、7段数码显示译码器设计、数控分频器的设计、设计8位全加器、译码器和数据选择器、序列检测器设计；汇编语言程序的运行与调试，调试程序debug常用指令的使用，两个多位十进制数相加实验，从键盘输入数据并显示实验，将键盘输入的字母大小写互换并显示实验，可编程中断控制8259a实验，8255并行输入输出实验，8255交通灯控制实验。存储器块清零，二进制到BCD码转换， 二进制到ASCII码转换，内存块移动， 程序跳转表，P1口输入输出，继电器控制，用74LS245读入数据，用74LS273输出数据，PWM转换电压实验，音频控制，用8255输入、输出，串行数转换并行数，并行数转换串行数，计数器实验，外部中断实验，定时器实验，D/A转换实验，A/D转换实验， 外部中断实验(急救车与交通灯) ，八段数码管显示， 键盘扫描显示实验，电子时钟， 单片机串行口通讯实验，打印机控制实验。
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