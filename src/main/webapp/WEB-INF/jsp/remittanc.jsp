<%@ page import="com.accp.entity.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>汇款充值</title>

    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">

    <style>
        .back {
            display: none;
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0);
            top: 0;
            left: 0;
            z-index: 1;
        }

        .pwdtwo {
            display: none;
            position: absolute;
            z-index: 2;
            width: 80%;
            height: 80%;
            top: 10%;
            left: 10%;
            background: #fff;
            border: 1px solid #CCCCCC;
            box-shadow: darkgrey 10px 10px 30px 5px;
        }
    </style>
</head>
<body>

<div style="margin: 15px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>电子银行》》汇款充值</legend>
    </fieldset>

    <form class="layui-form" action="/recharge" method="post">

        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">汇款日期</label>
                <div class="layui-input-block" style="width: 630px">
                    <input readonly type="text" name="tranTime"
                           id="date" <%--lay-verify="date" placeholder="yyyy-mm-dd"--%> autocomplete="off"
                           class="layui-input" <%--onclick="layui.laydate({elem: this})"--%>>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">汇款金额</label>
                <div class="layui-input-inline" style="width: 630px;">
                    <input type="number" name="price" lay-verify="price" placeholder="￥" autocomplete="off" id="price"
                           class="layui-input">
                    <span class="noprice">(CNY)</span>
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">摘要</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea" style="width: 50%" name="title"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单号</label>
            <div class="layui-input-inline" style="width: 630px; height: 20px;">
                <input type="text" id="orderNo" name="orderNo" lay-verify="text" class="layui-input" readonly/>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary" onclick="values()">重置</button>
            </div>
        </div>

        <div class="pwdtwo">
            <span style="cursor: pointer;color: #CCCCCC;position: absolute;top: 15px;right: 15px" onclick="hide()">X</span>
            <br/>
            <br/>
            <hr/>

                <div class="layui-form-item" style="display: flex;justify-content: center;margin: 15% 0 0 0">
                    <div class="layui-input-inline" style="width: 630px; height: 20px;">
                        <input type="password" id="pwd2" placeholder="请输入支付密码" class="layui-input"/>
                    </div>
                    <%--<div class="layui-input-inline" style="width: 630px; height: 20px;">--%>
                        <%--<img  class="showpwd" src="/images/password4.png" alt="" width="50" style="cursor: pointer;">--%>
                    <%--</div>--%>
                    <div class="layui-input-block">
                        <button type="button" id="btn" class="layui-btn">立即提交</button>
                        <%--隐藏用于提交--%>
                        <button id="subbutton" class="layui-btn" lay-submit="" style="display: none" lay-filter="demo">
                            立即提交
                        </button>
                    </div>
                </div>
        </div>
        <div class="back"></div>
    </form>
</div>


<script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/plugins/layui/layui.js"></script>

<script>
    var date = ""
    var orderNo = ""
    $(function () {
        //        初始化订单号
        date = new Date()
        orderNo = date.getYear() + "" + date.getMonth() + "" + date.getDate() + "" + date.getHours() + "" + date.getMinutes() + "" + date.getSeconds() + "" +${user.id};
        $("#orderNo").val(orderNo)
        //        初始化转账充值日期为当前日期
        date = date.getFullYear() + "-" + (date.getMonth() > 10 ? date.getMonth() : '0' + date.getMonth()) + "-" + (date.getMonth() > 10 ? date.getDate() : '0' + date.getDate())
        $("#date").val(date)
//        鼠标失去焦点获取余额
        $("#price").on("blur", function () {
            price()
        })

        $("#btn").on("click", function () {
            pwd2()
        })
//        var passwordShow = false
//        $(".showpwd").on("click", function () {
//            if (passwordShow == true) {
//                passwordShow=false
//                $("#pwd2").attr("type", "password")
//                $(this).attr("src","/images/password4.png")
//            } else {
//                passwordShow=true
//                $(this).attr("src","/images/password.png")
//                $("#pwd2").attr("type", "text")
//            }
//        })

    })

    //    判断余额是否足够
    function price() {
        if ($("#price").val() != null && $("#price").val() != '' && $("#price").val() > 0) {
            $.ajax({
                type: "post",
                data: {price: $("#price").val()},
                dataType: "json",
                url: "/queryPrice",
                success: function (data) {
                    if (data.result == "false") {
                        $("#price").val("")
                        $(".noprice").text("余额不足")
                        $(".noprice").css("color", "red");
                        return false
                    } else {
                        $(".noprice").text("(CNY)")
                        $(".noprice").css("color", "#000");
                        return true
                    }
                }
            })
        }
    }

    //    重新赋值订单号和日期
    function values() {
        setTimeout(function () {
            $("#date").val(date)
            $("#orderNo").val(orderNo)
        }, 1)

    }

    //    判断二级密码是否正确
    function pwd2() {
        if ($("#pwd2").val() == null || $("#pwd2").val() == '') {
            $("#subbutton").trigger("click")
        } else {
            $.ajax({
                type: "post",
                data: {pwd2: $("#pwd2").val()},
                dataType: "json",
                url: "/Users/pwdeq",
//            beforeSend: function () {
//
//            },
                success: function (data) {
                    if (data.result == "false") {
                        alert("支付密码错误")
                    } else {
                        $("#subbutton").trigger("click")
                    }
                },
                error: function (data) {
                }
            })
        }
    }

    function hide() {
        $(".pwdtwo").css("display", "none")
        $("#pwd2").val("")
        $(".back").css("display", "none")
        $("#pwd2").removeAttr("lay-verify")
    }
</script>
<script>

    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form(),
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        //自定义验证规则
        form.verify({
            price: function (value) {
                if (value <= 0) {
                    return '汇款金额必须大于0';
                }
            }
            , pwd: function (value) {
                if (value == "" || value == null) {
                    return "请输入支付密码"
                }
            }
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            $(".pwdtwo").css("display", "block")
            $(".back").css("display", "block")
            $("#pwd2").attr("lay-verify", "pwd")
            return false
        });

        form.on('submit(demo)', function (data) {

        });

    });
</script>
</body>
</html>
