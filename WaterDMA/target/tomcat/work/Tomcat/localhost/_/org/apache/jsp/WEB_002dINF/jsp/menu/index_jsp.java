/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-05-07 03:15:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.menu;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>系统功能</title>\r\n");
      out.write("    <link href=\"/static/styles/font-awesome.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/plugins/jquery-ui/jquery-ui.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/bootstrap/bootstrap.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/plugins/jqgrid/jqgrid.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <link href=\"/static/scripts/plugins/tree/tree.css\" rel=\"stylesheet\"/>\r\n");
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
      out.write("        <div class=\"west-Panel\">\r\n");
      out.write("            <div class=\"panel-Title\">功能目录</div>\r\n");
      out.write("            <div id=\"itemTree\"></div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"ui-layout-center\">\r\n");
      out.write("        <div class=\"center-Panel\">\r\n");
      out.write("            <div class=\"panel-Title\">功能信息</div>\r\n");
      out.write("            <div class=\"titlePanel\">\r\n");
      out.write("                <div class=\"title-search\">\r\n");
      out.write("                    <table>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <div id=\"queryCondition\" class=\"btn-group\">\r\n");
      out.write("                                    <a class=\"btn btn-default dropdown-text\" data-toggle=\"dropdown\">选择条件</a>\r\n");
      out.write("                                    <a class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\"><span class=\"caret\"></span></a>\r\n");
      out.write("                                    <ul class=\"dropdown-menu\">\r\n");
      out.write("                                        <li><a data-value=\"EnCode\">编号</a></li>\r\n");
      out.write("                                        <li><a data-value=\"FullName\">名称</a></li>\r\n");
      out.write("                                        <li><a data-value=\"UrlAddress\">地址</a></li>\r\n");
      out.write("                                    </ul>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left: 2px;\">\r\n");
      out.write("                                <input id=\"txt_Keyword\" type=\"text\" class=\"form-control\" placeholder=\"请输入要查询关键字\" style=\"width: 200px;\" />\r\n");
      out.write("                            </td>\r\n");
      out.write("                            <td style=\"padding-left: 5px;\">\r\n");
      out.write("                                <a id=\"btn_Search\" class=\"btn btn-primary\"><i class=\"fa fa-search\"></i>&nbsp;查询</a>\r\n");
      out.write("                            </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </table>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"toolbar\">\r\n");
      out.write("                    <div class=\"btn-group\">\r\n");
      out.write("                        <a id=\"lr-replace\" class=\"btn btn-default\" onclick=\"reload();\"><i class=\"fa fa-refresh\"></i>&nbsp;刷新</a>\r\n");
      out.write("                        <a id=\"lr-add\" class=\"btn btn-default\" onclick=\"btn_add()\"><i class=\"fa fa-plus\"></i>&nbsp;新增</a>\r\n");
      out.write("                        <a id=\"lr-edit\" class=\"btn btn-default\" onclick=\"btn_edit()\"><i class=\"fa fa-pencil-square-o\"></i>&nbsp;编辑</a>\r\n");
      out.write("                        <a id=\"lr-delete\" class=\"btn btn-default\" onclick=\"btn_delete()\"><i class=\"fa fa-trash-o\"></i>&nbsp;删除</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"gridPanel\">\r\n");
      out.write("                <table id=\"gridTable\"></table>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("<script src=\"/static/scripts/jquery/jquery-1.12.4.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/bootstrap/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/jquery-ui/jquery-ui.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/layout/jquery.layout.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/jqgrid/jqgrid.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/tree/tree.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/utils/learun-ui.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("    $(function () {\r\n");
      out.write("        InitialPage();\r\n");
      out.write("        GetTree();\r\n");
      out.write("        ");
      out.write("\r\n");
      out.write("    });\r\n");
      out.write("    //初始化页面\r\n");
      out.write("    function InitialPage() {\r\n");
      out.write("        //layout布局\r\n");
      out.write("        $('#layout').layout({\r\n");
      out.write("            applyDemoStyles: true,\r\n");
      out.write("            onresize: function () {\r\n");
      out.write("                $(window).resize()\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        //resize重设(表格、树形)宽高\r\n");
      out.write("        $(window).resize(function (e) {\r\n");
      out.write("            window.setTimeout(function () {\r\n");
      out.write("                $('#gridTable').setGridWidth(($('.gridPanel').width()));\r\n");
      out.write("                $(\"#gridTable\").setGridHeight($(window).height() - 141.5);\r\n");
      out.write("                $(\"#itemTree\").setTreeHeight($(window).height() - 52);\r\n");
      out.write("            }, 200);\r\n");
      out.write("            e.stopPropagation();\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("    //加载树\r\n");
      out.write("    var _parentId = \"\";\r\n");
      out.write("    function GetTree() {\r\n");
      out.write("        var item = {\r\n");
      out.write("            height: $(window).height() - 52,\r\n");
      out.write("            url: \"/menu/treeJson\",\r\n");
      out.write("            onnodeclick: function (item) {\r\n");
      out.write("                _parentId = item.id;\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("            }\r\n");
      out.write("        };\r\n");
      out.write("        //初始化\r\n");
      out.write("        $(\"#itemTree\").treeview(item);\r\n");
      out.write("    }\r\n");
      out.write("    //加载表格\r\n");
      out.write("    function GetGrid() {\r\n");
      out.write("        var selectedRowIndex = 0;\r\n");
      out.write("        var $gridTable = $('#gridTable');\r\n");
      out.write("        $gridTable.jqGrid({\r\n");
      out.write("            url: \"\",\r\n");
      out.write("            datatype: \"json\",\r\n");
      out.write("            height: $(window).height() - 141.5,\r\n");
      out.write("            autowidth: true,\r\n");
      out.write("            colModel: [\r\n");
      out.write("                { label: \"主键\", name: \"ModuleId\", index: \"ModuleId\", hidden: true },\r\n");
      out.write("                { label: \"编号\", name: \"EnCode\", index: \"EnCode\", width: 150, align: \"left\" },\r\n");
      out.write("                { label: \"名称\", name: \"FullName\", index: \"FullName\", width: 150, align: \"left\" },\r\n");
      out.write("                { label: \"地址\", name: \"UrlAddress\", index: \"UrlAddress\", width: 350, align: \"left\" },\r\n");
      out.write("                { label: \"目标\", name: \"Target\", index: \"Target\", width: 60, align: \"center\" },\r\n");
      out.write("                {\r\n");
      out.write("                    label: \"菜单\", name: \"IsMenu\", index: \"IsMenu\", width: 50, align: \"center\",\r\n");
      out.write("                    formatter: function (cellvalue, options, rowObject) {\r\n");
      out.write("                        return cellvalue == 1 ? \"<i value=\" + cellvalue + \" class=\\\"fa fa-toggle-on\\\"></i>\" : \"<i value=\" + cellvalue + \" class=\\\"fa fa-toggle-off\\\"></i>\";\r\n");
      out.write("                    }\r\n");
      out.write("                },\r\n");
      out.write("                {\r\n");
      out.write("                    label: \"展开\", name: \"AllowExpand\", index: \"AllowExpand\", width: 50, align: \"center\",\r\n");
      out.write("                    formatter: function (cellvalue, options, rowObject) {\r\n");
      out.write("                        return cellvalue == 1 ? \"<i class=\\\"fa fa-toggle-on\\\"></i>\" : \"<i class=\\\"fa fa-toggle-off\\\"></i>\";\r\n");
      out.write("                    }\r\n");
      out.write("                },\r\n");
      out.write("                {\r\n");
      out.write("                    label: \"公共\", name: \"IsPublic\", index: \"IsPublic\", width: 50, align: \"center\",\r\n");
      out.write("                    formatter: function (cellvalue, options, rowObject) {\r\n");
      out.write("                        return cellvalue == 1 ? \"<i class=\\\"fa fa-toggle-on\\\"></i>\" : \"<i class=\\\"fa fa-toggle-off\\\"></i>\";\r\n");
      out.write("                    }\r\n");
      out.write("                },\r\n");
      out.write("                {\r\n");
      out.write("                    label: \"有效\", name: \"EnabledMark\", index: \"EnabledMark\", width: 50, align: \"center\",\r\n");
      out.write("                    formatter: function (cellvalue, options, rowObject) {\r\n");
      out.write("                        return cellvalue == 1 ? \"<i class=\\\"fa fa-toggle-on\\\"></i>\" : \"<i class=\\\"fa fa-toggle-off\\\"></i>\";\r\n");
      out.write("                    }\r\n");
      out.write("                },\r\n");
      out.write("                { label: \"描述\", name: \"Description\", index: \"Description\", width: 100, align: \"left\" }\r\n");
      out.write("            ],\r\n");
      out.write("            pager: false,\r\n");
      out.write("            rowNum: \"1000\",\r\n");
      out.write("            rownumbers: true,\r\n");
      out.write("            shrinkToFit: false,\r\n");
      out.write("            gridview: true,\r\n");
      out.write("            onSelectRow: function () {\r\n");
      out.write("                selectedRowIndex = $(\"#\" + this.id).getGridParam('selrow');\r\n");
      out.write("            },\r\n");
      out.write("            gridComplete: function () {\r\n");
      out.write("                $(\"#\" + this.id).setSelection(selectedRowIndex, false);\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("        //查询条件\r\n");
      out.write("        $(\"#queryCondition .dropdown-menu li\").click(function () {\r\n");
      out.write("            var text = $(this).find('a').html();\r\n");
      out.write("            var value = $(this).find('a').attr('data-value');\r\n");
      out.write("            $(\"#queryCondition .dropdown-text\").html(text).attr('data-value', value)\r\n");
      out.write("        });\r\n");
      out.write("        //查询事件\r\n");
      out.write("        $(\"#btn_Search\").click(function () {\r\n");
      out.write("            $gridTable.jqGrid('setGridParam', {\r\n");
      out.write("                url: \"\",\r\n");
      out.write("                postData: {\r\n");
      out.write("                    parentid: _parentId,\r\n");
      out.write("                    condition: $(\"#queryCondition\").find('.dropdown-text').attr('data-value'),\r\n");
      out.write("                    keyword: $(\"#txt_Keyword\").val()\r\n");
      out.write("                }\r\n");
      out.write("            }).trigger('reloadGrid');\r\n");
      out.write("        });\r\n");
      out.write("        //查询回车\r\n");
      out.write("        $('#txt_Keyword').on('keydown', function (event) {\r\n");
      out.write("            if (event.keyCode === 13) {\r\n");
      out.write("                $('#btn_Search').trigger(\"click\");\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("    //新增\r\n");
      out.write("    function btn_add() {\r\n");
      out.write("        dialogOpen({\r\n");
      out.write("            id: \"Form\",\r\n");
      out.write("            title: '添加功能',\r\n");
      out.write("            url: '/menu/addMenu?parentId=' + _parentId,\r\n");
      out.write("            width: \"700px\",\r\n");
      out.write("            height: \"430px\",\r\n");
      out.write("            btn: null\r\n");
      out.write("        });\r\n");
      out.write("    }\r\n");
      out.write("    //编辑\r\n");
      out.write("    function btn_edit() {\r\n");
      out.write("        var keyValue = $(\"#gridTable\").jqGridRowValue(\"\");\r\n");
      out.write("        if (checkedRow(keyValue)) {\r\n");
      out.write("            dialogOpen({\r\n");
      out.write("                id: \"Form\",\r\n");
      out.write("                title: '编辑功能',\r\n");
      out.write("                url: '',\r\n");
      out.write("                width: \"700px\",\r\n");
      out.write("                height: \"430px\",\r\n");
      out.write("                btn: null\r\n");
      out.write("            });\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("    //删除\r\n");
      out.write("    function btn_delete() {\r\n");
      out.write("        var keyValue = $(\"#gridTable\").jqGridRowValue(\"\");\r\n");
      out.write("        if (keyValue) {\r\n");
      out.write("            $.RemoveForm({\r\n");
      out.write("                url: \"\",\r\n");
      out.write("                param: { keyValue: keyValue },\r\n");
      out.write("                success: function (data) {\r\n");
      out.write("                    $(\"#gridTable\").trigger(\"reloadGrid\");\r\n");
      out.write("                }\r\n");
      out.write("            })\r\n");
      out.write("        } else {\r\n");
      out.write("            dialogMsg('请选择需要删除的数据项！', 0);\r\n");
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
