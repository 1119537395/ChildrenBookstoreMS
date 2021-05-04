<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>结算窗口管理界面</title>
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

<!-- 表单开始 -->
<div style="display: none" id="checkFormHide">
    <blockquote class="layui-elem-quote" style="border-left:0px;">
        <h2>结算列表</h2>
        <hr style="background-color: #009688;">
        <form class="layui-form layui-form-pane" method="post" lay-filter="checkFrom" id="checkFrom">

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">订单编号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="orderId" id="orderId" autocomplete="off" readonly="readonly"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">图书编号</label>
                    <div class="layui-input-inline">
                        <input type="text" name="bookId" id="bookId" autocomplete="off" readonly="readonly"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">图书名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="bookName" id="bookName" readonly="readonly" autocomplete="off"
                               class="layui-input"
                               placeholder="输入图书名称">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">单价</label>
                    <div class="layui-input-inline">
                        <input type="text" name="bookSellPrice" id="bookSellPrice" readonly="readonly"
                               autocomplete="off"
                               class="layui-input"
                               placeholder="输入图书单价">
                    </div>
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">作者</label>
                <div class="layui-input-block">
                    <input type="text" name="bookAuthor" id="bookAuthor" autocomplete="off" lay-verify="required"
                           class="layui-input"
                           placeholder="请输入图书作者">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">出版社</label>
                <div class="layui-input-block">
                    <input type="text" name="bookPress" id="bookPress" readonly="readonly" autocomplete="off"
                           class="layui-input"
                           placeholder="请输入出版社名称">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">购书数量</label>
                <div class="layui-input-block">
                    <input type="text" name="orderSellNumber" id="orderSellNumber" autocomplete="off"
                           lay-verify="required|number|bookNumber"
                           class="layui-input" placeholder="请输入购买图书的数量">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">支付金额</label>
                <div class="layui-input-block">
                    <input type="text" name="orderAmount" id="orderAmount" autocomplete="off"
                           readonly="readonly"
                           lay-verify="required|number"
                           class="layui-input" placeholder="输入购书总金额">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">售货员</label>
                <div class="layui-input-block">
                    <input type="text" name="operName" id="operName" readonly="readonly" autocomplete="off"
                           lay-verify="required"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注说明</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入订单的详细描述" lay-verify="required" name="orderInfo"
                              class="layui-textarea"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <div class="layui-input-label">
                        <button type="button" class="layui-btn layui-icon layui-icon-ok-circle"
                                lay-filter="doSubmit" lay-submit="" id="doSubmit">&nbsp;结算
                        </button>
                    </div>
                </div>
                <div class="layui-inline">
                    <div class="layui-input-label">
                        <button type="button" class="layui-btn layui-icon layui-icon-close-fill"
                                id="cancel">&nbsp;取消
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </blockquote>
</div>
<!-- 表单结束 -->

<!-- 搜索 -->
<form class="layui-form layui-form-pane" method="post" id="searchFrom">

    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">书籍编码</label>
            <div class="layui-input-inline">
                <input type="text" name="bookId" autocomplete="off" class="layui-input" placeholder="请输入查询的书籍编码">
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

<!-- 数据表格开始 -->
<div id="tableId" style="display: block">
    <table class="layui-hide" id="GeneralTable" lay-filter="GeneralTable"></table>
</div>

<!-- 数据表格内部操作按钮开始 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="buy">出售</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="view">浏览</a>
</script>
<!-- 数据表格内部操作按钮结束 -->


<!-- 查看大图弹出层开始 -->
<div style="display: none" id="viewLargerImage">
    <img alt="书籍封面图片" width="300" height="300" id="viewImage" style="margin-left: 100px;margin-top: 40px">
</div>
<!-- 查看大图弹出层结束 -->


