<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>城市供水管网漏损评估与分析系统</title>
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/styles/learun-ui.css" rel="stylesheet"/>
    <link href="/static/adminDefault/css/index.css" rel="stylesheet" />
    <style>
        body{
            min-width: 1040px;
        }
        .clearfix:after{
            display: block;
            content: '';
            clear: both;
        }
    </style>
</head>
<body style="overflow: hidden;">
<div id="ajax-loader" style="cursor: progress; position: fixed; top: -50%; left: -50%; width: 200%; height: 200%; background: #fff; z-index: 10000; overflow: hidden;">
    <img src="/static/images/ajax-loader.gif" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" />
</div>
<div id="container">
    <div id="side">
        <%--<img id="icon-vension" src="/static/mages/icon_v_b_e.png" alt="旗舰版">--%>
        <ul id="nav" class="clearfix"></ul>
    </div>
    <div id="main">
        <div id="main-hd">
            <div class="logo_fleft">
                <img src="/static/images/loginlogo.png" />
            </div>
            <div style="float: right">
                <ul id="topnav">
                    <li class="list" id="HomePage">
                        <a><span><i class="fa fa-home"></i></span>系统首页</a>
                    </li>
                    <li class="list" id="UserSetting">
                        <a><span><i class="fa fa-user"></i></span>个人中心</a>
                    </li>
                    <li class="list" onclick="ShowOrHideNav()">
                        <a><span><i class="fa fa-bell"></i></span>消息通知</a>
                    </li>
                    <li class="list" onclick="IndexOut()">
                        <a><span><i class="fa fa-power-off"></i></span>安全退出</a>
                    </li>
                </ul>
            </div>
        </div>
        <div id="main-bd">
            <div id="tab_list_add">
            </div>
            <div class="contextmenu">
                <ul>
                    <li onclick="$.removeTab('reloadCurrent')">刷新当前</li>
                    <li onclick="$.removeTab('closeCurrent')">关闭当前</li>
                    <li onclick="$.removeTab('closeAll')">全部关闭</li>
                    <li onclick="$.removeTab('closeOther')">除此之外全部关闭</li>
                    <li onclick="$.removeTab('fullscreenchange')">全屏</li>
                    <div class='m-split'></div>
                    <li>退出</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="loading_background" class="loading_background" style="display: none;"></div>
<div id="loading_manage">
    正在拼了命为您加载…
</div>
<script src="/static/scripts/jquery/jquery-1.12.4.min.js"></script>
<script src="/static/scripts/plugins/cookie/jquery.cookie.js"></script>
<script src="/static/scripts/plugins/dialog/dialog.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script src="/static/adminDefault/clientData.js"></script>
<script>
    var tablist;
    $(function () {
        initialPage();
        if($(window).width() >= $(window).height()){
            $("#container").height($(window).height());
        }
        tablist = $("#tab_list_add").Tab({
            items: [
                { id: 'desktop', title: '欢迎首页', closed: false, icon: 'fa fa fa-desktop', url: '/home/adminDefaultDesktop' }
            ],
            tabScroll: false,
            width: $(window).width() - 100,
            height: $(window).height() - 56,
            tabcontentWidth: $(window).width() - 80,
            addEvent: function (item) {
                if (item.closed && item.isNoLog !== true) {
                    $.ajax({
                        url: "",
                        data: { moduleId: item.id, moduleName: item.title, moduleUrl: item.url },
                        type: "post",
                        dataType: "text"
                    });
                }
            },
            currentEvent: function (moduleId) {
                top.$.cookie('currentmoduleId', moduleId, { path: "/" });
            }
        });
        $("#HomePage").click(function () {
            tablist.newTab({ id: 'desktop', title: '欢迎首页', closed: false, icon: 'fa fa-desktop', url: '/home/adminDefaultDesktop' });
        });
        //个人中心
        $("#UserSetting").click(function () {
            tablist.newTab({ id: "UserSetting", title: "个人中心", closed: true, icon: "fa fa-user", url: "/personCenter/index" });
        });
        window.setTimeout(function () {
            $('#ajax-loader').fadeOut();
        }, 300);
        $(window).resize(function (e) {
            if($(window).width() >= $(window).height()){
                $("#container").height($(window).height());
            }
        });
    });
    //初始化页面
    function initialPage() {
        $.ajax('/menu/index/treeJson').done(function(data){
            loadnav(data);
        });
    }
    function ShowOrHideNav() {
        if ($('#side').is(":hidden"))
            $('#side').show();
        else
            $('#side').hide();
        $(window).trigger('resize');
    }
</script>
</body>
</html>
