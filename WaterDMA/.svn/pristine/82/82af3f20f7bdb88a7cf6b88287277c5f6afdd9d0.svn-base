<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>日流量分析</title>
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/static/scripts/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jqgrid/jqgrid.css" rel="stylesheet"/>
    <link href="/static/scripts/plugins/tree/tree.css" rel="stylesheet"/>
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
        <div class="west-Panel">
            <div class="panel-Title">监控站点列表</div>
            <div id="itemTree"></div>
        </div>
    </div>
    <div class="ui-layout-center">
        <div class="center-Panel">
            <div class="panel-Title">日流量分析</div>
            <div class="titlePanel" style="line-height:40px;height:40px;">
                <div class="title-search">
                    <table>
                        <tr>
                            <td>统计日期：</td>
                            <td style="padding-left: 5px;" id="filter-div">
                                <div style="float: left; width: 100px;">
                                    <input id="StartTime" readonly type="text" value="2018-04-19"
                                           class="form-control input-wdatepicker" onfocus="WdatePicker({maxDate:'%y-%M-%d'})">
                                </div>
                            </td>
                            <td style="padding-left: 5px;">时段间隔：</td>
                            <td style="padding-left: 5px;">
                                <div id="queryCondition" class="btn-group">
                                    <a class="btn btn-default dropdown-text" data-value="1" data-toggle="dropdown">1小时</a>
                                    <a class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a data-value="1">1小时</a></li>
                                        <li><a data-value="2">2小时</a></li>
                                        <li><a data-value="3">3小时</a></li>
                                        <li><a data-value="4">4小时</a></li>
                                        <li><a data-value="6">6小时</a></li>
                                        <li><a data-value="8">8小时</a></li>
                                    </ul>
                                </div>
                            </td>
                            <td style="padding-left: 5px;">
                                <a id="btn_Report" class="btn btn-primary"><i class="fa fa-table"></i>&nbsp;生成报表</a>
                            </td>
                            <td style="padding-left: 5px;">
                                <a id="btn_Chart" class="btn btn-primary"><i class="fa fa-bar-chart"></i>&nbsp;生成图表</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="gridPanel">
                <table id="gridTable"></table>
                <div id="gridPager"></div>
            </div>
            <div id="mainChart" class="border-top" style="height:280px"></div>
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
<script src="/static/scripts/plugins/tree/tree.js"></script>
<script src="/static/scripts/plugins/datepicker/datepicker.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script>
    $(function () {
        InitialPage();
        GetTree();
        GetGrid();
        //LoadChart();
    });
    //初始化页面
    function InitialPage() {
        $("#mainChart").hide();
        //layout布局
        $('#layout').layout({
            applyDemoStyles: true,
            onresize: function () {
                $(window).resize()
            }
        });
        //resize重设(表格、树形)宽高
        $(window).resize(function (e) {
            window.setTimeout(function () {
                $('#gridTable').setGridWidth(($('.gridPanel').width()));
                $("#gridTable").setGridHeight($(window).height() - 150);
                $("#itemTree").setTreeHeight($(window).height() - 52);
            }, 200);
            e.stopPropagation();
        });
    }
    //加载树
    var AreaId = -1;
    function GetTree() {
        var item = {
            height: $(window).height() - 52,
            showcheck: true,
            url: "../../LeakageConfig/ARM_Area/GetTreeJsonCheckBox"
        };
        //初始化
        $("#itemTree").treeview(item);
        //查询条件设置
        $("#queryCondition .dropdown-menu li").click(function () {
            var text = $(this).find('a').html();
            var value = $(this).find('a').attr('data-value');
            $("#queryCondition .dropdown-text").html(text).attr('data-value', value)
        });
    }
    //加载表格
    function GetGrid() {
        var $gridTable = $("#gridTable");
        $gridTable.jqGrid({
            datatype: "json",
            height: $(window).height() - 150,
            colModel: [
                { name: '时间', label: '时间', width: 130, align: 'left' },
            ],
            viewrecords: true,
            rowNum: 50,
            rowList: [10, 20, 30, 50, 100],
            pager: "#gridPager",
            rownumbers: false,
            shrinkToFit: false,
            gridview: true,
            onSelectRow: function () {
                selectedRowIndex = $("#" + this.id).getGridParam('selrow');
            },
            gridComplete: function () {
                $("#" + this.id).setSelection(selectedRowIndex, false);
            }
        });
        //生成报表点击事件
        $("#btn_Report").click(function () {
            SearchEvent();
        });
        //生成图表点击事件
        $("#btn_Chart").click(function () {
            LoadChart();
        });
        //查询表格函数
        function SearchEvent() {
            var queryJson = {};
            queryJson["MeterListId"] = String($("#itemTree").getCheckedAllNodes());
            $.ajax({
                url: "../../FlowAnalyze/AnalyzeFlowDay/GetGridColumnJson",
                data: { queryJson: JSON.stringify(queryJson) },
                type: "post",
                dataType: "json",
                success: function (resultObj) {
                    if (resultObj) {
                        GetGridColumns(resultObj);
                    }
                }
            });
            //LoadChart();
        }
    }
    //加载表格
    function GetGridColumns(resultObj) {
        $("#mainChart").hide();
        $(".gridPanel").show();
        var newColMs = eval(resultObj.ColMs);
        var selectedRowIndex = 0;
        var $gridTable = $("#gridTable");
        $gridTable.jqGrid('GridUnload');
        $gridTable = $("#gridTable");
        var queryJson = $("#filter-div").GetWebControls();
        queryJson["MeterListId"] = String($("#itemTree").getCheckedAllNodes());
        queryJson["StartTime"] = $("#StartTime").val();
        queryJson["SpanNumber"] = $("#queryCondition .dropdown-text").attr('data-value');
        $gridTable.jqGrid({
            url: "../../FlowAnalyze/AnalyzeFlowDay/GetReportJson",
            postData: { queryJson: JSON.stringify(queryJson) },
            datatype: "json",
            height: $(window).height() - 150,
            colModel: newColMs,
            viewrecords: true,
            rowNum: 50,
            rowList: [10, 20, 30, 50, 100],
            pager: "#gridPager",
            rownumbers: false,
            shrinkToFit: false,
            gridview: true,
            onSelectRow: function () {
                selectedRowIndex = $("#" + this.id).getGridParam('selrow');
            },
            gridComplete: function () {
                $("#" + this.id).setSelection(selectedRowIndex, false);
            }
        }).trigger('reloadGrid');
    }

    function LoadChart() {
        $(".gridPanel").hide();
        $("#mainChart").show();
        $("#mainChart").height($(window).height() - 93);
        var queryJson = $("#filter-div").GetWebControls();
        queryJson["MeterListId"] = String($("#itemTree").getCheckedAllNodes());
        queryJson["StartTime"] = $("#StartTime").val();
        queryJson["SpanNumber"] = $("#queryCondition .dropdown-text").attr('data-value');
        $.ajax({
            url: "../../FlowAnalyze/AnalyzeFlowDay/GetChartJson",
            data: { queryJson: JSON.stringify(queryJson) },
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data) {
                    var myChart = echarts.init(document.getElementById('mainChart'), 'macarons');
                    myChart.setOption(data);
                }
            }
        });
    }
</script>
</body>
</html>