<script src="${Path}/static/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    var tableIns;
    layui.use(['table', 'layer', 'form', 'jquery', 'upload'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var upload = layui.upload;
        var bookId;

        // 渲染表格数据
        tableIns = table.render({
            elem: '#GeneralTable'
            , url: '${Path}/book/loadBookInfoByState'
            , height: 'full-140'
            , cellMinWidth: 100
            , page: true
            , text: {
                none: "暂无相关数据"
            }
            , title: '书籍信息数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'bookId', title: '书籍编码', width: 160, align: "center"}
                , {field: 'bookName', title: '书籍名称', width: 150, align: "center"}
                , {field: 'bookAuthor', title: '作者', align: "center"}
                , {field: 'bookPress', title: '出版社', align: "center"}
                , {field: 'bookType', title: '分类', align: "center"}
                , {
                    field: 'bookSellPrice', title: '单价', align: "center", templet: function (data) {
                        return '<font color="#20b2aa">' + data.bookSellPrice + '元' + '</font>';
                    }
                }
                , {
                    field: 'bookStockNumber', title: '库存量', align: "center", templet: function (data) {
                        return '<font color="red">' + data.bookStockNumber + '册' + '</font>';
                    }
                }
                , {
                    field: 'bookImageUrl', title: '缩略图', align: "center", templet: function (d) {
                        return "<img width=40 height=40 src=${Path}/file/showImgFileInformation?path=" + d.bookImageUrl + "/>";
                    }
                }
                , {field: 'bookInfo', title: '备注说明', align: "center"}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 230, align: "center"}
            ]]
        });

        // 保存订单数据
        form.on("submit(doSubmit)", function () {
            // 序列化表单数据
            var params = $("#checkFrom").serialize();
            // 发送请求保存订单数据
            $.post("${Path}/order/addOrderData", params, function (value) {
                if (value.code == 200) {
                    // 显示数据表格
                    $("#tableId").css("display", "block");
                    // 隐藏订单列表
                    $("#checkFormHide").css("display", "none");
                    // 显示搜索框
                    $("#searchFrom").css("display", "block");
                    // 弹出提示
                    layer.msg(value.msg, {icon: 6});
                    // 刷新表格
                    tableIns.reload();
                }
            });
        });

        //给查询按钮添加单击事件
        $("#doSearch").click(function () {
            //获取表单提交的数据序列
            var parameter = $("#searchFrom").serialize();
            tableIns.reload({
                url: "${Path}/book/loadBookInfoByState?" + parameter,
                page: {curr: 1}
            });
        });


        //监听行工具购买和浏览按钮事件
        table.on('tool(GeneralTable)', function (obj) {
            var tableData = obj.data;  //获取到单击行的数据
            var layEvent = obj.event;
            if (layEvent === 'buy') {
                BuyFlowerFun(tableData);
            } else if (layEvent === 'view') {
                OpenViewModel(tableData);
            }
        });

        // 购买数量输入框添加事件
        $("#orderSellNumber").change(function () {
            if ($(this).val() !== '') {
                var amount = $("#bookSellPrice").val() * $(this).val();
                $("#orderAmount").val(amount);
            }
        });


        // 取消按钮的单击事件
        $("#cancel").on("click", function () {
            // 显示数据表格
            $("#tableId").css("display", "block");
            // 隐藏订单列表
            $("#checkFormHide").css("display", "none");
            // 显示搜索框
            $("#searchFrom").css("display", "block");
        });

        // 购买按钮的单击事件
        function BuyFlowerFun(tableData) {
            // 清空表单的数据
            $("#checkFrom")[0].reset();
            // 隐藏数据表格
            $("#tableId").css("display", "none");
            // 显示订单列表
            $("#checkFormHide").css("display", "block");
            // 隐藏搜索框
            $("#searchFrom").css("display", "none");
            // 初始化订单列表
            initOrderFormData(tableData);
        }

        // 初始化订单列表
        function initOrderFormData(tableData) {
            // 发送请求获取到订单列表数据
            $.post("${Path}/order/loadOrderFormData", function (map) {
                // 给订单输入框赋值
                $("#orderId").val(map.orderNumber);
                bookId = tableData.bookId;
                // 给操作员输入框赋值
                $("#operName").val(map.userName);
                $("#bookId").val(tableData.bookId);
                $("#bookName").val(tableData.bookName);
                $("#bookAuthor").val(tableData.bookAuthor);
                $("#bookPress").val(tableData.bookPress);
                $("#bookSellPrice").val(tableData.bookSellPrice);
            });
        }

        //点击查看大图
        function OpenViewModel(tableData) {
            maxIndex = layer.open({
                type: 1,
                title: "【" + tableData.bookName + "】图书封面",
                content: $('#viewLargerImage'),
                area: ["550px", "460px"],
                anim: 5,                 //动画效果
                skin: "layui-layer-lan", //皮肤
                closeBtn: 2,
                success: function (index) {
                    $("#viewImage").attr("src", "${Path}/file/showImgFileInformation?path=" + tableData.bookImageUrl);
                }
            });
        }

        //表单验证
        form.verify({
            bookNumber: function (value) {
                var formData = new FormData();
                formData.append("bookId", bookId);
                formData.append("bookStockNumber", value);
                var message = '';
                $.ajax({
                    url: "${Path}/book/checkBookNumber",
                    type: 'POST',
                    data: formData,
                    async: false,
                    cache: false,
                    processData: false,
                    contentType: false,
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            message = "库存数量不足，请重新输入购买数量！";
                        }
                    }
                });
                if (message !== '') {
                    return message;
                }
            }
        });

    });

</script>

</body>
</html>