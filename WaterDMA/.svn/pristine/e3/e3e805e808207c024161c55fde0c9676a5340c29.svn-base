<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>角色管理</title>
    <link href="/static/scripts/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/static/scripts/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/styles/learun-ui.css" rel="stylesheet"/>
    <!–[if lt IE 9]><script src="/static/scripts/html5/json2.js"></script><![endif]–>
</head>
<body>
<form id="form1">
    <div style="margin-left: 10px; margin-top: 20px; margin-right: 30px;">
        <table class="form">
            <tr>
                <td class="formTitle">角色名称<font face="宋体">*</font></td>
                <td class="formValue">
                    <input id="ROLE_NAME" type="text" onblur="$.ExistField(this.id,'/system/role/Checked')" class="form-control" placeholder="请输入名称" isvalid="yes" checkexpession="NotNull" />
                </td>
            </tr>
            <tr>
                <th class="formTitle" valign="top" style="padding-top: 4px;">角色描述
                </th>
                <td class="formValue">
                    <textarea id="Description" class="form-control" style="height: 70px;"></textarea>
                </td>
            </tr>
        </table>
    </div>
</form>
<script src="/static/scripts/jquery/jquery-1.12.4.min.js"></script>
<script src="/static/scripts/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="/static/scripts/bootstrap/bootstrap.min.js"></script>
<script src="/static/scripts/plugins/validator/validator.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script>
    var ROLE_ID = request('ROLE_ID');
    var ROLE_NAME = request('ROLE_NAME');
    var ACTION = request('ACTION');
    $(function () {
        initControl();
    });
    //初始化控件
    function initControl() {
        //获取表单
        if(!!ROLE_ID){
            $('#ROLE_NAME').val(decodeURI(ROLE_NAME));
        }
    }
    //保存表单
    function AcceptClick() {
        if (!$('#form1').Validform()) {
            return false;
        }
        var postData = $("#form1").GetWebControls();
        postData['ACTION'] = ACTION;
        if(!!ROLE_ID) postData['ROLE_ID'] = ROLE_ID;
        $.SaveForm({
            url: "/system/role/Form",
            param: postData,
            loading: "正在保存数据...",
            success: function (data) {
                data.result && data.result === 'success' ? $.currentIframe().$("#gridTable").trigger("reloadGrid") : dialogMsg('数据更新失败', -1)
            }
        })
    }
</script>
</body>
</html>
