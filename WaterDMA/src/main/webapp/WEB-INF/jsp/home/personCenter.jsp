<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>个人中心</title>
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/static/scripts/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jqgrid/jqgrid.css" rel="stylesheet"/>
    <link href="/static/scripts/plugins/tree/tree.css" rel="stylesheet"/>
    <link href="/static/scripts/plugins/datetime/datetime.css" rel="stylesheet"/>
    <link href="/static/styles/learun-ui.css" rel="stylesheet"/>
    <!–[if lt IE 9]><script src="/static/scripts/html5/json2.js"></script><![endif]–>
    <style>
        html, body {
            height: 100%;
            width: 100%;
        }
    </style>
    <style>
        .file {
            position: relative;
            display: inline-block;
            overflow: hidden;
            text-decoration: none;
            text-indent: 0;
            cursor: pointer !important;
        }

        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
            cursor: pointer !important;
        }

        .file:hover {
            text-decoration: none;
            cursor: pointer !important;
        }
    </style>
</head>
<body>
<div class="ui-layout" id="layout" style="height: 100%; width: 100%;">
    <div class="ui-layout-west">
        <div class="west-Panel">
            <div class="profile-nav">
                <ul style="padding-top: 20px;">
                    <li class="active" onclick="profileSwitch('BaseInfo')">基本信息</li>
                    <li onclick="profileSwitch('ContactInfo')">联系方式</li>
                    <li onclick="profileSwitch('MyheadIcon')">我的头像</li>
                    <li onclick="profileSwitch('RevisePassword')">修改密码</li>
                    <div class="divide"></div>
                    <li onclick="profileSwitch('SystemLog')">系统日志</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="ui-layout-center">
        <div class="center-Panel">
            <div class="profile-content" style="background: #fff;">
                <div id="BaseInfo" class="flag">
                    <div class="title">
                        基本信息
                    </div>
                    <table class="form" style="margin-top: 20px;">
                        <tr>
                            <td class="formTitle">账户</td>
                            <td class="formValue">
                                <input id="Account" readonly type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">工号</td>
                            <td class="formValue">
                                <input id="EnCode" readonly type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">姓名</td>
                            <td class="formValue">
                                <input id="RealName" readonly type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">性别</td>
                            <td class="formValue">
                                <div class="radio">
                                    <label>
                                        <input name="Gender" type="radio" checked="checked" value="1" />
                                        男
                                    </label>
                                    <label>
                                        <input name="Gender" type="radio" value="0" />
                                        女
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">公司</td>
                            <td class="formValue">
                                <input id="CompanyName" readonly type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">部门</td>
                            <td class="formValue">
                                <input id="DepartmentName" readonly type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">主管</td>
                            <td class="formValue">
                                <input id="ManagerName" readonly type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">岗位</td>
                            <td class="formValue">
                                <input id="DutyName" readonly type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">职位</td>
                            <td class="formValue">
                                <input id="PostName" readonly type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">角色</td>
                            <td class="formValue">
                                <input id="RoleName" readonly type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle" valign="top" style="padding-top: 4px;">自我介绍</td>
                            <td class="formValue">
                                <textarea id="Description" class="form-control input-profile" style="height: 70px;"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="ContactInfo" class="flag" style="display: none;">
                    <div class="title">
                        联系方式
                    </div>
                    <table class="form" style="margin-top: 20px;">
                        <tr>
                            <td class="formTitle">手机</td>
                            <td class="formValue">
                                <input id="Mobile" type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">电话</td>
                            <td class="formValue">
                                <input id="Telephone" type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">邮箱</td>
                            <td class="formValue">
                                <input id="Email" type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">微信</td>
                            <td class="formValue">
                                <input id="WeChat" type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">QQ</td>
                            <td class="formValue">
                                <input id="OICQ" type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">MSN</td>
                            <td class="formValue">
                                <input id="MSN" type="text" class="form-control input-profile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle"></td>
                            <td class="formValue">
                                <br />
                                <a class="btn btn-primary" onclick="SaveContactPanel()"><i class="fa fa-save"></i>&nbsp;保&nbsp;存</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="MyheadIcon" class="flag" style="display: none;">
                    <div class="title">
                        我的头像
                    </div>
                    <div style="width: 300px;">
                        <div style="margin-top: 40px; text-align: center;">
                            <div class="file" style="width: 100px; height: 100px;">
                                <img id="uploadPreview" style="width: 100px; height: 100px; border-radius: 100px;" src="/static/images/logo-headere47d5.png" />
                                <input type="file" name="uploadFile" id="uploadFile">
                            </div>
                            <div style="margin-top: 30px; line-height: 14px; color: #75777A; text-align: center;">
                                建议上传图片尺寸为100x100，大小不超过2M。
                            </div>
                        </div>
                    </div>
                </div>
                <div id="RevisePassword" class="flag" style="display: none;">
                    <div class="title">
                        修改密码
                    </div>
                    <table class="form" style="margin-top: 20px;">
                        <tr>
                            <td class="formTitle" style="height: 20px;"></td>
                            <td>
                                <p style="color: #959393; padding-left: 8px;">为了保护您的帐号安全，操作前请您进行安全验证</p>
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">旧密码<font face="宋体">*</font></td>
                            <td class="formValue">
                                <input id="OldPassword" type="password" class="form-control input-profile" style="float: left;" />
                                <div style="width: 300px; float: left"></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">新密码<font face="宋体">*</font></td>
                            <td class="formValue">
                                <input id="NewPassword" type="password" class="form-control input-profile" style="float: left;" />
                                <div style="width: 300px; float: left"></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">重复新密码<font face="宋体">*</font></td>
                            <td class="formValue">
                                <input id="RedoNewPassword" type="password" class="form-control input-profile" style="float: left;" />
                                <div style="width: 300px; float: left"></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle">验证码<font face="宋体">*</font></td>
                            <td class="formValue">
                                <div style="float: left;">
                                    <input id="VerifyCode" maxlength="4" type="text" class="form-control input-profile" style="width: 100px;" />
                                </div>
                                <div style="float: left; width: 200px;">
                                    <img src="/personCenter/verifyCode?_t=" id="VerifyCodeImag" width="100" height="30" alt="点击切换验证码"
                                         title="点击切换验证码" style="cursor: pointer; padding-top: 2px; padding-left: 5px;" />
                                </div>
                                <div class="VerifyCodemsg" style="width: 300px; float: left"></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="formTitle"></td>
                            <td class="formValue">
                                <br />
                                <a id="btn_RevisePassword" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;提&nbsp;交</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="SystemLog" class="flag" style="display: none;">
                    <div style="margin-top: 10px;">
                        <ul id="SystemLogType" class="nav nav-tabs">
                            <li class="active" data-value="1"><a href="#LoginLog" data-toggle="tab">登录日志</a></li>
                            <li data-value="2"><a href="#VisitLog" data-toggle="tab">访问日志</a></li>
                            <li data-value="3"><a href="#OperationLog" data-toggle="tab">操作日志</a></li>
                        </ul>
                        <div class="titlePanel">
                            <div class="title-search">
                                <table>
                                    <tr>
                                        <td>查询条件</td>
                                        <td style="padding-left: 10px;">
                                            <div class="ui-filter" style="width: 200px;">
                                                <div class="ui-filter-text">
                                                    <strong id="SelectedStartTime">2018-04-09</strong> 至 <strong id="SelectedEndTime">2018-04-16</strong>
                                                </div>
                                                <div class="ui-filter-list" style="width: 350px;">
                                                    <table class="form" id="filter-form">
                                                        <tr>
                                                            <th class="formTitle">操作时间：</th>
                                                            <td class="formValue">
                                                                <input id="Category" type="hidden" value="1" />
                                                                <div style="float: left; width: 45%;">
                                                                    <input id="StartTime" readonly type="text" value="2018-04-09" class="form-control input-wdatepicker" onfocus="WdatePicker({maxDate:'%y-%M-%d'})">
                                                                </div>
                                                                <div style="float: left; width: 10%; text-align: center;">至</div>
                                                                <div style="float: left; width: 45%;">
                                                                    <input id="EndTime" readonly type="text" value="2018-04-16" class="form-control input-wdatepicker" onfocus="WdatePicker({maxDate:'%y-%M-%d'})">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formTitle">IP地址：</td>
                                                            <td class="formValue">
                                                                <input id="IPAddress" type="text" class="form-control">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formTitle">操作类型：</td>
                                                            <td class="formValue">
                                                                <input id="OperateType" type="text" class="form-control">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formTitle">功能模块：</td>
                                                            <td class="formValue">
                                                                <input id="Module" type="text" class="form-control">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div class="ui-filter-list-bottom">
                                                        <a id="btn_Reset" class="btn btn-default">&nbsp;重&nbsp;&nbsp;置</a>
                                                        <a id="btn_Search" class="btn btn-primary">&nbsp;查&nbsp;&nbsp;询</a>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/static/scripts/jquery/jquery-1.12.4.min.js"></script>
