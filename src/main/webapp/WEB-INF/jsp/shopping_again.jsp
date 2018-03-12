
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
    <legend>购物管理》重新购物</legend>
</fieldset>
<div class="layui-form-item">
    <div class="layui-inline a" style="display:flex; flex-direction: row; ">
        <div class="layui-form-item">
            <label class="layui-form-label">编号</label>
            <div class="layui-input-block" >
                <input type="text" name="price_min" lay-verify="text" class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">套餐标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>

        <button class="layui-btn layui-btn-radius">查询</button>
    </div>
</div>

<fieldset class="layui-elem-field">
    <legend>数据列表</legend>
    <div class="layui-field-box layui-form">
        <table class="layui-table admin-table">
            <thead>
            <tr>
                <%--<th style="width: 30px;"><input type="checkbox" lay-filter="allselector" lay-skin="primary"></th>--%>
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
    <button class="layui-btn layui-btn-radius"> <a href="">去结算</a></button>
    <button class="layui-btn layui-btn-radius fa fa-shopping-cart" aria-hidden="true"> <a href="shopping_cart ">加入购物车</a></button>
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
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })

        });
    });
</script>
<script >
    layui.config({
        base: 'js/'
    });
    flushPage(1);
    function flushPage(page) {
        layui.use('begtable', function () {
            var begtable = layui.begtable(),
                layer = layui.layer,
                $ = layui.jquery,
                laypage = layui.laypage;
            var datas = ""
            var count=3;
            var groups=2
            $.ajax({
                url: "/commoditySetMeal/list",
                data: {pageIndex:page},
                async: false,  //同步执行
                type: "post",
                dataType: "json",
                success: function (data) {
                    count = data.count;
                    $("#content").html("");
                    for (var i = 0; i < data.list.length; i++) {

                        var datew="";
                        datew+="<tr>"
                        datew+="<td>"+data.list[i].no+"</td>"
                        datew+="<td>"+data.list[i].name+"</td>"
                        datew+="<td>"+data.list[i].price+"</td>"
                        datew+="<td>"+data.list[i].discountPrice+"</td>"
                        datew+="<td>"+data.list[i].illustrate+"</td>"
                        datew+="<td><input type='text' value='1' id='count'></td>"
                        datew+="</tr>"
                        $("#content").append(datew);
                    }

                    groups=data.pageSize;
                    datas = data.list;
                }
            })

            laypage({
                cont: $('.beg-table-paged'),
                pages: count //总页数
                ,curr:page,
                groups: groups//连续显示分页数
                ,
                jump: function (obj,first) {
                    //得到了当前页，用于向服务端请求对应数据
                    var curr = obj.curr;
                    if (!first) {
                        layer.msg('第 '+ obj.curr +' 页');
                        flushPage(curr)
                    }
                }
            });

//            var columns = [{
//                title: '编号',
//                field: 'no'
//            }, {
//                title: '套餐标题',
//                field: 'name'
//            }, {
//                title: '零售价（元）',
//                field: 'price'
//            },
//                {
//                    title: '优惠价（元）',
//                    field: 'discountPrice'
//                },
//                {
//                    title: '说明',
//                    field: 'illustrate'
//                },
//                {
//                    title: '数量',
//                    field: 'sss',
//                    format: function (value) {
//
//                    }
//                }
//            ];
//        var data = [{
//            name: '张三',
//            age: 19,
//            sex: '男',
//            isEnable: true,
//            remarks: 'aaa'
//        }, {
//            name: '李四',
//            age: 21,
//            sex: '男',
//            isEnable: false,
//            remarks: 'bbb'
//        }, {
//            name: '王小丽',
//            age: 29,
//            sex: '女',
//            isEnable: true,
//            remarks: 'ccc'
//        }, {
//            name: 'f赵六',
//            age: 15,
//            sex: '男',
//            isEnable: true,
//            remarks: 'ddd'
//        }];


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
</script>
</body>
</html>
