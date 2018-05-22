<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>角色管理</title>
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/static/scripts/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jqgrid/jqgrid.css" rel="stylesheet"/>
    <link href="/static/styles/learun-ui.css" rel="stylesheet"/>
    <!–[if lt IE 9]><script src="/static/scripts/html5/json2.js"></script><![endif]–>
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
                            <li><a data-value="ROLE_ID">角色编号</a></li>
                            <li><a data-value="ROLE_NAME">角色名称</a></li>
                        </ul>
                    </div>
                </td>
                <td style="padding-left: 2px;">
                    <input id="txt_Keyword" type="text" class="form-control" placeholder="请输入要查询关键字" style="width: 200px;" />
                </td>
                <td style="padding-left: 5px;">
                    <a id="btn_Search" class="btn btn-primary"><i class="fa fa-search"></i>&nbsp;查询</a>
                </td>
            </tr>
        </table>
    </div>
    <div class="toolbar">
        <div class="btn-group">
            <a id="lr-replace" class="btn btn-default" onclick="reload();"><i class="fa fa-refresh"></i>&nbsp;刷新</a>
            <a id="lr-add" class="btn btn-default" onclick="btn_add()"><i class="fa fa-plus"></i>&nbsp;新增</a>
            <a id="lr-edit" class="btn btn-default" onclick="btn_edit()"><i class="fa fa-pencil-square-o"></i>&nbsp;编辑</a>
            <a id="lr-delete" class="btn btn-default" onclick="btn_delete()"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
        </div>
        <div class="btn-group">
            <a id="lr-member" class="btn btn-default" onclick="btn_member()"><i class="fa fa fa-group"></i>&nbsp;角色成员</a>
            <a id="lr-authorize" class="btn btn-default" onclick="btn_authorize()"><i class="fa fa-gavel"></i>&nbsp;角色授权</a>
        </div>
        <div class="btn-group">
            <a id="lr-appfilter" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-filter"></i>&nbsp;访问过滤<span class="caret"></span>
            </a>
            <ul class="dropdown-menu pull-right">
                <li id="lr-ipfilter"><a onclick="btn_ipfilter()"><i></i>&nbsp;IP过滤</a></li>
                <li id="lr-timefilter"><a onclick="btn_timefilter()"><i></i>&nbsp;时段过滤</a></li>
            </ul>
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
<script src="/static/scripts/plugins/jqgrid/jqgrid.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script src="/static/scripts/plugins/cryptojs/crypto-js.js"></script>
<script src="/static/scripts/plugins/biginteger/BigInteger.js"></script>
<script src="/static/scripts/utils/encrypt.js"></script>
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
    }
    //加载表格
    function GetGrid() {
        var selectedRowIndex = 0;
        var $gridTable = $('#gridTable');
        $gridTable.jqGrid({
            url: "/system/role/GetPageListJson",
            datatype: "json",
            height: $(window).height() - 136.5,
            autowidth: true,
            colModel: [
                { label: '角色编号', name: 'ROLE_ID', index: 'EnCode', width: 150, align: 'left' },
                { label: '角色名称', name: 'ROLE_NAME', index: 'FullName', width: 200, align: 'left' },
                {
                    label: '创建时间', name: 'create_date', index: 'create_date', width: 130, align: 'center',
                    formatter: "date", formatoptions: { srcformat: 'Y-m-d H:i', newformat: 'Y-m-d H:i' }
                },
                {
                    label: "公共", name: "IsPublic", index: "IsPublic", width: 50, align: "center",
                    formatter: function (cellvalue, options, rowObject) {
                        return cellvalue == 1 ? "<i class=\"fa fa-toggle-on\"></i>" : "<i class=\"fa fa-toggle-off\"></i>";
                    }
                },
                {
                    label: "有效", name: "EnabledMark", index: "EnabledMark", width: 50, align: "center",
                    formatter: function (cellvalue, options, rowObject) {
                        return cellvalue == 1 ? "<i class=\"fa fa-toggle-on\"></i>" : "<i class=\"fa fa-toggle-off\"></i>";
                    }
                },
                { label: "角色描述", name: "Description", index: "Description", width: 200, align: "left" }
            ],
            viewrecords: true,
            rowNum: 30,
            rowList: [30, 50, 100],
            pager: "#gridPager",
            sortname: 'ROLE_ID',
            sortorder: 'desc',
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
                postData: { queryJson: JSON.stringify(queryJson) },
                page: 1
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
            id: "Form",
            title: '添加角色',
            url: '/system/role/Form?ACTION=ADD',
            width: "500px",
            height: "360px",
            callBack: function (iframeId) {
                top.frames[iframeId].AcceptClick();
            }
        });
    }
    //编辑
    function btn_edit() {
        var ROLE_ID = $("#gridTable").jqGridRowValue("ROLE_ID");
        var ROLE_NAME = $("#gridTable").jqGridRowValue("ROLE_NAME");
        if (checkedRow(ROLE_ID)) {
            dialogOpen({
                id: "Form",
                title: '修改角色',
                url: '/system/role/Form?ACTION=EDIT&ROLE_ID=' + ROLE_ID + '&ROLE_NAME=' + ROLE_NAME,
                width: "500px",
                height: "360px",
                callBack: function (iframeId) {
                    top.frames[iframeId].AcceptClick();
                }
            });
        }
    }
    //删除
    function btn_delete() {
        var ROLE_ID = $("#gridTable").jqGridRowValue("ROLE_ID");
        if (ROLE_ID) {
            $.RemoveForm({
                url: "/system/role/Form",
                param: {
                    ROLE_ID: ROLE_ID,
                    ACTION: 'DEL'
                },
                success: function (data) {
                    $("#gridTable").trigger("reloadGrid");
                }
            })
        } else {
            dialogMsg('请选择需要删除的角色！', 0);
        }
    }
    //角色成员
    function btn_member() {
        var keyValue = $("#gridTable").jqGridRowValue("RoleId");
        var RoleName = $("#gridTable").jqGridRowValue("FullName");
        if (checkedRow(keyValue)) {
            dialogOpen({
                id: "AllotMember",
                title: '角色成员 - ' + RoleName,
                url: '/system/role/PermissionRole?roleId=' + keyValue,
                width: "800px",
                height: "520px",
                callBack: function (iframeId) {
                    top.frames[iframeId].AcceptClick();
                }
            });
        }
    }
    //角色授权
    function btn_authorize() {
        var ROLE_ID = $("#gridTable").jqGridRowValue("ROLE_ID");
        var NAME = $("#gridTable").jqGridRowValue("NAME");
        if (checkedRow(ROLE_ID)) {
            dialogOpen({
                id: "AllotAuthorize",
                title: '角色授权 - ' + NAME,
                url: '/system/role/PermissionRole?ROLE_ID=' + ROLE_ID,
                width: "700px",
                height: "690px",
                btn: null
            });
        }
    }
    //IP过滤
    function btn_ipfilter() {
        var keyValue = $("#gridTable").jqGridRowValue("RoleId");
        var FullName = $("#gridTable").jqGridRowValue("FullName");
        if (checkedRow(keyValue)) {
            dialogOpen({
                id: "FilterIP",
                title: 'TCP/IP 地址访问限制 - ' + FullName,
                url: '/AuthorizeManage/FilterIP/Index?objectId=' + keyValue + '&objectType=Role',
                width: "600px",
                height: "400px",
                btn: null
            });
        }
    }
    //时段过滤
    function btn_timefilter() {
        var keyValue = $("#gridTable").jqGridRowValue("RoleId");
        var FullName = $("#gridTable").jqGridRowValue("FullName");
        if (checkedRow(keyValue)) {
            dialogOpen({
                id: "FilterTime",
                title: '时段访问过滤 - ' + FullName,
                url: '/AuthorizeManage/FilterTime/Index?objectId=' + keyValue + '&objectType=Role',
                width: "640px",
                height: "480px",
                callBack: function (iframeId) {
                    top.frames[iframeId].AcceptClick();
                }
            });
        }
    }
</script>
</body>
</html>
