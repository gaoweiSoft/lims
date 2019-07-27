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
<title>模拟电路实验室</title>
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
模拟电路实验室主要承担全校理工类专业的学生进行电子技术以及电子基础课程相关的实验教学，是学生独立开展模拟电路实践环节的重要场所，是学生把基础理论知识转化为实际基本能力的一个必要途径，提高学生的动手能力，达到巩固电子基础知识的目的。
</h4>
<br/>
<img src="img/模拟1.jpg" style="margin-left: 50px;">
<h4>
<br/>  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
模拟电路实验室配备有24台DVCC-DA2JH模拟/数字电路综合实验箱；24台配套电脑及实验模块等实验工具，能完成模拟电路实验20项；部分数字电路实验25项；能一次容纳四十名学生开展实验教学活动，设备使用率达80%。
</h4>
<br/>  
<img src="img/模拟2.jpg" style="margin-left: 50px;">
<h4 style="margin-bottom: 100px;">
<br/> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
通过实验教学，能让课程理论和实际有效的结合，让学生在课堂既可深度掌握理论知识，又可为学生学习后续专业课程提供必要的基础知识和理论背景，为学生形成良好的专业素质打好基础。
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