 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta charset="utf-8">
    <title>增加商品信息表</title>
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
    <%--<legend>增加商品信息表</legend>--%>
    <%--</fieldset>--%>

    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">商品编号<span style="color: red">*</span></label>
            <div class="layui-input-inline">
                <%--<input type="text" name="no" lay-verify="title"  autocomplete="off" class="layui-input" >--%>
                <input type="text" name="no" width="100px" lay-verify="required" placeholder="商品编号:B SB BB QB WB..." autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品名称<span style="color: red">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="name" width="100px" lay-verify="required" placeholder="请输入商品名称" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">市场价格<span style="color: red">*</span></label>
                <div class="layui-input-block" style="width: 630px;">
                    <input type="number" name="price" lay-verify="price" placeholder="￥" autocomplete="off" class="layui-input">
                    <div class="layui-form-mid layui-word-aux">(CNY)</div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">优惠价格<span style="color: red">*</span></label>
                <div class="layui-input-block" style="width: 630px;">
                    <input type="number" name="price_min" lay-verify="price" placeholder="￥" autocomplete="off" class="layui-input">
                    <div class="layui-form-mid layui-word-aux">(CNY)</div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">库存</label>
            <div class="layui-input-block">
                <input type="number" name="stock" lay-verify="price" placeholder="" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">规格</label>
            <div class="layui-input-block">
                <input type="text" name="unit" lay-verify="title" placeholder="计量单位" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品状态</label>
            <div class="layui-input-block">
                <input type="radio" name="stats" value="1" title="上架" checked="">
                <input type="radio" name="stats" value="0" title="下架">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">商品说明</label>
            <div class="layui-input-block">
                <textarea name="illustrate" placeholder="请输入产品成分，功效，保质期..." class="layui-textarea"></textarea>
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
//        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
//        form.verify({
//            title: function(value) {
//                if(value.length < 5) {
//                    return '商品名称至少得5个字符啊';
//                }
//            }
//        });

        //监听提交
        form.on('submit(demo1)', function(data) {
            var mycars=new Array()
            mycars[0]=data.field.no
            mycars[1]=data.field.name
            mycars[2]=data.field.price
            mycars[3]=data.field.price_min
            mycars[4]=data.field.stock
            mycars[5]=data.field.unit
            mycars[6]=data.field.stats
            mycars[7]=data.field.illustrate
            $.get("/commodity/add/"+mycars, null, function (form){
                alert(form.msg)
                if(form.msg=="成功"){
                    time:5000
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.layer.close(index);
                    location="/commodity/list"
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