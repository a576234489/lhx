<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Form</title>
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/static/scripts/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/tree/tree.css" rel="stylesheet"/>
    <link href="/static/styles/learun-ui.css" rel="stylesheet"/>
</head>
<body>
<form id="form1">
    <div class="widget-body">
        <div class="step-content" id="wizard-steps" style="border-left: none; border-bottom: none; border-right: none;">
            <div class="step-pane active" id="step-1" style="margin-left: 0px; margin-top: 15px; margin-right: 30px;">
                <table class="form">
                    <tr>
                        <th class="formTitle">编号</th>
                        <td class="formValue">
                            <input id="id" type="text" class="form-control" placeholder="请输入编号"/>
                        </td>
                        <th class="formTitle">名称<font face="宋体">*</font></th>
                        <td class="formValue">
                            <input id="text" type="text" class="form-control" placeholder="请输入名称" isvalid="yes" checkexpession="NotNull" />
                        </td>
                    </tr>
                    <tr>
                        <th class="formTitle">上级</th>
                        <td class="formValue">
                            <div id="parentnodes" type="selectTree" class="ui-select"></div>
                        </td>
                        <th class="formTitle">图标<font face="宋体">*</font></th>
                        <td class="formValue">
                            <input id="img" type="text" isvalid="yes" checkexpession="NotNull" class="form-control" />
                            <span class="input-button" onclick="SelectIcon()" title="选取图标">...</span>
                        </td>
                    </tr>
                    <tr>
                        <th class="formTitle">目标<font face="宋体">*</font></th>
                        <td class="formValue">
                            <div id="target" type="select" class="ui-select" isvalid="yes" checkexpession="NotNull">
                                <ul>
                                    <li data-value="expand">expand</li>
                                    <li data-value="iframe">iframe</li>
                                    <li data-value="open">open</li>
                                    <li data-value="href">href</li>
                                    <li data-value="blank">blank</li>
                                </ul>
                            </div>
                        </td>
                        <th class="formTitle">排序</th>
                        <td class="formValue">
                            <input id="sortCode" type="text" class="form-control" checkexpession="Num" />
                        </td>
                    </tr>
                    <tr>
                        <th class="formTitle">地址</th>
                        <td class="formValue" colspan="3">
                            <input id="url" type="text" class="form-control" />
                        </td>
                    </tr>
                    <tr>
                        <th class="formTitle" style="height: 37px;">选项</th>
                        <td class="formValue">
                            <div class="checkbox user-select">
                                <label>
                                    <input id="isMenu" type="checkbox" />
                                    菜单
                                </label>
                                <label>
                                    <input id="isPublic" type="checkbox" />
                                    公共
                                </label>
                                <label>
                                    <input id="allowExpand" type="checkbox" />
                                    展开
                                </label>
                                <label>
                                    <input id="enabledMark" type="checkbox" checked="checked" />
                                    有效
                                </label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th class="formTitle" valign="top" style="padding-top: 4px;">描述
                        </th>
                        <td class="formValue" colspan="3">
                            <textarea id="description" class="form-control" style="height: 70px;"></textarea>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="form-button" id="wizard-actions">
        <a id="btn_finish" class="btn btn-success">完成</a>
    </div>
</form>
<script src="/static/scripts/jquery/jquery-1.12.4.min.js"></script>
<script src="/static/scripts/plugins/tree/tree.js"></script>
<script src="/static/scripts/plugins/validator/validator.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script type="text/javascript">
    var keyValue = request('keyValue');
    var parentId = request('parentId');
    $(function () {
        initialPage();
    });
    //初始化页面
    function initialPage() {
        //加载导向
        initControl();

        $('#btn_finish').on('click', function (e) {
            AcceptClick();
            e.stopPropagation();

        })

    }
    //初始化控件
    function initControl() {
        //目标
        $("#target").ComboBox({
            description: "==请选择==",
            height: "200px"
        });
        //上级
        $("#parentnodes").ComboBoxTree({
            url: "/menu/treeJson",
            description: "==请选择==",
            height: "195px",
            allowSearch: true
        });

        $("#parentnodes").ComboBoxTreeSetValue(parentId);
    }
    //选取图标
    function SelectIcon() {
        dialogOpen({
            id: "SelectIcon",
            title: '选取图标',
            url: '/menu/icon?controlId=img',
            width: "1000px",
            height: "600px",
            btn: false
        })
    }
    //保存表单
    function AcceptClick() {
        if (!$('#form1').Validform()) {
            return false;
        }
        var postData = $("#form1").GetWebControls();
        $.SaveForm({
            url: "/menu/save",
            param: postData,
            loading: "正在保存数据...",
            success: function (data) {
                if(data.msg ==='success' && top.initialPage){
                    top.initialPage();
                }
                console.log(data)
                <%--$.currentIframe().$("#gridTable").trigger("reloadGrid");--%>
            }
        })
    }
</script>
</body>
</html>