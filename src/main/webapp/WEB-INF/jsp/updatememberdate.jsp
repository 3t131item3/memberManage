<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>修改会员资料</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
</head>

<body>
<div style="margin: 15px;">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>修改会员资料</legend>
    </fieldset>

    <form class="layui-form" action="/Users/updatememberdate" method="post">
        <input type="hidden" value="${user.id}" name="id"/>
        <div class="layui-form-item">
            <label class="layui-form-label">申请日期<span style="color: red">*</span><span>：</span></label>
            <div class="layui-input-inline">
                <input type="text" name="createTime" lay-verify="date" autocomplete="off"
                       value="<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd"/>"
                       class="layui-input" disabled>
            </div>
            <div class="layui-form-mid layui-word-aux" style="color: #FD482C">不可更改</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">用户名<span style="color: red">*</span><span>：</span></label>
            <div class="layui-input-inline">
                <input type="text" name="userName" lay-verify="username" autocomplete="off" value="${user.userName}"
                       class="layui-input" disabled>
            </div>
            <div class="layui-form-mid layui-word-aux" style="color: #FD482C">不可更改</div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">真实姓名<span style="color: red">*</span><span>：</span></label>
            <div class="layui-input-inline">
                <input lay-verify="name" type="text" name="name" autocomplete="off" value="${user.name}"
                       class="layui-input"
                       <c:if test="${user.name!=null}">disabled</c:if> placeholder="请输入真实姓名">
            </div>

            <c:if test="${user.name!=null}">
                <div class="layui-form-mid layui-word-aux" style="color: #FD482C">不可更改</div>
            </c:if>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">身份证<span style="color: red">*</span><span>：</span></label>
            <div class="layui-input-inline">
                <input type="text" name="papersNo" lay-verify="idcard" autocomplete="off" value="${user.papersNo}"
                       class="layui-input" placeholder="请输入证件号" maxlength="18"
                       <c:if test="${user.papersNo!=null}">disabled</c:if> >
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">手机号<span style="color: red">*</span><span>:</span></label>
            <div class="layui-input-block">
                <input type="tel" name="telephoneNumber" lay-verify="phone" value="${user.telephoneNumber}"
                       placeholder="请输入正确的手机号码" autocomplete="off" class="layui-input" maxlength="11" minlength="11"
                       pattern="1[345789][0-9]{9}" title="请输入正确的手机号">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">二级密码<span style="color: red">*</span><span>:</span></label>
            <div class="layui-input-block">
                <input type="password" name="pwd2" lay-verify="pwd2" value="${user.telephoneNumber}"
                       placeholder="请输入二级密码" autocomplete="off" class="layui-input" maxlength="11" minlength="6"
                       title="请输入正确的二级密码">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">邮箱<span style="color: red">*</span><span>:</span></label>
            <div class="layui-input-block">
                <input type="email" name="email" lay-verify="email" autocomplete="off" value="${user.email}"
                       class="layui-input" placeholder="请输入邮箱">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">银行卡卡号<span style="color: red">*</span><span>:</span></label>
            <div class="layui-input-block">
                <input type="text" name="openNo" lay-verify="bankcard" placeholder="请输入18位银行卡号" autocomplete="off"
                       value="${user.papersNo}" class="layui-input" maxlength="18">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">开户行<span style="color: red">*</span><span>:</span></label>
            <div class="layui-input-block">
                <input type="text" name="bankName" lay-verify="bankName" placeholder="请输入开户行" autocomplete="off"
                <c:if test="${user.bank!=null}"> value="${user.bank.bankName}" </c:if> class="layui-input" maxlength="10">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">收货地址<span>:</span></label>
            <div class="layui-input-block">
                <input type="text" name="address" lay-verify="address" autocomplete="off"
                       value="${user.address}" class="layui-input" placeholder="请输入收货地址">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" type="submit" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="plugins/layui/layui.js"></script>

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
            bankcard: [/^([1-9]{1})(\d{14}|\d{17})$/, '银行卡填写有误'],
            idcard: [/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/, '证件号填写有误'],
            name: [/^[\u4E00-\u9FA5A-Za-z]+$/, '真实姓名填写有误'],
            address: function (value) {
                if (value.length <= 0) {
                    return "请输入收获地址"
                }
            },
            bankName:function (value) {
                if(value.length<1){
                    return "请输入开户行"
                }
            }
        });
        //监听提交
        //监听提交
//        form.on('submit(demo1)', function (data) {
//            alert("dfd")
//            var mycars = new Array()
//            mycars[0] = data.field.phone
//            mycars[1] = data.field.email
//            mycars[2] = data.field.bankcard
//            mycars[3] = data.field.address
//            $.get("/Users/updatememberdate", null, function (form) {
//                alert(form.msg)
//                if (form.msg == "成功") {
//                    time:5000
//                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
//                    parent.layer.close(index);
//                    location = "/jsp/commodity/list"
//                } else {
//                    alert(form.msg)
//                }
//
//            })
//            return false;
//        });
    });

    function queryBank(bankNo) {
        var exists = true
        $.ajax({
            type: "post",
            async: false,
            data: {bankNo: bankNo},
            dataType: "json",
            url: "",
            success: function (data) {
                if (data.result == "true") {
                    exists = true
                } else {
                    exists = false
                }
            }
        })
        return exists
    }

</script>
</body>

</html>