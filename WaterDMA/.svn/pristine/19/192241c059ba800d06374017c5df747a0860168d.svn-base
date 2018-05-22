<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户管理</title>
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/static/scripts/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/scripts/bootstrap/bootstrap.extension.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/tree/tree.css" rel="stylesheet"/>
    <link href="/static/scripts/plugins/datetime/datetime.css" rel="stylesheet"/>
    <link href="/static/scripts/plugins/wizard/wizard.css" rel="stylesheet"/>
    <link href="/static/styles/learun-ui.css" rel="stylesheet"/>
    <link href="/static/styles/learun-flowall.css"/>
    <!–[if lt IE 9]><script src="/static/scripts/html5/json2.js"></script><![endif]–>
</head>
<body>
<form id="form1">
    <div style="margin-left: 10px; margin-right: 10px;">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#BaseInfo" data-toggle="tab">基本信息</a></li>
        </ul>
        <div class="tab-content" style="padding-top: 15px;">
            <div id="BaseInfo" class="tab-pane active" style=" padding-right: 30px;">
                <table class="form">
                    <tr>
                        <td class="formTitle">账户<font face="宋体">*</font></td>
                        <td class="formValue">
                            <input id="USERNAME" type="text" onblur="$.ExistField(this.id,'/system/User/Checked')" class="form-control" placeholder="请输入账户" isvalid="yes" checkexpession="NotNull" />
                        </td>
                        <td class="formTitle">密码<font face="宋体">*</font></td>
                        <td class="formValue">
                            <input id="PASSWORD" type="text" class="form-control" placeholder="请输入密码" isvalid="yes" checkexpession="NotNull" />
                        </td>
                    </tr>
                    <tr>
                        <td class="formTitle">角色<font face="宋体">*</font></td>
                        <td class="formValue">
                            <div id="ROLE_ID" type="select" class="ui-select" checkexpession="NotNull"></div>
                        </td>
                        <td class="formTitle">姓名</td>
                        <td class="formValue">
                            <input id="NAME" type="text" class="form-control" />
                        </td>
                    </tr>
                    <tr>
                        <td class="formTitle">性别</td>
                        <td class="formValue">
                            <div id="SEX" type="select" class="ui-select">
                                <ul>
                                    <li data-value="1">男</li>
                                    <li data-value="0">女</li>
                                </ul>
                            </div>
                        </td>
                        <td class="formTitle">手机</td>
                        <td class="formValue">
                            <input id="MOBILE" type="text" class="form-control" />
                        </td>
                    </tr>
                    <tr>
                        <td class="formTitle">QQ</td>
                        <td class="formValue">
                            <input id="QQ" type="text" class="form-control" />
                        </td>
                        <td class="formTitle">电话</td>
                        <td class="formValue">
                            <input id="MOBILE" type="text" class="form-control" />
                        </td>
                    </tr>
                    <tr>
                        <td class="formTitle">邮箱</td>
                        <td class="formValue">
                            <input id="Email" type="text" class="form-control" /></td>

                        <td class="formTitle">微信</td>
                        <td class="formValue">
                            <input id="WeChat" type="text" class="form-control" /></td>
                    </tr>
                    <tr>
                        <th class="formTitle" valign="top" style="padding-top: 4px;">备注
                        </th>
                        <td class="formValue" colspan="3">
                            <textarea id="Description" class="form-control" style="height: 50px;"></textarea>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</form>
<script src="/static/scripts/jquery/jquery-1.12.4.min.js"></script>
<script src="/static/scripts/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="/static/scripts/bootstrap/bootstrap.min.js"></script>
<script src="/static/scripts/plugins/tree/tree.js"></script>
<script src="/static/scripts/plugins/validator/validator.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script src="/static/scripts/plugins/cryptojs/crypto-js.js"></script>
<script src="/static/scripts/plugins/biginteger/BigInteger.js"></script>
<script src="/static/scripts/utils/encrypt.js"></script>
<script>
    var USER_ID = request('USER_ID');
    var USERNAME = request('USERNAME');
    var action = request('ACTION');
    $(function () {
        initControl();
    });
    //初始化控件
    function initControl() {
        //角色
        $.ajax('/system/role/GetTreeJson')
            .done(function (data) {
                var str = '<ul>';
                for(var i=0; i<data.length; i++){
                    str += '<li data-value="'+ data[i].ROLE_ID +'">'+ data[i].ROLE_NAME +'</li>'
                }
                str += '</ul>';
                $("#ROLE_ID")
                    .html(str)
                    .ComboBox({
                        description: "==请选择==",
                        height: "200px"
                    });
            });
        //性别
        $("#SEX").ComboBox({
            description: "==请选择==",
            height: "200px"
        });
        //判断添加与新增
        if(!!USER_ID){
            var tableData = request('tableData');
            tableData = JSON.parse(aceDecryption(tableData, nonce));
            $('#PASSWORD').val('******').attr('disabled', 'disabled');
            $('#USERNAME').val(USERNAME);
            for(var i in tableData){
                if(i === 'ROLE_ID'){
                    $("#" + i).ComboBoxTreeSetValue(tableData[i]);
                }else if(i === 'SEX'){
                    tableData[i] === '男' ? $("#" + i).ComboBoxTreeSetValue(1) : tableData[i] !== '' ? $("#" + i).ComboBoxTreeSetValue(0) : '';
                }else{
                    $("#" + i).val(tableData[i])
                }
            }

        }
    }
    //保存表单
    function AcceptClick() {
        if (!$("#form1").Validform()) {
            return false;
        }
        var postData = $("#form1").GetWebControls();
        postData['ACTION'] = action;
        postData['SEX'] = postData['SEX'] === '' ? '' : postData['SEX'] === '1' ? '男' : '女';
        if(USER_ID && USER_ID !=='') postData['USER_ID'] = USER_ID;
        $.SaveForm({
            url: "/system/User/Form",
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