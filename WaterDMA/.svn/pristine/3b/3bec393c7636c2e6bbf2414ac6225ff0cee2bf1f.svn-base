<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width" />
    <title>系统登录</title>
    <link href="/static/styles/learun-login.css" rel="stylesheet" />
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
    <!–[if lt IE 9]><script src="/static/scripts/html5/json2.js"></script><![endif]–>
    <style type="text/css">
        body {
            background: url(/static/images/login-bgm.jpg) no-repeat fixed center;
            background-size: cover;
        }
        .clearfix:after{
            display: block;
            content: '';
            clear: both;
        }
    </style>
</head>
<body class="aaabody">
<div class="wrap">
    <div style="text-align: center;">
        <img src="/static/images/on-line.png" style="border-radius: 96px; margin-bottom: -48px;" />
    </div>
    <div id="loginform" class="container">
        <fieldset class="box">
            <legend>城市供水管网漏损评估与分析系统</legend>
            <dl class="form">
                <dd>
                    <input id="username" type="text" class="px" placeholder="请输入用户名">
                </dd>
                <dd>
                    <input id="password" type="password" class="px" placeholder="请输入用户密码">
                </dd>
                <dd class="clearfix" style="margin: 0">
                    <div style="float:right;padding-right:10%;">
                        <div style="float: left;margin-top:3px;margin-right:2px;">
                            <font>记住密码</font>
                        </div>
                        <div style="float: left;">
                            <input name="form-field-checkbox" id="saveid" type="checkbox" onclick="savePaw();" style="padding-top:0;">
                        </div>
                    </div>
                </dd>
                <dd class="btn">
                    <button id="btnlogin" type="button" class="pn"><span>登录</span></button>
                </dd>
            </dl>
        </fieldset>
    </div>
</div>
<div class="copyright" style="color: #fff;">
    上海桑锐电子科技股份有限公司
    <br>
    官方网站：http://www.51sunray.com
</div>
<script src="/static/scripts/jquery/jquery-1.12.4.min.js"></script>
<script src="/static/scripts/plugins/jquery.md5.js"></script>
<script src="/static/scripts/plugins/cookie/jquery.cookie.js"></script>
<script src="/static/scripts/plugins/dialog/dialog.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script src="/static/scripts/plugins/validator/validator.js"></script>
<script src="/static/scripts/plugins/tipso.min.js"></script>
<script src="/static/scripts/plugins/cryptojs/crypto-js.js"></script>
<script src="/static/scripts/plugins/biginteger/BigInteger.js"></script>
<script src="/static/scripts/utils/encrypt.js"></script>
<script>
    var isIE = !!window.ActiveXObject;
    var isIE6 = isIE && !window.XMLHttpRequest;
    if (isIE6) {
        window.location.href = "/error/errorBrowser";
    }
    //回车键
    $('#loginform').on('keydown', function (e) {
        if(e.keyCode === 13){
            $('#btnlogin').trigger('click')
        }
    });

    //初始化
    $(function () {

        var username = $.cookie('username');
        var password = $.cookie('password');
        if (typeof username !== "undefined" && typeof password !== "undefined") {
            $("#username").val(username);
            $("#password").val(password);
            $("#saveid").attr("checked", true);
        }

        $(".wrap").css("margin-top", ($(window).height() - $(".wrap").height()) / 2 - 35);
        $(window).resize(function (e) {
            $(".wrap").css("margin-top", ($(window).height() - $(".wrap").height()) / 2 - 35);
            e.stopPropagation();
        });

        //登录按钮事件
        $("#btnlogin").click(function () {
            var $username = $("#username");
            var $password = $("#password");
            if ($username.val() === "") {
                $username.focus();
                formMessage('请输入用户名。');
                return false;
            } else if ($password.val() === "") {
                $password.focus();
                formMessage('请输入密码。');
                return false;
            } else {
                CheckLogin();
            }
        })
    });
    //登录验证
    function CheckLogin() {
        $("#btnlogin").addClass('active').attr('disabled', 'disabled');
        $("#btnlogin").find('span').hide();

        var username = $.trim($("#username").val());
        var password = $.trim($("#password").val());
        // password = $.md5(password);
        $.ajax({
            url: "/login_login",
            data: { KEYDATA : username + ',fh,' + password },  //Encrypt({ KEYDATA : username + ',fh,' + password })
            type: "post",
            dataType: "json",
            success: function (data) {

                /*
                * {"result":"errInfo"}
                * errInfo = "usererror";    // 用户名或密码有误
                * errInfo = "error";        // 缺少参数
                * errInfo = "success";      // 验证成功
                * */

                if(data.result === 'usererror'){
                    dialogAlert('用户名或密码有误', 0);
                    $("#btnlogin").removeClass('active').removeAttr('disabled');
                    $("#btnlogin").find('span').show();
                }else if(data.result === 'error'){
                    dialogAlert('缺少参数', 0);
                    $("#btnlogin").removeClass('active').removeAttr('disabled');
                    $("#btnlogin").find('span').show();
                }else if(data.result === 'success'){
                    saveCookie();
                    window.location.href = '/main/index'
                }else{
                    dialogAlert('未知错误', 0);
                    $("#btnlogin").removeClass('active').removeAttr('disabled');
                    $("#btnlogin").find('span').show();
                }
            },
            error: function (err) {
                dialogAlert('登录失败', 0);
                $("#btnlogin").removeClass('active').removeAttr('disabled');
                $("#btnlogin").find('span').show();
                console.log(err)
            }
        });
    }
    //提示信息
    function formMessage(msg, type) {
        $('.login_tips').parents('dt').remove();
        var _class = "login_tips";
        if (type === 1) {
            _class = "login_tips-succeed";
        }
        $('.form').prepend('<dt><div class="' + _class + '"><i class="fa fa-question-circle"></i>' + msg + '</div></dt>');
    }
    //选中checkbox事件
    function savePaw() {
        if (!$("#saveid").attr("checked")) {
            $("#saveid").attr("checked", true);
        }
    }
    //保存密码
    function saveCookie() {
        if ($("#saveid").attr("checked")) {
            $.cookie('username', $.trim($("#username").val()),{
                path: "/", expires: 7
            });
            $.cookie('password', $.trim($("#password").val()),{
                path: "/", expires: 7
            });
        }
    }
</script>
</body>
</html>
