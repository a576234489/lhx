<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户权限</title>
    <link href="/static/styles/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/static/scripts/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="/static/scripts/bootstrap/bootstrap.extension.css" rel="stylesheet" />
    <link href="/static/scripts/plugins/tree/tree.css" rel="stylesheet"/>
    <link href="/static/scripts/plugins/wizard/wizard.css" rel="stylesheet"/>
    <link href="/static/styles/learun-ui.css" rel="stylesheet"/>
</head>
<body>
<form id="form1">
    <div class="widget-body">
        <div id="wizard" class="wizard" data-target="#wizard-steps" style="border-left: none; border-top: none; border-right: none;">
            <ul class="steps">
                <li data-target="#step-1" class="active"><span class="step">1</span>系统功能<span class="chevron"></span></li>
                <li data-target="#step-2"><span class="step">2</span>添加权限<span class="chevron"></span></li>
                <li data-target="#step-3"><span class="step">3</span>查看权限<span class="chevron"></span></li>
                <li data-target="#step-4"><span class="step">4</span>编辑权限<span class="chevron"></span></li>
                <li data-target="#step-5"><span class="step">5</span>删除权限<span class="chevron"></span></li>
            </ul>
        </div>
        <div class="step-content" id="wizard-steps" style="border-left: none; border-bottom: none; border-right: none;">
            <div class="step-pane active" id="step-1">
                <div id="ModuleTree" style="margin: 10px;"></div>
            </div>
            <div class="step-pane" id="step-2">
                <div id="AddPermissions" style="margin: 10px;"></div>
            </div>
            <div class="step-pane" id="step-3">
                <div id="CheckPermissions" style="margin: 10px;"></div>
            </div>
            <div class="step-pane" id="step-4">
                <div id="EditPermissions" style="margin: 10px;"></div>
            </div>
            <div class="step-pane" id="step-5">
                <div id="DeletePermissions" style="margin: 10px;"></div>
            </div>
        </div>
    </div>
    <div class="form-button" id="wizard-actions">
        <a id="btn_last" disabled class="btn btn-default btn-prev">上一步</a>
        <a id="btn_next" class="btn btn-default btn-next">下一步</a>
        <a id="btn_finish" disabled class="btn btn-success">完成</a>
    </div>

</form>
<script src="/static/scripts/jquery/jquery-1.12.4.min.js"></script>
<script src="/static/scripts/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="/static/scripts/bootstrap/bootstrap.min.js"></script>
<script src="/static/scripts/plugins/tree/tree.js"></script>
<script src="/static/scripts/plugins/validator/validator.js"></script>
<script src="/static/scripts/plugins/wizard/wizard.js"></script>
<script src="/static/scripts/utils/learun-ui.js"></script>
<script type="text/javascript">
    var USER_ID = request('USER_ID');
    $(function () {
        initialPage();
        GetModuleTree();
        GetModuleButtonTree();
    });
    //初始化页面
    function initialPage() {
        //加载导向
        $('#wizard').wizard().on('change', function (e, data) {
            var $finish = $("#btn_finish");
            var $next = $("#btn_next");
            var len = $('#wizard').find('ul.steps').find('li').length;
            if (data.direction === "next") {
                if (data.step >= len - 1) {
                    $next.attr('disabled', 'disabled');
                    $finish.removeAttr('disabled');
                }
            } else {
                $finish.attr('disabled', 'disabled');
                $next.removeAttr('disabled');
            }
        });
        //数据权限 、点击类型触发事件
        $("input[name='authorizeType']").click(function () {
            var value = $(this).val();
            if (value === -5) {
                $("#OrganizeTreebackground").hide();
            } else {
                $("#OrganizeTreebackground").show();
            }
        });
        buttonOperation();
    }
    //获取系统功能
    function GetModuleTree() {
        $.ajax('/system/User/getMenu?USER_ID=' + USER_ID)
            .done(function (data) {
                var item = {
                    height: 540,
                    showcheck: true,
                    data: data
                };
                $("#ModuleTree").treeview(item);
                simulationClick($("#ModuleTree"), data)
            }).fail(function () {
            dialogMsg('数据加载失败', -1)
        })
    }
    //获取系统按钮
    function GetModuleButtonTree() {
        $.ajax("/system/user/getButtonMenu?USER_ID=" + USER_ID)
            .done(function (data) {
                $("#AddPermissions").treeview({
                    height: 540,
                    showcheck: true,
                    data: data.add
                });
                simulationClick($("#AddPermissions"), data.add);
                $("#CheckPermissions").treeview({
                    height: 540,
                    showcheck: true,
                    data: data.cha
                });
                simulationClick($("#CheckPermissions"), data.cha);
                $("#EditPermissions").treeview({
                    height: 540,
                    showcheck: true,
                    data: data.edit
                });
                simulationClick($("#EditPermissions"), data.edit);
                $("#DeletePermissions").treeview({
                    height: 540,
                    showcheck: true,
                    data: data.del
                });
                simulationClick($("#DeletePermissions"), data.del);
            })
            .fail(function (err) {
                dialogMsg('数据加载失败', -1)
            })
    }
    function simulationClick(el, data) {
        var id = el.attr('id');
        var simulationButton = [];
        simulationClickButton(data, simulationButton);
        for(var i=0, len=simulationButton.length; i<len; i++){
            $("#" + id + "_" + simulationButton[i] + "_cb").trigger('click');
        }
    }
    function simulationClickButton(data, simulationButton) {
        $.each(data, function (i) {
            if(data[i].hasChildren){
                simulationClickButton(data[i].ChildNodes, simulationButton)
            }else{
                if(data[i].hasMenu){
                    simulationButton.push(data[i].id)
                }
            }
        })
    }
    function buttonOperation() {
        var $finish = $("#btn_finish");
        //完成提交保存
        $finish.click(function () {
            var postData = $("#form1").GetWebControls();
            postData["USER_ID"] = USER_ID;
            postData["ModuleTree"] = String($("#ModuleTree").getCheckedAllNodes());
            postData["AddPermissions"] = String($("#AddPermissions").getCheckedAllNodes());
            postData["DeletePermissions"] = String($("#DeletePermissions").getCheckedAllNodes());
            postData["EditPermissions"] = String($("#EditPermissions").getCheckedAllNodes());
            postData["CheckPermissions"] = String($("#CheckPermissions").getCheckedAllNodes());
            $.SaveForm({
                url: "/system/user/PermissionUser",
                param: postData,
                loading: "正在保存用户授权...",
                success: function () {
                    $.currentIframe().$("#gridTable").trigger("reloadGrid");
                }
            })
        })
    }
    //获取数据范围权限选中值、返回Json
    function GetDataAuthorize() {
        var dataAuthorize = [];
        var authorizeType = $("input[name='authorizeType']:checked").val();
        if (authorizeType === -5) {
            var selectedData = $("#OrganizeTree").getCheckedAllNodes();
            for (var i = 0; i < selectedData.length; i++) {
                var ResourceId = selectedData[i];
                var IsRead = $("input[name='" + ResourceId + "']:checked").val() == 1 ? 1 : 0;
                var rowdata = {
                    ResourceId: ResourceId,
                    IsRead: IsRead,
                    AuthorizeType: -5
                }
                dataAuthorize.push(rowdata);
            }
        } else {
            var rowdata = {
                IsRead: 0,
                AuthorizeType: authorizeType
            }
            dataAuthorize.push(rowdata);
        }
        return dataAuthorize;
    }
</script>
</body>
</html>
