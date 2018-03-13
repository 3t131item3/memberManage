<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/global.css" media="all">
</head>

<head>
    <meta charset="utf-8">
    <title>商品详情</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/global.css" media="all">
</head>

<body>

<fieldset class="layui-elem-field">
    <legend><em>商品详情</em></legend>
    <div class="layui-field-box">
        <fieldset class="layui-elem-field layui-field-title">
            <div class="layui-field-box">
                <p><span>商品编号</span><span>：</span><span style="color: blue">${commodity.commodityNo}</span></p>
                <p><span>商品名称</span><span>：</span><span style="color: blue">${commodity.name}</span></p>
                <p><span>市场价</span><span>：</span><span style="color: red">${commodity.price}</span>￥</p>
                <p><span>优惠价</span><span>：</span><span style="color: red">${commodity.discountPrice}</span>￥</p>
                <p><span>库存</span><span>：</span><span>${commodity.stock}</span></p>
                <p><span>状态</span><span>：</span><span>${commodity.state}</span></p>
                <p><span>商品规格</span><span>：</span><span>${commodity.spec}</span></p>
                <p><span>商品说明</span><span>：</span><span>${commodity.illustrate}</span></p>
            </div>
                    <button class="layui-btn" id="demo1">返回</button>


        </fieldset>
    </div>
</fieldset>
<script type="text/javascript" src="/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="plugins/layui/layui.js"></script>
</body>
<script>
    $("#demo1").on('click',function (){
        location.href="/commoditymanagement";
    });
</script>
</html>