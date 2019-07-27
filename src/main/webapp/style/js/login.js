function check() {
   /* var email = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    var mobil = /^1[3|4|5|8][0-9]\d{8}$/;;*/
    var name = /^[0-9]{10}$/;
    var pass = /^[a-zA-Z0-9]{6,16}$/;
    var username = $("#number").val();
    var password = $("#password").val();
    if ((username == null || username == "") && (password == null || password == "")) {
        // alert("用户名不能为空！");
         var $warn=$();
        $warn.prependTo("#warn");//放到table
        $("#div1").addClass("has-warning has-feedback");
        $("#span1").addClass("glyphicon glyphicon-warning-sign form-control-feedback");
        $("#div2").addClass("has-warning has-feedback");
        $("#span2").addClass("glyphicon glyphicon-warning-sign form-control-feedback");
        return false;
    }
    else if (username == null || username == "") {
        $("#div1").addClass("has-warning has-feedback");
        $("#span1").addClass("glyphicon glyphicon-warning-sign form-control-feedback");
        return false;
    }
    else if (password == null || password == "") {
        $("#div2").addClass("has-warning has-feedback");
        $("#span2").addClass("glyphicon glyphicon-warning-sign form-control-feedback");
        return false;
    }
   /* if (!email.test(username)) {
        if (!mobil.test(username)) {*/
            if (!name.test(username)) {
                $("#warn").empty();
                var $warn=$("<h6 style='color: red'>学号/工号格式错误</h6>");
                $warn.prependTo("#warn");//放到table
                //alert("用户名、邮箱、手机号格式错误，请重新输入！");
                $("#div1").removeClass("has-warning has-feedback");
                $("#div1").addClass("has-error has-feedback");
                $("#span1").removeClass("glyphicon glyphicon-warning-sign form-control-feedback");
                $("#span1").addClass("glyphicon glyphicon-remove form-control-feedback");
                // $("#div2").removeClass("has-warning has-feedback");
                // $("#div2").addClass("has-warning has-feedback");

                return false
            }
     /*   }
    }*/
    if (!pass.test(password)) {
        $("#warn1").empty();
        var $warn1=$("<h6 style='color: red'>密码为6-16位数字或字母</h6>");
        $warn1.prependTo("#warn1");//放到table
       // alert("密码为6-10位数字或字母！");
        $("#div1").removeClass("has-warning has-feedback");
        $("#div1").removeClass("has-error has-feedback");
        $("#div1").addClass("has-success has-feedback");
        $("#span1").removeClass("glyphicon glyphicon-warning-sign form-control-feedback");
        $("#span1").removeClass("glyphicon glyphicon-remove form-control-feedback");
        $("#span1").addClass("glyphicon glyphicon-ok form-control-feedback");
        $("#div2").removeClass("has-warning has-feedback");
        $("#div2").addClass("has-error has-feedback");
        $("#span2").removeClass("glyphicon glyphicon-warning-sign form-control-feedback");
        $("#span2").addClass("glyphicon glyphicon-remove form-control-feedback")
        return false
    }
    return true;
}
var _height = $("body").height();//获取当前窗口的高度
var _width = $("body").width();//获取当前窗口的宽度
$("#form").css('width', _width + 'px').css('height', _height + 'px');//调整列表的宽高