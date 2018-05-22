<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>历史数据查询</title>
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/static/scripts/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jqgrid/jqgrid.css" rel="stylesheet"/>
    <link href="/static/scripts/plugins/tree/tree.css" rel="stylesheet"/>
    <link href="/static/scripts/plugins/datetime/datetime.css" rel="stylesheet"/>
    <link href="/static/styles/learun-ui.css" rel="stylesheet"/>
    <style>
        body {
            margin: 10px 10px 0 10px;
        }
    </style>
</head>
<body>
<div class="titlePanel">
    <div class="title-search">
        <table>
            <tr>
                <td>站点：</td>
                <td style="padding-left: 10px;">
                    <div id="MeterList" style="width: 200px;" type="select" class="ui-select" >
                    </div>
                </td>
                <td style="padding-left: 10px;">日期：</td>
                <td style="padding-left: 10px;">
                    <div class="ui-filter" style="width: 200px;">
                        <div class="ui-filter-text">
                            <strong id="SelectedStartTime">2018-04-13</strong> 至 <strong id="SelectedEndTime">2018-04-20</strong>
                        </div>
                        <div class="ui-filter-list" style="width: 350px;">
                            <table class="form" id="filter-form">
                                <tr>
                                    <th class="formTitle">查询时间段：</th>
                                    <td class="formValue">
                                        <input type="hidden" id="MeterId" />
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
<script src="/static/scripts/jquery/jquery-1.12.4.min.js"></script>
<script src="/static/scripts/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="/static/scripts/bootstrap/bootstrap.min.js"></script>
<script src="/static/scripts/plugins/layout/jquery.layout.js"></script>
<script src="/static/scripts/plugins/datepicker/WdatePicker.js"></script>
<script src="/static/scripts/plugins/jqgrid/jqgrid.js"></script>
<script src="/static/scripts/plugins/tree/tree.js"></script>
<script src="/static/scripts/plugins/datepicker/datepicker.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script>
    $(function () {
        InitialPage();
        GetGrid();
    });
    //初始化页面
    function InitialPage() {
        //resize重设(表格、树形)宽高
        $(window).resize(function (e) {
            window.setTimeout(function () {
                $('#gridTable').setGridWidth(($('.gridPanel').width()));
                $("#gridTable").setGridHeight($(window).height() - 136.5);
            }, 200);
            e.stopPropagation();
        });
        //监测点列表
        $("#MeterList").ComboBox({
            url: "../../LeakageConfig/MeterInfoManage/GetListJson",
            id: "MeterId",
            text: "M_Name",
            description: "==请选择==",
            height: "250px",
            allowSearch: true
        }).bind("change", function () {
            $("#MeterId").val($(this).attr('data-value'));
            var queryJson = $("#filter-form").GetWebControls();
            $("#gridTable").jqGrid('setGridParam', {
                postData: { queryJson: JSON.stringify(queryJson) },
                page: 1
            }).trigger('reloadGrid');
        });
    }
    //加载表格
    function GetGrid() {
        var selectedRowIndex = 0;
        var $gridTable = $("#gridTable");
        var queryJson = $("#filter-form").GetWebControls();
        $gridTable.jqGrid({
            url: "../../LeakageQuery/HistoryData/GetPageListJson",
            postData: { queryJson: JSON.stringify(queryJson) },
            datatype: "json",
            height: $(window).height() - 136.5,
            autowidth: true,
            colModel: [
                { name: 'ID', label: '主键', hidden: true },
                { name: 'M_Name', label: '站点名称', width: 160, align: 'left' },
                { name: 'M_PipeDn', label: '管径大小', width: 80, align: 'left' },
                { name: 'M_Material', label: '管线材质', width: 80, align: 'left' },
                { name: 'M_InstallAddress', label: '安装地址', width: 200, align: 'left' },
                { name: "RealValue", label: "瞬时流量（m³/h)", width: 125, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { name: "ForValue", label: "正向累计流量（m³)", width: 130, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { name: "RevValue", label: "反向累计流量（m³)", width: 130, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { name: "PressValue", label: "管道压力（Mpa)", width: 110, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { name: "CelVal", label: "电池电压（V)", width: 110, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { name: "CreateTime", label: "采集时间", width: 120, align: "right" }
            ],
            viewrecords: true,
            rowNum: 20,
            rowList: [10, 20, 30, 50, 100],
            pager: "#gridPager",
            sortname: 'CreateTime DESC',
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

        var rowData = $("#" + this.id).jqGrid('getRowData', 0);
        $("#" + this.id).setSelection(selectedRowIndex, false);
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
            $("#MeterId").val($("#MeterList").attr('data-value'));
            var queryJson = $("#filter-form").GetWebControls();
            $("#gridTable").jqGrid('setGridParam', {
                postData: { queryJson: JSON.stringify(queryJson) },
                page: 1
            }).trigger('reloadGrid');
        }
    }

</script>
</body>
</html>
