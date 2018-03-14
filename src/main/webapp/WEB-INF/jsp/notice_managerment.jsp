<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公告管理</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/global.css" media="all">
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/table.css" />
    <style>
        .site-table th, .site-table td{
            border:0;
        }
    </style>
</head>
<body>
    <fieldset class="layui-elem-field layui-field-title" >
        <legend>公告管理</legend>
    </fieldset>
    <div style="display: flex;justify-content: center;">
        <button class="layui-btn layui-btn-radius">新增</button>
        <button class="layui-btn layui-btn-radius">修改</button>
        <button class="layui-btn layui-btn-radius">删除</button>
    </div>

        <div class="layui-field-box">
                <table class="site-table table-hover">
                    <thead>
                    <tr>
                        <th style="width: 30px;"><input type="checkbox" id="selected-all"></th>
                        <th>标题</th>
                        <th>创建时间</th>
                    </tr>
                    </thead>
                    <!--内容容器-->
                    <tbody id="con">
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>Layui</td>
                        <td>2016-11-16 11:50</td>

                    </tr>
                    </tbody>
                </table>
                <!--分页容器-->
                <div id="paged"></div>
        </div>

    <script type="text/javascript" src="/plugins/layui/layui.js"></script>

    <script type="text/html" id="conTemp">
        {{# layui.each(d.list, function(index, item){ }}
        <tr>
            <td><input type="checkbox"></td>
            <td>{{ item.title }}</td>
            <td>{{ item.createTime }}</td>
        </tr>
        {{# }); }}
    </script>
    <script>
        layui.config({
            base: 'js/'
        }).use(['paging', 'code'], function() {
            layui.code();
            var $ = layui.jquery,
                paging = layui.paging();

            paging.init({
                openWait: true,
                url: '/showProclamation', //地址
                elem: '#con', //内容容器
                type:'post',
                params: { //发送到服务端的参数
//                    t: Math.random(),
//                    token:'F8F5AE2137BFAEF77FF7408476AF6C64',
//                    pageIndex: 1
                },
                type:'GET',
                tempElem: '#conTemp', //模块容器
                pageConfig: { //分页参数配置
                    elem: '#paged', //分页容器
                    pageSize: 5, //分页大小
                    pageIndex:1
                },
                success: function() { //渲染成功的回调
                    //alert('渲染成功');
                },
                fail: function(msg) { //获取数据失败的回调
                    //alert('获取数据失败')
                },
                complate: function(res) { //完成的回调
                    //alert('处理完成');
                    console.log(res);
                },
            });

        });
    </script>
</body>
</html>
