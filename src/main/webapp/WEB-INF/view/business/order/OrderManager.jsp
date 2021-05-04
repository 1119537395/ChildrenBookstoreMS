<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>订单管理页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${Path}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${Path}/static/css/public.css" media="all"/>
</head>
<body style="margin: 10px">

<!-- 搜索条件开始 -->
<blockquote class="layui-elem-quote">
    <i class="layui-icon layui-purple">&#xe615;</i>
    查询条件
</blockquote>
<form class="layui-form layui-form-pane" method="post" id="searchFrom">

    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">订单号</label>
            <div class="layui-input-inline">
                <input type="text" name="orderId" autocomplete="off" class="layui-input" placeholder="请输入订单编号">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">书籍编码</label>
            <div class="layui-input-inline">
                <input type="text" name="bookId" autocomplete="off" class="layui-input" placeholder="请输入书籍编码">
            </div>
        </div>

        <div class="layui-inline">
            <div class="layui-input-label">
                <button type="button" class="layui-btn layui-icon layui-icon-search" id="doSearch">&nbsp;查询</button>
                <button type="reset" class="layui-btn layui-icon layui-btn-danger layui-icon-refresh">&nbsp;重置</button>
            </div>
        </div>
    </div>
</form>
<!-- 搜索条件结束 -->


<!-- 数据表格开始 -->
<table class="layui-hide" id="GeneralTable" lay-filter="GeneralTable"></table>


<!-- 数据表格内部操作按钮 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>


<!-- 添加和修改的弹出层开始 -->
<div style="display: none" id="addAndEditModel">

    <form class="layui-form layui-form-pane" action="" lay-filter="DataForm" id="DataForm" style="margin: 20px">
        <blockquote class="layui-elem-quote">
            <i class="layui-icon layui-blue">&#xe609;</i>
            订单信息修改
        </blockquote>

        <div class="layui-form-item">
            <label class="layui-form-label">订单编号</label>
            <div class="layui-input-block">
                <input type="text" name="orderId" readonly="readonly" autocomplete="off" class="layui-input"
                       lay-verify="required">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">书籍编码</label>
            <div class="layui-input-block">
                <input type="text" name="bookId" id="bookId" autocomplete="off" readonly="readonly"
                       lay-verify="required" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">书名</label>
            <div class="layui-input-block">
                <input type="text" name="bookName" id="bookName" autocomplete="off" class="layui-input"
                       lay-verify="required" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">作者</label>
            <div class="layui-input-block">
                <input type="text" name="bookAuthor" id="bookAuthor" autocomplete="off" class="layui-input"
                       lay-verify="required" readonly="readonly">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注说明</label>
            <div class="layui-input-block">
                    <textarea placeholder="请输入订单的详细描述" lay-verify="required" name="orderInfo"
                              class="layui-textarea"></textarea>
            </div>
        </div>

        <div class="layui-form-item" align="center">
            <div class="layui-input-label">
                <button type="button" class="layui-btn layui-icon layui-icon-ok-circle" lay-submit=""
                        lay-filter="doAddSubmit" id="doAddSubmit">&nbsp;提交
                </button>
                <button type="reset"
                        class="layui-btn layui-icon layui-btn-danger layui-icon-refresh">&nbsp;重置
                </button>
            </div>
        </div>
    </form>
</div>
<!-- 添加和修改的弹出层结束 -->


