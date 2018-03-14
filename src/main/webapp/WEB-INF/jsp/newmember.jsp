<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta charset="utf-8">
    <title>注册新会员</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
</head>

<body>
<div style="margin: 15px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>注册新会员</legend>
    </fieldset>

    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名<span style="color: red">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="用户名必须大于六位"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录密码<span style="color: red">*</span></label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">真实姓名<span style="color: red">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="username" width="50px" lay-verify="required" placeholder="请输入真实姓名"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">手机号<span style="color: red">*</span></label>
            <div class="layui-input-inline">
                <input type="tel" name="phone" lay-verify="phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱<span style="color: red">*</span></label>
            <div class="layui-input-inline">
                <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮政编码</label>
            <div class="layui-input-block">
                <input type="text" name="username" width="50px" lay-verify="required" placeholder="请输入邮政编码"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">出生日期</label>
                <div class="layui-input-block">
                    <input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-mm-dd"
                           autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">银行卡号<span style="color: red">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="username" width="50px" lay-verify="required" placeholder="请输入银行卡卡号"
                       autocomplete="off" class="layui-input">

            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">收货地址</label>
            <div class="layui-input-block">
                <input type="text" name="username" width="50px" lay-verify="required" placeholder="xx省xx市（县）xxx"
                       autocomplete="off" class="layui-input">

            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">身份证<span style="color: red">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">上传身份证正面照片<span style="color: red">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="username" width="50px" lay-verify="required" placeholder="身份证图片路径"
                       autocomplete="off" class="layui-input">
            </div>
            <button class="layui-btn"><i class="layui-icon"></i> 上传照片</button>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">上传身份证反面照片<span style="color: red">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="username" width="50px" lay-verify="required" placeholder="身份证图片路径"
                       autocomplete="off" class="layui-input">
            </div>
            <button class="layui-btn"><i class="layui-icon"></i> 上传照片</button>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
        <button lay-filter="edits" lay-submit style="display: none;">嘻嘻嘻</button>
    </form>
</div>
<script type="text/javascript" src="/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="plugins/layui/layui.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

//创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
//自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '用户名至少得5个字符';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            content: function (value) {
                layedit.sync(editIndex);
            }
        });

//监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });
</script>
</body>
</html>