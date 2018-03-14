<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>会员登录</title>
    <%--设置浏览器左上角的小图标--%>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="/css/login.css"/>
    <link rel="stylesheet" href="/css/jquery.slider.css"/>
    <style>
        <%--滑块的容器--%>
        .demo2 {
            /*display: none;!*隐藏滑块*!*/
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 2;
        }
        #slider2 {
            z-index: 3;
            position: absolute;
            display: none;
            top:50%;
            left: 50%;
            margin-top: -17px;
            margin-left: -150px;

        }
        /*.showpwd{*/
            /*cursor: pointer;*/
            /*position: absolute;*/
            /*right: 1.4rem;*/
            /*top: 0.7rem*/
        /*}*/

    </style>
</head>
<%--获取cookie 记住密码--%>
<%
    String user="";
    String userName="";
    String pwd="";
    Cookie [] cookies=request.getCookies();
    if(cookies!=null){
        for (Cookie cookie:cookies) {
            if("user".equals(cookie.getName())){
                user=cookie.getValue();
                String [] users=user.split("/");
                userName=users[0];
                pwd=users[1];
            }
        }
    }
%>
<body class="beg-login-bg">
<div class="beg-login-box">
    <header>
        <h1>会员登录</h1>
        <%--<marquee onmouseover="this.stop()" onmouseout="this.start()" behavior="" direction="right" style="font-size: 100px;cursor: pointer;">(눈_눈)</marquee>--%>
    </header>
    <div class="beg-login-main">
        <form action="/login.do" class="layui-form" method="post"><input name="__RequestVerificationToken"
                                                                             type="hidden"
                                                                             value="fkfh8D89BFqTdrE2iiSdG_L781RSRtdWOH411poVUWhxzA5MzI8es07g6KPYQh9Log-xf84pIR2RIAEkOokZL3Ee3UKmX0Jc8bW8jOdhqo81">
            <p style="color: red;font-size: 18px">${msg}</p>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i celass="layui-icon">&#xe612;</i>
                </label>
                <input id="username" type="text" name="userName" lay-verify="required" autocomplete="off"
                       placeholder="这里输入用户名" class="layui-input" value="<%=userName%>" />
            </div>
            <div id="pwdDiv" class="layui-form-item" style="display: flex;flex-direction: row;align-items: center;">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input id="password" type="password" name="password" lay-verify="required"autocomplete="off"
                       placeholder="这里输入密码" class="layui-input" value="<%=pwd%>" />

                <img  class="showpwd" src="/images/password4.png" alt="" width="50px;" >
            </div>
            <div class="layui-form-item">
                <div class="beg-pull-left beg-login-remember">
                    <label>记住帐号？</label>
                    <input type="checkbox" name="rememberMe" value="true" lay-skin="switch" checked title="记住帐号">
                </div>
                <div class="beg-pull-right">
                    <button class="layui-btn layui-btn-primary" lay-submit lay-filter="login">
                        <i class="layui-icon">&#xe650;</i> 登录
                    </button>
                </div>
                <div class="beg-clear"></div>
            </div>
            <input id="submit" type="submit" style="display: none" value="提交"/>
        </form>
        <form class="sub" method="post" action="/login.do">
            <input type="hidden" class="userName" name="userName" />
            <input type="hidden" class="password" name="password" />
            <input type="hidden" name="rememberPwd" value="true"/>
            <button class="layui-btn layui-btn-primary tologin" lay-submit lay-filter="login2" style="display: none">
            </button>
        </form>
    </div>
    <footer>
        <%--<a href="/page/index">dddddd</a>--%>
        <p>没有账号？<a href="/register" style="color: #ffffff;text-decoration: underline ">注册一个</a></p>
    </footer>

    <%--滑块验证--%>
    <div class="demo2">
        <!--<div class="btns">-->
        <!--<button id="reset2">还原</button>-->
        <!--</div>-->
    </div>

    <div id="slider2" class="slider"></div>
</div>
<script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/js/jquery.slider.min.js"></script>
<script type="text/javascript" src="/plugins/layui/layui.js"></script>
<script type="text/javascript" src="/js/fontSize.js"></script>
<%--<script type="text/javascript" src="/js/disablekey.js"></script>--%>
<script>
    $(function () {
        $("#pwdDiv").width($("#pwdDiv").width()+50)
        var passwordShow = false
        $(".showpwd").on("click", function () {
            if (passwordShow == true) {
                passwordShow=false
                $("#password").attr("type", "password")
                $(this).attr("src","/images/password4.png")
                $("#pwdDiv").width($("#pwdDiv").width()+2)
            } else {
                passwordShow=true
                $(this).attr("src","/images/password.png")
                $("#password").attr("type", "text")
                $("#pwdDiv").width($("#pwdDiv").width()-2)
            }
        })
    })
</script>
<script>
    var username = "";
    var password = "";
    layui.use(['layer', 'form'], function () {
        var layer = layui.layer,
            $ = layui.jquery,
            form = layui.form();

        form.on('submit(login)', function (data) {
            username = $("#username").val()
            password = $("#password").val()


            if (username == "" || username == null || password == "" || password == null) {
                $("#submit").trigger("click")
                return false
            }
            $("#slider2").css("display", "block")
            $(".demo2").css("display", "flex")
//            var userName=data.field.userName;
//            var password=data.field.password;
//            location.href='login.do?userName='+userName+'&password='+password+'';
            return false;
        });
        form.on('submit(login2)', function (data) {
            return true
        });
    });
</script>

<%--滑块验证--%>
<script>
    $("#slider2").slider({
        callback: function (result) {
            if (result == true) {
//                location.href = 'login.do?userName=' + username + '&password=' + password + '';
                $(".userName").val(username)
                $(".password").val(password)
                if($(":input[name=rememberMe]").prop("checked")==true){
                    $(":input[name=rememberPwd]").val("true")
                }else{
                    $(":input[name=rememberPwd]").val("false")
                }
                $(".tologin").trigger("click")
            }
        }
    });
    $("#reset2").click(function () {
        $("#slider2").slider("restore");
    });
</script>
<script>
    $(function () {
        $(".demo2").on("click", function () {
            $(this).css("display", "none")
            $("#slider2").css("display", "none")
        })
    })
</script>

<script>
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        form.verify({
//            title: function (value) {
//                if (value.length < 5) {
//                    return '用户名至少得5个字符';
//                }
//            },
//            pass: [/(.+){6,12}$/, '密码必须6到12位'],
//            content: function (value) {
//                layedit.sync(editIndex);
//            }
        });

    });
</script>

</body>

</html>
