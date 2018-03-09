
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>权限管理</title>
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
    <fieldset class="layui-elem-field">
        <button class="layui-btn"><i class="layui-icon"></i>系统管理</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>用户管理</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>角色管理</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>权限管理</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>商品管理</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>商品套餐管理</button>
    </fieldset>
    <fieldset class="layui-elem-field">
        <button class="layui-btn"><i class="layui-icon"></i>会员管理</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>注册新会员</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>修改本人资料</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>会员列表</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>修改本人密码</button>
    </fieldset>
    <fieldset class="layui-elem-field">
        <button class="layui-btn"><i class="layui-icon"></i>电子银行</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>汇款充值</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>基本账户</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>消费账户</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>内部转账</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>申请提现</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>提现明细</button>
    </fieldset>
    <fieldset class="layui-elem-field">
        <button class="layui-btn"><i class="layui-icon"></i>购物管理</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>购货列表</button>
        <button class="layui-btn layui-btn-primary layui-btn-small"><input type="checkbox"/>货单查询</button>
    </fieldset>
    <fieldset class="layui-elem-field">
        <button class="layui-btn"><i class="layui-icon"></i>信息查询</button>
    </fieldset>
    <fieldset class="layui-elem-field">
        <button class="layui-btn"><i class="layui-icon"></i>资讯管理</button>
    </fieldset>

</div>
<script type="text/html" id="tpl">
    {{# layui.each(d.list, function(index, item){ }}


    {{# }); }}
</script>
<script src="/js/jquery-1.12.4.js"></script>
<script>
//    $(".xxx").on("click",function () {
//        $(".xxx").removeClass("layui-this")
//        $(this).addClass("layui-this")
//    })
//    $(".xxx").on("hover",function () {
//        $(this).addClass("layui-this")
//    })

layui.use(['paging', 'form'], function () {
    var $ = layui.jquery,
        paging = layui.paging(),
        layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
        layer = layui.layer, //获取当前窗口的layer对象
        form = layui.form();
//                alert($("input[name='names']"))
//            alert(document.getElementById("sss").value);

    paging.init({
        openWait: true,
        url: '/root/list?v=' + new Date().getTime(), //地址
//            url: 'datas/laytpl_laypage_data.json?v=' + new Date().getTime(), //地址
        elem: '#content', //内容容器
        params: { //发送到服务端的参数
//                    name:names
        },
        success: function () { //渲染成功的回调
//                alert('渲染成功');
        },
        fail: function (msg) { //获取数据失败的回调
            //alert('获取数据失败')
        },
        complate: function () { //完成的回调
            //alert('处理完成');
            //重新渲染复选框
            form.render('checkbox');
            form.on('checkbox(allselector)', function (data) {
                var elem = data.elem;

                $('#content').children('tr').each(function () {
                    var $that = $(this);
                    //全选或反选
                    $that.children('td').eq(0).children('input[type=checkbox]')[0].checked = elem.checked;
                    form.render('checkbox');
                });
            });

            //绑定所有编辑按钮事件
            $('#content').children('tr').each(function () {
                var $that = $(this);
                $that.children('td:last-child').children('a[data-opt=edit]').on('click', function () {
//                            layer.msg($(this).data('name'));
                    var id=$(this).data('name')
                    $.get('/role/updateRole/'+id, null, function (form) {
                        alert(form)
                        addBoxIndex = layer.open({
                            type:2,
                            title: '修改表单',
//                                    content:form,
                            content: "/role/updateRole/"+id,
                            btn: ['保存', '取消'],
                            shade: false,
                            offset: ['100px', '30%'],
                            area: ['600px', '400px'],
                            zIndex: 19950924,
                            maxmin: true,
                            shadeClose:true,
                            anim:1,
                            yes: function (index) {
                                //触发表单的提交事件
//                                        $('form.layui-form').find('button[lay-filter=demo1]').click();
                                alert( $($('form.layui-form').find('input[name=title]')).val())
                                $('#demo1').click();

                            },
                            full: function (elem) {
                                var win = window.top === window.self ? window : parent.window;
                                $(win).on('resize', function () {
                                    var $this = $(this);
                                    elem.width($this.width()).height($this.height()).css({
                                        top: 0,
                                        left: 0
                                    });
                                    elem.children('div.layui-layer-content').height($this.height() - 95);
                                });
                            },

                            success: function (layero, index) {
                                //弹出窗口成功后渲染表单
                                var form = layui.form();
                                form.render();

                                console.log(layero, index);
                            },
                            end: function () {
                                addBoxIndex = -1;
                            }
                        });
                    });
                });
                $that.children('td:last-child').children('a[data-opt=del]').on('click',function () {
                    var id=$(this).data('name');
                    layer.open({
                        title: '角色删除'
                        ,content: '你确定要删除',
                        yes: function (index) {
//                                    alert(id)
                            sss(id)
                        }
                    });

                })
            });

        },
    });
</script>
</body>

</html>