
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/css/begtable.css" />
</head>
<style>
    .a,.s{
        display: flex;
        flex-direction: row;
    }
    .layui-input-block{
        margin: 0 15px;
    }
</style>
<body>

<input type="hidden" class="beginDate"/>
<input type="hidden" class="endDate"/>

<div class="layui-form-item">
    <div class="layui-inline a">
        <div class="s">
            <label class="layui-form-label">日期</label>
            <div class="layui-inline">
                <div class="layui-input-block">
                    <input type="text" name="date" id="beginDate" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
                </div>
            </div>
        </div>
        <label class="layui-form-label">to</label>
        <div class="s">
            <div class="layui-inline">
                <div class="layui-input-block" >
                    <input type="text1" name="date"  id="endDate" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
                </div>
            </div>
        </div>
        <button class="layui-btn layui-btn-radius" id="query">查询</button>
    </div>
</div>
<div style="width: 90%; height: 85%; border: 1px solid #009688;margin-left: 65px">
    <div class="beg-table-box">
        <div class="beg-table-body">
            <table class="beg-table beg-table-bordered beg-table-striped beg-table-hovered">
                <thead>
                <tr>
                    <th>日期</th>
                    <th>时间</th>
                    <th>摘要</th>
                    <th>交易金额(元)</th>
                    <th>余额(元)</th>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
        <div class="beg-table-paged"></div>
    </div>
</div>
</div>
<script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/plugins/layui/layui.js"></script>
<%--<script type="text/javascript" src="/js/disablekey.js"></script>--%>

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
<script>
    $(function () {
        ajaxQuery(1)
        $("#query").on("click",function () {
            $(".beginDate").val($("#beginDate").val())
            $(".endDate").val($("#endDate").val())
            ajaxQuery(1)
        })
    })
    layui.config({
        base: 'js/'
    });
function laypages(rowCount,currPage){
    layui.use('begtable', function() {
        var begtable = layui.begtable(),
            layer = layui.layer,
            $ = layui.jquery,
            laypage = layui.laypage;

        laypage({
            cont: $('.beg-table-paged'),
            pages: rowCount,//总页数
            curr:currPage,//当前页
            groups: 5, //连续显示分页数

            jump: function(obj, first) {
                //得到了当前页，用于向服务端请求对应数据
                var curr = obj.curr;
                if(!first) {
                    //layer.msg('第 '+ obj.curr +' 页');
                    ajaxQuery(curr);
                }
            }
        });

        var columns = [{
            title: '用户名',
            field: 'name'
        }, {
            title: '年龄',
            field: 'age'
        }, {
            title: '是否启用',
            field: 'isEnable',
            format: function(value) {

            }
        }, {
            title: '性别',
            field: 'sex'
        }, {
            title: '备注',
            field: 'remarks'
        }];
        var data = [{
            name: '张三',
            age: 19,
            sex: '男',
            isEnable: true,
            remarks: 'aaa'
        }, {
            name: '李四',
            age: 21,
            sex: '男',
            isEnable: false,
            remarks: 'bbb'
        }, {
            name: '王小丽',
            age: 29,
            sex: '女',
            isEnable: true,
            remarks: 'ccc'
        }, {
            name: 'f赵六',
            age: 15,
            sex: '男',
            isEnable: true,
            remarks: 'ddd'
        }];
        begtable.set({
            bordered: true,
            hovered: true,
            striped: true,
            elem: '#xx',
            columns: columns,
            data: data,
            checked: true,
            //paged:false
        }).init();

        console.log(begtable.getSelectedRows());
        console.log(location);
    });
}
    function ajaxQuery(thisPage) {
        $.ajax({
            url:"/queryPageTranRecords",
            data:{beginDate:$(".beginDate").val(),endDate:$(".endDate").val(),thisPage:thisPage},
            dataType:"json",
            type:"post",
            success:function (data) {
//                得到tbody标签元素
                var tbody=$("tbody")
//                清空tbody的子节点
                tbody.empty()
//              判断是否有值
                if(data.data.length<=0){
                    tbody.append("<tr>" +
                            "<td colspan='5' align='center'style='font-size: 36px;'>"+"暂无数据"+"</td>"
                        +"</tr>")
                }

                for(var i=0;i<data.data.length;i++){
                    var date=new Date(data.data[i].tranTime)
                tbody.append("<tr>" +
                        "<td>"+date.getFullYear()+"-"+(date.getMonth()+1>9?date.getMonth()+1 : '0'+(date.getMonth()+1))+"-"+(date.getDate()>9?date.getDate() : '0'+date.getDate())+"</td>"+
                        "<td>"+(date.getHours()>9?date.getHours(): '0'+date.getHours())+":"+(date.getMinutes()>9?date.getMinutes(): '0'+date.getMinutes())+":"+(date.getSeconds()>9?date.getSeconds(): '0'+date.getSeconds())+"</td>"+
                        "<td>"+data.data[i].title+"</td>"+
                        "<td>"+data.data[i].price+"</td>"+
                        "<td>"+data.data[i].remainder+"</td>"
                    +"</tr>")
                }
//              分页按钮只有1页不显示
                laypages(data.totalPageCount,data.pagerNo)
            }
        })
    }
</script>
</body>
</html>
