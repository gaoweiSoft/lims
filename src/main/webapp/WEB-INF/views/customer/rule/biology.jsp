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
<title>生物仪器室规章制度</title>
<link rel="shortcut icon" href="img/logo.png"/>
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<jsp:include page="../header.jsp" flush="true" />
<body style="background-image: url('img/rule3.jpg');background-position: 0px 50px;">
<div class="col-sm-7 col-sm-offset-3">
<h1 style="margin-top: 175px;">生物仪器室安全管理制度</h1>
<h5 style="color:red">教学仪器设备是进行实验教学，提高教学质量不可缺少的条件，是学校的固定资产，要加强管理，爱护使用，充分发挥作用。 </h5>
<ul style="margin-bottom: 100px;">
<li>
一、实验室各项仪器设备要按要求统一分类、编号、入账，建立总账、分类账，低值易耗品帐，做到总账、分类账相符要求，仪器与橱上的目录卡片相符。设专人管理。 
</li>
<li>
二、仪器存放应定橱定位，做到分类科学、取用方便。 
</li>
<li>
三、 生物实验室危险品必须贮放在危险品室（柜）内，严格执行危险品管理制度，措施到位，责任到人。 
</li>
<li>
四、教师演示与学生实验需用的仪器、药品由任课老师提前一周提出使用计划，填写实验申请，列出所需仪器、药品明细，交由实验老师准备。解剖需用的小动物等应根据季节情况于学期初提出计划，由实验老师给予准备。 
</li>
<li>
五、实验结束，实验老师按任课老师所列仪器、药品进行清点回收，并填写实验记录中仪器、药品损耗情况，由实验老师留存，以备检查。 
</li>
<li>
六、及时维修、定期保养，每学期清点一次仪器、器材、试剂。
</li>
<li>
七、仪器、器材、试剂的报损和添置应每年一次。按学校资产、财务管理制度和国有资产管理办法进行。对非正常损坏、丢失和因失职而造成的事故，要按赔偿制度执行。  
</li>
<li>
八、教学仪器（用品）室应保持整洁、干燥、安全，要具备防火、防腐、防中毒等应急措施。 
</li>
<li>
九、使用仪器设备，必须办理借出手续，并按时归还。 
</li>
<li>
十、加强安全管理，注意防毒、防潮、防火、防盗，保持通风良好，清洁卫生。学期结束，全面清查，及时补充、修整、保证教学要求。 
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