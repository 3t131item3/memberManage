
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>结算</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
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
<div style="margin: 15px;">
<fieldset class="layui-field-title" >
    <legend>结算</legend>
</fieldset>
<fieldset class="layui-elem-field">
    <legend>订单明细</legend>
    <div class="layui-field-box layui-form">
        <table class="layui-table admin-table">
            <thead>
            <tr>
                <th>单号:</th>
                <th id="rand"></th>
            </tr>
            <tr><input type="hidden" value="${user.id}" id="userId"><input type="hidden"  id="commoditySetMealId">
                <th>购买会员用户名：</th>
                <th>${user.userName}</th>
            </tr>
            <tr>
                <th>购买人姓名</th>
                <th>${user.name}</th>
            </tr>
            <tr>
                <th>购买类型：</th>
                <th>
                    <div class="layui-input-inline">
                    <select name="quiz1ss" id="quiz1ss">
                        <option value="0">请选择</option>
                        <option value="报单购货" selected="selected">报单购货</option>
                        <option value="重消购货">重消购货</option>
                        <option value="辅消购货">辅消购货</option>
                    </select>
                </div>
                </th>
            </tr>
            <tr>
                <th>购买时间：</th>
                <th ><span id="date"></span></th>
            </tr>

            </tbody>
        </table>
        <div class="beg-table-paged"></div>
    </div>
</fieldset>
<fieldset class="layui-elem-field">
    <legend>商品详细</legend>
    <div class="layui-field-box layui-form">
        <table id="xx" class="layui-table admin-table">
        </table>
    </div>
    <div class="layui-field-box layui-form">
        <table  style="width:900px">

            <tr style="border: 0">
                <td style="width: 100px;">当前余额:</td>
                <td style="width: 500px;" ><span class="counts">${user.remainder}</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; <a href="" style='color: red;text-decoration:underline;'>余额不足，马上去汇款充值</a></td>
                <td style="width: 100px;">总价：</td>
                <td style="width: 200px;"><span id="countPice"></span></td>
            </tr>
        </table>

    </div>

</fieldset>
<form class="layui-form" id="none" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">收货地址：</label>
        <div class="layui-input-inline">
            <select name="quiz1s">
                <option value="0">请选择</option>
                <option value="中国"  selected="selected">中国</option>
                <option value="美国">美国</option>
                <option value="日本">日本</option>
            </select>
        </div>
        <div class="layui-input-inline">
            <input type="tel" name="dizhi" lay-verify="text" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">快递类型：</label>
        <div class="layui-input-inline">
            <select name="quiz1">
                <option value="请选择" selected="selected">请选择</option>
                <option value="EMS">EMS</option>
                <option value="顺丰">顺丰</option>
                <option value="圆通">圆通</option>
                <option value="韵达">韵达</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮编：</label>
        <div class="layui-input-inline">
            <input type="text" name="email" lay-verify="text" autocomplete="off" class="layui-input">
        </div>
            <button class="layui-btn" lay-submit="" lay-filter="demo1" >立即提交</button>
    </div>
</form>
    <form class="layui-form"  action="">
    <div class="layui-field-box layui-form" id="hisss" style="display:none " >
        <table  id="table" class="layui-table admin-table" border="0"style="width: 600px;">
            <tr>
                <td style="width: 200px;">收货地址:</td>
                <td style="width: 400px;"><span id="shouhuo"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span></span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="javascript:;"data-opt="edit" class="layui-btn layui-btn-mini"  style="display: none">修改</a></td>
            </tr>
            <tr>
                <td>快递类型:</td>
                <td id="quiz1"></td>
            </tr>
            <tr>
                <td>邮编:</td>
                <td id="email"></td>
            </tr>
        </table>

    </div>

        <div class="layui-form-item">
            <label class="layui-form-label">请输入二级密码：</label>
            <div class="layui-input-inline">
                <input type="tel" name="dizhi" lay-verify="text" autocomplete="off" placeholder="请输入二级密码" class="layui-input">
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="demo1s" >支付</button>
        </div>
    </form>
