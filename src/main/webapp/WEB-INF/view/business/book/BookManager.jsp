<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>书籍库存管理</title>
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
            <label class="layui-form-label">编码</label>
            <div class="layui-input-inline">
                <input type="text" name="bookId" autocomplete="off" class="layui-input" placeholder="请输入查询的书籍编码">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline">
                <input type="text" name="bookName" autocomplete="off" class="layui-input" placeholder="请输入查询的书籍名称">
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

<!-- 数据表格上方工具栏按钮 -->
<%--<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-containe">
        <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="add">添加</button>
    </div>
</script>--%>

<!-- 数据表格内部操作按钮 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="view">封面预览</a>
</script>

<!--表单内嵌效果展示开始-->
<script type="text/html" id="switchTpl">
    <input type="checkbox" name="bookState" value="{{d.bookState}}" lay-filter="test11" lay-skin="switch"
           lay-text="上架|下架"
           {{ d.bookState==1?'checked':''}}>
</script>

<!-- 数据表格结束 -->

<!-- 查看大图弹出层开始 -->
<div style="display: none" id="viewLargerImage">
    <img alt="书籍封面图片" width="300" height="300" id="viewImage" style="margin-left: 100px;margin-top: 40px">
</div>
<!-- 查看大图弹出层结束 -->


