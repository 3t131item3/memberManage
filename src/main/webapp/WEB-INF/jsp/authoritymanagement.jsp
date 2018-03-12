
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>btable</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/btable.css" />
    <link rel="stylesheet" href="css/global.css" media="all">
</head>

<body>
<div class="admin-main">
    <blockquote class="layui-elem-quote">
        <h2>权限管理</h2>
        <ul class="layui-nav layui-inline">
            <li class="layui-nav-item">
                <a href="">角色列表</a>
            </li>
            <li class="layui-nav-item layui-this xxx">
                <a href="javascript:;">会员</a>
            </li>
            <li class="layui-nav-item xxx">
                <a href="javascript:;">系统管理员</a>
            </li>
        </ul>

        <button class="layui-btn layui-btn-primary" >保存</button>
    </blockquote>
    <div id="count">

    </div>
</div>
<!--模板-->
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="plugins/layui/layui.js"></script>
<script>
    layui.config({
        base: 'js/'
    });

    layui.use(['paging', 'form'], function () {
        var $ = layui.jquery,
            paging = layui.paging(),
            layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
            layer = layui.layer, //获取当前窗口的layer对象
            form = layui.form();
        $.get("/queryRoots", null, function (form){
            for (var i = 0; i < form.navs.length; i++) {
                var options="<fieldset class='layui-elem-field'>"
                options+="<button class=\"layui-btn\"><i class=\"layui-icon\"></i>"+form.navs[i].title+"</button>"
                for (var j = 0; j < form.navs[i].children.length; j++) {
                    options+="<button class=\"layui-btn layui-btn-primary layui-btn-small\"><input type=\"checkbox\"/>"
                    options+=""+form.navs[i].children[j].title+"</button>";
                }
                options+="</fieldset>";
                $("#count").append(options);
            }

        })


    });

</script>
</body>

</html>