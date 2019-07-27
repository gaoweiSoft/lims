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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<title>设备管理后台系统</title>
<link rel="shortcut icon" href="img/admin-logo.jpg">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="fixed-sidebar full-height-layout gray-bg"
	style="overflow: hidden">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span><img alt="image" src="img/admin-logo.png" style="margin-top:-10px"></span>
						</div>
						<div class="logo-element">C</div>
					</li>
					<li><a href="javascript:void(0)"> <i class="fa fa-home"
							aria-hidden="true"></i> <span class="nav-label">首页</span> <span
							class="fa arrow"></span>
					</a></li>
					<li><a href="javascript:void(0)"> <i class="fa fa-user"
							aria-hidden="true"></i> <span class="nav-label">用户管理</span> <span
							class="fa arrow"></span>
					</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem"
								href="manage/user/userListUI.shtml">&nbsp;审核用户</a></li>
							<li><a class="J_menuItem"
								href="manage/manager/managerListUI.shtml">&nbsp;分配管理员</a></li>
						</ul></li>
					<li><a href="javascript:void(0)"> <i
							class="fa fa-cubes" aria-hidden="true"></i> <span
							class="nav-label">实验室管理</span> <span class="fa arrow"></span>
					</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem"
								href="manage/laboratory/laboratoryListUI.shtml">&nbsp;实验室管理</a>
							</li>
						</ul></li>
					<li><a href="javascript:void(0)"> <i
							class="fa fa-desktop fa-fw" aria-hidden="true"></i> <span
							class="nav-label">设备管理</span> <span class="fa arrow"></span>
					</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem"
								href="manage/apply/applyListUI.shtml">&nbsp;审核设备</a></li>
							<li><a class="J_menuItem"
								href="manage/repair/repairListUI.shtml">&nbsp;报修处理</a></li>
							<li><a class="J_menuItem"
								href="manage/equipment/equipmentListUI.shtml">&nbsp;设备信息</a></li>
						</ul></li>
					<!-- <li><a href="javascript:void(0)"> <i
							class="fa fa-copy fa-fw"></i> <span class="nav-label">界面管理</span>
							<span class="fa arrow"></span>
					</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="javascript:void(0)">&nbsp;设备图片</a>
							</li>
							<li><a class="J_menuItem" href="javascript:void(0)">&nbsp;新闻公告</a>
							</li>
						</ul></li> -->
					<li><a href="javascript:void(0)"> <i
							class="fa fa-tachometer fa-fw" aria-hidden="true"></i> <span
							class="nav-label">监控设备</span> <span class="fa arrow"></span>
					</a>
						<ul class="nav nav-second-level">
							<li><a class="J_menuItem" href="manage/log/laboratoryLogUI.shtml">&nbsp;实验室设备柱状图</a>
							</li>
							<li><a class="J_menuItem" href="manage/log/typeLogUI.shtml">&nbsp;设备类型饼图</a>
							</li>
						</ul></li>
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="javascript:void(0)"><i class="fa fa-bars"></i> </a>
					</div>
					<ul class="nav navbar-top-links navbar-right">
					<!-- 	<li class="dropdown" id="equipmentCheck"><a
							class="dropdown-toggle count-info" 
							href="manage/apply/applyListUI.shtml"> <i class="fa fa-briefcase"></i>
								<span class="label label-primary">8</span>
						</a></li>
						<li class="dropdown" id="dealRepair"><a
							class="dropdown-toggle count-info"
							href="manage/repair/repairListUI.shtml"> <i class="fa fa-wrench"></i> <span
								class="label label-primary">3</span>
						</a></li>
						<li id="userCheck" class="dropdown"><a
							class="dropdown-toggle count-info"
							href="manage/user/userListUI.shtml"> <i class="fa fa-users"></i> <span
								class="label label-primary">3</span>
						</a></li> -->
						<li class="dropdown" style="border: none"><a href="javascript:void(0)" id="close" name="close"
							class="dropdown-toggle"> <i class="fa fa-power-off"></i>
						</a></li>
					</ul>
				</nav>

			</div>

			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:void(0)" class="active J_menuTab"
							data-id="main.html">首页</a>
					</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>
					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a>定位当前选项卡</a></li>
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<a href="javascript:void(0)"  class="roll-nav roll-right J_tabExit"><i
					class="fa fa fa-sign-out"></i> 退出</a>
			</div>
			<div class="row J_mainContent" id="content-main">
				<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
					src="manage/mainUI.shtml" frameborder="0" data-id="index_v1.html"
					seamless></iframe>
			</div>
			<div class="footer">
				<div class="pull-right">&copy; 2017</div>
			</div>
		</div>
		<!--右侧部分结束-->
	</div>
	<!-- 全局js -->
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="js/plugins/layer/layer.min.js"></script>
	<!-- 自定义js -->
	<script type="text/javascript" src="js/hplus.js?v=4.1.0"></script>
	<script type="text/javascript" src="js/contabs.js"></script>
	<!-- 第三方插件 -->
	<script type="text/javascript" src="js/plugins/pace/pace.min.js"></script>
	<script>
	$("a[name='close']").click(function (){
		layer.confirm('确定退出系统吗？', {
			  btn: ['确定', '取消'] 
			},
			function(index){
			    layer.close(index);
			    window.opener=null;  
				window.open('','_self');  
				window.close();  
	  		}, 
	  		function(){
	  			layer.msg('取消操作');
			}
		);    	
	});</script>
</body>
</html>