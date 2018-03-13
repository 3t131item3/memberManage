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

    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/btable.css"/>
    <link rel="stylesheet" href="css/global.css" media="all">
</head>

<body>
<div class="admin-main">
    <form action="/modifyRoot" method="post">
        <blockquote class="layui-elem-quote">
            <h2>权限管理</h2>
            <ul class="layui-nav layui-inline" id="role">

            </ul>
            <input type="hidden" name="roleId" id="roleId" value="1"/>
            <button type="submit" class="layui-btn layui-btn-primary">保存</button>
        </blockquote>
        <div id="count">
            <c:forEach var="manage" items="${manages}">
                <fieldset class='layui-elem-field'>
                    <button type="button" class="layui-btn aaa">
                        <i class="layui-icon"></i>
                            ${manage.mName}
                    </button>
                    <c:forEach var="manageItem" items="${manage.manageItems}">
                        <button type="button" class="layui-btn layui-btn-primary layui-btn-small bbb">
                            <input type="checkbox" name="manageItemsId" value="${manageItem.id}"/>
                                ${manageItem.name}
                        </button>
                    </c:forEach>
                </fieldset>
            </c:forEach>
        </div>
    </form>
</div>
<!--模板-->
<script type="text/javascript" src="/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/plugins/layui/layui.js"></script>
<script>
    $(function () {
        role()
        manageItem(1)
        $(".aaa").on("click", function () {
            var check = $(this).parent().find(":input[type=checkbox]")
            var checklength = check.length
            var checks = 0
            check.each(function () {
                if ($(this).prop("checked") == true) {
                    checks += 1
                }
            })
            if (checks == checklength) {
                check.prop("checked", false)
            } else {
                check.prop("checked", "checked")
            }
        })

        $(".bbb").on("click", function () {
            var bbb = $(this).find(":input[type=checkbox]")
            bbb.click()
        })

        $("#role").on("click", ".xxx", function () {
            $(".layui-nav-item").removeClass("layui-this")
            $(this).parent(".layui-nav-item").addClass("layui-this")
            manageItem($(this).attr("data-id"))
            $("#roleId").val($(this).attr("data-id"))
        })
    })
    layui.config({
        base: 'js/'
    });

    $("form").submit(function(){
        return confirm("确认要修改吗？")
    })
    layui.use(['paging', 'form'], function () {
        var $ = layui.jquery,
            paging = layui.paging(),
            layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
            layer = layui.layer, //获取当前窗口的layer对象
            form = layui.form();
//        $.get("/queryRoots", null, function (form){
//            for (var i = 0; i < form.navs.length; i++) {
//                var options="<fieldset class='layui-elem-field'>"
//                options+="<button class=\"layui-btn\"><i class=\"layui-icon\"></i>"+form.navs[i].title+"</button>"
//                for (var j = 0; j < form.navs[i].children.length; j++) {
//                    options+="<button class=\"layui-btn layui-btn-primary layui-btn-small\"><input type=\"checkbox\"/>"
//                    options+=""+form.navs[i].children[j].title+"</button>";
//                }
//                options+="</fieldset>";
//                $("#count").append(options);
//            }
//
//        })


    });

    function role() {
        var role = $("#role")
        role.append(' <li class="layui-nav-item">' +
            '                <a href="javascript:;">角色列表</a>' +
            '                </li>')
        $.ajax({
            url: "/role/queryrole",
            data: {},
            dataType: "json",
            type: "post",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    if (i == 0) {
                        role.append(' <li class="layui-nav-item layui-this">' +
                            '                <a href="javascript:;" class="xxx"  data-id="' + data[i].id + '">' + data[i].roleName + '</a>' +
                            '                </li>')
                    } else {
                        role.append(' <li class="layui-nav-item" >' +
                            '                <a href="javascript:;" class="xxx" data-id="' + data[i].id + '">' + data[i].roleName + '</a>' +
                            '                </li>')
                    }
                }
            }
        })
    }

    function manageItem(roleId) {
        $.ajax({
            url: "/roots",
            data: {roleId: roleId},
            type: "post",
            dataType: "json",
            success: function (data) {
                var check = $(":input[type=checkbox]")
                check.prop("checked", false)
                for (var i = 0; i < data.length; i++) {
                    check.each(function () {
                        if (data[i].manageItemId == $(this).val()) {
                            $(this).prop("checked", true)
                        }
                    })
                }
            }
        })
    }
</script>
</body>

</html>