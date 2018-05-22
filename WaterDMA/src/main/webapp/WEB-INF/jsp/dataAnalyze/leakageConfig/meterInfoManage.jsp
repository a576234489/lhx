<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>列表页面</title>
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
                <td>
                    <div id="queryCondition" class="btn-group">
                        <a class="btn btn-default dropdown-text" data-toggle="dropdown">选择条件</a>
                        <a class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a data-value="M_Name">名称</a></li>
                            <li><a data-value="AddressCode">地址编码</a></li>
                            <li><a data-value="M_SIM">SIM卡号</a></li>
                        </ul>
                    </div>
                </td>
                <td style="padding-left: 2px;">
                    <input id="txt_Keyword" type="text" class="form-control" placeholder="请输入要查询关键字" style="width: 200px;" />
                </td>
                <td style="padding-left: 5px;">
                    <a id="btn_Search" class="btn btn-primary"><i class="fa fa-search"></i>查询</a>
                </td>
            </tr>
        </table>
    </div>
    <div class="toolbar">
        <div class="btn-group">
            <a id="lr-replace" class="btn btn-default" onclick="reload()"><i class="fa fa-refresh"></i>&nbsp;刷新</a>
            <a id="lr-add" class="btn btn-default"><i class="fa fa-plus"></i>&nbsp;新增</a>
            <a id="lr-edit" class="btn btn-default"><i class="fa fa-pencil-square-o"></i>&nbsp;编辑</a>
            <a id="lr-delete" class="btn btn-default"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
        </div>
    </div>
</div>
<div class="gridPanel">
    <table id="gridTable"></table>
    <div id="gridPager"></div>
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
        GetGrid();
    });
    //初始化页面
    function InitialPage() {
        //resize重设布局;
        $(window).resize(function (e) {
            window.setTimeout(function () {
                $('#gridTable').setGridWidth(($('.gridPanel').width()));
                $('#gridTable').setGridHeight($(window).height() - 138);
            }, 200);
            e.stopPropagation();
        });
    }
    //加载表格
    function GetGrid() {
        var selectedRowIndex = 0;
        var $gridTable = $('#gridTable');
        //var queryJson = $("#filter-form").GetWebControls();
        $gridTable.jqGrid({
            url: "../../LeakageConfig/MeterInfoManage/GetPageListJson",
            //postData: { queryJson: JSON.stringify(queryJson) },
            datatype: "json",
            height: $(window).height() - 138,
            autowidth: true,
            colModel: [
                { label: '表主键', name: 'MeterId', index: 'MeterId', width: 100, align: 'left', hidden: true },
                { label: '地址编码', name: 'AddressCode', index: 'AddressCode', width: 100, align: 'left'  },
                { label: '名称', name: 'M_Name', index: 'M_Name', width: 140, align: 'left'  },
                { label: '管径大小', name: 'M_PipeDn', index: 'M_PipeDn', width: 80, align: 'left'  },
                { label: '管线材质', name: 'M_Material', index: 'M_Material', width: 80, align: 'left'  },
                { label: '安装地址', name: 'M_InstallAddress', index: 'M_InstallAddress', width: 200, align: 'left'  },
                { label: 'SIM卡号', name: 'M_SIM', index: 'M_SIM', width: 120, align: 'left' },
                { label: '排序索引', name: 'M_SortCode', index: 'M_SortCode', width: 80, align: 'center' },
                { label: '描述', name: 'M_Description', index: 'M_Description', width: 160, align: 'left' },
            ],
            viewrecords: true,
            rowNum: 20,
            rowList: [10, 20, 30, 50, 100],
            pager: "#gridPager",
            sortname: 'M_SortCode ASC',
            rownumbers: true,
            shrinkToFit: false,
            gridview: true,
            onSelectRow: function () {
                selectedRowIndex = $('#' + this.id).getGridParam('selrow');
            },
            gridComplete: function () {
                $('#' + this.id).setSelection(selectedRowIndex, false);
            }
        });
        //查询条件
        $("#queryCondition .dropdown-menu li").click(function () {
            var text = $(this).find('a').html();
            var value = $(this).find('a').attr('data-value');
            $("#queryCondition .dropdown-text").html(text).attr('data-value', value)
        });
        //查询事件
        $("#btn_Search").click(function () {
            var queryJson = {
                condition: $("#queryCondition").find('.dropdown-text').attr('data-value'),
                keyword: $("#txt_Keyword").val()
            }
            $gridTable.jqGrid('setGridParam', {
                postData: { queryJson: JSON.stringify(queryJson) }, page: 1
            }).trigger('reloadGrid');
        });
        //查询回车
        $('#txt_Keyword').bind('keypress', function (event) {
            if (event.keyCode == "13") {
                $('#btn_Search').trigger("click");
            }
        });
    }
    //新增
    function btn_add() {
        dialogOpen({
            id: 'Form',
            title: '添加ARM_Meter',
            url: '/LeakageConfig/MeterInfoManage/Form',
            width: '400px',
            height: '300px',
            callBack: function (iframeId) {
                top.frames[iframeId].AcceptClick();
            }
        });
    }
    //编辑
    function btn_edit() {
        var keyValue = jqGridRowValue('#gridTable', 'MeterId');
        if (checkedRow(keyValue)) {
            dialogOpen({
                id: 'Form',
                title: '编辑ARM_Meter',
                url: '/LeakageConfig/MeterInfoManage/Form?keyValue=' + keyValue,
                width: '400px',
                height: '300px',
                callBack: function (iframeId) {
                    top.frames[iframeId].AcceptClick();
                }
            })
        }
    }
    //删除
    function btn_delete() {
        var keyValue = jqGridRowValue('#gridTable', 'MeterId');
        if (keyValue) {
            $.RemoveForm({
                url: '../../LeakageConfig/MeterInfoManage/RemoveForm',
                param: { keyValue: keyValue },
                success: function (data) {
                    $('#gridTable').trigger('reloadGrid');
                }
            })
        } else {
            dialogMsg('请选择需要删除的ARM_Meter！', 0);
        }
    }
</script>
</body>
</html>