<!-- 添加和修改的弹出层开始 -->
<div style="display: none" id="addAndEditModel">

    <form class="layui-form " action="" lay-filter="DataForm" id="DataForm" style="margin: 10px">
        <blockquote class="layui-elem-quote">
            <i class="layui-icon layui-blue">&#xe609;</i>
            书籍信息管理
        </blockquote>

        <div class="layui-col-md12 layui-col-xs12">

            <div class="layui-row layui-col-space10">
                <div class="layui-col-md9 layui-col-xs7">

                    <div class="layui-form-item">
                        <label class="layui-form-label">图书编码</label>
                        <div class="layui-input-block">
                            <input type="text" name="bookId" autocomplete="off" class="layui-input" readonly="readonly">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">图书名称</label>
                        <div class="layui-input-block">
                            <input type="text" name="bookName" autocomplete="off" class="layui-input"
                                   placeholder="请输入图书名称">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">作者</label>
                        <div class="layui-input-block">
                            <input type="text" name="bookAuthor" autocomplete="off" class="layui-input"
                                   placeholder="请输入作者姓名">
                        </div>
                    </div>

                </div>

                <!-- 图书封面图片上传 -->
                <div class="layui-col-md3 layui-col-xs5">
                    <div class="layui-upload-list thumbBox mag0 magt3" id="uploadImgId">
                        <img class="layui-upload-img thumbImg" id="showImgId">
                        <input type="hidden" name="bookImageUrl" id="hiddenUrl">
                    </div>
                </div>

            </div>

            <div class="layui-form-item magb2">
                <label class="layui-form-label">出版社</label>
                <div class="layui-input-block">
                    <input type="text" name="bookPress" class="layui-input " lay-verify="required"
                           placeholder="请输入出版社名称">
                </div>
            </div>

            <div class="layui-form-item magb2">
                <label class="layui-form-label">包装类型</label>
                <div class="layui-input-block">
                    <select name="bookPack">
                        <option value="">请选择图书包装类型</option>
                        <option value="精装书">精装书</option>
                        <option value="平装书">平装书</option>
                        <option value="异型书">异型书</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item magb2">
                <label class="layui-form-label">图书分类</label>
                <div class="layui-input-block">
                    <select name="bookType">
                        <option value="">请选择图书分类</option>
                        <option value="诗歌童谣">诗歌童谣</option>
                        <option value="童话寓言">童话寓言</option>
                        <option value="图画文学">图画文学</option>
                        <option value="儿童故事">儿童故事</option>
                        <option value="儿童小说">儿童小说</option>
                        <option value="国学启蒙">国学启蒙</option>
                        <option value="儿童科学">儿童科学</option>
                        <option value="儿童散文">儿童散文</option>
                        <option value="儿童戏剧">儿童戏剧</option>
                        <option value="儿童影视">儿童影视</option>
                        <option value="挂图卡片">挂图卡片</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item magb2">
                <label class="layui-form-label">图书状态</label>
                <div class="layui-input-block">
                    <select name="bookState">
                        <option value="">请选择图书状态</option>
                        <option value="1">上架</option>
                        <option value="0">下架</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item magb2">
                <label class="layui-form-label">图书册数</label>
                <div class="layui-input-inline">
                    <input type="text" name="bookStockNumber" class="layui-input " lay-verify="required|number"
                           placeholder="请输入图书数量">
                </div>

                <label class="layui-form-label">购买价格</label>
                <div class="layui-input-inline">
                    <input type="text" name="bookBuyPrice" class="layui-input " lay-verify="required|number"
                           placeholder="请输入购买价格">
                </div>

                <label class="layui-form-label">出售价格</label>
                <div class="layui-input-inline">
                    <input type="text" name="bookSellPrice" class="layui-input " lay-verify="required|number"
                           placeholder="请输入出售价格">
                </div>
            </div>

            <div class="layui-form-item magb2">
                <label class="layui-form-label">备注说明</label>
                <div class="layui-input-block">
                    <textarea name="bookInfo" placeholder="请输入备注信息" lay-verify="required"
                              class="layui-textarea"></textarea>
                </div>
            </div>

            <div class="layui-form-item" align="center">
                <div class="layui-input-label">
                    <button type="button" class="layui-btn layui-icon layui-icon-ok-circle" lay-submit=""
                            lay-filter="doAddSubmit" id="doAddSubmit">&nbsp;提交
                    </button>
                    <button type="reset" class="layui-btn layui-icon layui-btn-danger layui-icon-refresh">&nbsp;重置
                    </button>
                </div>
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

        // 渲染表格数据
        tableIns = table.render({
            elem: '#GeneralTable'
            , url: '${Path}/book/loadBookInfo'
            , toolbar: '#toolbarDemo'
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
                    field: 'bookStockNumber', title: '库存量', align: "center", templet: function (data) {
                        return '<font color="#1e90ff">' + data.bookStockNumber + '册' + '</font>';
                    }
                }
                , {field: 'bookBuyPrice', title: '进货价', align: "center",templet:function (data) {
                        return '<font color="#b22222">' + data.bookBuyPrice + '元' + '</font>';
                    }}
                , {field: 'bookSellPrice', title: '出售价', align: "center",templet:function (data) {
                        return '<font color="red">' + data.bookSellPrice + '元' + '</font>';
                    }}
                , {field: 'bookPack', title: '包装类型', align: "center"}
                , {field: 'bookState', title: '状态', align: "center", templet: '#switchTpl'}
                , {
                    field: 'bookImageUrl', title: '缩略图', align: "center", templet: function (d) {
                        return "<img width=40 height=40 src=${Path}/file/showImgFileInformation?path=" + d.bookImageUrl + "/>";
                    }
                }
                , {field: 'bookInfo', title: '备注说明', align: "center"}
                , {field: 'createTime', title: '录入时间', width: 180, align: "center"}
                , {field: 'createUserName', title: '创建人', align: "center"}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 200, align: "center"}
            ]]
        });

        //给查询按钮添加单击事件
        $("#doSearch").click(function () {
            //获取表单提交的数据序列
            var parameter = $("#searchFrom").serialize();
            console.log(parameter);
            tableIns.reload({
                url: "${Path}/book/loadBookInfo?" + parameter,
                page: {curr: 1}
            });
        });


        //监听头工具栏添加按钮和删除按钮事件
        /* table.on('toolbar(GeneralTable)', function (obj) {
             switch (obj.event) {
                 case 'add':
                     addInfoModel();
             }
             ;
         });*/

        //监听行工具删除和修改按钮事件
        table.on('tool(GeneralTable)', function (obj) {
            var tableData = obj.data;  //获取到单击行的数据
            if (obj.event === 'delete') {
                deleteInfoModel(tableData);
            } else if (obj.event === 'edit') {
                updateInfoModel(tableData);
            } else if (obj.event === 'view') {
                OpenViewModel(tableData);
            }
        });


        // 添加的模态框
        var maxIndex;
        var url;

        // 删除
        function deleteInfoModel(tableData) {
            layer.confirm('确定删除【' + tableData.bookName + '】书籍信息吗？', {
                icon: 3,
                title: "提示",
                skin: 'layui-layer-lan',
                btnAlign: 'c'
            }, function () {
                $.post("${Path}/book/deleteBookInfo?", {bookId: tableData.bookId}, function (returnValue) {
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
        function updateInfoModel(data) {
            maxIndex = layer.open({
                type: 1,
                title: "修改书籍信息",
                content: $('#addAndEditModel'),
                area: ["970px", "550px"],
                anim: 5,
                skin: "layui-layer-molv",
                closeBtn: 2,
                success: function (index) {
                    //给表单赋值
                    form.val("DataForm", data);
                    //加载图片
                    $("#showImgId").attr("src", "${Path}/file/showImgFileInformation?path=" + data.bookImageUrl);
                    $('#uploadImgId').css("background", "#fff");
                    url = "${Path}/book/updateBookInfo";
                }
            });
        }

        //点击查看大图
        function OpenViewModel(tableData) {
            maxIndex = layer.open({
                type: 1,
                title: "【" + tableData.bookName + "】图书封面",
                content: $('#viewLargerImage'),
                area: ["550px", "460px"],
                anim: 5,
                skin: "layui-layer-lan",
                closeBtn: 2,
                success: function (index) {
                    $("#viewImage").attr("src", "${Path}/file/showImgFileInformation?path=" + tableData.bookImageUrl);
                }
            });
        }

        //保存添加或修改的用户数据
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


    });

</script>

</body>
</html>