<script src="${Path}/static/layui/layui.js" charset="utf-8"></script>
<script>
    var tableIns;
    layui.use(['table', 'layer', 'form', 'jquery', 'laydate'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        var maxIndex;
        var url;

        // 渲染表格数据
        tableIns = table.render({
            elem: '#GeneralTable'
            , url: '${Path}/order/loadOrderInfo'
            , height: 'full-145'
            , cellMinWidth: 100
            , page: true
            , text: {
                none: "暂无相关数据"
            }
            , title: '订单数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'orderId', title: '订单号',width: 200, align: "center"}
                , {field: 'bookId', title: '书籍编码', width: 160, align: "center"}
                , {
                    field: 'book', title: '书名', align: "center", templet: function (data) {
                        return data.book.bookName;
                    }
                }
                , {
                    field: 'book', title: '作者', align: "center", templet: function (data) {
                        return data.book.bookAuthor;
                    }
                }
                , {
                    field: 'book', title: '出版社', align: "center",width: 160, templet: function (data) {
                        return data.book.bookPress;
                    }
                }
                , {
                    field: 'book', title: '分类', align: "center", templet: function (data) {
                        return data.book.bookType;
                    }
                }
                , {
                    field: 'bookSellPrice', title: '单价', align: "center", templet: function (data) {
                        return '<font color="#00bfff">' + data.bookSellPrice + '元' + '</font>';
                    }
                }
                , {
                    field: 'orderSellNumber', title: '数量', align: "center", templet: function (data) {
                        return '<font color="red">' + data.orderSellNumber + '本' + '</font>';
                    }
                }
                , {
                    field: 'orderAmount', title: '金额', align: "center", templet: function (data) {
                        return '<font color="#00bfff">' + data.orderAmount + '元' + '</font>';
                    }
                }
                , {field: 'orderInfo', title: '备注', align: "center"}
                , {field: 'orderCreateTime', title: '创建时间',width: 160, align: "center"}
                , {
                    field: 'user', title: '售货员', align: "center", templet: function (data) {
                        return data.user.userName;
                    }
                }
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 180, align: "center"}
            ]]
        });

        //给查询按钮添加单击事件
        $("#doSearch").click(function () {
            //获取表单提交的数据序列
            var parameter = $("#searchFrom").serialize();
            tableIns.reload({
                url: "${Path}/order/loadOrderInfo?" + parameter,
                page: {curr: 1}
            });
        });

        // 购买数量输入框添加事件
        $("#buyTicketNumber").change(function () {
            if ($(this).val() !== '') {
                newBuyTicketNumber = $(this).val();
                var amount = fieldPrice * $(this).val();
                $("#paymentAmount").val(amount);
            }
        });


        //监听行工具删除和修改按钮事件
        table.on('tool(GeneralTable)', function (obj) {
            var tableData = obj.data;  //获取到单击行的数据
            if (obj.event === 'delete') {
                deleteInfo(tableData);
            } else if (obj.event === 'edit') {
                updateInfoModel(tableData);
            } else if (obj.event === 'finish') {
                finishInfo(tableData);
            }
        });


        // 删除
        function deleteInfo(tableData) {
            layer.confirm('确定删除【' + tableData.orderId + '】订单信息吗？', {
                icon: 3,
                title: "提示",
                skin: 'layui-layer-lan',
                btnAlign: 'c'
            }, function () {
                $.post("${Path}/order/deleteOrderInfo?", {orderId: tableData.orderId}, function (returnValue) {
                    if (returnValue.code === 200) {
                        layer.msg(returnValue.msg, {
                            icon: 6
                        });
                        //刷新表格
                        tableIns.reload();
                    } else {
                        layer.msg(returnValue.msg, {
                            icon: 5
                        });
                    }
                });
            });
        }


        // 修改
        function updateInfoModel(tableData) {
            maxIndex = layer.open({
                type: 1,
                title: "修改订单信息",
                content: $('#addAndEditModel'),
                area: ["700px", "550px"],
                anim: 5,
                skin: "layui-layer-lan",
                closeBtn: 2,
                success: function (index) {
                    //给表单赋值
                    $("#bookName").val(tableData.book.bookName);
                    $("#bookAuthor").val(tableData.book.bookAuthor);
                    form.val("DataForm", tableData);
                    url = "${Path}/order/updateOrderInfo";
                }
            });
        }

        //保存
        form.on('submit(doAddSubmit)', function (data) {
            //序列化表单数据
            var params = $("#DataForm").serialize();
            $.post(url, params, function (obj) {
                //弹出成功或失败的提示信息
                layer.msg(obj.msg, {
                    icon: 6
                });
                //关闭弹出层
                layer.close(maxIndex);
                //刷新表格
                tableIns.reload();
            });
        });


        //表单验证
        form.verify({
            ticketsNumber: function (value) {
                if (value > oldBuyTicketNumber) {
                    var formData = new FormData();
                    formData.append("newBuyTicketNumber", value);
                    formData.append("oldBuyTicketNumber", oldBuyTicketNumber);
                    formData.append("orderId", orderId);
                    var message = '';
                    $.ajax({
                        url: "${Path}/order/checkTicketNumber",
                        type: 'POST',
                        data: formData,
                        async: false,
                        cache: false,
                        processData: false,
                        contentType: false,
                        dataType: "json",
                        success: function (data) {
                            if (data) {
                                message = "剩余票量不足，请重新输入购买数量!";
                            }
                        }
                    });
                    if (message !== '') {
                        return message;
                    }
                }
            }
        });


    });

</script>

</body>
</html>
