/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-05-15 05:34:36 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.dataAnalyze.leakageConfig;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class DMAParamConfig_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>列表页面</title>\r\n");
      out.write("    <link href=\"/static/styles/font-awesome.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/plugins/jquery-ui/jquery-ui.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/bootstrap/bootstrap.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/plugins/jqgrid/jqgrid.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <link href=\"/static/scripts/plugins/tree/tree.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <link href=\"/static/scripts/plugins/datetime/datetime.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <link href=\"/static/styles/learun-ui.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <style>\r\n");
      out.write("        body {\r\n");
      out.write("            margin: 10px 10px 0 10px;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"titlePanel\">\r\n");
      out.write("    <div class=\"title-search\">\r\n");
      out.write("        <table>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <input id=\"txt_Keyword\" type=\"text\" class=\"form-control\" placeholder=\"请输入要查询关键字\" style=\"width: 200px;\" />\r\n");
      out.write("                </td>\r\n");
      out.write("                <td style=\"padding-left: 5px;\">\r\n");
      out.write("                    <a id=\"btn_Search\" class=\"btn btn-primary\"><i class=\"fa fa-search\"></i>查询</a>\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"toolbar\">\r\n");
      out.write("        <div class=\"btn-group\">\r\n");
      out.write("            <a id=\"lr-replace\" class=\"btn btn-default\" onclick=\"reload()\"><i class=\"fa fa-refresh\"></i>&nbsp;刷新</a>\r\n");
      out.write("            <a id=\"lr-edit\" class=\"btn btn-default\" ><i class=\"fa fa-pencil-square-o\"></i>&nbsp;编辑</a>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"gridPanel\">\r\n");
      out.write("    <table id=\"gridTable\"></table>\r\n");
      out.write("    <div id=\"gridPager\"></div>\r\n");
      out.write("</div>\r\n");
      out.write("<script src=\"/static/scripts/jquery/jquery-1.12.4.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/jquery-ui/jquery-ui.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/bootstrap/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/echarts/echarts.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/layout/jquery.layout.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/datepicker/WdatePicker.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/jqgrid/jqgrid.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/tree/tree.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/datepicker/datepicker.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/utils/learun-ui.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("    $(function () {\r\n");
      out.write("        InitialPage();\r\n");
      out.write("        GetGrid();\r\n");
      out.write("    });\r\n");
      out.write("    //初始化页面\r\n");
      out.write("    function InitialPage() {\r\n");
      out.write("        //resize重设布局;\r\n");
      out.write("        $(window).resize(function (e) {\r\n");
      out.write("            window.setTimeout(function () {\r\n");
      out.write("                $('#gridTable').setGridWidth(($('.gridPanel').width()));\r\n");
      out.write("                $('#gridTable').setGridHeight($(window).height() - 136.5);\r\n");
      out.write("            }, 200);\r\n");
      out.write("            e.stopPropagation();\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("    //加载表格\r\n");
      out.write("    function GetGrid() {\r\n");
      out.write("        var selectedRowIndex = 0;\r\n");
      out.write("        var $gridTable = $('#gridTable');\r\n");
      out.write("        $gridTable.jqGrid({\r\n");
      out.write("            autowidth: true,\r\n");
      out.write("            height: $(window).height() - 136.5,\r\n");
      out.write("            url: \"../../LeakageConfig/DMAParamConfig/GetPageListJson\",\r\n");
      out.write("            datatype: \"json\",\r\n");
      out.write("            colModel: [\r\n");
      out.write("                { label: '分区名称', name: 'AreaName', index: 'AreaName', width: 200, align: 'left' },\r\n");
      out.write("                { label: '区域平均压力', name: 'GsAznp', index: 'GsPeopleNum', width: 100, align: 'left', sortable: false },\r\n");
      out.write("                { label: '居民用户数量', name: 'GsPeopleNum', index: 'GsPeopleNum', width: 100, align: 'left',sortable: false  },\r\n");
      out.write("                { label: '每小时每户支管估计漏损水量', name: 'GsPeopleLeak', index: 'GsPeopleLeak', width: 200, align: 'right',sortable: false  },\r\n");
      out.write("                { label: '非居民用户水量', name: 'GsNoPeopleLeak', index: 'GsNoPeopleLeak', width: 110, align: 'right',sortable: false  },\r\n");
      out.write("                { label: '用户支管数量', name: 'GsC1', index: 'GsC1', width: 100, align: 'right',sortable: false  },\r\n");
      out.write("                { label: '私有管道数量', name: 'GsC2', index: 'GsC2', width: 100, align: 'right',sortable: false  },\r\n");
      out.write("                { label: '干管长度', name: 'GsL1', index: 'GsL1', width: 100, align: 'right',sortable: false  },\r\n");
      out.write("                { label: '私有管道平均长度', name: 'GsL2', index: 'GsL2', width: 120, align: 'right',sortable: false  },\r\n");
      out.write("                { label: '管网设施状况因子', name: 'GsICF', index: 'GsICF', width: 120, align: 'right',sortable: false  },\r\n");
      out.write("                { label: 'AreaId', name: 'AreaId', index: 'AreaId', width: 10, align: 'left',sortable: true ,hidden: true },\r\n");
      out.write("            ],\r\n");
      out.write("            viewrecords: true,\r\n");
      out.write("            rowNum: 30,\r\n");
      out.write("            rowList: [30, 50, 100],\r\n");
      out.write("            pager: \"#gridPager\",\r\n");
      out.write("            sortname: 'AreaId ASC',\r\n");
      out.write("            rownumbers: true,\r\n");
      out.write("            shrinkToFit: false,\r\n");
      out.write("            gridview: true,\r\n");
      out.write("            onSelectRow: function () {\r\n");
      out.write("                selectedRowIndex = $('#' + this.id).getGridParam('selrow');\r\n");
      out.write("            },\r\n");
      out.write("            gridComplete: function () {\r\n");
      out.write("                $('#' + this.id).setSelection(selectedRowIndex, false);\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        //查询事件\r\n");
      out.write("        $(\"#btn_Search\").click(function () {\r\n");
      out.write("            var queryJson = {\r\n");
      out.write("                condition: 'AreaName',\r\n");
      out.write("                keyword: $(\"#txt_Keyword\").val()\r\n");
      out.write("            }\r\n");
      out.write("            $gridTable.jqGrid('setGridParam', {\r\n");
      out.write("                postData: { queryJson: JSON.stringify(queryJson) }, page: 1\r\n");
      out.write("            }).trigger('reloadGrid');\r\n");
      out.write("        });\r\n");
      out.write("        //查询回车\r\n");
      out.write("        $('#txt_Keyword').bind('keypress', function (event) {\r\n");
      out.write("            if (event.keyCode == \"13\") {\r\n");
      out.write("                $('#btn_Search').trigger(\"click\");\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("    //编辑\r\n");
      out.write("    function btn_edit() {\r\n");
      out.write("        var keyValue = jqGridRowValue('#gridTable', 'AreaId');\r\n");
      out.write("        if (checkedRow(keyValue)) {\r\n");
      out.write("            dialogOpen({\r\n");
      out.write("                id: 'Form',\r\n");
      out.write("                title: '编辑DMA配置参数',\r\n");
      out.write("                url: '/LeakageConfig/DMAParamConfig/Form?keyValue=' + keyValue,\r\n");
      out.write("                width: '500px',\r\n");
      out.write("                height: '400px',\r\n");
      out.write("                callBack: function (iframeId) {\r\n");
      out.write("                    top.frames[iframeId].AcceptClick();\r\n");
      out.write("                }\r\n");
      out.write("            })\r\n");
      out.write("        }\r\n");
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