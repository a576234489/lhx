<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>漏损率排行榜</title>
    <link href="/static/scripts/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jqgrid/jqgrid.css" rel="stylesheet"/>
    <link href="/static/scripts/plugins/datetime/datetime.css" rel="stylesheet"/>
    <link href="/static/styles/learun-ui.css" rel="stylesheet"/>
    <style>
        html, body {
            height: 100%;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="ui-layout" id="layout" style="height: 100%; width: 100%;">
    <div class="ui-layout-west">
        <div class="west-Panel" style="border-left: none;border-right: none;border-bottom: none;">
            <div class="panel-Title" style="border-left: 1px solid #ccc;border-right: 1px solid #ccc;">漏损率排行榜</div>
            <div class="titlePanel" style="line-height:40px;height:40px;border-top: none;">
                <div class="title-search">
                    <table>
                        <tr>
                            <td>日期：</td>
                            <td style="padding-left: 10px;">
                                <div class="ui-filter" style="width: 200px;">
                                    <div class="ui-filter-text">
                                        <strong id="SelectedStartTime">2018-04-13</strong> 至 <strong id="SelectedEndTime">2018-04-20</strong>
                                    </div>
                                    <div class="ui-filter-list" style="width: 350px;">
                                        <table class="form" id="filter-form">
                                            <tr>
                                                <th class="formTitle">统计时间：</th>
                                                <td class="formValue">
                                                    <div style="float: left; width: 45%;">
                                                        <input id="StartTime" readonly type="text" value="2018-04-13" class="form-control input-wdatepicker" onfocus="WdatePicker({maxDate:'%y-%M-%d'})">
                                                    </div>
                                                    <div style="float: left; width: 10%; text-align: center;">至</div>
                                                    <div style="float: left; width: 45%;">
                                                        <input id="EndTime" readonly type="text" value="2018-04-20" class="form-control input-wdatepicker" onfocus="WdatePicker({maxDate:'%y-%M-%d'})">
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="ui-filter-list-bottom">
                                            <a id="btn_Cancel" class="btn btn-default">&nbsp;取&nbsp;&nbsp;消</a>
                                            <a id="btn_Search" class="btn btn-primary">&nbsp;确&nbsp;&nbsp;定</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td style="padding-left: 10px;">
                                <div id="time_horizon" class="btn-group">
                                    <a class="btn btn-default" data-value="1">今天</a>
                                    <a class="btn btn-default active" data-value="2">近7天</a>
                                    <a class="btn btn-default" data-value="3">近1个月</a>
                                    <a class="btn btn-default" data-value="4">近3个月</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="gridPanel">
                <table id="gridTable" ></table>
            </div>
        </div>
    </div>
    <div class="ui-layout-center">
        <div class="center-Panel">
            <div class="panel-Title">漏损统计图表</div>
            <div class="row" style="overflow: hidden;">
                <div style="width: 50%; float: left;">
                    <div class="portal-panel-title">
                        &nbsp;&nbsp;<i class="fa fa-dashboard"></i>&nbsp;&nbsp;漏损率（%）
                    </div>
                    <div class="portal-panel-content" style="margin-top: 0px; overflow: hidden;">
                        <div id="statChart1">
                        </div>
                    </div>
                </div>
                <div style="width: 50%; float: left;">
                    <div class="portal-panel-title">
                        &nbsp;&nbsp;<i class="fa fa-pie-chart"></i>&nbsp;&nbsp;用水漏水量（%）
                    </div>
                    <div class="portal-panel-content" style="margin-top: 0px; overflow: hidden;">
                        <div id="statChart2" class="border-left"></div>
                    </div>
                </div>
            </div>
            <div class="row" style="overflow: hidden;">
                <div style="width: 100%; float: left;">
                    <div class="portal-panel-title" style="border-top: 1px solid #ccc;color: #666;">
                        &nbsp;&nbsp;<i class="fa fa-line-chart"></i>&nbsp;&nbsp;漏损率变化曲线图（%）
                    </div>
                    <div class="portal-panel-content" style="margin-top: 0px; overflow: hidden;">
                        <div id="statChart3">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/static/scripts/jquery/jquery-1.12.4.min.js"></script>
<script src="/static/scripts/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="/static/scripts/bootstrap/bootstrap.min.js"></script>
<script src="/static/scripts/plugins/echarts/echarts.js"></script>
<script src="/static/scripts/plugins/layout/jquery.layout.js"></script>
<script src="/static/scripts/plugins/datepicker/WdatePicker.js"></script>
<script src="/static/scripts/plugins/jqgrid/jqgrid.js"></script>
<script src="/static/scripts/plugins/datepicker/datepicker.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script>
    $(function () {
        InitialPage();
        GetGrid();
        $(".row").height(($(window).height() - 52) / 2);
        $("#statChart1").height(($(window).height()) / 2);
        $("#statChart2").height(($(window).height()) / 2);
        $("#statChart3").height(($(window).height()) / 2 - 18);
        LoadChart("0", "0", "100");
        LoadChart(-1);
    });
    //初始化页面
    function InitialPage() {
        //layout布局
        $('#layout').layout({
            applyDemoStyles: true,
            west__size: 540,
            onresize: function () {
                $(window).resize()
            }
        });
        //resize重设(表格、树形)宽高
        $(window).resize(function (e) {
            window.setTimeout(function () {
                $("#gridTable").setGridHeight($(window).height() - 122);
                $(".row").height(($(window).height() - 52) / 2);
                $("#statChart1").height(($(window).height()) / 2);
                $("#statChart2").height(($(window).height()) / 2);
                $("#statChart3").height(($(window).height()) / 2 - 18);
            }, 200);
            e.stopPropagation();
        });
    }
    //加载表格
    function GetGrid() {
        var selectedRowIndex = 0;
        var $gridTable = $("#gridTable");
        var queryJson = $("#filter-form").GetWebControls();
        $gridTable.jqGrid({
            url: "../../LeakageAnalyze/LeakageSortAnalyze/GetListJson",
            postData: { queryJson: JSON.stringify(queryJson) },
            datatype: "json",
            height: $(window).height() - 122,
            autowidth: true,
            shrinkToFit: true,
            colModel: [
                { name: 'areaid', label: '主键', hidden: true },
                { name: 'areaname', label: 'DMA分区名称', index: "areaname", width: 150, align: 'left' },
                { name: "leakagevalue", label: "漏水量（m³)", index: "leakagevalue", width: 100, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { name: "flowvalue", label: "供水量（m³)", index: "flowvalue", width: 100, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { name: "leakagerate", label: "漏损率（%）", index: "leakagerate", hidden: true, formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 1 } },
                {
                    label: "漏损率（%）", name: "leakageratevalue", index: "leakageratevalue", width: 70, align: "center",
                    formatter: function (cellvalue, options, rowObject) {
                        if (cellvalue <= 15) {
                            return "<span class=\"label label-green-learun\">" + cellvalue.toFixed(1) + "</span>";
                        } else if(cellvalue <= 30){
                            return "<span class=\"label label-yellow-learun\">" + cellvalue.toFixed(1) + "</span>";
                        } else {
                            return "<span class=\"label label-red-learun\">" + cellvalue.toFixed(1) + "</span>";
                        }
                    }
                },
            ],
            rowNum: "10000",
            rownumbers: true,
            onSelectRow: function () {
                selectedRowIndex = $("#" + this.id).getGridParam('selrow');
                var rowData = $("#" + this.id).jqGrid('getRowData', $("#" + this.id).jqGrid('getGridParam', 'selrow'));
                var leakRate = rowData['leakagerate'];
                var leakValue = rowData['leakagevalue'];
                var flowValue = rowData['flowvalue'];
                var areaId = rowData['areaid'];
                LoadChart(leakRate, leakValue, flowValue);
                LoadChart3(areaId);
            },
            gridComplete: function () {
                $("#" + this.id).setSelection(selectedRowIndex, false);
                var pSelectedRowIndex = $("#" + this.id).getGridParam('selrow');
                if (pSelectedRowIndex > -1) {
                    var rowData = $("#" + this.id).jqGrid('getRowData', pSelectedRowIndex);
                    var leakRate = rowData['leakagerate'];
                    var leakValue = rowData['leakagevalue'];
                    var flowValue = rowData['flowvalue'];
                    var areaId = rowData['areaid'];
                    LoadChart(leakRate, leakValue, flowValue);
                    LoadChart3(areaId);
                }
                else {
                    alert(pSelectedRowIndex);
                    $("#" + this.id).setSelection(1, true);
                    pSelectedRowIndex = $("#" + this.id).getGridParam('selrow');
                    alert(pSelectedRowIndex);
                    if (pSelectedRowIndex > -1) {
                        var rowData = $("#" + this.id).jqGrid('getRowData', pSelectedRowIndex);
                        var leakRate = rowData['leakagerate'];
                        var leakValue = rowData['leakagevalue'];
                        var flowValue = rowData['flowvalue'];
                        var areaId = rowData['areaid'];
                        LoadChart(leakRate, leakValue, flowValue);
                        LoadChart3(areaId);
                    }
                }
            }
        });
        //var rowData = $gridTable.jqGrid('getRowData', 0);
        //$gridTable.setSelection(0, true);

        //点击时间范围（今天、近7天、近一个月、近三个月）
        $("#time_horizon a.btn-default").click(function () {
            $("#time_horizon a.btn-default").removeClass("active");
            $(this).addClass("active");
            switch ($(this).attr('data-value')) {
                case "1"://今天
                    $("#StartTime").val("2018-04-20");
                    $("#EndTime").val("2018-04-20");
                    break;
                case "2"://近7天
                    $("#StartTime").val("2018-04-13");
                    $("#EndTime").val("2018-04-20");
                    break;
                case "3"://近一个月
                    $("#StartTime").val("2018-03-20");
                    $("#EndTime").val("2018-04-20");
                    break;
                case "4"://近三个月
                    $("#StartTime").val("2018-01-20");
                    $("#EndTime").val("2018-04-20");
                    break;
                default:
                    break;
            }
            $("#SelectedStartTime").html($("#StartTime").val());
            $("#SelectedEndTime").html($("#EndTime").val());
            SearchEvent();
        });
        //查询点击事件
        $("#btn_Search").click(function () {
            SearchEvent();
            $(".ui-filter-text").trigger("click");
            $("#SelectedStartTime").html($("#StartTime").val());
            $("#SelectedEndTime").html($("#EndTime").val());
        });
        //取消点击事件
        $("#btn_Cancel").click(function () {
            $(".ui-filter-text").trigger("click");
        });
        //查询表格函数
        function SearchEvent() {
            var queryJson = $("#filter-form").GetWebControls();
            $("#gridTable").jqGrid('setGridParam', {
                postData: { queryJson: JSON.stringify(queryJson) }
            }).trigger('reloadGrid');
        }
    }

    var option1 = {
        tooltip: {
            formatter: "{a} <br/>{b} : {c}%"
        },
        toolbox: {
            show: true,
            feature: {
                mark: { show: true },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        series: [
            {
                name: '供水管网分区',
                type: 'gauge',
                center: ['50%', '45%'],
                radius: [0, '70%'],
                splitNumber: 10,       // 分割段数，默认为5
                axisLine: {            // 坐标轴线
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: [[0.15, '#228b22'], [0.3, '#ffbc00'], [1, '#ff4500']], // color: [[0.12, '#228b22'], [0.2, '#48b'], [1, '#ff4500']],
                        width: 8
                    }
                },
                axisTick: {            // 坐标轴小标记
                    splitNumber: 10,   // 每份split细分多少段
                    length: 12,        // 属性length控制线长
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: 'auto'
                    }
                },
                axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'auto'
                    }
                },
                splitLine: {           // 分隔线
                    show: true,        // 默认显示，属性show控制显示与否
                    length: 20,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                        color: 'auto'
                    }
                },
                pointer: {
                    width: 5
                },
                title: {
                    show: true,
                    offsetCenter: [0, '-30%'],       // x, y，单位px
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        fontWeight: 'bolder'
                    }
                },
                detail: {
                    formatter: '{value}%',
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'auto',
                        fontSize: 20,
                        fontWeight: 'bolder'
                    }
                },
                data: [{ value: 0, name: '漏损率' }]
            }
        ]
    };

    option2 = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        toolbox: {
            show: true,
            feature: {
                mark: { show: true },
                restore: { show: true },
                saveAsImage: { show: true }
            }
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: ['漏水量', '用水量']
        },
        calculable: true,
        series: [
            {
                name: '用水漏水量（m³）',
                type: 'pie',
                radius: '60%',
                itemStyle: {
                    normal: {
                        label: {
                            position: 'inner',
                            formatter: function (params) {
                                return (params.percent - 0).toFixed(0) + '%'
                            }
                        },
                        labelLine: {
                            show: false
                        }
                    }
                },
                center: ['50%', '40%'],
                data: [
                    { value: 26, name: '漏水量' },
                    { value: 235, name: '用水量' }
                ]
            }
        ]
    };


    function LoadChart(leakRate, leakValue, flowValue) {
        if (leakRate == undefined)
            leakRate = "0";
        option1.series[0].data[0].value = Number(leakRate);
        var myChart1 = echarts.init(document.getElementById('statChart1'), 'macarons');
        myChart1.setOption(option1, true);

        if (leakValue == undefined)
            leakValue = "0";
        if (flowValue == undefined)
            flowValue = "100";
        option2.series[0].data[0].value = Number(leakValue);
        option2.series[0].data[1].value = Number(flowValue) - Number(leakValue);
        var myChart2 = echarts.init(document.getElementById('statChart2'), 'default');
        myChart2.setOption(option2, true);
    }

    function LoadChart3(areaId) {
        var postData = $("#filter-form").GetWebControls();
        postData["AreaId"] = areaId;
        $.ajax({
            url: "../../LeakageAnalyze/LeakageSortAnalyze/GetChartJson",
            data: { queryJson: JSON.stringify(postData) },
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data) {
                    var myChart = echarts.init(document.getElementById('statChart3'), 'macarons');
                    myChart.setOption(data);
                }
            }
        });
    }
</script>
</body>
</html>
