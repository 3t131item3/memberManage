<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>会员注册</title>
    <%--设置浏览器左上角的小图标--%>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico">
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="/css/login.css"/>
</head>

<body class="beg-login-bg">
<div class="beg-login-box">
    <header>
        <h1>会员注册</h1>
    </header>
    <div class="beg-login-main">
        <form action="/addUser" class="layui-form" method="post"><input name="__RequestVerificationToken"
                                                                        type="hidden"
                                                                        value="fkfh8D89BFqTdrE2iiSdG_L781RSRtdWOH411poVUWhxzA5MzI8es07g6KPYQh9Log-xf84pIR2RIAEkOokZL3Ee3UKmX0Jc8bW8jOdhqo81">
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i celass="layui-icon">&#xe612;</i>
                </label>
                <input type="text" name="userName" id="userName" maxlength="15" lay-verify="userName" autocomplete="off"
                       placeholder="这里输入用户名"
                       class="layui-input" value="">
            </div>
            <div id="pwdDiv" class="layui-form-item" style="display: flex;flex-direction: row;align-items: center;">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input type="password" name="pwd" id="pwd" lay-verify="pwd" autocomplete="off" placeholder="这里输入密码"
                       class="layui-input" value="">
                <img class="showpwd" src="/images/password4.png" alt="" width="50px;">
            </div>
            <div class="layui-form-item">
                <%--<div class="beg-pull-left beg-login-remember">--%>
                <%--<label>记住帐号？</label>--%>
                <%--<input type="checkbox" name="rememberMe" value="true" lay-skin="switch" checked title="记住帐号">--%>
                <%--</div>--%>
                <div class="beg-pull-left">
                    <button class="layui-btn layui-btn-primary" type="reset">
                        <i class="layui-icon">&#xe650;</i> 重置
                    </button>
                </div>
                <div class="beg-pull-right">
                    <button class="layui-btn layui-btn-primary" lay-submit lay-filter="register">
                        <i class="layui-icon">&#xe650;</i> 注册
                    </button>
                </div>
                <div class="beg-clear"></div>
            </div>
        </form>
    </div>
    <footer>
        <p>已有账号？<a href="/login" style="color: #ffffff;text-decoration: underline ">去登录</a></p>
    </footer>
</div>
<script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/plugins/layui/layui.js"></script>
<script>
    $(function () {
        $("#pwdDiv").width($("#pwdDiv").width() + 50)
        var passwordShow = false
        $(".showpwd").on("click", function () {
            if (passwordShow == true) {
                passwordShow = false
                $("#pwd").attr("type", "password")
                $(this).attr("src", "/images/password4.png")
                $("#pwdDiv").width($("#pwdDiv").width() + 2)
            } else {
                passwordShow = true
                $(this).attr("src", "/images/password.png")
                $("#pwd").attr("type", "text")
                $("#pwdDiv").width($("#pwdDiv").width() - 2)
            }
        })
    })
</script>
<script>
    var reg = /^[0-9a-zA-Z_.@]*$/;
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        form.verify({
            userName: function (value) {
                if (value.length == 0) {
                    return '输入用户名';
                }
                else if (reg.test(value) == false) {
                    return "用户名必须为英文字母、数字、._@组成";
                }
                else if (userNameExists(value) == true) {
                    return '该用户名已存在';
                }
            },
            pwd: function (value) {
                if (value.length < 6 || value.length > 12) {
                    return '密码必须大于6位小于12位';
                } else if (value.indexOf(' ') > -1) {
                    return '密码不能有空格';
                }
            }
//            ,

        });
        form.on('submit(register)', function (data) {
        });
    });
</script>

<script>
    function userNameExists(userName) {
        var exists = false
        $.ajax({
            type: "post",
            url: "/userNameExists",
            dataType: "json",
            async: false,
            data: {userName: userName},
            success: function (data) {
                if (data.result == "false") {
                    exists = false
                } else {
                    exists = true
                }
            }
        })
        return exists
    }
</script>
</body>

</html>
