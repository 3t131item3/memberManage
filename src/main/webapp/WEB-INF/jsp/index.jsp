﻿
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
	<meta charset="utf-8">
	<title>会员商城</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" type="image/x-icon" href="/images/favicon.ico">
	<link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all"/>
	<link rel="stylesheet" href="/css/global.css" media="all">
	<link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">

</head>

<body>
<div class="layui-layout layui-layout-admin" style="border-bottom: solid 5px #1aa094;">
	<div class="layui-header header header-demo">
		<div class="layui-main">
			<div class="admin-login-box">
				<a class="logo" style="left: 0;" href="http://mgr.xxpay.org">
					<span style="font-size: 22px;">会员商城</span>
				</a>

				<div class="admin-side-toggle">
					<i class="fa fa-bars" aria-hidden="true" style="margin: 25% 0 0 0;"></i>
				</div>
				<div class="admin-side-full">
					<i class="fa fa-life-bouy" aria-hidden="true" style="margin: 25% 0 0 0;"></i>
				</div>
			</div>
			<ul class="layui-nav admin-header-item">
				<!--<li class="layui-nav-item">-->
				<!--<a href="javascript:;">清除缓存</a>-->
				<!--</li>-->
				<!--<li class="layui-nav-item" id="pay">-->
				<!--<a href="javascript:;">捐赠我&支付流程体验</a>-->
				<!--</li>-->
				<!--<li class="layui-nav-item">-->
				<!--<a href="http://www.xxpay.org" target="_blank">浏览网站</a>-->
				<!--</li>-->
				<li class="layui-nav-item">
					<a href="javascript:;" class="admin-header-user">
						<img src="/images/0.jpg"/>
						<span>${user.name}</span>
					</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
						</dd>
						<dd>
							<a href="javascript:;"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
						</dd>
						<dd id="lock">
							<a href="javascript:;">
								<i class="fa fa-lock" aria-hidden="true"
								   style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)
							</a>
						</dd>
						<dd>
							<a href="/login"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
						</dd>
					</dl>
				</li>
			</ul>
			<ul class="layui-nav admin-header-item-mobile">
				<li class="layui-nav-item">
					<a href="/login"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="layui-side layui-bg-black" id="admin-side">
		<div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side"></div>
	</div>
	<div class="layui-body" style="bottom: 0;border-left: solid 2px #1AA094;" id="admin-body">
		<div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
			<ul class="layui-tab-title">
				<li class="layui-this">
					<i class="fa fa-dashboard" aria-hidden="true"></i>
					<cite>待定</cite>
				</li>
			</ul>
			<div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
				<div class="layui-tab-item layui-show">
					<!--<iframe src="main.html"></iframe>-->
				</div>
			</div>
		</div>
	</div>
	<div class="layui-footer footer footer-demo" id="admin-footer">
		<div class="layui-main">
			<p>2017 &copy;
				<a href="http://mgr.xxpay.org/">xxpay</a>
				<script src="https://s13.cnzz.com/z_stat.php?id=1262480096&web_id=1262480096"
						language="JavaScript"></script>
			</p>
		</div>
	</div>
	<div class="site-tree-mobile layui-hide">
		<i class="layui-icon">&#xe602;</i>
	</div>
	<div class="site-mobile-shade"></div>

	<!--锁屏模板 start-->
	<script type="text/template" id="lock-temp">
		<div class="admin-header-lock" id="lock-box">
			<div class="admin-header-lock-img">
				<img src="/images/0.jpg"/>
			</div>
			<div class="admin-header-lock-name" id="lockUserName">${user.name}</div>
			<input type="hidden" id="username" value="${user.userName}"/>
			<input type="password" class="admin-header-lock-input" value="" placeholder="输入密码解锁.." name="lockPwd"
				   id="lockPwd"/>
			<button class="layui-btn layui-btn-small" id="unlock" onclick="unlock()">解锁</button>
		</div>
	</script>
	<!--锁屏模板 end -->

	<script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="/plugins/layui/layui.js"></script>
	<script type="text/javascript" src="/datas/nav.js"></script>
	<script type="text/javascript" src="/js/index.js"></script>
	<%--<script type="text/javascript" src="/js/disablekey.js"></script>--%>
	<!--<script>-->
	<!--layui.use('layer', function () {-->
	<!--var $ = layui.jquery,-->
	<!--layer = layui.layer;-->

	<!--$('#pay').on('click', function () {-->
	<!--layer.open({-->
	<!--title: '捐赠我&支付流程体验',-->
	<!--maxmin: true,-->
	<!--type: 2,-->
	<!--content: 'http://shop.xxpay.org/goods/openQrPay.html',-->
	<!--area: ['800px', '600px']-->
	<!--});-->
	<!--});-->
	<!--});-->
	<!--</script>-->
</div>
</body>

</html>