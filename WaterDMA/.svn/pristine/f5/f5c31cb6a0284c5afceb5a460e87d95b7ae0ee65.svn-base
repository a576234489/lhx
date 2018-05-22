<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户管理</title>
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
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
<div class="titlePanel">
    <div class="title-search">
        <table>
            <tr>
                <td>
                    <div id="queryCondition" class="btn-group">
                        <a class="btn btn-default dropdown-text" data-toggle="dropdown">选择条件</a>
                        <a class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a data-value="USERNAME">账户</a></li>
                            <li><a data-value="NAME">姓名</a></li>
                            <li><a data-value="MOBILE">手机</a></li>
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
            <c:if test="${user.add=='1'}">
            <a id="lr-add" class="btn btn-default" onclick="btn_add()"><i class="fa fa-plus"></i>&nbsp;新增</a>
            </c:if>
            <c:if test="${user.edit=='1'}">
            <a id="lr-edit" class="btn btn-default" onclick="btn_edit()"><i class="fa fa-pencil-square-o"></i>&nbsp;编辑</a>
            </c:if>
            <c:if test="${user.del=='1'}">
            <a id="lr-delete" class="btn btn-default" onclick="btn_delete()"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
            </c:if>
            <a id="lr-revisepassword" class="btn btn-default" onclick="btn_revisepassword()"><i class="fa fa-key"></i>&nbsp;重置密码</a>
            <a id="lr-more" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <i class="fa fa-reorder"></i>&nbsp;更多<span class="caret"></span>
            </a>
            <ul class="dropdown-menu pull-right">
                <li id="lr-export"><a onclick="btn_export()"><i></i>&nbsp;导出Excel</a></li>
                <li id="lr-disabled"><a onclick="btn_disabled()"><i></i>&nbsp;禁用账户</a></li>
                <li id="lr-enabled"><a onclick="btn_enabled()"><i></i>&nbsp;启用账户</a></li>
            </ul>
        </div>
        <div class="btn-group">
            <a id="lr-authorize" class="btn btn-default" onclick="btn_authorize()"><i class="fa fa-gavel"></i>&nbsp;用户权限</a>
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
                $("#gridTable").setGridHeight($(window).height() - 120);
            }, 200);
            e.stopPropagation();
        });
    }
    //加载表格
    function GetGrid() {
    	if(${user.cha}==1){
        var selectedRowIndex = 0;
        var $gridTable = $('#gridTable');
        $gridTable.jqGrid({
            url: "/system/User/GetPageListJson",
            datatype: "json",
            height: $(window).height() - 120,
            autowidth: true,
            colModel: [
                { label: '主键', name: 'USER_ID', hidden: true },
                { label: '角色ID', name: 'ROLE_ID', hidden: true },
                { label: '账户', name: 'USERNAME', index: 'USERNAME', width: 100, align: 'left' },
                { label: '姓名', name: 'NAME', index: 'NAME', width: 100, align: 'left' },
                {
                    label: '性别', name: 'SEX', index: 'SEX', width: 45, align: 'center'
                },
                { label: '手机', name: 'MOBILE', index: 'MOBILE', width: 100, align: 'center' },
                {
                    label: '密码', name: 'PASSWORD', index: 'PASSWORD', width: 200, align: 'left'
                },
                { label: 'ADD_QX', name: 'ADD_QX', index: 'ADD_QX', width: 100, align: 'left' },
                { label: 'CHA_QX', name: 'CHA_QX', index: 'CHA_QX', width: 100, align: 'left' },
                { label: '角色', name: 'ROLE_NAME', index: 'ROLE_NAME', width: 100, align: 'left' },
                {
                    label: "状态", name: "EnabledMark", index: "EnabledMark", width: 50, align: "center",
                    formatter: function (cellvalue, options, rowObject) {
                        if (cellvalue == 1) {
                            return '<span onclick=\"btn_disabled(\'' + rowObject.UserId + '\')\" class=\"label label-success\" style=\"cursor: pointer;\">正常</span>';
                        } else if (cellvalue == 0) {
                            return '<span onclick=\"btn_enabled(\'' + rowObject.UserId + '\')\" class=\"label label-default\" style=\"cursor: pointer;\">禁用</span>';
                        }
                    }
                },
                { lable: '创建日期', name: 'create_date', index: 'create_date', width: 200, align: 'center'},
                { label: "备注", name: "Description", index: "Description", width: 200, align: "left" }
            ],
            viewrecords: true,
            rowNum: 30,
            rowList: [30, 50, 100],
            pager: "#gridPager",
            sortname: 'USER_ID',
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
    }
    //新增
    function btn_add() {
        dialogOpen({
            id: "Form",
            title: '添加用户',
            url: '/system/User/Form?ACTION=ADD',
            width: "750px",
            height: "550px",
            callBack: function (iframeId) {
                top.frames[iframeId].AcceptClick();
            }
        });
    }
    //编辑
    function btn_edit() {
        var USER_ID = $("#gridTable").jqGridRowValue("USER_ID");
        var USERNAME = $("#gridTable").jqGridRowValue("USERNAME");
        var RowData = $("#gridTable").jqGrid("getRowData", $("#gridTable").jqGrid("getGridParam", "selrow"));
        var arr = ['ROLE_ID', 'NAME', 'SEX', 'MOBILE', 'QQ', 'PHONE', 'Email', 'WeChat', 'Description'];
        if (checkedRow(USER_ID)) {
            dialogOpen({
                id: "Form",
                title: '修改用户',
                url: '/system/User/Form?ACTION=EDIT&USER_ID=' + USER_ID + '&USERNAME=' + USERNAME + '&tableData=' + aesEncrypt(tableData(RowData, arr), nonce),
                width: "750px",
                height: "550px",
                callBack: function (iframeId) {
                    top.frames[iframeId].AcceptClick();
                }
            });
        }
    }

    //删除
    function btn_delete() {
        var USER_ID = $("#gridTable").jqGridRowValue("USER_ID");
        if (USER_ID) {
            $.RemoveForm({
                url: "/system/User/Form",
                param: {
                    USER_ID: USER_ID,
                    ACTION: 'DEL'
                },
                success: function (data) {
                    data.result === 'success' ? $("#gridTable").trigger("reloadGrid") : dialogMsg('删除数据失败', 0);
                }
            })
        } else {
            dialogMsg('请选择需要删除的用户！', 0);
        }
    }
    //重置密码
    function btn_revisepassword() {
        var USER_ID = $("#gridTable").jqGridRowValue("USER_ID");
        var NAME = $("#gridTable").jqGridRowValue("NAME");
        var USERNAME = $("#gridTable").jqGridRowValue("USERNAME");
        if (checkedRow(USER_ID)) {
            dialogOpen({
                id: "RevisePassword",
                title: '重置密码',
                url: '/system/user/reset?USER_ID=' + USER_ID + "&NAME=" + encodeURIComponent(NAME) + '&USERNAME=' + encodeURIComponent(USERNAME),
                width: "500px",
                height: "260px",
                callBack: function (iframeId) {
                    top.frames[iframeId].AcceptClick();
                }
            });
        }
    }
    //导出
    function btn_export() {
        location.href = "";
    }
    //禁用
    function btn_disabled(keyValue) {
        if (typeof keyValue === 'undefined') {
            keyValue = $("#gridTable").jqGridRowValue("USER_ID");
        }
        if (checkedRow(keyValue)) {
            $.ConfirmAjax({
                msg: "注：您确定要【禁用】账户？",
                url: "../../BaseManage/User/DisabledAccount",
                param: { keyValue: keyValue },
                success: function (data) {
                    $("#gridTable").trigger("reloadGrid");
                }
            })
        }
    }
    //启用
    function btn_enabled(keyValue) {
        if (typeof keyValue === 'undefined') {
            keyValue = $("#gridTable").jqGridRowValue("USER_ID");
        }
        if (checkedRow(keyValue)) {
            $.ConfirmAjax({
                msg: "注：您确定要【启用】账户？",
                url: "../../BaseManage/User/EnabledAccount",
                param: { keyValue: keyValue },
                success: function (data) {
                    $("#gridTable").trigger("reloadGrid");
                }
            })
        }
    }
    //用户授权
    function btn_authorize() {
        var USER_ID = $("#gridTable").jqGridRowValue("USER_ID");
        var NAME = $("#gridTable").jqGridRowValue("NAME");
        var ROLE_ID = $("#gridTable").jqGridRowValue("ROLE_ID");
        if (checkedRow(USER_ID)) {
            dialogOpen({
                id: "AllotAuthorize",
                title: '用户授权 - ' + NAME,
                url: '/system/user/PermissionUser?USER_ID=' + USER_ID,
                width: "700px",
                height: "690px",
                btn: null
            });
        }
    }
    //IP过滤
    function btn_ipfilter() {
        var keyValue = $("#gridTable").jqGridRowValue("USER_ID");
        var FullName = $("#gridTable").jqGridRowValue("NAME");
        if (checkedRow(keyValue)) {
            dialogOpen({
                id: "FilterIP",
                title: 'TCP/IP 地址访问限制 - ' + FullName,
                url: '/AuthorizeManage/FilterIP/Index?objectId=' + keyValue + '&objectType=Uesr',
                width: "600px",
                height: "400px",
                btn: null
            });
        }
    }
    //时段过滤
    function btn_timefilter() {
        var keyValue = $("#gridTable").jqGridRowValue("USER_ID");
        var FullName = $("#gridTable").jqGridRowValue("NAME");
        if (checkedRow(keyValue)) {
            dialogOpen({
                id: "FilterTime",
                title: '时段访问过滤 - ' + FullName,
                url: '/AuthorizeManage/FilterTime/Index?objectId=' + keyValue + '&objectType=Uesr',
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