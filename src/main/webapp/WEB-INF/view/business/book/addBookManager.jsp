<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>儿童书籍进货管理</title>
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
<body class="childrenBody">
<form class="layui-form layui-row layui-col-space10" action="" lay-filter="addBookFrame" id="addBookFrame">
    <div class="layui-col-md9 layui-col-xs12">
        <div class="layui-row layui-col-space10">
            <div class="layui-col-md9 layui-col-xs7">
                <div class="layui-form-item magt3">
                    <label class="layui-form-label">图书编号</label>
                    <div class="layui-input-block">
                        <input type="text" name="bookId" id="bookId" readonly="readonly" class="layui-input" lay-verify="required" placeholder="请输入图书编号">
                    </div>
                </div>
                <div class="layui-form-item magt3">
                    <label class="layui-form-label">图书名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="bookName" class="layui-input" lay-verify="required" placeholder="请输入图书名称">
                    </div>
                </div>
                <div class="layui-form-item magt3">
                    <label class="layui-form-label">图书作者</label>
                    <div class="layui-input-block">
                        <input type="text" name="bookAuthor" class="layui-input" lay-verify="required" placeholder="请输入图书作者">
                    </div>
                </div>
            </div>
            <div class="layui-col-md3 layui-col-xs5">
                <div class="layui-upload-list thumbBox mag0 magt3" id="uploadImgId">
                    <img class="layui-upload-img thumbImg" id="showImgId">
                    <input type="hidden" name="bookImageUrl" id="hiddenUrl">
                </div>
            </div>
        </div>

        <div class="layui-form-item magt3">
            <label class="layui-form-label">出版社</label>
            <div class="layui-input-block">
                <input type="text" name="bookPress" class="layui-input" lay-verify="required" placeholder="请输入图书出版社信息">
            </div>
        </div>

        <div class="layui-form-item magt3">
            <label class="layui-form-label">图书册数</label>
            <div class="layui-input-block">
                <input type="text" name="bookStockNumber" class="layui-input" lay-verify="required" placeholder="请输入购买图书数量">
            </div>
        </div>

        <div class="layui-form-item magt3">
            <label class="layui-form-label">进货价格</label>
            <div class="layui-input-block">
                <input type="text" name="bookBuyPrice" class="layui-input" lay-verify="required|number" placeholder="请输入购买图书价格(元/本)">
            </div>
        </div>

        <div class="layui-form-item magt3">
            <label class="layui-form-label">出售价格</label>
            <div class="layui-input-block">
                <input type="text" name="bookSellPrice" class="layui-input" lay-verify="required|number" placeholder="请输入图书出售价格(元/本)">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注信息</label>
            <div class="layui-input-block">
                <textarea name="bookInfo" lay-verify="required" placeholder="请输入书籍内容说明" class="layui-textarea" style="height: 150px"></textarea>
            </div>
        </div>


    </div>
    <div class="layui-col-md3 layui-col-xs12">
        <blockquote class="layui-elem-quote title"><i class="seraph icon-caidan"></i> 图书分类</blockquote>
        <div class="border category">
            <input type="radio" name="bookType" value="诗歌童谣" title="诗歌童谣" lay-skin="primary" checked />
            <input type="radio" name="bookType" value="童话寓言" title="童话寓言" lay-skin="primary"/>
            <input type="radio" name="bookType" value="图画文学" title="图画文学" lay-skin="primary"/>
            <input type="radio" name="bookType" value="儿童故事" title="儿童故事" lay-skin="primary"/>
            <input type="radio" name="bookType" value="儿童小说" title="儿童小说" lay-skin="primary"/>
            <input type="radio" name="bookType" value="国学启蒙" title="国学启蒙" lay-skin="primary"/>
            <input type="radio" name="bookType" value="儿童科学" title="儿童科学" lay-skin="primary"/>
            <input type="radio" name="bookType" value="儿童散文" title="儿童散文" lay-skin="primary"/>
            <input type="radio" name="bookType" value="儿童戏剧" title="儿童戏剧" lay-skin="primary"/>
            <input type="radio" name="bookType" value="儿童影视" title="儿童影视" lay-skin="primary"/>
            <input type="radio" name="bookType" value="挂图卡片" title="挂图卡片" lay-skin="primary"/>
        </div>
        <blockquote class="layui-elem-quote title magt10"><i class="layui-icon">&#xe609;</i> 图书状态</blockquote>
        <div class="border">
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="seraph icon-sina"></i> 类　型</label>
                <div class="layui-input-block">
                    <input type="radio" name="bookPack" value="精装书" title="精装书" lay-skin="primary" checked />
                    <input type="radio" name="bookPack" value="平装书" title="平装书" lay-skin="primary" />
                    <input type="radio" name="bookPack" value="异型书" title="异型书" lay-skin="primary" />
                </div>
            </div>
            <div class="layui-form-item newsTop">
                <label class="layui-form-label"><i class="seraph icon-look"></i> 状　态</label>
                <div class="layui-input-block">
                    <input type="radio" name="bookState" value="1" title="上架" lay-skin="primary" checked/>
                    <input type="radio" name="bookState" value="0" title="下架" lay-skin="primary"/>
                </div>
            </div>
            <hr class="layui-bg-gray" />
            <div class="layui-left">
                <a class="layui-btn layui-btn-sm" lay-filter="addBookInfo" lay-submit="" id="addBookInfo"><i class="layui-icon">&#xe654;</i>添加</a>
            </div>
        </div>
    </div>
</form>


<script src="${Path}/static/layui/layui.js" charset="utf-8"></script>
<script>
    var tableIns;
    layui.use(['table', 'layer', 'form', 'jquery','upload'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var upload = layui.upload;
        
        // 默认加载
        loadDefaultContent();

        form.on('submit(addBookInfo)', function () {
            //序列化表单数据
            let params = $("#addBookFrame").serialize();
            $.post("${Path}/book/addBookInfo",params,function (result) {
                layer.msg(result.msg, {
                    icon: 6,
                });
                if (result.code === 200){
                    // 延迟刷新
                    setTimeout(function(){
                        location.reload(true);
                        $.post("${Path}/book/getBookCode",function (map) {
                            $("#bookId").val(map.bookCode);
                        });
                    },2000);
                }
            });
        });
        

        // 默认加载内容
        function loadDefaultContent() {
            // 加载默认图片
            $("#hiddenUrl").val("images/defaultPicture.jpg");
            // 获取随机生成的图书编号
            $.post("${Path}/book/getBookCode",function (map) {
                $("#bookId").val(map.bookCode);
            });
        }

        // 初始化图片上传功能
        upload.render({
            elem: '#uploadImgId',
            url: '${Path}/file/uploadFile',
            field: 'mf',
            acceptMime: 'image/*',
            method: "post",
            done: function (res, index, upload) {
                $('#showImgId').attr('src', "${Path}/file/showImgFileInformation?path=" + res.data.src);
                $("#hiddenUrl").val(res.data.src);
                $('#uploadImgId').css("background", "#fff");
            }
        });
        
    });

</script>

</body>
</html>
