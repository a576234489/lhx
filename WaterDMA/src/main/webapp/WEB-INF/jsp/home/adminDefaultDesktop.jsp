<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的桌面</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="/static/scripts/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/adminLTE/css/index.css" rel="stylesheet" />
    <style>
        #copyrightcontent {
            height: 30px;
            line-height: 29px;
            overflow: hidden;
            position: absolute;
            top: 100%;
            margin-top: -30px;
            width: 100%;
            background-color: #fff;
            border: 1px solid #e6e6e6;
            padding-left: 10px;
            padding-right: 10px;
        }

        .dashboard-stats {
            float: left;
            width: 25%;
        }

        .dashboard-stats-item {
            position: relative;
            overflow: hidden;
            color: #fff;
            cursor: pointer;
            height: 105px;
            margin-right: 10px;
            margin-bottom: 10px;
            padding-left: 15px;
            padding-top: 20px;
        }

        .dashboard-stats-item .m-top-none {
            margin-top: 5px;
        }

        .dashboard-stats-item h2 {
            font-size: 28px;
            font-family: inherit;
            line-height: 1.1;
            font-weight: 500;
            padding-left: 70px;
        }

        .dashboard-stats-item h2 span {
            font-size: 12px;
            padding-left: 5px;
        }

        .dashboard-stats-item h5 {
            font-size: 12px;
            font-family: inherit;
            margin-top: 1px;
            line-height: 1.1;
            padding-left: 70px;
        }


        .dashboard-stats-item .stat-icon {
            position: absolute;
            top: 18px;
            font-size: 50px;
            opacity: .3;
        }

        .dashboard-stats i.fa.stats-icon {
            width: 50px;
            padding: 20px;
            font-size: 50px;
            text-align: center;
            color: #fff;
            height: 50px;
            border-radius: 10px;
        }

        .panel-default {
            border: none;
            border-radius: 0;
            margin-bottom: 0;
            box-shadow: none;
            -webkit-box-shadow: none;
        }

        .panel-default > .panel-heading {
            color: #777;
            background-color: #fff;
            border-color: #e6e6e6;
            padding: 10px 10px;
        }

        .panel-default > .panel-body {
            padding: 10px 10px 0 10px;
        }

        .panel-default > .panel-body ul {
            overflow: hidden;
            padding: 0;
            margin: -5px 0 0 0;
        }

        .panel-default > .panel-body ul li {
            line-height: 27px;
            list-style-type: none;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .panel-default > .panel-body ul li .time {
            color: #a1a1a1;
            float: right;
            padding-right: 5px;
        }
    </style>
</head>
<body style="overflow: hidden; margin: 0px;">
<div id="areascontent" style="margin: 10px 10px 0 10px; overflow: auto;">
    <div class="rows" style="margin-bottom: 0.8%; overflow: hidden;">
        <div style="float: left; width: 69.2%;">
            <div style="height: 100%; border: 1px solid #e6e6e6; overflow: hidden;">
                <div class="dashboard-stats">
                    <div class="dashboard-stats-item" style="background-color: #578ebe;" onclick="OpenNav('7e1e5e0c-5183-42d9-abc9-19f0eb9fbfd6');">
                        <div class="stat-icon">
                            <i class="fa fa-pie-chart"></i>
                        </div>
                        <h2 class="m-top-none">36<span>%</span></h2>
                        <h5>产销差率</h5>
                    </div>
                </div>
                <div class="dashboard-stats">
                    <div class="dashboard-stats-item" style="background-color: #e35b5a;" onclick="OpenNav('5893dc60-9683-456d-92d2-850e8bad029b');">
                        <h2 class="m-top-none">28<span>%</span></h2>
                        <h5>管网漏损率</h5>
                        <div class="stat-icon">
                            <i class="fa fa-bar-chart-o"></i>
                        </div>
                    </div>
                </div>
                <div class="dashboard-stats">
                    <div class="dashboard-stats-item" style="background-color: #44b6ae;" onclick="OpenNav('7e1e5e0c-5183-42d9-abc9-19f0eb9fbfd6');">
                        <h2 class="m-top-none">3<span>个</span></h2>
                        <h5>DMA分区总量</h5>
                        <div class="stat-icon">
                            <i class="fa fa-windows"></i>
                        </div>
                    </div>
                </div>
                <div class="dashboard-stats">
                    <div class="dashboard-stats-item" style="background-color: #8775a7; margin-right: 0px;" onclick="OpenNav('ce445861-579c-4f52-9d7a-5e783715d82d');">
                        <h2 class="m-top-none">0<span>km3</span></h2>
                        <h5>今日供水量</h5>
                        <div class="stat-icon">
                            <i class="fa fa-globe"></i>
                        </div>
                    </div>
                </div>
                <div class="dashboard-stats">
                    <div class="dashboard-stats-item" style="background-color: #4f5c65; margin-bottom: 0px;" onclick="OpenNav('f78c1d62-643f-4034-b312-748e93b85cb3');">
                        <h2 class="m-top-none">6<span>个</span></h2>
                        <h5>监测点总量</h5>
                        <div class="stat-icon">
                            <i class="fa fa-shopping-cart"></i>
                        </div>
                    </div>
                </div>
                <div class="dashboard-stats">
                    <div class="dashboard-stats-item" style="background-color: #14aae4; margin-bottom: 0px;" onclick="OpenNav('f84db46b-648b-4d5f-9f32-075e9c1cce00');">
                        <h2 class="m-top-none">288<span>次</span></h2>
                        <h5>今日采集频率</h5>
                        <div class="stat-icon">
                            <i class="fa fa-file-text-o"></i>
                        </div>
                    </div>
                </div>
                <div class="dashboard-stats">
                    <div class="dashboard-stats-item" style="background-color: #949FB1; margin-bottom: 0px;" onclick="OpenNav('e4ec1958-6625-44b8-8ce9-60ecaf0f87ef');">
                        <h2 class="m-top-none">288<span>个</span></h2>
                        <h5>压力分析统计</h5>
                        <div class="stat-icon">
                            <i class="fa fa-globe"></i>
                        </div>
                    </div>
                </div>
                <div class="dashboard-stats">
                    <div class="dashboard-stats-item" style="background-color: #f29503; margin-right: 0px; margin-bottom: 0px;" onclick="OpenNav('f78c1d62-643f-4034-b312-748e93b85cb3');">
                        <h2 class="m-top-none">0<span>km3</span></h2>
                        <h5>今日售水量</h5>
                        <div class="stat-icon">
                            <i class="fa fa-globe" style="padding-left: 10px;"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="float: right; width: 30%;">
            <div style="height: 221px; border: 1px solid #e6e6e6; background-color: #fff;">
                <div class="panel panel-default">
                    <div class="panel-heading"><i class="fa fa-area-chart fa-lg" style="padding-right: 5px;"></i>漏损率统计</div>
                    <div class="panel-body">
                        <div id="water-supply" style="height: 165px; width: 100%;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="rows" style="margin-bottom: 0.8%; overflow: hidden;">
        <div style="float: left; width: 69.2%;">
            <div style="height: 290px; border: 1px solid #e6e6e6; background-color: #fff;">
                <div class="panel panel-default">
                    <div class="panel-heading"><i class="fa fa-bar-chart fa-lg" style="padding-right: 5px;"></i>供水量统计</div>
                    <div class="panel-body">
                        <div id="leakage-rate" style="height: 230px; width: 100%;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div style="float: right; width: 30%;">
            <div style="height: 290px; border: 1px solid #e6e6e6; background-color: #fff;">
                <div class="panel panel-default">
                    <div class="panel-heading"><i class="fa fa-pie-chart fa-lg" style="padding-right: 5px;"></i>分类型总用水量占比</div>
                    <div class="panel-body">
                        <div id="user-type" style="height: 232px"></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="/static/scripts/jquery/jquery-1.12.4.min.js"></script>
<script src="/static/scripts/plugins/echarts/echarts.js"></script>
<script src="/static/scripts/html5/html5.js"></script>
<script src="/static/scripts/html5/excanvas.js"></script>
<script src="/static/scripts/html5/selectivizr-min.js"></script>
<script>
    $(function () {
        if ($('#areascontent').height() > $(window).height() - 20) {
            $('#areascontent').css("margin-right", "0px");
        }
        $('#areascontent').height($(window).height() - 22);
        $(window).resize(function (e) {
            window.setTimeout(function () {
                $('#areascontent').height($(window).height() - 22);
            }, 200);
        });
        Canvas1();
        Canvas2();
        Canvas3();
    });
    function Canvas1() {
        var scaleData = [
            {
                'name': '工程建设',
                'value': 10
            },
            {
                'name': '产权交易',
                'value': 20
            },
            {
                'name': '土地交易',
                'value': 20
            },
            {
                'name': '其他交易',
                'value': 27
            },
            {
                'name': '政府采购',
                'value': 23
            }
        ];
        var rich = {
            white: {
                color: '#ddd',
                align: 'center',
                padding: [5, 0]
            }
        };
        var placeHolderStyle = {
            normal: {
                label: {
                    show: false
                },
                labelLine: {
                    show: false
                },
                color: 'rgba(0, 0, 0, 0)',
                borderColor: 'rgba(0, 0, 0, 0)',
                borderWidth: 0
            }
        };
        var data = [];
        for (var i = 0; i < scaleData.length; i++) {
            data.push({
                value: scaleData[i].value,
                name: scaleData[i].name,
                itemStyle: {
                    normal: {
                        borderWidth: 5,
                        shadowBlur: 30,
                        borderColor: new echarts.graphic.LinearGradient(0, 0, 1, 1, [{
                            offset: 0,
                            color: '#7777eb'
                        }, {
                            offset: 1,
                            color: '#70ffac'
                        }]),
                        shadowColor: 'rgba(142, 152, 241, 0.6)'
                    }
                }
            }, {
                value: 4,
                name: '',
                itemStyle: placeHolderStyle
            });
        }
        var seriesObj = [{
            name: '',
            type: 'pie',
            clockWise: false,
            radius: [88, 90],
            hoverAnimation: false,
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        position: 'outside',
                        formatter: function(params) {
                            var percent = 0;
                            var total = 0;
                            for (var i = 0; i < scaleData.length; i++) {
                                total += scaleData[i].value;
                            }
                            percent = ((params.value / total) * 100).toFixed(0);
                            if(params.name !== '') {
                                return params.name + '\n{blue|' + '占比' + percent + '%}';
                            }else {
                                return '';
                            }
                        },
                        rich: rich
                    },
                    labelLine: {
                        show: false
                    }
                }
            },
            data: data
        }];
        var option = {
            // backgroundColor: '#04243E',
            tooltip: {
                show: false
            },
            legend: {
                show: false
            },
            toolbox: {
                show: false
            },
            series: seriesObj
        };
        var myChart = echarts.init($('#user-type')[0]);
        myChart.setOption(option);
    }
    function Canvas2() {
        var option = {
            title: {
                text: '漏损率',
                textStyle: {
                    fontWeight: 'normal',
                    fontSize: 16,
                    color: '#F1F1F3'
                },
                left: '6%'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    lineStyle: {
                        color: '#57617B'
                    }
                }
            },
            legend: {
                icon: 'rect',
                itemWidth: 14,
                itemHeight: 5,
                itemGap: 13,
                data: ['漏损率'],
                right: '4%',
                textStyle: {
                    fontSize: 12,
                    color: '#F1F1F3'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: false,
                axisLine: {
                    lineStyle: {
                        color: '#57617B'
                    }
                },
                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
            }],
            yAxis: [{
                type: 'value',
                name: '单位（%）',
                axisTick: {
                    show: false
                },
                axisLine: {
                    lineStyle: {
                        color: '#57617B'
                    }
                },
                axisLabel: {
                    margin: 10,
                    textStyle: {
                        fontSize: 14
                    }
                },
                splitLine: {
                    lineStyle: {
                        color: '#57617B'
                    }
                }
            }],
            series: [{
                name: '漏损率',
                type: 'line',
                smooth: true,
                symbol: 'circle',
                symbolSize: 5,
                showSymbol: false,
                lineStyle: {
                    normal: {
                        width: 1
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: 'rgba(219, 50, 51, 0.3)'
                        }, {
                            offset: 0.8,
                            color: 'rgba(219, 50, 51, 0)'
                        }], false),
                        shadowColor: 'rgba(0, 0, 0, 0.1)',
                        shadowBlur: 10
                    }
                },
                itemStyle: {
                    normal: {

                        color: 'rgb(219,50,51)',
                        borderColor: 'rgba(219,50,51,0.2)',
                        borderWidth: 12
                    }
                },
                data: [220, 182, 125, 145, 122, 191, 134]
            }]
        };
        var myChart = echarts.init($('#leakage-rate')[0]);
        myChart.setOption(option);
    }
    function Canvas3() {
        var option = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    lineStyle: {
                        color: '#57617B'
                    }
                }
            },
            legend: {
                icon: 'rect',
                itemWidth: 14,
                itemHeight: 5,
                itemGap: 13,
                data: ['漏损率'],
                right: '4%',
                textStyle: {
                    fontSize: 12,
                    color: '#ddd'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: false,
                axisLine: {
                    lineStyle: {
                        color: '#57617B'
                    }
                },
                data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
            }],
            yAxis: [{
                type: 'value',
                name: '单位（%）',
                axisTick: {
                    show: false
                },
                axisLine: {
                    lineStyle: {
                        color: '#57617B'
                    }
                },
                axisLabel: {
                    margin: 10,
                    textStyle: {
                        fontSize: 14
                    }
                },
                splitLine: {
                    lineStyle: {
                        color: '#57617B'
                    }
                }
            }],
            series: [{
                name: '漏损率',
                type: 'line',
                smooth: true,
                symbol: 'circle',
                symbolSize: 5,
                showSymbol: false,
                lineStyle: {
                    normal: {
                        width: 1
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: 'rgba(219, 50, 51, 0.3)'
                        }, {
                            offset: 0.8,
                            color: 'rgba(219, 50, 51, 0)'
                        }], false),
                        shadowColor: 'rgba(0, 0, 0, 0.1)',
                        shadowBlur: 10
                    }
                },
                itemStyle: {
                    normal: {

                        color: 'rgb(219,50,51)',
                        borderColor: 'rgba(219,50,51,0.2)',
                        borderWidth: 12
                    }
                },
                data: [220, 182, 125, 145, 122, 191, 134]
            }]
        };
        var myChart = echarts.init($('#water-supply')[0]);
        myChart.setOption(option);
    }
    //跳转到指定模块菜单
    function OpenNav(Navid) {
        top.$("#sidebar-menu").find("a[data-id = '" + Navid + "']").trigger("click");
    }
    function menu() {
        $.ajax({
            url: '',
            type: 'get',
            data: '',
            dataType: 'json',
            success: function (data) {
                var str = '';
                $.each(data, function (i, j) {
                    str +=
                    '<div class="dashboard-stats">\n' +
                        '<div class="dashboard-stats-item" data-id="'+ j.id +'" style="background-color: '+ color(i) +'">\n' +
                            '<div class="stat-icon">\n' +
                                '<i class="fa '+ j.icon +'"></i>\n' +
                            '</div>\n' +
                            '<h2 class="m-top-none">36<span>%</span></h2>\n' +
                            '<h5>'+ j.title +'</h5>\n' +
                        '</div>\n' +
                    '</div>'
                });
                $(str).append()
            }

        })
    }

    function color(i) {
        var color = [
            '#578ebe', '#e35b5a', '#44b6ae', '#8775a7',
            '#4f5c65', '#14aae4', '#949FB1', '#f29503'
        ]
        return color[i]
    }

</script>
</body>
</html>
