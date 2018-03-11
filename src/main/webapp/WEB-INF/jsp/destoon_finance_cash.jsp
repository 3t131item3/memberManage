<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>申请提现</title>

    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
</head>

<body>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>电子银行》申请提现</legend>
    </fieldset>
<form class="layui-form" action="/Users/tixian">
    <div style="margin-left: 200px">
        <div class="layui-form-item">
            <label class="layui-form-label" >当前余额：</label>
            <div class="layui-input-block" style="width:30px;display:flex;align-items: center">
                <span id="user_remainder">${user.remainder}(元)</span>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">提现金额：</label>
                <div class="layui-input-inline">
                    <input type="number" name="remainder" id="remainder" lay-verify="price" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <label href="remainder" class="layui-form-mid layui-word-aux remainderMessage">*（提现金额不能大于余额）</label>
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="width: 480px">
            <label class="layui-form-label">银行名称</label>
            <div class="layui-input-block">
                <input type="text" name="user.bank.bankName" id="bankName" lay-verify="title" value="${user.bank.bankName}" readonly autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">银行开户名</label>
            <div class="layui-input-block" style="width: 480px;">
                <input type="text" name="user.bank.openUser" id="openUser" lay-verify="text" value="${user.bank.openUser}" readonly  class="layui-input"/>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">银行卡号</label>
            <div class="layui-input-inline" style="width: 480px; height: 20px;" >
                <input type="text" name="user.bank.no" id="openNo" lay-verify="text" value="${user.openNo}" readonly  class="layui-input"/>
            </div>
        </div>
        <button type="submit" class="layui-btn layui-btn-radius" id="sub" lay-submit="" lay-filter="demo1" style="margin-left: 50px">提交申请</button>
    </div>
</form>

    <script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="/plugins/layui/layui.js"></script>

    <script>
        $(function () {
            $("#remainder").on("blur", function () {
                remainder()
            })
            replaces()
        })
        layui.use(['form', 'layedit', 'laydate'], function() {
            var form = layui.form(),
                layer = layui.layer,
                layedit = layui.layedit,
                laydate = layui.laydate;

            //创建一个编辑器
            var editIndex = layedit.build('LAY_demo_editor');
            //自定义验证规则
            form.verify({
                price: function(value) {
                    if(value<=0) {
                        return '汇款金额必须大于0';
                    }
                },
                text: function(value) {
                    if(value=="" || value==null){
                        return "订单号不能为空"
                    }
                }
            });

            //监听提交
            form.on('submit(demo1)', function(data) {
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'.
                if(remainder()==true){
                    layer.confirm('<div class="layui-form-item">' +
                        '            <div class="layui-inline">' +
                        '                <label class="layui-form-label">二级密码：</label>' +
                        '                <div class="layui-input-inline">' +
                        '                    <input type="text" id="pwd2" autocomplete="off" class="layui-input">' +
                        '                    <input type="hidden" id="pwd" value="${user.pwd2}">' +
                        '                </div>' +
                        '            </div>' +
                        '        </div>', {title:'二级密码',area:['500','300px']},
                        function () {
                            var pwd2=$("#pwd2").val()
                             if(pwd2!=null && pwd2 !=''){
                                if(pwd2==$("#pwd").val()){
                                    $("form").submit()
                                }else{
                                    alert("二级密码有误")
                                }
                             }else{
                                 alert("请填写二级密码")
                             }
                        }, function () {
                            layer.msg({
                                time: 2000
                            });
                        });
                }
                return false
//            })
            });
        });
    </script>
<script>
    function replaces(){
        var openNo=$("#openNo").val()
        var openNo2=openNo.substring(0,openNo.length-4)
        $("#openNo").val(openNo.replace(openNo2,'************'))
        var openUser=$("#openUser").val();
        if(openUser.length<4){
        var openUser2=openUser.substring(0,1)
        $("#openUser").val(openUser.replace(openUser2,'*'))
        }else{
            var openUser2=openUser.substring(0,2)
            $("#openUser").val(openUser.replace(openUser2,'**'))
        }

    }
    function remainder() {
        if ($("#remainder").val() != null && $("#remainder").val() != '') {
            if (parseFloat($("#user_remainder").text()) < parseFloat($("#remainder").val())) {
                $(".remainderMessage").text("余额不足")
                $(".remainderMessage").css("color","red")
                return false
            } else {
                $(".remainderMessage").text("*（提现金额不能大于余额）")
                $(".remainderMessage").css("color","#ccc")
                return true
            }
        }
    }
</script>
</body>
</html>
