<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>实时监测数据</title>
    <link href="/static/scripts/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/static/scripts/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jqgrid/jqgrid.css" rel="stylesheet"/>
    <link href="/static/styles/learun-ui.css" rel="stylesheet"/>
    <style>
        body {
            margin: 10px 10px 0 10px;
        }
    </style>
</head>
<body>
<div class="gridPanel">
    <table id="gridTable"></table>
</div>
<script src="/static/scripts/jquery/jquery-1.12.4.min.js"></script>
<script src="/static/scripts/bootstrap/bootstrap.min.js"></script>
<script src="/static/scripts/plugins/jqgrid/jqgrid.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script>
    $(function () {
        InitialPage();
        GetGrid();
        setInterval(function () {
            $("#gridTable").trigger("reloadGrid");
        }, 60000);
    });
    //初始化页面
    function InitialPage() {
        //resize重设(表格、树形)宽高
        $(window).resize(function (e) {
            window.setTimeout(function () {
                $('#gridTable').setGridWidth(($('.gridPanel').width()));
                $("#gridTable").setGridHeight($(window).height() - 62);
            }, 200);
            e.stopPropagation();
        });
    }
    function cancelAlarm(addresscode, m_name) {
        $.ConfirmAjax({
            msg: "将取消【" + m_name + "】的告警信息,您确认吗？",
            url: "../../MonitorInfo/RealData/CancelAlarm",
            param: { keyValue: addresscode },
            success: function (data) {
                $("#gridTable").trigger("reloadGrid");
            }
        });
    }

    //加载表格
    function GetGrid() {
        var selectedRowIndex = 0;
        var $gridTable = $("#gridTable");
        $gridTable.jqGrid({
            url: "../../MonitorInfo/RealData/GetListJson",
            datatype: "json",
            height: $(window).height() - 62,
            //autowidth: true,
            colModel: [
                { label: '主键', name: 'meterid', hidden: true },
                { label: '地址码', name: 'addresscode', hidden: true },
                {
                    label: "告警", name: "warnstatus", index: "warnstatus", width: 50, align: "center",
                    formatter: function (cellvalue, options, rowObject) {
                        if (cellvalue != "" && cellvalue != null) {
                            return '<span onclick="cancelAlarm(\'' + rowObject.addresscode + '\',\'' + rowObject.m_name + '\');" class="label label-red-learun" title="'
                                + cellvalue + '">告警</span>';
                        }
                        else {
                            return "";
                        }
                    }
                },
                { label: '站点名称', name: 'm_name', index: 'm_name', width: 150, align: 'left' },
                { label: '管径大小', name: 'm_pipedn', index: 'm_pipedn', width: 120, align: 'left' },
                { label: '管线材质', name: 'm_material', index: 'm_material', width: 75, align: 'left' },
                { label: "瞬时流量（m³/h）", name: "realvalue", index: "realvalue", width: 130, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { label: "正向流量（m³）", name: "forvalue", index: "forvalue", width: 125, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { label: "反向流量（m³）", name: "revvalue", index: "revvalue", width: 125, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { label: "管道压力（MPa）", name: "pressvalue", index: "pressvalue", width: 125, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { label: "电池电压（V）", name: "celval", index: "celval", width: 105, align: "right", formatter: 'number', formatoptions: { thousandsSeparator: "", decimalPlaces: 2 } },
                { label: "最后采集时间", name: "createtime", index: "createtime", width: 140, align: "right", formatter: 'date', formatoptions: { srcformat: 'Y-m-d H:i:s', newformat: 'Y-m-d H:i' } },
                { label: '', name: '', index: '', width: 10, align: 'left' }
            ],
            rowNum: "10000",
            rownumbers: true,
            onSelectRow: function () {
                selectedRowIndex = $("#" + this.id).getGridParam('selrow');
            },
            gridComplete: function () {
                $("#" + this.id).setSelection(selectedRowIndex, false);
            }
        });
    }
</script>
</body>
</html>
