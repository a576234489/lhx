/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-05-14 09:53:14 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.dataAnalyze.leakageAnalyze;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class sort_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width\" />\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <title>漏损率排行榜</title>\r\n");
      out.write("    <link href=\"/static/scripts/bootstrap/bootstrap.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/styles/font-awesome.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/plugins/jquery-ui/jquery-ui.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/plugins/jqgrid/jqgrid.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <link href=\"/static/scripts/plugins/datetime/datetime.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <link href=\"/static/styles/learun-ui.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <style>\r\n");
      out.write("        html, body {\r\n");
      out.write("            height: 100%;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"ui-layout\" id=\"layout\" style=\"height: 100%; width: 100%;\">\r\n");
      out.write("    <div class=\"ui-layout-west\">\r\n");
      out.write("        <div class=\"west-Panel\" style=\"border-left: none;border-right: none;border-bottom: none;\">\r\n");
      out.write("            <div class=\"panel-Title\" style=\"border-left: 1px solid #ccc;border-right: 1px solid #ccc;\">漏损率排行榜</div>\r\n");
      out.write("            <div class=\"titlePanel\" style=\"line-height:40px;height:40px;border-top: none;\">\r\n");
      out.write("                <div class=\"title-search\">\r\n");
      out.write("                    <table>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>日期：</td>\r\n");
      out.write("                            <td style=\"padding-left: 10px;\">\r\n");
      out.write("                                <div class=\"ui-filter\" style=\"width: 200px;\">\r\n");
      out.write("                                    <div class=\"ui-filter-text\">\r\n");
      out.write("                                        <strong id=\"SelectedStartTime\">2018-04-13</strong> 至 <strong id=\"SelectedEndTime\">2018-04-20</strong>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"ui-filter-list\" style=\"width: 350px;\">\r\n");
      out.write("                                        <table class=\"form\" id=\"filter-form\">\r\n");
      out.write("                                            <tr>\r\n");
      out.write("                                                <th class=\"formTitle\">统计时间：</th>\r\n");
      out.write("                                                <td class=\"formValue\">\r\n");
      out.write("                                                    <div style=\"float: left; width: 45%;\">\r\n");
      out.write("                                                        <input id=\"StartTime\" readonly type=\"text\" value=\"2018-04-13\" class=\"form-control input-wdatepicker\" onfocus=\"WdatePicker({maxDate:'%y-%M-%d'})\">\r\n");
      out.write("                                                    </div>\r\n");
      out.write("                                                    <div style=\"float: left; width: 10%; text-align: center;\">至</div>\r\n");
      out.write("                                                    <div style=\"float: left; width: 45%;\">\r\n");
      out.write("                                                        <input id=\"EndTime\" readonly type=\"text\" value=\"2018-04-20\" class=\"form-control input-wdatepicker\" onfocus=\"WdatePicker({maxDate:'%y-%M-%d'})\">\r\n");
      out.write("                                                    </div>\r\n");
      out.write("                                                </td>\r\n");
      out.write("                                            </tr>\r\n");
      out.write("                                        </table>\r\n");
      out.write("                                        <div class=\"ui-filter-list-bottom\">\r\n");
      out.write("                                            <a id=\"btn_Cancel\" class=\"btn btn-default\">&nbsp;取&nbsp;&nbsp;消</a>\r\n");
      out.write("                                            <a id=\"btn_Search\" class=\"btn btn-primary\">&nbsp;确&nbsp;&nbsp;定</a>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left: 10px;\">\r\n");
      out.write("                                <div id=\"time_horizon\" class=\"btn-group\">\r\n");
      out.write("                                    <a class=\"btn btn-default\" data-value=\"1\">今天</a>\r\n");
      out.write("                                    <a class=\"btn btn-default active\" data-value=\"2\">近7天</a>\r\n");
      out.write("                                    <a class=\"btn btn-default\" data-value=\"3\">近1个月</a>\r\n");
      out.write("                                    <a class=\"btn btn-default\" data-value=\"4\">近3个月</a>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"gridPanel\">\r\n");
      out.write("                <table id=\"gridTable\" ></table>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"ui-layout-center\">\r\n");
      out.write("        <div class=\"center-Panel\">\r\n");
      out.write("            <div class=\"panel-Title\">漏损统计图表</div>\r\n");
      out.write("            <div class=\"row\" style=\"overflow: hidden;\">\r\n");
      out.write("                <div style=\"width: 50%; float: left;\">\r\n");
      out.write("                    <div class=\"portal-panel-title\">\r\n");
      out.write("                        &nbsp;&nbsp;<i class=\"fa fa-dashboard\"></i>&nbsp;&nbsp;漏损率（%）\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"portal-panel-content\" style=\"margin-top: 0px; overflow: hidden;\">\r\n");
      out.write("                        <div id=\"statChart1\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div style=\"width: 50%; float: left;\">\r\n");
      out.write("                    <div class=\"portal-panel-title\">\r\n");
      out.write("                        &nbsp;&nbsp;<i class=\"fa fa-pie-chart\"></i>&nbsp;&nbsp;用水漏水量（%）\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"portal-panel-content\" style=\"margin-top: 0px; overflow: hidden;\">\r\n");
      out.write("                        <div id=\"statChart2\" class=\"border-left\"></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"row\" style=\"overflow: hidden;\">\r\n");
      out.write("                <div style=\"width: 100%; float: left;\">\r\n");
      out.write("                    <div class=\"portal-panel-title\" style=\"border-top: 1px solid #ccc;color: #666;\">\r\n");
      out.write("                        &nbsp;&nbsp;<i class=\"fa fa-line-chart\"></i>&nbsp;&nbsp;漏损率变化曲线图（%）\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"portal-panel-content\" style=\"margin-top: 0px; overflow: hidden;\">\r\n");
      out.write("                        <div id=\"statChart3\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<script src=\"/static/scripts/jquery/jquery-1.12.4.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/jquery-ui/jquery-ui.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/bootstrap/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/echarts/echarts.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/layout/jquery.layout.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/datepicker/WdatePicker.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/jqgrid/jqgrid.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/datepicker/datepicker.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/utils/learun-ui.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("    $(function () {\r\n");
      out.write("        InitialPage();\r\n");
      out.write("        GetGrid();\r\n");
      out.write("        $(\".row\").height(($(window).height() - 52) / 2);\r\n");
      out.write("        $(\"#statChart1\").height(($(window).height()) / 2);\r\n");
      out.write("        $(\"#statChart2\").height(($(window).height()) / 2);\r\n");
      out.write("        $(\"#statChart3\").height(($(window).height()) / 2 - 18);\r\n");
      out.write("        LoadChart(\"0\", \"0\", \"100\");\r\n");
      out.write("        LoadChart(-1);\r\n");
      out.write("    });\r\n");
      out.write("    //初始化页面\r\n");
      out.write("    function InitialPage() {\r\n");
      out.write("        //layout布局\r\n");
      out.write("        $('#layout').layout({\r\n");
      out.write("            applyDemoStyles: true,\r\n");
      out.write("            west__size: 540,\r\n");
      out.write("            onresize: function () {\r\n");
      out.write("                $(window).resize()\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        //resize重设(表格、树形)宽高\r\n");
      out.write("        $(window).resize(function (e) {\r\n");
      out.write("            window.setTimeout(function () {\r\n");
      out.write("                $(\"#gridTable\").setGridHeight($(window).height() - 122);\r\n");
      out.write("                $(\".row\").height(($(window).height() - 52) / 2);\r\n");
      out.write("                $(\"#statChart1\").height(($(window).height()) / 2);\r\n");
      out.write("                $(\"#statChart2\").height(($(window).height()) / 2);\r\n");
      out.write("                $(\"#statChart3\").height(($(window).height()) / 2 - 18);\r\n");
      out.write("            }, 200);\r\n");
      out.write("            e.stopPropagation();\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("    //加载表格\r\n");
      out.write("    function GetGrid() {\r\n");
      out.write("        var selectedRowIndex = 0;\r\n");
      out.write("        var $gridTable = $(\"#gridTable\");\r\n");
      out.write("        var queryJson = $(\"#filter-form\").GetWebControls();\r\n");
      out.write("        $gridTable.jqGrid({\r\n");
      out.write("            url: \"../../LeakageAnalyze/LeakageSortAnalyze/GetListJson\",\r\n");
      out.write("            postData: { queryJson: JSON.stringify(queryJson) },\r\n");
      out.write("            datatype: \"json\",\r\n");
      out.write("            height: $(window).height() - 122,\r\n");
      out.write("            autowidth: true,\r\n");
      out.write("            shrinkToFit: true,\r\n");
      out.write("            colModel: [\r\n");
      out.write("                { name: 'areaid', label: '主键', hidden: true },\r\n");
      out.write("                { name: 'areaname', label: 'DMA分区名称', index: \"areaname\", width: 150, align: 'left' },\r\n");
      out.write("                { name: \"leakagevalue\", label: \"漏水量（m³)\", index: \"leakagevalue\", width: 100, align: \"right\", formatter: 'number', formatoptions: { thousandsSeparator: \"\", decimalPlaces: 2 } },\r\n");
      out.write("                { name: \"flowvalue\", label: \"供水量（m³)\", index: \"flowvalue\", width: 100, align: \"right\", formatter: 'number', formatoptions: { thousandsSeparator: \"\", decimalPlaces: 2 } },\r\n");
      out.write("                { name: \"leakagerate\", label: \"漏损率（%）\", index: \"leakagerate\", hidden: true, formatter: 'number', formatoptions: { thousandsSeparator: \"\", decimalPlaces: 1 } },\r\n");
      out.write("                {\r\n");
      out.write("                    label: \"漏损率（%）\", name: \"leakageratevalue\", index: \"leakageratevalue\", width: 70, align: \"center\",\r\n");
      out.write("                    formatter: function (cellvalue, options, rowObject) {\r\n");
      out.write("                        if (cellvalue <= 15) {\r\n");
      out.write("                            return \"<span class=\\\"label label-green-learun\\\">\" + cellvalue.toFixed(1) + \"</span>\";\r\n");
      out.write("                        } else if(cellvalue <= 30){\r\n");
      out.write("                            return \"<span class=\\\"label label-yellow-learun\\\">\" + cellvalue.toFixed(1) + \"</span>\";\r\n");
      out.write("                        } else {\r\n");
      out.write("                            return \"<span class=\\\"label label-red-learun\\\">\" + cellvalue.toFixed(1) + \"</span>\";\r\n");
      out.write("                        }\r\n");
      out.write("                    }\r\n");
      out.write("                },\r\n");
      out.write("            ],\r\n");
      out.write("            rowNum: \"10000\",\r\n");
      out.write("            rownumbers: true,\r\n");
      out.write("            onSelectRow: function () {\r\n");
      out.write("                selectedRowIndex = $(\"#\" + this.id).getGridParam('selrow');\r\n");
      out.write("                var rowData = $(\"#\" + this.id).jqGrid('getRowData', $(\"#\" + this.id).jqGrid('getGridParam', 'selrow'));\r\n");
      out.write("                var leakRate = rowData['leakagerate'];\r\n");
      out.write("                var leakValue = rowData['leakagevalue'];\r\n");
      out.write("                var flowValue = rowData['flowvalue'];\r\n");
      out.write("                var areaId = rowData['areaid'];\r\n");
      out.write("                LoadChart(leakRate, leakValue, flowValue);\r\n");
      out.write("                LoadChart3(areaId);\r\n");
      out.write("            },\r\n");
      out.write("            gridComplete: function () {\r\n");
      out.write("                $(\"#\" + this.id).setSelection(selectedRowIndex, false);\r\n");
      out.write("                var pSelectedRowIndex = $(\"#\" + this.id).getGridParam('selrow');\r\n");
      out.write("                if (pSelectedRowIndex > -1) {\r\n");
      out.write("                    var rowData = $(\"#\" + this.id).jqGrid('getRowData', pSelectedRowIndex);\r\n");
      out.write("                    var leakRate = rowData['leakagerate'];\r\n");
      out.write("                    var leakValue = rowData['leakagevalue'];\r\n");
      out.write("                    var flowValue = rowData['flowvalue'];\r\n");
      out.write("                    var areaId = rowData['areaid'];\r\n");
      out.write("                    LoadChart(leakRate, leakValue, flowValue);\r\n");
      out.write("                    LoadChart3(areaId);\r\n");
      out.write("                }\r\n");
      out.write("                else {\r\n");
      out.write("                    alert(pSelectedRowIndex);\r\n");
      out.write("                    $(\"#\" + this.id).setSelection(1, true);\r\n");
      out.write("                    pSelectedRowIndex = $(\"#\" + this.id).getGridParam('selrow');\r\n");
      out.write("                    alert(pSelectedRowIndex);\r\n");
      out.write("                    if (pSelectedRowIndex > -1) {\r\n");
      out.write("                        var rowData = $(\"#\" + this.id).jqGrid('getRowData', pSelectedRowIndex);\r\n");
      out.write("                        var leakRate = rowData['leakagerate'];\r\n");
      out.write("                        var leakValue = rowData['leakagevalue'];\r\n");
      out.write("                        var flowValue = rowData['flowvalue'];\r\n");
      out.write("                        var areaId = rowData['areaid'];\r\n");
      out.write("                        LoadChart(leakRate, leakValue, flowValue);\r\n");
      out.write("                        LoadChart3(areaId);\r\n");
      out.write("                    }\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        //var rowData = $gridTable.jqGrid('getRowData', 0);\r\n");
      out.write("        //$gridTable.setSelection(0, true);\r\n");
      out.write("\r\n");
      out.write("        //点击时间范围（今天、近7天、近一个月、近三个月）\r\n");
      out.write("        $(\"#time_horizon a.btn-default\").click(function () {\r\n");
      out.write("            $(\"#time_horizon a.btn-default\").removeClass(\"active\");\r\n");
      out.write("            $(this).addClass(\"active\");\r\n");
      out.write("            switch ($(this).attr('data-value')) {\r\n");
      out.write("                case \"1\"://今天\r\n");
      out.write("                    $(\"#StartTime\").val(\"2018-04-20\");\r\n");
      out.write("                    $(\"#EndTime\").val(\"2018-04-20\");\r\n");
      out.write("                    break;\r\n");
      out.write("                case \"2\"://近7天\r\n");
      out.write("                    $(\"#StartTime\").val(\"2018-04-13\");\r\n");
      out.write("                    $(\"#EndTime\").val(\"2018-04-20\");\r\n");
      out.write("                    break;\r\n");
      out.write("                case \"3\"://近一个月\r\n");
      out.write("                    $(\"#StartTime\").val(\"2018-03-20\");\r\n");
      out.write("                    $(\"#EndTime\").val(\"2018-04-20\");\r\n");
      out.write("                    break;\r\n");
      out.write("                case \"4\"://近三个月\r\n");
      out.write("                    $(\"#StartTime\").val(\"2018-01-20\");\r\n");
      out.write("                    $(\"#EndTime\").val(\"2018-04-20\");\r\n");
      out.write("                    break;\r\n");
      out.write("                default:\r\n");
      out.write("                    break;\r\n");
      out.write("            }\r\n");
      out.write("            $(\"#SelectedStartTime\").html($(\"#StartTime\").val());\r\n");
      out.write("            $(\"#SelectedEndTime\").html($(\"#EndTime\").val());\r\n");
      out.write("            SearchEvent();\r\n");
      out.write("        });\r\n");
      out.write("        //查询点击事件\r\n");
      out.write("        $(\"#btn_Search\").click(function () {\r\n");
      out.write("            SearchEvent();\r\n");
      out.write("            $(\".ui-filter-text\").trigger(\"click\");\r\n");
      out.write("            $(\"#SelectedStartTime\").html($(\"#StartTime\").val());\r\n");
      out.write("            $(\"#SelectedEndTime\").html($(\"#EndTime\").val());\r\n");
      out.write("        });\r\n");
      out.write("        //取消点击事件\r\n");
      out.write("        $(\"#btn_Cancel\").click(function () {\r\n");
      out.write("            $(\".ui-filter-text\").trigger(\"click\");\r\n");
      out.write("        });\r\n");
      out.write("        //查询表格函数\r\n");
      out.write("        function SearchEvent() {\r\n");
      out.write("            var queryJson = $(\"#filter-form\").GetWebControls();\r\n");
      out.write("            $(\"#gridTable\").jqGrid('setGridParam', {\r\n");
      out.write("                postData: { queryJson: JSON.stringify(queryJson) }\r\n");
      out.write("            }).trigger('reloadGrid');\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    var option1 = {\r\n");
      out.write("        tooltip: {\r\n");
      out.write("            formatter: \"{a} <br/>{b} : {c}%\"\r\n");
      out.write("        },\r\n");
      out.write("        toolbox: {\r\n");
      out.write("            show: true,\r\n");
      out.write("            feature: {\r\n");
      out.write("                mark: { show: true },\r\n");
      out.write("                restore: { show: true },\r\n");
      out.write("                saveAsImage: { show: true }\r\n");
      out.write("            }\r\n");
      out.write("        },\r\n");
      out.write("        series: [\r\n");
      out.write("            {\r\n");
      out.write("                name: '供水管网分区',\r\n");
      out.write("                type: 'gauge',\r\n");
      out.write("                center: ['50%', '45%'],\r\n");
      out.write("                radius: [0, '70%'],\r\n");
      out.write("                splitNumber: 10,       // 分割段数，默认为5\r\n");
      out.write("                axisLine: {            // 坐标轴线\r\n");
      out.write("                    lineStyle: {       // 属性lineStyle控制线条样式\r\n");
      out.write("                        color: [[0.15, '#228b22'], [0.3, '#ffbc00'], [1, '#ff4500']], // color: [[0.12, '#228b22'], [0.2, '#48b'], [1, '#ff4500']],\r\n");
      out.write("                        width: 8\r\n");
      out.write("                    }\r\n");
      out.write("                },\r\n");
      out.write("                axisTick: {            // 坐标轴小标记\r\n");
      out.write("                    splitNumber: 10,   // 每份split细分多少段\r\n");
      out.write("                    length: 12,        // 属性length控制线长\r\n");
      out.write("                    lineStyle: {       // 属性lineStyle控制线条样式\r\n");
      out.write("                        color: 'auto'\r\n");
      out.write("                    }\r\n");
      out.write("                },\r\n");
      out.write("                axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel\r\n");
      out.write("                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE\r\n");
      out.write("                        color: 'auto'\r\n");
      out.write("                    }\r\n");
      out.write("                },\r\n");
      out.write("                splitLine: {           // 分隔线\r\n");
      out.write("                    show: true,        // 默认显示，属性show控制显示与否\r\n");
      out.write("                    length: 20,         // 属性length控制线长\r\n");
      out.write("                    lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式\r\n");
      out.write("                        color: 'auto'\r\n");
      out.write("                    }\r\n");
      out.write("                },\r\n");
      out.write("                pointer: {\r\n");
      out.write("                    width: 5\r\n");
      out.write("                },\r\n");
      out.write("                title: {\r\n");
      out.write("                    show: true,\r\n");
      out.write("                    offsetCenter: [0, '-30%'],       // x, y，单位px\r\n");
      out.write("                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE\r\n");
      out.write("                        fontWeight: 'bolder'\r\n");
      out.write("                    }\r\n");
      out.write("                },\r\n");
      out.write("                detail: {\r\n");
      out.write("                    formatter: '{value}%',\r\n");
      out.write("                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE\r\n");
      out.write("                        color: 'auto',\r\n");
      out.write("                        fontSize: 20,\r\n");
      out.write("                        fontWeight: 'bolder'\r\n");
      out.write("                    }\r\n");
      out.write("                },\r\n");
      out.write("                data: [{ value: 0, name: '漏损率' }]\r\n");
      out.write("            }\r\n");
      out.write("        ]\r\n");
      out.write("    };\r\n");
      out.write("\r\n");
      out.write("    option2 = {\r\n");
      out.write("        tooltip: {\r\n");
      out.write("            trigger: 'item',\r\n");
      out.write("            formatter: \"{a} <br/>{b} : {c} ({d}%)\"\r\n");
      out.write("        },\r\n");
      out.write("        toolbox: {\r\n");
      out.write("            show: true,\r\n");
      out.write("            feature: {\r\n");
      out.write("                mark: { show: true },\r\n");
      out.write("                restore: { show: true },\r\n");
      out.write("                saveAsImage: { show: true }\r\n");
      out.write("            }\r\n");
      out.write("        },\r\n");
      out.write("        legend: {\r\n");
      out.write("            orient: 'vertical',\r\n");
      out.write("            x: 'left',\r\n");
      out.write("            data: ['漏水量', '用水量']\r\n");
      out.write("        },\r\n");
      out.write("        calculable: true,\r\n");
      out.write("        series: [\r\n");
      out.write("            {\r\n");
      out.write("                name: '用水漏水量（m³）',\r\n");
      out.write("                type: 'pie',\r\n");
      out.write("                radius: '60%',\r\n");
      out.write("                itemStyle: {\r\n");
      out.write("                    normal: {\r\n");
      out.write("                        label: {\r\n");
      out.write("                            position: 'inner',\r\n");
      out.write("                            formatter: function (params) {\r\n");
      out.write("                                return (params.percent - 0).toFixed(0) + '%'\r\n");
      out.write("                            }\r\n");
      out.write("                        },\r\n");
      out.write("                        labelLine: {\r\n");
      out.write("                            show: false\r\n");
      out.write("                        }\r\n");
      out.write("                    }\r\n");
      out.write("                },\r\n");
      out.write("                center: ['50%', '40%'],\r\n");
      out.write("                data: [\r\n");
      out.write("                    { value: 26, name: '漏水量' },\r\n");
      out.write("                    { value: 235, name: '用水量' }\r\n");
      out.write("                ]\r\n");
      out.write("            }\r\n");
      out.write("        ]\r\n");
      out.write("    };\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    function LoadChart(leakRate, leakValue, flowValue) {\r\n");
      out.write("        if (leakRate == undefined)\r\n");
      out.write("            leakRate = \"0\";\r\n");
      out.write("        option1.series[0].data[0].value = Number(leakRate);\r\n");
      out.write("        var myChart1 = echarts.init(document.getElementById('statChart1'), 'macarons');\r\n");
      out.write("        myChart1.setOption(option1, true);\r\n");
      out.write("\r\n");
      out.write("        if (leakValue == undefined)\r\n");
      out.write("            leakValue = \"0\";\r\n");
      out.write("        if (flowValue == undefined)\r\n");
      out.write("            flowValue = \"100\";\r\n");
      out.write("        option2.series[0].data[0].value = Number(leakValue);\r\n");
      out.write("        option2.series[0].data[1].value = Number(flowValue) - Number(leakValue);\r\n");
      out.write("        var myChart2 = echarts.init(document.getElementById('statChart2'), 'default');\r\n");
      out.write("        myChart2.setOption(option2, true);\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function LoadChart3(areaId) {\r\n");
      out.write("        var postData = $(\"#filter-form\").GetWebControls();\r\n");
      out.write("        postData[\"AreaId\"] = areaId;\r\n");
      out.write("        $.ajax({\r\n");
      out.write("            url: \"../../LeakageAnalyze/LeakageSortAnalyze/GetChartJson\",\r\n");
      out.write("            data: { queryJson: JSON.stringify(postData) },\r\n");
      out.write("            type: \"post\",\r\n");
      out.write("            dataType: \"json\",\r\n");
      out.write("            success: function (data) {\r\n");
      out.write("                if (data) {\r\n");
      out.write("                    var myChart = echarts.init(document.getElementById('statChart3'), 'macarons');\r\n");
      out.write("                    myChart.setOption(data);\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
