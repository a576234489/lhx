<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>重置密码</title>
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/static/scripts/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/styles/learun-ui.css" rel="stylesheet"/>
    <!–[if lt IE 9]><script src="/static/scripts/html5/json2.js"></script><![endif]–>
</head>
<body>
<form id="form1">
    <div style="margin-top: 20px; margin-right: 30px;">
        <table class="form">
            <tr>
                <td class="formTitle">姓名</td>
                <td class="formValue">
                    <input id="RealName" readonly type="text" class="form-control" />
                </td>
            </tr>
            <tr>
                <td class="formTitle">帐户</td>
                <td class="formValue">
                    <input id="Account" readonly type="text" class="form-control" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">新密码<font face="宋体">*</font>
                </th>
                <td class="formValue">
                    <input id="Password" type="password" class="form-control" placeholder="请输入新密码" isvalid="yes" checkexpession="NotNull" minlength="6" />
                </td>
            </tr>
            <tr>
                <th class="formTitle">再次密码<font face="宋体">*</font>
                </th>
                <td class="formValue">
                    <input id="rePassword" type="password" class="form-control" placeholder="请再一次输入新密码" isvalid="yes" checkexpession="NotNull" minlength="6" />
                </td>
            </tr>
        </table>
    </div>
</form>
<script src="/static/scripts/jquery/jquery-1.12.4.min.js"></script>
<script src="/static/scripts/plugins/validator/validator.js"></script>
<script src="/static/scripts/plugins/jquery.md5.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script src="/static/scripts/plugins/cryptojs/crypto-js.js"></script>
<script src="/static/scripts/plugins/biginteger/BigInteger.js"></script>
<script src="/static/scripts/utils/encrypt.js"></script>
<script>
    var USER_ID = request('USER_ID');
    $(function () {
        $("#NAME").val(request('NAME'));
        $("#USERNAME").val(request('USERNAME'));
    });
    //保存事件
    function AcceptClick() {
        if (!$('#form1').Validform()) {
            return false;
        }
        if($.trim($("#Password").val()) !== $.trim($("#rePassword").val())){
            dialogMsg('两次密码不一样', -1);
            return false
        }
        var postData = $("#form1").GetWebControls(USER_ID);
        postData['Password'] = $.trim($("#Password").val());
        postData['rePassword'] = $.trim($("#rePassword").val());  //Encrypt(postData)
        postData['USER_ID'] = USER_ID;
        $.SaveForm({
            url: "/system/user/reset",
            param: postData,
            loading: "正在保存数据...",
            success: function () {
                // dialogMsg('密码修改成功', -1)
            }
        })
    }
</script>
</body>
</html>
