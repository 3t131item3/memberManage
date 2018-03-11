<%@ page import="com.accp.entity.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>内部转账</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>电子银行》内部转账</legend>
</fieldset>
<input type="hidden" id="user_name" value="${user.userName}"/>
<form class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">当前余额</label>
        <div class="layui-input-block" style="width: 630px;display:flex;align-items: center">
            <span id="user_remainder">${user.remainder}(元)</span>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">转账目标</label>
        <div class="layui-input-inline" style="width: 480px;">
            <input type="text" name="userName" id="userName" lay-verify="userName" autocomplete="off"
                   placeholder="请输入会员" class="layui-input">
        </div>
        <div class="layui-input-inline" id="noexistsUser" style="display: none;">
            <span class="userNameMessage" style="color: red;">该用户不存在</span>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">转账金额</label>
            <div class="layui-input-inline" style="width: 480px">
                <input type="number" id="remainder" name="remainder" lay-verify="price" lay-verify="number"
                       autocomplete="off"
                       class="layui-input" placeholder="请输入转账金额">
            </div>
            <div class="layui-input-inline noremainder" style="display: none;">
                <a href="/remittanc" class="layui-form-mid layui-word-aux" style="color:red;text-decoration: underline">余额不足，马上去汇款充值</a>
            </div>

        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">二级密码</label>
        <input type="hidden" value="${user.pwd2}" id="password"/>
        <div class="layui-input-inline" style="width: 480px">
            <input type="password" name="pwd2" id="pwd2" lay-verify="pass" placeholder="请输入密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux pwd2">请填写6到12位密码</div>
    </div>
    <button class="layui-btn layui-btn-radius" style="margin-left: 50px" lay-submit="" lay-filter="demo1">立即提交</button>

</form>

<script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="plugins/layui/layui.js"></script>

<script>
    var userNameexists
    $(function () {
        userNameexists = 'false';
        $("#userName").on("blur", function () {
            userNameSuccess()
        })
        $("#remainder").on("blur", function () {
            remainder()
        })
        $("#pwd2").on("blur", function () {
            pwd2()
        })
    })
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            userName: function (value) {
                if (value == "" || value == null) {
                    return '请填写转账目标';
                }
            },
            price: function (value) {
                if (value == "" || value == null) {
                    return "金额不能为空"
                } else if (value < 0) {
                    return "转账金额必须大于0"
                }
            }
            ,
            pass: function (value) {
                if (value == "" || value == null) {
                    return "密码不能为空"
                } else if (value.length > 12 && value.length < 6) {
                    return "请填写6到12位密码"
                }
            }
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })
            if (userNameSuccess() && remainder() && pwd2()) {
//                              弹框层
                layer.confirm('<form class="layui-form" id="zhuanzhang" action="/Users/zhuanzhang" method="post">' +
                    '   <div class="layui-form-item">' +
                    '        <label class="layui-form-label">转账目标</label>' +
                    '        <div class="layui-input-inline" style="width: 480px;">' +
                    '            <input type="text" name="userName" style="border: 0;" autocomplete="off" class="layui-input" value="'+$("#userName").val()+'" readonly>' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="layui-form-item">' +
                    '        <div class="layui-inline">' +
                    '            <label class="layui-form-label">转账金额</label>' +
                    '            <div class="layui-input-inline" style="width: 480px">' +
                    '                <input type="text" name="remainder"' +
                    '                       autocomplete="off"' +
                    '                       class="layui-input" style="border: 0;" value="'+$("#remainder").val()+'" readonly>' +
                    '            </div>' +
                    '        </div>' +
                    '    </div></form>', {title:'确定要转账吗',area:['700px','300px']},
                    function () {
                        $("#zhuanzhang").submit()
                    }, function () {
                    layer.msg({
                        time: 2000
                    });
                });
            }
            return false
        });
    });
</script>
<script>
    <%--验证用户名--%>

    function userNameSuccess() {
        if ($("#userName").val() != null && $("#userName").val() != '') {
            if ($("#user_name").val() == $("#userName").val()) {
                $(".userNameMessage").text("不能为自己转账")
                $("#noexistsUser").css("display", "block")
                return false;
            }
            queryUserName()
            if (userNameexists == 'false') {
                $("#noexistsUser").css("display", "block")
                $(".userNameMessage").text("该用户不存在")
                return false
            } else {
                $("#noexistsUser").css("display", "none")
                return true
            }
        }
    }

    function pwd2() {
        if ($("#pwd2").val() != null && $("#pwd2").val() != '') {
            if ($("#pwd2").val() == $("#password").val()) {
                $(".pwd2").text("请填写6到12位密码")
                $(".pwd2").css("color", "#000")
                return true;
            } else {
                $(".pwd2").text("二级密码有误")
                $(".pwd2").css("color", "red")
                return false
            }
        }
    }

    // 判断钱是否够
    function remainder() {
        if ($("#remainder").val() != null && $("#remainder").val() != '') {
            if (parseFloat($("#user_remainder").text()) < parseFloat($("#remainder").val())) {
                $(".noremainder").css("display", "block")
                return false
            } else {
                $(".noremainder").css("display", "none")
                return true
            }
        }
    }

    <%--查询用户是否存在--%>

    function queryUserName() {
        $.ajax({
            async: false,//同步
            url: "/Users/existsUser",
            data: {userName: $("#userName").val()},
            type: "post",
            dataType: "json",
            success: function (data) {
                userNameexists = data.result;
            }
        })
    }
</script>
</body>
</html>
