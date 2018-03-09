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
    <%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">--%>
        <%--<legend>增加新用户</legend>--%>
    <%--</fieldset>--%>

    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">角色编号<span style="color: red">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="no"  lay-verify="title" width="100px" autocomplete="off" class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色名称<span style="color: red">*</span></label>
            <div class="layui-input-inline">
                <input type="text" name="roleName" lay-verify="title"  autocomplete="off" class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色状态</label>
            <div class="layui-input-block">
                <input type="radio" name="stats" value="1" title="启用" checked="">
                <input type="radio" name="stats" value="0" title="禁用">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">

        <button class="layui-btn" lay-submit="" lay-filter="demo1" >立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>

        <%--//style="display: none;"--%>
        <%--<button lay-filter="dusss" lay-submit style="display: none;" id="ssss"></button>--%>
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
//            pass: [/(.+){6,12}$/, '密码必须6到12位'],
             pass: [null, '不能为空'],
            content: function(value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data) {
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })
            var mycars=new Array()
            mycars[0]=data.field.no
            mycars[1]=data.field.roleName
            mycars[2]=data.field.stats
            $.get("/role/add/"+mycars, null, function (form){
                alert(form.msg)
                if(form.msg=="成功"){
                    time:5000
                   var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index);
                    location="/role/list"
                }else {
                    alert(form.msg)
                }

            })
            return false;
        });
    });
</script>
</body>

</html>