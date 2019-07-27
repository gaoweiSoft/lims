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
<title>化学仪器室规章制度</title>
<link rel="shortcut icon" href="img/logo.png"/>
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<jsp:include page="../header.jsp" flush="true" />
<body style="background-image: url('img/rule2.jpg');background-position: 0px 50px;">
<div class="col-sm-9 col-sm-offset-2">
<div class="col-sm-6">
<h1 style="margin-top: 150px;">化学实验室安全管理制度 </h1>
<ul style="margin-bottom: 75px">
<li>
 一、实验室内严禁烟火，也不能在实验室内点火取暖，严禁闲杂人员入内。
</li>
<li> 
二、充分熟悉安全用具，如灭火器、急救箱的存放位置和使用方法，并妥加爱护，安全用具及急救药品不准移作它用。 
</li>
<li> 
三、盛药品的容器上应贴上标签，注明名称、溶液浓度。  
</li>
<li>
四、危险药品要专人、专类、专柜保管，实行双人双锁管理制度。各种危险药品要根据其性能、特点分门别类贮存，并定期进行检查，以防意外事故发生。     
</li>
<li> 
五、不得私自将药品带出实验室。    
</li>
<li> 
六、有危险的实验在操作时应使用防护眼镜、面罩、手套等防护设备。     
</li>
<li> 
七、能产生有刺激性或有毒气体的实验必须在通风橱内进行。    
</li>
<li> 
八、浓酸、浓碱具有强烈的腐蚀性，用时要特别小心切勿使其溅在衣服或皮肤上。废酸应倒入酸缸，但不要往酸缸里倾倒碱液，以免酸碱中和放出大量的热而发生危险。 
</li>
<li> 
 九、实验中所用药品不得随意散失、遗弃，对反应中产生有害气体的实验应按规定处理，以免污染环境，影响健康。      
</li>
<li> 
十、实验完毕后，对实验室作一次系统的检查，随时关好门窗，防火、防盗、防破坏。   
</li>
</ul>
</div>
<div class="col-sm-6">
<h1 style="margin-top: 150px;">化学实验室安全操作规程</h1>  
<h5 style="color:red">为了顺利地做好化学实验，保证实验成功，保护实验仪器设备，维护每个师生的安全，防止一切实验事故，特制订本实验室安全操作规程。  </h5>
<ul style="margin-bottom: 75px">
<li>
一、未进实验室时，就应对本次实验进行预习，掌握操作过程及原理，弄清所有药品的性质。估计可能发生危险的实验，在操作时注意防范。 
</li>
<li>
 二、实验开始前，检查仪器是否完整无损，装置是否正确稳妥。 实验进行时，应该经常注意仪器有无漏气、碎裂，反应进行是否正常等情况。 
</li>
<li>
三、灯火加热时要注意安全。在酒精灯快烧尽、灯火还没熄灭时，千万不能注入燃料；酒精灯熄灭时，要用灯帽来罩，不要用口来吹，防止发生意外；不要用一个酒精灯来点燃，以免酒精溢出，引起燃烧。点燃的火柴用完后立即熄灭，不得乱扔。 
</li>
<li>
四、使用氢气时，要严禁烟火，点燃氢气前必须检查氢气的纯度。使用易燃、易爆试剂一定要远离火源。
</li>
<li>
五、要注意安全用电，不要用湿手、湿物接触电源，实验结束后应及时切断电源。 
</li>
<li>六、加热或倾倒液体时，切勿俯视容器，以防液滴飞溅造成伤害。给试管加热时，切勿将管口对着自己或他人，以免药品喷出伤人。 
 </li>
<li>
七、嗅闻气体时，应保持一定的距离，慢慢地用手把挥发出来的气体少量地煽向自己，不要俯向容器直接去嗅。 
 </li>
<li>
八、凡做有毒和有恶臭气体的实验，应在通风橱内进行。 
</li>
<li>
九、取用药品要选用药匙等专用器具，不能用手直接拿取。
 </li>
<li>
十、未经许可，绝对不允许任意混合各种化学药品，以免发生意外事故。  
</li>
<li>
十一、稀释浓酸（特别是浓硫酸），应把酸慢慢地注入水中，并不断搅拌。  
</li>
<li>
十二、使用玻璃仪器时，要按操作规程，轻拿轻放，以免破损，造成伤害。
</li> 
</ul>
</div>
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