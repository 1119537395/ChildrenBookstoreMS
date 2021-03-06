<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍销售数量统计</title>
</head>
<body>
<div id="container" style="height: 100%"></div>
<script type="text/javascript" src="${Path}/static/echarts/js/echarts.min.js"></script>
<script type="text/javascript" src="${Path}/static/echarts/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

    //发送get请求获取扇形图统计数据
    $.get("${Path}/stats/loadMediaFanChartData",function (data) {
        var dom = document.getElementById("container");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        option = {
            title: {
                text: '书籍销售数量统计',
                subtext: '',
                left: 'center'
            },

            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: data
            },
            series: [
                {
                    name: '销售数量(占比)：',
                    type: 'pie',
                    radius: '70%',
                    center: ['50%', '50%'],
                    data: data,
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        ;
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    });
</script>
</body>
</html>
