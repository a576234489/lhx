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
            <a id="lr-edit" class="btn btn-default" ><i class="fa fa-pencil-square-o"></i>&nbsp;编辑</a>
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
                $('#gridTable').setGridHeight($(window).height() - 136.5);
            }, 200);
            e.stopPropagation();
        });
    }
    //加载表格
    function GetGrid() {
        var selectedRowIndex = 0;
        var $gridTable = $('#gridTable');
        $gridTable.jqGrid({
            autowidth: true,
            height: $(window).height() - 136.5,
            url: "../../LeakageConfig/DMAParamConfig/GetPageListJson",
            datatype: "json",
            colModel: [
                { label: '分区名称', name: 'AreaName', index: 'AreaName', width: 200, align: 'left' },
                { label: '区域平均压力', name: 'GsAznp', index: 'GsPeopleNum', width: 100, align: 'left', sortable: false },
                { label: '居民用户数量', name: 'GsPeopleNum', index: 'GsPeopleNum', width: 100, align: 'left',sortable: false  },
                { label: '每小时每户支管估计漏损水量', name: 'GsPeopleLeak', index: 'GsPeopleLeak', width: 200, align: 'right',sortable: false  },
                { label: '非居民用户水量', name: 'GsNoPeopleLeak', index: 'GsNoPeopleLeak', width: 110, align: 'right',sortable: false  },
                { label: '用户支管数量', name: 'GsC1', index: 'GsC1', width: 100, align: 'right',sortable: false  },
                { label: '私有管道数量', name: 'GsC2', index: 'GsC2', width: 100, align: 'right',sortable: false  },
                { label: '干管长度', name: 'GsL1', index: 'GsL1', width: 100, align: 'right',sortable: false  },
                { label: '私有管道平均长度', name: 'GsL2', index: 'GsL2', width: 120, align: 'right',sortable: false  },
                { label: '管网设施状况因子', name: 'GsICF', index: 'GsICF', width: 120, align: 'right',sortable: false  },
                { label: 'AreaId', name: 'AreaId', index: 'AreaId', width: 10, align: 'left',sortable: true ,hidden: true },
            ],
            viewrecords: true,
            rowNum: 30,
            rowList: [30, 50, 100],
            pager: "#gridPager",
            sortname: 'AreaId ASC',
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
        //查询事件
        $("#btn_Search").click(function () {
            var queryJson = {
                condition: 'AreaName',
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
    //编辑
    function btn_edit() {
        var keyValue = jqGridRowValue('#gridTable', 'AreaId');
        if (checkedRow(keyValue)) {
            dialogOpen({
                id: 'Form',
                title: '编辑DMA配置参数',
                url: '/LeakageConfig/DMAParamConfig/Form?keyValue=' + keyValue,
                width: '500px',
                height: '400px',
                callBack: function (iframeId) {
                    top.frames[iframeId].AcceptClick();
                }
            })
        }
    }
</script>
</body>
</html>
