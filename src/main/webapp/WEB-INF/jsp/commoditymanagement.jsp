
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商品管理</title>
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
        <a href="javascript:;" class="layui-btn layui-btn-small" id="add">
            <i class="layui-icon">&#xe608;</i> 添加信息
        </a>
        <form class="layui-form" style="float:right;">
            <div class="layui-form-item" style="margin:0;">
                <label class="layui-form-label">名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" placeholder="支持模糊查询.." autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <button lay-filter="search" class="layui-btn" lay-submit><i class="fa fa-search" aria-hidden="true"></i> 查询</button>
                </div>
            </div>
        </form>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>商品列表</legend>
        <div class="layui-field-box layui-form">
            <table class="layui-table admin-table">
                <thead>
                <tr>
                    <%--<th style="width: 30px;display: none"><input type="checkbox" lay-filter="allselector" lay-skin="primary"></th>--%>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>市场价￥</th>
                    <th>优惠价￥</th>
                    <th>库存</th>
                    <th>状态(上架/下架)</th>
                    <th>最后修改时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="content">
                </tbody>
            </table>
        </div>
    </fieldset>
    <div class="admin-table-page">
        <div id="paged" class="page">
        </div>
    </div>
</div>
<!--模板-->
<script type="text/html" id="tpl">
    {{# layui.each(d.list, function(index, item){ }}
    <tr>
        <%--<td><input type="checkbox" lay-skin="primary"></td>--%>
        <input type="hidden" value={{d.totalCount}} class="count"/>
        <td>{{ item.id }}</td>
        <td>{{ item.name }}</td>
        <td>{{ item.price }}</td>
        <td>{{ item.discountPrice }}</td>
        <td>{{ item.stock }}</td>
        <td><input type="checkbox" {{# if (item.state!=0) { }}
                   checked="checked" {{# } }} name="open" lay-skin="switch" lay-filter="switchTest" lay-text="上架|下架" ></td>
        <td>{{item.modifyTime}}</td>
        <td>
            <a href="javascript:;"  data-name="{{ item.id}}" data-opt="show" class="layui-btn layui-btn-normal layui-btn-mini">预览</a>
            <a href="javascript:;" data-name="{{ item.name }}" data-opt="edit" class="layui-btn layui-btn-mini">编辑</a>
            <a href="javascript:;" data-name="{{ item.id}}" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
        </td>
    </tr>
    {{# }); }}
</script>
<script type="text/javascript" src="plugins/layui/layui.js"></script>
<script>
    layui.config({
        base: 'js/'
    });

    layui.use(['paging', 'form'], function() {
        var $ = layui.jquery,
            paging = layui.paging(),
            layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
            layer = layui.layer, //获取当前窗口的layer对象
            form = layui.form();

        paging.init({
            openWait: true,
            url: '/jsp/commodity/list?v=' + new Date().getTime(), //地址
            elem: '#content', //内容容器
            params: { //发送到服务端的参数
            },
            type: 'GET',
            tempElem: '#tpl', //模块容器
            pageConfig: { //分页参数配置
                elem: '#paged', //分页容器
                pageSize:1,//分页大小
                pageIndex:1,
                count:$(".count").val()
            },

            success: function() { //渲染成功的回调
//                alert($(".count").val())
                //alert('渲染成功');
            },
            fail: function(msg) { //获取数据失败的回调
                //alert('获取数据失败')
            },
            complate: function() { //完成的回调
                //alert('处理完成');
                //重新渲染复选框
//                form.render('checkbox');
//                form.on('checkbox(allselector)', function(data) {
//                    var elem = data.elem;
//
//                    $('#content').children('tr').each(function() {
//                        var $that = $(this);
//                        //全选或反选
//                        $that.children('td').eq(0).children('input[type=checkbox]')[0].checked = elem.checked;
//                        form.render('checkbox');
//                    });
//                });

                //列里按钮
                $('#content').children('tr').each(function() {
                    var $that = $(this);
                    //绑定所有编辑按钮事件
                    $that.children('td:last-child').children('a[data-opt=edit]').on('click', function() {
                        layer.msg($(this).data('name'));
                    });
                    //绑定所有预览按钮事件;
                    $that.children('td:last-child').children('a[data-opt=show]').on('click', function() {
                        var id=$(this).data('name');
                        location.href="/jsp/commodity/getId/"+id
                    });
                    //绑定所有删除按钮事件
                    $that.children('td:last-child').children('a[data-opt=del]').on('click',function () {
                        var id=$(this).data('name');
                        layer.open({
                            title: '商品删除'
                            ,content: '你确定要删除此商品？',
                            yes: function (index) {
                                delcomm(id)
                            }
                        });

                    })
                });
            },
        });
        //获取所有选择的列
        $('#getSelected').on('click', function() {
            var names = '';
            $('#content').children('tr').each(function() {
                var $that = $(this);
                var $cbx = $that.children('td').eq(0).children('input[type=checkbox]')[0].checked;
                if($cbx) {
                    var n = $that.children('td:last-child').children('a[data-opt=edit]').data('name');
                    names += n + ',';
                }
            });
            layer.msg('你选择的名称有：' + names);
        });

        $('#search').on('click', function() {
            parent.layer.alert('你点击了搜索按钮')
        });

        var addBoxIndex = -1;
        $('#add').on('click', function() {
            if(addBoxIndex !== -1)
                return;
            //本表单通过ajax加载 --以模板的形式，当然你也可以直接写在页面上读取
            $.get('/addcommodity', null, function(form) {
                addBoxIndex = layer.open({
                    type: 2,
                    title: '添加表单',
                    content: "/addcommodity",
//                    btn: ['保存', '取消'],
                    shade: false,
                    offset: ['100px', '30%'],
                    area: ['600px', '400px'],
                    zIndex: 19950924,
                    maxmin: true,
                    yes: function(index) {
                        //触发表单的提交事件
                        $('form.layui-form').find('button[lay-filter=edit]').click();
                    },
                    full: function(elem) {
                        var win = window.top === window.self ? window : parent.window;
                        $(win).on('resize', function() {
                            var $this = $(this);
                            elem.width($this.width()).height($this.height()).css({
                                top: 0,
                                left: 0
                            });
                            elem.children('div.layui-layer-content').height($this.height() - 95);
                        });
                    },
                    success: function(layero, index) {
                        //弹出窗口成功后渲染表单
                        var form = layui.form();
                        form.render();
                        form.on('submit(edit)', function(data) {
                            console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                            console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                            //调用父窗口的layer对象
                            layerTips.open({
                                title: '这里面是表单的信息',
                                type: 1,
                                content: JSON.stringify(data.field),
                                area: ['500px', '300px'],
                                btn: ['关闭并刷新', '关闭'],
                                yes: function(index, layero) {
                                    layerTips.msg('你点击了关闭并刷新');
                                    layerTips.close(index);
                                    location.reload(); //刷新
                                }

                            });
                            //这里可以写ajax方法提交表单
                            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                        });
                        //console.log(layero, index);
                    },
                    end: function() {
                        addBoxIndex = -1;
                    }
                });
            });
        });

        $('#import').on('click', function() {
            var that = this;
            var index = layer.tips('只想提示地精准些', that, { tips: [1, 'white'] });
            $('#layui-layer' + index).children('div.layui-layer-content').css('color', '#000000');
        });

        //商品删除按钮查询外键表
        function  delcomm(id) {
            $.get("/jsp/commodity/delete/"+id, null, function (form){
                var  msg=null;
                if(form.msg=="noNull"){
                    msg='商品套餐表包含此商品，请先删除此商品套餐!'
                }else  if(form.msg=="true"){
                    msg='删除成功！'
                }else if(form.msg=="fales"){
                    msg='删除失败！'
                }
                alert(msg)
                location.reload();
            })
        }
    });
</script>
</body>

</html>