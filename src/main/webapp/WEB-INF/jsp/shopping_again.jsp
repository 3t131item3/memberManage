
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>重新购物</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/begtable.css" />
</head>
<style>
    /*.a,.s{*/
    /**/
    /*}*/
    .layui-input-block{
        display: flex;
        flex-direction: row;
    }
    .layui-btn-radius{
        margin-left: 10px;
    }
    .but{
        display: flex;
        flex-direction: row-reverse;
        position: absolute;
        right: 620px;
        top: 650px;
    }

</style>
<body>
<fieldset class="layui-elem-field layui-field-title" >
    <legend>结算</legend>
</fieldset>
<form class="layui-form" action="">
<div class="layui-form-item">
    <div class="layui-inline a" style="display:flex; flex-direction: row; ">
        <div class="layui-form-item">
            <label class="layui-form-label">编号</label>
            <div class="layui-input-block" >
                <input type="text" name="commodityNo" id="price_min" lay-verify="text" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">套餐标题</label>
            <div class="layui-input-block">
                <input type="text" name="name" id="tx" lay-verify="text"  placeholder="请输入标题" class="layui-input">
            </div>
        </div>
        <button class="layui-btn layui-btn-radius"lay-submit="" lay-filter="demo1s">查询</button>
    </div>
</div>
</form>
<fieldset class="layui-elem-field">
    <legend>数据列表</legend>
    <div class="layui-field-box layui-form">
        <table class="layui-table admin-table">
            <thead>
            <tr>
                <th style="width: 30px;"><input type="checkbox" lay-filter="allselector" lay-skin="primary"></th>
                <th>编号</th>
                <th>角色</th>
                <th>零售价（元）</th>
                <th>优惠价（元）</th>
                <th>说明</th>
                <th>数量</th>
            </tr>
            </thead>
            <tbody id="content">
            </tbody>
        </table>
        <div class="beg-table-paged"></div>
    </div>
</fieldset>





<div class="but">

    <button class="layui-btn layui-btn-radius" lay-submit="" lay-filter="demo1">去结算</button>
    <button class="layui-btn layui-btn-radius fa fa-shopping-cart" aria-hidden="true">加入购物车</button>
</div>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
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
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            content: function(value) {
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data) {
            var names = new Array();
            var is=0;
            var mycars=new Array()
            $('#content').children('tr').each(function () {
                var $that = $(this);
                var $cbx = $that.children('td').eq(0).children('input[type=checkbox]')[0].checked;

                if($cbx) {
                    var n = $that.children('td:last-child').children('input[name=id]').val()
                    var ns = $that.children('td:last-child').children('input[name=count]').val()
                    mycars[is]=n;
                    names[is]=ns
                    is++;
                }

            });
            if(names.length>0&&mycars.length>0){
                location='/commoditySetMeal/Clearing/'+mycars+'/'+names;
            }else {
                layer.msg('请选择商品套餐');
            }
        });

        $(".ssss").keyup(function(ent){
            var count=$(this);
            var id=count.next().val();
            var count2=count.val();
            $.get('/jsp/commodity/iscount/'+id+'/'+count2,null,function(ftom){
                if(ftom!="" && ftom!=null){
                    layer.msg(ftom);
                    count.val("1");
                }




            });
        })

    });
</script>
<script >
    var commodityNo;
    var name;
    $(function () {
        ajaxQuery(1,commodityNo,name);

    });
    layui.config({
        base: 'js/'
    });
    function flushPage(page,groups) {
        layui.use('begtable', function () {
            var begtable = layui.begtable(),
                layer = layui.layer,
                $ = layui.jquery,
                laypage = layui.laypage,
                form = layui.form();

            form.on('submit(demo1s)', function(data) {
                 commodityNo=data.field.commodityNo;
                 name=data.field.name;
                ajaxQuery(1,commodityNo,name);
                return false;
            })
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
            laypage({
                cont: $('.beg-table-paged'),
                pages: groups //总页数
                ,curr:page,
                groups: 3//连续显示分页数
                ,
                jump: function (obj,first) {
                    //得到了当前页，用于向服务端请求对应数据
                    var curr = obj.curr;
                    if (!first) {
                        layer.msg('第 '+ obj.curr +' 页');
                        ajaxQuery(curr,null,null);
                    }
                }
            });

            begtable.set({
                bordered: true,
                hovered: true,
                striped: true,
                checked: true,
//                paged:false,
            }).init();
            console.log(begtable.getSelectedRows());
            console.log(location);
        });
    };

    function ajaxQuery(page,commodityNo,name) {
        $.ajax({
            url: "/jsp/commodity/list",
            data: {pageIndex:page,price_min:commodityNo,tx:name},
            async: false,  //同步执行
            type: "post",
            dataType: "json",
            success: function (data) {
                counts = data.count;
                $("#content").html("");
                var datew="";
                for (var i = 0; i < data.list.length; i++) {
                    datew+="<tr>"
                    datew+="<td style='width: 30px;'><input type='checkbox' lay-skin='primary' /></td>"
                    datew+="<td>"+data.list[i].commodityNo+"</td>"
                    datew+="<td>"+data.list[i].name+"</td>"
                    datew+="<td>"+data.list[i].price+"</td>"
                    datew+="<td>"+data.list[i].discountPrice+"</td>"
                    datew+="<td>"+data.list[i].illustrate+"</td>"
                    datew+="<td><input type='text' value='1' id='count' class='ssss' name='count'><input type='hidden' name='id' value='"+data.list[i].id+"'/>"
                    datew+="</td>"
                    datew+="</td>"
                    datew+="</tr>"

                }
                $("#content").append(datew);

                datas = data.list;
                flushPage(data.pagerNo,counts);
            }
        });
    }
</script>
</body>
</html>