<script src="/static/scripts/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="/static/scripts/bootstrap/bootstrap.min.js"></script>
<script src="/static/scripts/plugins/layout/jquery.layout.js"></script>
<script src="/static/scripts/plugins/datepicker/WdatePicker.js"></script>
<script src="/static/scripts/plugins/jqgrid/jqgrid.js"></script>
<script src="/static/scripts/plugins/tree/tree.js"></script>
<script src="/static/scripts/plugins/validator/validator.js"></script>
<script src="/static/scripts/plugins/datepicker/datepicker.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script src="/static/scripts/plugins/jquery.md5.js"></script>
<script src="/static/scripts/plugins/uploadify/ajaxfileupload.js"></script>
<script>
    var keyValue = 'System';
    $(function () {
        InitialPage();
        InitControl();
        RevisePasswordPanel();
    });
    //初始化数据
    function InitControl() {
        $.SetForm({
            url: "",
            param: { keyValue: keyValue },
            success: function (data) {
                if (data != null)
                {
                    $("#layout").SetWebControls(data);
                    if (data.HeadIcon) {
                        document.getElementById('uploadPreview').src =  data.HeadIcon;
                    }
                }
            }
        });
    }
    //初始化页面
    function InitialPage() {
        //layout布局
        $('#layout').layout({
            applyDemoStyles: true,
            onresize: function () {
                $(window).resize()
            }
        });
        $('.profile-nav').height($(window).height() - 20);
        $('.profile-content').height($(window).height() - 20);
        //resize重设(表格、树形)宽高
        $(window).resize(function (e) {
            window.setTimeout(function () {
                $('.profile-nav').height($(window).height() - 20);
                $('.profile-content').height($(window).height() - 20);
            }, 200);
            e.stopPropagation();
        });
        $('#uploadFile').change(function () {
            var f = document.getElementById('uploadFile').files[0]
            var src = window.URL.createObjectURL(f);
            document.getElementById('uploadPreview').src = src;

            //上传应用图标
            $.ajaxFileUpload({
                url: "/PersonCenter/UploadFile",
                secureuri: false,
                fileElementId: 'uploadFile',
                dataType: 'json',
                success: function (data) {
                    dialogMsg(data.message, 1);
                }
            });
        });
    }
    //侧面切换显示/隐藏
    function profileSwitch(id) {
        $(".profile-content").find('.flag').hide()
        $(".profile-content").find("#" + id).show();
        if (id == 'SystemLog') {
            GetSystemLogGrid();
        }
    }
    //修改密码
    function RevisePasswordPanel() {
        var chePassword = false;
        $("#VerifyCodeImag").click(function () {
            $("#VerifyCode").val('');
            $("#VerifyCodeImag").attr("src", "/Login/VerifyCode?time=" + Math.random());
        })
        $("#OldPassword").blur(function () {
            $("#OldPassword").parent().find('div').html("");
            if ($(this).val() === "") {
                return false;
            }
            $.ajax({
                url: "",
                data: { OldPassword: $(this).val() },
                type: "post",
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data.type === 1) {
                        chePassword = true;
                        $("#OldPassword").parent().find('div').html("<div class=\"form-succeed-text\">" + data.message + "</div>")
                    } else {
                        $("#OldPassword").parent().find('div').html("<div class=\"form-error-text\">" + data.message + "</div>")
                    }
                }
            });
        });
        $("#NewPassword").blur(function () {
            $("#NewPassword").parent().find('div').html("");
            if ($(this).val() === "") {
                return false;
            }
            if ($(this).val() === $("#OldPassword").val()) {
                $("#NewPassword").parent().find('div').html("<div class=\"form-error-text\">新密码不能与旧密码相同</div>")
            } else {
                $("#NewPassword").parent().find('div').html("<div class=\"form-succeed-text\"></div>")
            }
        });
        $("#RedoNewPassword").blur(function () {
            $("#RedoNewPassword").parent().find('div').html("")
            if ($(this).val() === "") {
                return false;
            }
            if ($(this).val() !== $("#NewPassword").val()) {
                $("#RedoNewPassword").parent().find('div').html("<div class=\"form-error-text\">您两次输入的密码不一致！</div>")
            } else {
                $("#RedoNewPassword").parent().find('div').html("<div class=\"form-succeed-text\"></div>")
            }
        });
        $("#VerifyCode").blur(function () {
            $(".VerifyCodemsg").html("")
            if ($(this).val() === "") {
                return false;
            }
        });
        //提交
        $("#btn_RevisePassword").click(function () {
            var OldPassword = $("#OldPassword").val();
            var NewPassword = $("#NewPassword").val();
            var RedoNewPassword = $("#RedoNewPassword").val();
            var VerifyCode = $("#VerifyCode").val();
            if (OldPassword === "") {
                $("#OldPassword").parent().find('div').html("<div class=\"form-error-text\">请输入登陆密码</div>");
                return false;
            }
            if (NewPassword === "") {
                $("#NewPassword").parent().find('div').html("<div class=\"form-error-text\">请输入新密码</div>");
                return false;
            }
            if (RedoNewPassword === "") {
                $("#RedoNewPassword").parent().find('div').html("<div class=\"form-error-text\">请输入重复新密码</div>");
                return false;
            }
            if (VerifyCode === "") {
                $(".VerifyCodemsg").html("<div class=\"form-error-text\">请输入验证码</div>");
                return false;
            }
            if (!chePassword) {
                $("#OldPassword").parent().find('div').html("<div class=\"form-error-text\">原密码错误，请重新输入</div>");
                return false;
            }
            if (confirm('注：请牢记当前设置密码，您确认要修改密码？')) {
                Loading(true, "正在提交数据...");
                window.setTimeout(function () {
                    var postData = {
                        password: $.md5($("#NewPassword").val()),
                        oldPassword: $.md5($("#OldPassword").val()),
                        verifyCode: $("#VerifyCode").val()
                    }
                    $.ajax({
                        url: "/personCenter/SubmitResetPassword",
                        data: postData,
                        type: "post",
                        dataType: "json",
                        success: function (data) {
                            if (data.type == 1) {
                                alert(data.message)
                                top.location.href = "/Login/Index";
                            } else {
                                $("#VerifyCodeImag").trigger("click");
                                $(".VerifyCodemsg").val('');
                                $(".VerifyCodemsg").html("<div class=\"form-error-text\">" + data.message + "</div>");
                            }
                            Loading(false);
                        }
                    });
                }, 200);
            }
        })
    }
    //初始化加载系统日志
    function GetSystemLogGrid() {
        var queryJson = $("#filter-form").GetWebControls();
        queryJson["CategoryId"] = 1;
        queryJson["OperateAccount"] = 'System';
        var $gridTable = $("#gridTable");
        $gridTable.jqGrid({
            url: "",
            postData: { queryJson: JSON.stringify(queryJson) },
            datatype: "json",
            height: $(window).height() - 195,
            autowidth: true,
            colModel: [
                { label: "主键", name: "LogId", hidden: true },
                {
                    label: "操作时间", name: "OperateTime", index: "OperateTime", width: 160, align: "left",
                    formatter: function (cellvalue, options, rowObject) {
                        return formatDate(cellvalue, 'yyyy-MM-dd hh:mm:ss');
                    }
                },
                { label: "IP地址", name: "IPAddress", index: "IPAddress", width: 150, align: "left" },
                { label: "系统功能", name: "Module", index: "Module", width: 200, align: "left" },
                { label: "操作类型", name: "OperateType", index: "OperateType", width: 70, align: "center" },
                {
                    label: "执行结果", name: "ExecuteResult", index: "ExecuteResult", width: 70, align: "center",
                    formatter: function (cellvalue, options, rowObject) {
                        if (cellvalue == '1') {
                            return "<span class=\"label label-success\">成功</span>";
                        } else {
                            return "<span class=\"label label-danger\">失败</span>";
                        }
                    }
                },
                { label: "执行结果描述", name: "ExecuteResultJson", index: "ExecuteResultJson", width: 100, align: "left" }
            ],
            viewrecords: true,
            rowNum: 30,
            rowList: [30, 50, 100, 500, 1000],
            pager: "#gridPager",
            sortname: 'OperateTime desc',
            rownumbers: true,
            shrinkToFit: false,
            gridview: true
        });
        //点击时间范围（今天、近7天、近一个月、近三个月）
        $("#time_horizon a.btn-default").click(function () {
            $("#time_horizon a.btn-default").removeClass("active");
            $(this).addClass("active");
            switch ($(this).attr('data-value')) {
                case "1"://今天
                    $("#StartTime").val("2018-04-16");
                    $("#EndTime").val("2018-04-16");
                    break;
                case "2"://近7天
                    $("#StartTime").val("2018-04-09");
                    $("#EndTime").val("2018-04-16");
                    break;
                case "3"://近一个月
                    $("#StartTime").val("2018-03-16");
                    $("#EndTime").val("2018-04-16");
                    break;
                case "4"://近三个月
                    $("#StartTime").val("2018-01-16");
                    $("#EndTime").val("2018-04-16");
                    break;
                default:
                    break;
            }
            $("#SelectedStartTime").html($("#StartTime").val());
            $("#SelectedEndTime").html($("#EndTime").val());
            SearchEvent();
        });
        //日志分类点击事件（登录日志、访问日志、操作日志）
        $("#SystemLogType li").click(function () {
            $("#SystemLogType li").removeClass("active");
            $(this).addClass("active");
            SearchEvent();
        });
        //查询点击事件
        $("#btn_Search").click(function () {
            SearchEvent();
            $(".ui-filter-text").trigger("click");
            $("#SelectedStartTime").html($("#StartTime").val());
            $("#SelectedEndTime").html($("#EndTime").val());
        });
        //查询表格函数
        function SearchEvent() {
            var queryJson = $("#filter-form").GetWebControls();
            queryJson["CategoryId"] = $("#SystemLogType").find('li.active').attr('data-value');
            if ($("#SystemLogType").find('li.active').attr('data-value') == 1) {
                queryJson["OperateAccount"] = 'System';
            } else {
                queryJson["OperateUserId"] = 'System';
            }
            $("#gridTable").jqGrid('setGridParam', {
                url: "",
                postData: { queryJson: JSON.stringify(queryJson) },
                page: 1
            }).trigger('reloadGrid');
        }
    }
</script>
</body>
</html>
