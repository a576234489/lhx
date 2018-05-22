<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>管网漏损分析</title>
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
            <div class="panel-Title">DMA分区列表</div>
            <div id="itemTree"></div>
        </div>
    </div>
    <div class="ui-layout-center">
        <div class="center-Panel">
            <div class="panel-Title">管网漏损分析</div>
            <div class="titlePanel" style="line-height:40px;height:40px;">
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
        LoadChart();
    });
    //初始化页面
    function InitialPage() {
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
                //$("#gridTable").setGridHeight($(window).height() - 141);
                $("#gridTable").setGridHeight($(window).height() - 430);
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
            url: "../../LeakageConfig/ARM_Area/GetTreeJson",
            onnodeclick: function (item) {
                AreaId = item.id;
                var queryJson = $("#filter-form").GetWebControls();
                queryJson["AreaId"] = AreaId;
                $("#gridTable").jqGrid('setGridParam', {
                    postData: { queryJson: JSON.stringify(queryJson) }
                }).trigger('reloadGrid');
                LoadChart();
            },
        };
        //初始化
        $("#itemTree").treeview(item);
    }
    //加载表格
    function GetGrid() {
        var selectedRowIndex = 0;
        var $gridTable = $("#gridTable");
        var queryJson = $("#filter-form").GetWebControls();
        queryJson["AreaId"] = AreaId;
        $gridTable.jqGrid({
            url: "../../LeakageAnalyze/PipeLeakageAnalyze/GetPageListJson",
            postData: { queryJson: JSON.stringify(queryJson) },
            datatype: "json",
            height: $(window).height() - 430,
            autowidth: true,
            colModel: [
                { name: 'ID', label: '主键', hidden: true },
                { name: 'AreaName', label: 'DMA分区名称', width: 200, align: 'left' },
                { name: 'CreateDay', label: '日期', width: 100, align: 'left' },
                { name: "InFlow", label: "进水流量（m³)", width: 110, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { name: "OutFlow", label: "出水流量（m³)", width: 110, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { name: "BackgroundLeakage", label: "背景漏水量（m³)", width: 120, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { name: "MNF", label: "最小夜间流量（m³/h)", width: 150, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { name: "BrokenlLeakage", label: "破管漏水量（m³)", width: 120, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } }
            ],
            viewrecords: true,
            rowNum: 20,
            rowList: [10, 20, 30, 50, 100],
            pager: "#gridPager",
            sortname: 'CreateTime ASC',
            rownumbers: true,
            shrinkToFit: false,
            gridview: true,
            onSelectRow: function () {
                selectedRowIndex = $("#" + this.id).getGridParam('selrow');
            },
            gridComplete: function () {
                $("#" + this.id).setSelection(selectedRowIndex, false);
            }
        });
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
            queryJson["AreaId"] = AreaId;
            $("#gridTable").jqGrid('setGridParam', {
                postData: { queryJson: JSON.stringify(queryJson) },
                page: 1
            }).trigger('reloadGrid');
            LoadChart();
        }
    }

    function LoadChart() {
        var postData = $("#filter-form").GetWebControls();
        postData["AreaId"] = AreaId;
        $.ajax({
            url: "../../LeakageAnalyze/PipeLeakageAnalyze/GetChartJson",
            data: { queryJson: JSON.stringify(postData) },
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

