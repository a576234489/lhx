/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-05-07 01:34:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.system.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class addUser_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>用户管理</title>\r\n");
      out.write("    <link href=\"/static/styles/font-awesome.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/plugins/jquery-ui/jquery-ui.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/bootstrap/bootstrap.min.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/bootstrap/bootstrap.extension.css\" rel=\"stylesheet\" />\r\n");
      out.write("    <link href=\"/static/scripts/plugins/tree/tree.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <link href=\"/static/scripts/plugins/datetime/datetime.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <link href=\"/static/scripts/plugins/wizard/wizard.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <link href=\"/static/styles/learun-ui.css\" rel=\"stylesheet\"/>\r\n");
      out.write("    <link href=\"/static/styles/learun-flowall.css\"/>\r\n");
      out.write("    <!–[if lt IE 9]><script src=\"/static/scripts/html5/json2.js\"></script><![endif]–>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<form id=\"form1\">\r\n");
      out.write("    <div style=\"margin-left: 10px; margin-right: 10px;\">\r\n");
      out.write("        <ul class=\"nav nav-tabs\">\r\n");
      out.write("            <li class=\"active\"><a href=\"#BaseInfo\" data-toggle=\"tab\">基本信息</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("        <div class=\"tab-content\" style=\"padding-top: 15px;\">\r\n");
      out.write("            <div id=\"BaseInfo\" class=\"tab-pane active\" style=\" padding-right: 30px;\">\r\n");
      out.write("                <table class=\"form\">\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td class=\"formTitle\">账户<font face=\"宋体\">*</font></td>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <input id=\"USERNAME\" type=\"text\" onblur=\"$.ExistField(this.id,'/system/User/Checked')\" class=\"form-control\" placeholder=\"请输入账户\" isvalid=\"yes\" checkexpession=\"NotNull\" />\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <td class=\"formTitle\">密码<font face=\"宋体\">*</font></td>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <input id=\"PASSWORD\" type=\"text\" class=\"form-control\" placeholder=\"请输入密码\" isvalid=\"yes\" checkexpession=\"NotNull\" />\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td class=\"formTitle\">角色<font face=\"宋体\">*</font></td>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <div id=\"ROLE_ID\" type=\"select\" class=\"ui-select\" checkexpession=\"NotNull\"></div>\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <td class=\"formTitle\">姓名</td>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <input id=\"NAME\" type=\"text\" class=\"form-control\" />\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td class=\"formTitle\">性别</td>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <div id=\"SEX\" type=\"select\" class=\"ui-select\">\r\n");
      out.write("                                <ul>\r\n");
      out.write("                                    <li data-value=\"1\">男</li>\r\n");
      out.write("                                    <li data-value=\"0\">女</li>\r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <td class=\"formTitle\">手机</td>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <input id=\"MOBILE\" type=\"text\" class=\"form-control\" />\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td class=\"formTitle\">QQ</td>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <input id=\"QQ\" type=\"text\" class=\"form-control\" />\r\n");
      out.write("                        </td>\r\n");
      out.write("                        <td class=\"formTitle\">电话</td>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <input id=\"MOBILE\" type=\"text\" class=\"form-control\" />\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td class=\"formTitle\">邮箱</td>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <input id=\"Email\" type=\"text\" class=\"form-control\" /></td>\r\n");
      out.write("\r\n");
      out.write("                        <td class=\"formTitle\">微信</td>\r\n");
      out.write("                        <td class=\"formValue\">\r\n");
      out.write("                            <input id=\"WeChat\" type=\"text\" class=\"form-control\" /></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th class=\"formTitle\" valign=\"top\" style=\"padding-top: 4px;\">备注\r\n");
      out.write("                        </th>\r\n");
      out.write("                        <td class=\"formValue\" colspan=\"3\">\r\n");
      out.write("                            <textarea id=\"Description\" class=\"form-control\" style=\"height: 50px;\"></textarea>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </table>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</form>\r\n");
      out.write("<script src=\"/static/scripts/jquery/jquery-1.12.4.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/jquery-ui/jquery-ui.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/bootstrap/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/tree/tree.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/validator/validator.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/utils/learun-ui.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/cryptojs/crypto-js.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/plugins/biginteger/BigInteger.js\"></script>\r\n");
      out.write("<script src=\"/static/scripts/utils/encrypt.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("    var USER_ID = request('USER_ID');\r\n");
      out.write("    var USERNAME = request('USERNAME');\r\n");
      out.write("    var action = request('ACTION');\r\n");
      out.write("    $(function () {\r\n");
      out.write("        initControl();\r\n");
      out.write("    });\r\n");
      out.write("    //初始化控件\r\n");
      out.write("    function initControl() {\r\n");
      out.write("        //角色\r\n");
      out.write("        $.ajax('/system/role/GetTreeJson')\r\n");
      out.write("            .done(function (data) {\r\n");
      out.write("                var str = '<ul>';\r\n");
      out.write("                for(var i=0; i<data.length; i++){\r\n");
      out.write("                    str += '<li data-value=\"'+ data[i].ROLE_ID +'\">'+ data[i].ROLE_NAME +'</li>'\r\n");
      out.write("                }\r\n");
      out.write("                str += '</ul>';\r\n");
      out.write("                $(\"#ROLE_ID\")\r\n");
      out.write("                    .html(str)\r\n");
      out.write("                    .ComboBox({\r\n");
      out.write("                        description: \"==请选择==\",\r\n");
      out.write("                        height: \"200px\"\r\n");
      out.write("                    });\r\n");
      out.write("            });\r\n");
      out.write("        //性别\r\n");
      out.write("        $(\"#SEX\").ComboBox({\r\n");
      out.write("            description: \"==请选择==\",\r\n");
      out.write("            height: \"200px\"\r\n");
      out.write("        });\r\n");
      out.write("        //判断添加与新增\r\n");
      out.write("        if(!!USER_ID){\r\n");
      out.write("            var tableData = request('tableData');\r\n");
      out.write("            tableData = JSON.parse(aceDecryption(tableData, nonce));\r\n");
      out.write("            $('#PASSWORD').val('******').attr('disabled', 'disabled');\r\n");
      out.write("            $('#USERNAME').val(USERNAME);\r\n");
      out.write("            for(var i in tableData){\r\n");
      out.write("                if(i === 'ROLE_ID'){\r\n");
      out.write("                    $(\"#\" + i).ComboBoxTreeSetValue(tableData[i]);\r\n");
      out.write("                }else if(i === 'SEX'){\r\n");
      out.write("                    tableData[i] === '男' ? $(\"#\" + i).ComboBoxTreeSetValue(1) : tableData[i] !== '' ? $(\"#\" + i).ComboBoxTreeSetValue(0) : '';\r\n");
      out.write("                }else{\r\n");
      out.write("                    $(\"#\" + i).val(tableData[i])\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("        }\r\n");
      out.write("    }\r\n");
      out.write("    //保存表单\r\n");
      out.write("    function AcceptClick() {\r\n");
      out.write("        if (!$(\"#form1\").Validform()) {\r\n");
      out.write("            return false;\r\n");
      out.write("        }\r\n");
      out.write("        var postData = $(\"#form1\").GetWebControls();\r\n");
      out.write("        postData['ACTION'] = action;\r\n");
      out.write("        postData['SEX'] = postData['SEX'] === '' ? '' : postData['SEX'] === '1' ? '男' : '女';\r\n");
      out.write("        if(USER_ID && USER_ID !=='') postData['USER_ID'] = USER_ID;\r\n");
      out.write("        $.SaveForm({\r\n");
      out.write("            url: \"/system/User/Form\",\r\n");
      out.write("            param: postData,\r\n");
      out.write("            loading: \"正在保存数据...\",\r\n");
      out.write("            success: function (data) {\r\n");
      out.write("                data.result && data.result === 'success' ? $.currentIframe().$(\"#gridTable\").trigger(\"reloadGrid\") : dialogMsg('数据更新失败', -1)\r\n");
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
