<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";%>
    
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <base href="<%=basePath %>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="开放式实验室管理系统_设备管理子系统">
    <meta name="author" content="高卫">
    <title>实验室管理系统</title>
    <link rel="shortcut icon" href="img/logo.png"/>
    <link href="style/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="style/css/index.css" rel="stylesheet">
    <script src="style/bootstrap/js/html5shiv.min.js"></script>
    <script src="style/bootstrap/js/respond.min.js"></script>
     <link href="css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-default top_bottom" role="navigation">
    <div class="container-fluid">
        <div class="navbar-headert">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="JavaScript:void(0)"><img src="img/main-logo.png" alt="SEATTLE website template" style="margin-top: -10px"></a>
        </div>
        <div class="collapse navbar-collapse font_style" id="bs-example-navbar-collapse1">

            <ul class="nav navbar-nav  pull-right">
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" class="form-control" value="${search }" placeholder="请输入搜索的设备信息" id="type" name="type">
                    </div>
                    <a href="javascript:void(0)" id="search"class="btn btn-info font_style" >搜索</a>
                </form>
                <li class="dropdown">
                    <a href="customer/indexUI.shtml" >首页</a>
                </li>
                <li class="dropdown ">
                    <a href="JavaScript:void(0)" class="dropdown-toggle " data-toggle="dropdown">设备管理</a>
                    <ul class="dropdown-menu dropdown" role="menu">
                        <li><a href="customer/repair/repairAddUI.shtml">设备报修</a></li>
                        <li><a href="customer/apply/applyListUI.shtml">申请使用设备</a></li>
                        <li><a href="customer/equipment/equipmentListUI.shtml">查询设备信息</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="JavaScript:void(0)" class="dropdown-toggle" data-toggle="dropdown">实验室介绍</a>
                    <ul class="dropdown-menu dropdown" role="menu">
                        <li><a href="customer/introduce/digitalUI.shtml">数字电路实验室</a></li>
                        <li><a href="customer/introduce/simulationUI.shtml">模拟电路实验室</a></li>
                        <li><a href="customer/introduce/EDAUI.shtml">EDA实验室</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="JavaScript:void(0)" class="dropdown-toggle" data-toggle="dropdown">规章制度</a>
                    <ul class="dropdown-menu dropdown" role="menu">
                        <li><a href="customer/rule/physicalUI.shtml">物理仪器室</a></li>
                        <li><a href="customer/rule/biologyUI.shtml">生物仪器室</a></li>
                        <li><a href="customer/rule/chemistryUI.shtml">化学实验室</a></li>
                        <li><a href="customer/rule/laboratoryUI.shtml">实验室守则</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="JavaScript:void(0)" class="dropdown-toggle " data-toggle="dropdown">用户管理</a>
                    <ul class="dropdown-menu dropdown" role="menu">
                        <li><a href="customer/user/changePasswordUI.shtml">修改密码</a></li>
                        <li><a href="customer/user/userEditUI.shtml">修改个人信息</a></li>
                        <li><a id="delete" name="delete" href="javascript:void(0);">注销用户</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a id="close" name="close" href="JavaScript:void(0)">退出</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="jumbotron" style="background-image: url('img/main.png');">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-3">
                    <p><a href="JavaScript:void(0)">研发即服务</a></p>
                    <ul class="menu">
                        <li>用心的研发、精致的服务</li>
                        <li>研发是一种创新，服务是一种态度，缺一不可。</li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-3">
                    <p><a href="JavaScript:void(0)">云计算</a></p>
                    <ul class="menu">
                        <li>安全、可靠、无数据丢失</li>
                        <li>可用的、便捷的、按需的网络访问</li>
                        <li>可配置的计算资源共享池</li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-3">
                    <p><a href="JavaScript:void(0)">绿信</a></p>
                    <ul class="menu">
                        <li>为特定用户提供量身定做</li>
                        <li>跨系统平台的无缝接入和集成</li>
                        <li>实现个性化业务应用的高效开发</li>
                    </ul>
                </div>
                <div class="col-md-3 col-sm-3">
                    <p><a href="JavaScript:void(0)">大数据</a></p>
                    <ul class="menu">
                        <li>大量、高速、多样、价值</li>
                        <li> 海量数据进行存储和分析</li>
                        <li> 更强的决策力、洞察力</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">

        <div class="col-md-3 col-sm-6 col-sm-offset-2  content_left"id="news">
            <h3>新闻/公告</h3>
            <div style="background-image: url(img/2.jpg);width: 328px;height: 271px">
                <p style="padding-top: 20px">
                <ul >
                    <li>为特定用户提供量身定做</li>
                    <li>跨系统平台的无缝接入和集成</li>
                    <li>实现个性化业务应用的高效开发</li>
                </ul></p>
            </div>
        </div>


        <div class="col-md-3 col-sm-6  content">
            <h3>设备展示</h3>
            <dl id="menu">
                <dt>
                    <a href="JavaScript:void(0)" onclick="document.getElementById('img1').scrollIntoView();">1</a>
                    <a href="JavaScript:void(0)" onclick="document.getElementById('img2').scrollIntoView();">2</a>
                    <a href="JavaScript:void(0)" onclick="document.getElementById('img3').scrollIntoView();">3</a>
                    <a href="JavaScript:void(0)" onclick="document.getElementById('img4').scrollIntoView();">4</a>
                </dt>
                <dd>
                    <img src="img/su1.jpg" id="img1"/>
                    <img src="img/su2.jpg" id="img2"/>
                    <img src="img/su3.jpg" id="img3"/>
                    <img src="img/su4.jpg" id="img4"/>
                </dd>
            </dl>
        </div>
        <div class="col-md-3 col-sm-6 col-sm-offset-3 content_right page">

            <ul id="myTab" class="nav nav-tabs page_text">
                <li>
                    <a href="#page1" data-toggle="tab"style="background-color: #9acfea;border: none" style="margin-left: 100px;">消息</a>
                </li>
                <li>
                    <a href="#page2" data-toggle="tab"style="background-color: #9acfea;border: none">荣誉</a>
                </li>

                <li class="dropdown">
                    <a id="myTabDrop1" class="dropdown-toggle" style="background-color: #9acfea;border: none" data-toggle="dropdown">实验室介绍
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu " style=" background-color: #9acfea;border: none" role="menu" aria-labelledby="myTabDrop1">
                        <li><a href="#page-re1" tabindex="-1" data-toggle="tab">模拟电路实验室</a></li>
                        <li><a href="#page-re2" tabindex="-1" data-toggle="tab">数字电路实验室</a></li>
                        <li><a href="#page-re3" tabindex="-1" data-toggle="tab">EDA实验室</a></li>
                    </ul>
                </li>
            </ul>
            <div style="background-image: url(img/1.jpg);width: 328px;height: 271px;padding: 0px 20px 0px 20px">
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="page1">
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="list-unstyled iconList">
                                    <br/>
                                    <br/>
                                    <p>副校长许民强走访广州知名企业</p>
                                    <p>《百家讲坛》杨雨教授为海大师生解读柳如是</p>
                                    <p>举行“育鲲”轮“全国工人先锋号”揭牌仪式</p>
                                    <p>“育鹏”轮开启首次远洋航行之旅</p>
                                    <p>举行水运相关领域专题座谈会</p>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="page2">
                        <br/>
                        <br/>
                        <div class="row">
                            <div class="col-sm-11 ">
								<p>物理实验教学中心于2006年评为“省级示范教学中心”</p>
                                <p>生物实验教学中心于2016年评为“省级示范教学中心”</p>
                                <p>化学实验教学中心于2016年评为“省级示范教学中心”</p>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="page-re1">
                        <br/>
                        <br/>
                        <div class="row">
                            
                            <div class="col-md-7 col-xs-7 col-sm-7">
                                <p>
                                		模拟电路实验室配备有24台DVCC-DA2JH模拟/数字电路综合实验箱；24台配套电脑及实验模块等实验工具，能完成模拟电路实验20项；部分数字电路实验25项。
         						</p>
                            </div>
                            <div class="col-md-5 col-xs-5 col-sm-5">

                                <img alt="" src="img/模拟11.jpg" class="img-responsive">
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="page-re2">
                        <br/>
                        <br/>
                        <div class="row">
                            <div class="col-md-7 col-sm-7 col-xs-7">
                                <p>
                                                                                                                 按照专业基础，利用现成芯片及布线自主设计。嵌入式课程从系统设计、移植及外部工程等方向设实验课程。电子设计自动化通过软件完成硬件的布线，让软件自动化地完成时序、逻辑等排布方式，让芯片完成特定的硬解码功能。
                                </p>
                            </div>
                             <div class="col-md-5 col-sm-5 col-xs-5">
                                <img alt="" src="img/数字11.jpg" class="img-responsive">
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="page-re3">
                        <br/>
                        <br/>
                        <div class="row">
                            <div class="col-md-7 col-sm-7 col-xs-7">
                                <p>
                                    	开设可编程器件原理与应用、单片机原理与应用、DSP技术和嵌入式系统等相关课程实验，主要有EDA实验箱、DSP实验开发系统、 单片机实验箱D、ARM7嵌入式系统实验箱、计算机和示波器各45套
                                </p>
                            </div>
                                 <div class="col-md-5 col-sm-5 col-xs-5">

                                <img alt="" src="img/EDA1.jpg" class="img-responsive">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="top_bottom navbar navbar-default"style="text-align: center;padding-top:15px;margin-top: 50px;margin-bottom: -50px; ">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p>Copyright © 2017&nbsp; <a href="#" target="blank"><b>大连海事大学</b></a> &nbsp;/ &nbsp;版权所有. &nbsp;&nbsp;&nbsp;<a
                        href="http://www.miitbeian.gov.cn/"> &nbsp;辽ICP备05001354号 </a>&nbsp;&nbsp;<b> 邮编：</b>辽ICP备05001354号 &nbsp;&nbsp;<b>&nbsp;地址：</b>辽宁省大连市凌海路1号
                </p>
            </div>
        </div>
    </div>
</footer>
<script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <!-- layer javascript -->
    <script src="js/plugins/layer/layer.min.js"></script>
    <!-- 自定义js -->
    <script src="js/content.js?v=1.0.0"></script>
    <!-- jQuery Validation plugin javascript-->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
    <script src="js/plugins/validate/messages_zh.min.js"></script>
<script>
$("a[name='delete']").click(function (){
	layer.confirm('确定注销该用户？', {
		  btn: ['确定', '取消'] 
		},
		function(index){
		    layer.close(index);
		    $.ajax({
		        type: 'POST',
		        async: true,
		        url: 'customer/user/deleteUser.shtml',
		        data: {
		            "number": $("#number").val()          
		        },
		        success: function (data) {
		        	layer.alert("注销成功");
		        	window.location.href="customer/indexUI.shtml";				        	 
		        },
		        error: function () {
		        	layer.alert("系统出现问题，请联系管理员");
		        },
		        dataType: 'json'
		    });
  		}, 
  		function(){
  			layer.msg('取消操作');
		}
	);    	
});

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
});
 $("#search").click(function(){
	var $type = $("#type").val();
	window.location.href="customer/equipment/equipmentListUI.shtml?search=" + $type;
}); 
</script>
</body>
</html>
