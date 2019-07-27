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
<title>实验室守则</title>
<link rel="shortcut icon" href="img/logo.png"/>
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<jsp:include page="../header.jsp" flush="true" />
<body style="background-image: url('img/rule4.jpg');background-position: 0px 50px;">
<div class="col-sm-7 col-sm-offset-3">
<h1 style="margin-top: 75px;">实验室守则</h1>
<ul  style="margin-bottom: 75px;">
<li>
一、分组实验是学生完成学习任务的重要组成部分，是培养学生观察能力、动手能力、分析问题和解决问题的能力，全面实施素质教育的重要手段。每个学生必须高度重视实验课，亲自动手，认真完成每一个分组实验。 
</li>
<li>
 二、实验课前，必须认真预习实验内容，明确实验目的和要求，掌握实验的基本原理，设计实验方法和实验步骤，明确注意事项，并认真写好实验预习报告，经教师检查合格后，才能进行实验。 
</li>
<li>
  三、进出实验室要保持良好秩序，不准喧哗、打闹，做到“三定”，即：定组、定位、定仪器。  
  </li>
<li>
四、实验前，必须认真听取教师讲解实验内容和要求，仔细观察教师的示范操作。实验开始时，首先要检查实验仪器、药品和器材是否齐全，若发现短缺或破损，应立即报告教师，给予补齐或调换。未经许可，不得擅自动用仪器和药品。  
 </li>
<li>
 五、实验时，必须严格遵守实验室纪律，遵循实验操作规程。同学间要发扬团结友爱、协调一致的精神，认真、规范地完成实验任务。 
</li>
<li>
六、在实验过程中，要积极动手，认真观察，仔细分析实验现象，规范地做好实验原始记录，总结实验现象。重做、补做实验或做规定外的实验，须经教师批准。 
</li>
<li>
七、实验过程中，要注意安全，防止意外事故发生。如出现异常现象，应立即停止实验，及时报告教师，在教师指导下妥善处理。 
</li>
<li>
八、实验后，及时切断电源和火源，清洗有关器皿，整理教学仪器、药品和器材，并按要求摆放整齐。若教学仪器有损坏，须及时报告教师，并按学校有关赔偿规定执行。 
</li>
<li>
九、要爱护实验室里的一切设施和用品，注意节约水、电、药品和实验材料，没有用完的药品、材料，要放到指定的容器或其它地方存放。严禁将实验器材和药品携带出实验室，一旦发现，严肃处理。 
</li>
<li>
十、要保持实验室的清洁卫生。实验产生的废液，须倒入废液桶（缸）里，严禁倒入水槽，其它废物装入污物桶。集中倒入垃圾箱。下课后，要轮流值日。 
</li>
<li>
十一、实验结束后，根据原始记录和实验现象，按教师要求，独立完成实验报告。
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