<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta charset="utf-8">
    <title>增加用户信息表单</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
</head>

<body>
<div style="margin: 15px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>增加新用户</legend>
    </fieldset>

    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名<span style="color: red">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="title"  lay-verify="title" width="100px" autocomplete="off" placeholder="请输入登录账号" class="layui-input" value="${users.name}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录密码<span style="color: red">*</span></label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">真实姓名<span style="color: red">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="username" width="100px" lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--<div class="layui-form-item">--%>
            <%--<label class="layui-form-label">性别</label>--%>
            <%--<div class="layui-input-block">--%>
                <%--<input type="radio" name="sex" value="男" title="男" checked="">--%>
                <%--<input type="radio" name="sex" value="女" title="女">--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号<span style="color: red">*</span></label>
            <div class="layui-input-inline">
                <input type="tel" name="phone" lay-verify="phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="email" lay-verify="email" id="dd" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">出生日期</label>
                <div class="layui-input-block">
                    <input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身份证<span style="color: red">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--<div class="layui-form-item">--%>
            <%--<div class="layui-input-block">--%>
                <%--<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>--%>
                <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
            <%--</div>--%>
        <%--</div>--%>
        <button lay-filter="edits" lay-submit  style="display: none;"lay-filter="demo1">sss</button>
    </form>
</div>
<script type="text/javascript" src="/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="plugins/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            title: function(value) {
                if(value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            content: function(value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });
</script>
</body>

</html>