var navs=""
$(function () {
    $.ajax({
        url:"queryRoots",
        data:{},
        type:"post",
        dataType:"json",
        success:function (data) {
            navs=data.navs
        }
    })
})
// var navs = [{
// 	"title": "后台管理",
// 	"icon": "fa-cubes",
// 	"spread": true,
// 	"children": [{
// 		"title": "用户管理",
// 		"icon": "&#xe641;",
// 		"href": "/usermanagement"
// 	}, {
// 		"title": "角色管理",
// 		"icon": "&#xe63c;",
// 		"href": "/pay_channel/list.html"
// 	}, {
// 		"title": "权限管理",
// 		"icon": "&#xe63c;",
// 		"href": "/mch_notify/list.html"
// 	}, {
// 		"title": "产品管理",
// 		"icon": "&#xe63c;",
// 		"href": "/mch_notify/list.html"
// 	}, {
// 		"title": "产品套餐管理",
// 		"icon": "&#xe63c;",
// 		"href": "/mch_notify/list.html"
// 	}]
// },{
// 	"title": "会员管理",
// 	"icon": "fa-cubes",
// 	"spread": false,
// 	"children": [{
// 		"title": "注册新会员",
// 		"icon": "fa-check-square-o",
// 		"href": "/pay_order/list.html"
// 	}, {
// 		"title": "新会员管理",
// 		"icon": "fa-check-square-o",
// 		"href": "/trans_order/list.html"
// 	}, {
// 		"title": "退款订单资料",
// 		"icon": "fa-check-square-o",
// 		"href": "/refund_order/list.html"
// 	}, {
// 		"title": "修改本人密码",
// 		"icon": "fa-check-square-o",
// 		"href": "/refund_order/list.html"
// 	}]
// },{
// 	"title": "电子银行",
// 	"icon": "fa-cubes",
// 	"spread": false,
// 	"children": [{
// 		"title": "汇款充值",
// 		"icon": "fa-check-square-o",
// 		"href": "/remittanc"
// 	}, {
// 		"title": "基本账户",
// 		"icon": "fa-check-square-o",
// 		"href": "/basicaccount"
// 	}, {
// 		"title": "内部转账",
// 		"icon": "fa-check-square-o",
// 		"href": "/refund_order/list.html"
// 	}, {
// 		"title": "申请提现",
// 		"icon": "fa-check-square-o",
// 		"href": "/refund_order/list.html"
// 	}, {
// 		"title": "提现明细",
// 		"icon": "fa-check-square-o",
// 		"href": "/refund_order/list.html"
// 	}]
// },{
// 	"title": "购物管理",
// 	"icon": "fa-cubes",
// 	"spread": false,
// 	"children": [ {
// 		"title": "报单购货",
// 		"icon": "fa-check-square-o",
// 		"href": "/trans_order/list.html"
// 	}, {
// 		"title": "确认激活",
// 		"icon": "fa-check-square-o",
// 		"href": "/refund_order/list.html"
// 	}, {
// 		"title": "重新购货",
// 		"icon": "fa-check-square-o",
// 		"href": "/refund_order/list.html"
// 	}, {
// 		"title": "辅消购货",
// 		"icon": "fa-check-square-o",
// 		"href": "/refund_order/list.html"
// 	}, {
// 		"title": "购货管理",
// 		"icon": "fa-check-square-o",
// 		"href": "/refund_order/list.html"
// 	}]
// },{
// 	"title": "资讯管理",
// 	"icon": "fa-cubes",
// 	"spread": false,
// 	"children": [{
// 		"title": "公告管理",
// 		"icon": "fa-check-square-o",
// 		"href": "/pay_order/list.html"
// 	}]
// }];