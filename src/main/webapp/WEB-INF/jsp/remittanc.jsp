
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>汇款充值</title>

<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">

</head>
<body>

<div style="margin: 15px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>电子银行》》汇款充值</legend>
    </fieldset>

    <form class="layui-form" action="/aaa">

        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">汇款日期</label>
                <div class="layui-input-block" style="width: 630px">
                    <input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
                </div>
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">汇款金额</label>
                <div class="layui-input-inline" style="width: 630px;">
                    <input type="number" name="price_min" lay-verify="price" placeholder="￥" autocomplete="off" class="layui-input">
                   <span>(CNY)</span>
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">摘要</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea" style="width: 50%"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单号</label>
            <div class="layui-input-inline" style="width: 630px; height: 20px;" >
                <input type="text" name="price_min" lay-verify="text"  class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

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
            price: function(value) {
                if(value<=0) {
                    return '汇款金额必须大于0';
                }
            },
            text: function(value) {
                if(value=="" || value==null){
                    return "订单号不能为空"
                }
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data) {
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })
        });
    });
</script>
</body>
</html>