</div>
<script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="plugins/layui/layui.js"></script>
<script >
    layui.config({
        base: 'js/'
    });
    var commoditySetMealId=new Array();
    var number=new Array();
    var mycars=new Array();
    layui.use(['begtable','form'], function () {
        var begtable = layui.begtable(),
            layer = layui.layer,
            $ = layui.jquery,
            laypage = layui.laypage,form = layui.form(),layer = layui.layer;
        var columns = [{
            title: '编号',
            field: 'name'
        }, {
            title: '优惠价（元）',
            field: 'discountPrice'
        }, {
            title: '总价',
            field: 'price',
        }, {
            title: '数量',
            field: 'illustrate'
        }];
        var datas = ""

        $.ajax({
            url: "/commoditySetMeal/Clearings",
            data: {},
            async: false,  //同步执行
            type: "post",
            dataType: "json",
            success: function (data) {
                datas=data.list;
                var x = 10000000000;
                var y = 1;
                var rand = String.fromCharCode(Math.floor( Math.random() * 26) + "a".charCodeAt(0))+parseInt(Math.random() * (x - y + 1) + y)+String.fromCharCode(Math.floor( Math.random() * 26) + "a".charCodeAt(0));
                $("#countPice").val(datas.countPice);
                $("#date").text(new Date().toLocaleTimeString());
                $("#rand").html(rand)
                $("#countPice").text(data.countPice);
                    for (var i=0;i<data.list.length;i++){
                        commoditySetMealId[i]= data.list[i].id
                        number[i]=data.list[i].illustrate
                    }
            }
        });
        begtable.set({
            bordered: true,
            hovered: true,
            striped: true,
            elem: '#xx',
            columns: columns,
            data: datas,
//            checked: true,
            paged:false
        }).init();

        console.log(begtable.getSelectedRows());
        console.log(location);

            form.on('submit(demo1s)', function(data) {
//              var ss=  $(".counts").text()
//              var sss=  $("#countPice").text()
                if(  $(".counts").val()< $("#countPice").val()){
                    layer.msg("用户余额不足!,请马上去汇款充值")
                    return false
                }


                mycars[0]=$("#quiz1ss option:selected").text();
                mycars[1]=$("#quiz1").text();
                mycars[2]= $("#shouhuo").text();
                mycars[3]= $("#shouhuo").next().text();
                mycars[4]= $("#email").text();
                mycars[5]=$("#rand").text();
                mycars[6]=data.field.dizhi;
                mycars[7]=$("#countPice").text();
                $.ajax({
                    url: '/commoditySetMeal/add/'+commoditySetMealId+'/'+number,
                    data: {'beginDate':mycars},
                    traditional:true,
                    async: false,  //同步执行
                    type: "post",
                    dataType: "json",
                    success: function (data) {
                        if(data=="true"){
                            layer.msg("添加购买成功！");
                            location.href="/shopping_again";
                        }else if(data="noPwd") {
                            layer.msg("支付密码错误");
                        }else if(data="userFales"){
                            layer.msg("购买失败");
                        }else  if(data="false"){
                            layer.msg("购买失败");
                        }
                    }

                });

                return false;
            });
    });


</script>
<script>

    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;
        form.on('submit(demo1)', function(data) {
            $("#none").css("display","none");
            $("#hisss").css("display","block");
            $("#quiz1").html(data.field.quiz1)
            $("#shouhuo").html(data.field.quiz1s).next().text(data.field.dizhi)
            $("#email").html(data.field.email)
            return false;
        });
        $("#table tr").mouseover(function(){
            $("a[data-opt=edit]").show();
        });
        $("#table tr").mouseout(function(){
            $("a[data-opt=edit]").hide();
        })
        $("a[data-opt=edit]").on("click",function () {
            $("#none").css("display","block");
            $("#hisss").css("display","none");
        })


    });
</script>
</body>
</html>
