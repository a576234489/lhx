/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-05-07 03:44:36 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.menu;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addMenu_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("    <title>Form</title>\r\n");
      out.write("    <link href=\"/static/styles/font-awesome.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/plugins/jquery-ui/jquery-ui.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/bootstrap/bootstrap.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/plugins/tree/tree.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <link href=\"/static/styles/learun-ui.css\" rel=\"stylesheet\"/>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<form id=\"form1\">\r\n");
      out.write("    <div class=\"widget-body\">\r\n");
      out.write("        <div class=\"step-content\" id=\"wizard-steps\" style=\"border-left: none; border-bottom: none; border-right: none;\">\r\n");
      out.write("            <div class=\"step-pane active\" id=\"step-1\" style=\"margin-left: 0px; margin-top: 15px; margin-right: 30px;\">\r\n");
      out.write("                <table class=\"form\">\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th class=\"formTitle\">编号</th>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <input id=\"id\" type=\"text\" class=\"form-control\" placeholder=\"请输入编号\"/>\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <th class=\"formTitle\">名称<font face=\"宋体\">*</font></th>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <input id=\"text\" type=\"text\" class=\"form-control\" placeholder=\"请输入名称\" isvalid=\"yes\" checkexpession=\"NotNull\" />\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th class=\"formTitle\">上级</th>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <div id=\"parentnodes\" type=\"selectTree\" class=\"ui-select\"></div>\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <th class=\"formTitle\">图标<font face=\"宋体\">*</font></th>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <input id=\"img\" type=\"text\" isvalid=\"yes\" checkexpession=\"NotNull\" class=\"form-control\" />\r\n");
      out.write("                            <span class=\"input-button\" onclick=\"SelectIcon()\" title=\"选取图标\">...</span>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th class=\"formTitle\">目标<font face=\"宋体\">*</font></th>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <div id=\"target\" type=\"select\" class=\"ui-select\" isvalid=\"yes\" checkexpession=\"NotNull\">\r\n");
      out.write("                                <ul>\r\n");
      out.write("                                    <li data-value=\"expand\">expand</li>\r\n");
      out.write("                                    <li data-value=\"iframe\">iframe</li>\r\n");
      out.write("                                    <li data-value=\"open\">open</li>\r\n");
      out.write("                                    <li data-value=\"href\">href</li>\r\n");
      out.write("                                    <li data-value=\"blank\">blank</li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <th class=\"formTitle\">排序</th>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <input id=\"sortCode\" type=\"text\" class=\"form-control\" checkexpession=\"Num\" />\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th class=\"formTitle\">地址</th>\r\n");
      out.write("                        <td class=\"formValue\" colspan=\"3\">\r\n");
      out.write("                            <input id=\"url\" type=\"text\" class=\"form-control\" />\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th class=\"formTitle\" style=\"height: 37px;\">选项</th>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <div class=\"checkbox user-select\">\r\n");
      out.write("                                <label>\r\n");
      out.write("                                    <input id=\"isMenu\" type=\"checkbox\" />\r\n");
      out.write("                                    菜单\r\n");
      out.write("                                </label>\r\n");
      out.write("                                <label>\r\n");
      out.write("                                    <input id=\"isPublic\" type=\"checkbox\" />\r\n");
      out.write("                                    公共\r\n");
      out.write("                                </label>\r\n");
      out.write("                                <label>\r\n");
      out.write("                                    <input id=\"allowExpand\" type=\"checkbox\" />\r\n");
      out.write("                                    展开\r\n");
      out.write("                                </label>\r\n");
      out.write("                                <label>\r\n");
      out.write("                                    <input id=\"enabledMark\" type=\"checkbox\" checked=\"checked\" />\r\n");
      out.write("                                    有效\r\n");
      out.write("                                </label>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th class=\"formTitle\" valign=\"top\" style=\"padding-top: 4px;\">描述\r\n");
      out.write("                        </th>\r\n");
      out.write("                        <td class=\"formValue\" colspan=\"3\">\r\n");
      out.write("                            <textarea id=\"description\" class=\"form-control\" style=\"height: 70px;\"></textarea>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </table>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"form-button\" id=\"wizard-actions\">\r\n");
      out.write("        <a id=\"btn_finish\" class=\"btn btn-success\">完成</a>\r\n");
      out.write("    </div>\r\n");
      out.write("</form>\r\n");
      out.write("<script src=\"/static/scripts/jquery/jquery-1.12.4.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/tree/tree.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/validator/validator.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/utils/learun-ui.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    var keyValue = request('keyValue');\r\n");
      out.write("    var parentId = request('parentId');\r\n");
      out.write("    $(function () {\r\n");
      out.write("        initialPage();\r\n");
      out.write("    });\r\n");
      out.write("    //初始化页面\r\n");
      out.write("    function initialPage() {\r\n");
      out.write("        //加载导向\r\n");
      out.write("        initControl();\r\n");
      out.write("\r\n");
      out.write("        $('#btn_finish').on('click', function (e) {\r\n");
      out.write("            AcceptClick();\r\n");
      out.write("            e.stopPropagation();\r\n");
      out.write("\r\n");
      out.write("        })\r\n");
      out.write("\r\n");
      out.write("    }\r\n");
      out.write("    //初始化控件\r\n");
      out.write("    function initControl() {\r\n");
      out.write("        //目标\r\n");
      out.write("        $(\"#target\").ComboBox({\r\n");
      out.write("            description: \"==请选择==\",\r\n");
      out.write("            height: \"200px\"\r\n");
      out.write("        });\r\n");
      out.write("        //上级\r\n");
      out.write("        $(\"#parentnodes\").ComboBoxTree({\r\n");
      out.write("            url: \"/menu/treeJson\",\r\n");
      out.write("            description: \"==请选择==\",\r\n");
      out.write("            height: \"195px\",\r\n");
      out.write("            allowSearch: true\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        $(\"#parentnodes\").ComboBoxTreeSetValue(parentId);\r\n");
      out.write("    }\r\n");
      out.write("    //选取图标\r\n");
      out.write("    function SelectIcon() {\r\n");
      out.write("        dialogOpen({\r\n");
      out.write("            id: \"SelectIcon\",\r\n");
      out.write("            title: '选取图标',\r\n");
      out.write("            url: '/menu/icon?controlId=img',\r\n");
      out.write("            width: \"1000px\",\r\n");
      out.write("            height: \"600px\",\r\n");
      out.write("            btn: false\r\n");
      out.write("        })\r\n");
      out.write("    }\r\n");
      out.write("    //保存表单\r\n");
      out.write("    function AcceptClick() {\r\n");
      out.write("        if (!$('#form1').Validform()) {\r\n");
      out.write("            return false;\r\n");
      out.write("        }\r\n");
      out.write("        var postData = $(\"#form1\").GetWebControls();\r\n");
      out.write("        $.SaveForm({\r\n");
      out.write("            url: \"/menu/save\",\r\n");
      out.write("            param: postData,\r\n");
      out.write("            loading: \"正在保存数据...\",\r\n");
      out.write("            success: function (data) {\r\n");
      out.write("                if(data.msg ==='success' && top.initialPage){\r\n");
      out.write("                    top.initialPage();\r\n");
      out.write("                }\r\n");
      out.write("                console.log(data)\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("            }\r\n");
      out.write("        })\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
