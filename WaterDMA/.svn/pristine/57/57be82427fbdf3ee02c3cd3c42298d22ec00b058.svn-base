package com.qysgps.waterdma.controller.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qysgps.waterdma.controller.basecontroller.BaseController;
import com.qysgps.waterdma.entity.Menu;
import com.qysgps.waterdma.entity.Role;
import com.qysgps.waterdma.entity.User;
import com.qysgps.waterdma.service.menu.MenuService;
import com.qysgps.waterdma.service.roleService.RoleService;
import com.qysgps.waterdma.service.user.UserService;
import com.qysgps.waterdma.util.AppUtil;
import com.qysgps.waterdma.util.Const;
import com.qysgps.waterdma.util.DateUtil;
import com.qysgps.waterdma.util.JsonUtils;
import com.qysgps.waterdma.util.PageData;
import com.qysgps.waterdma.util.RightsHelper;
import com.qysgps.waterdma.util.Tools;

@Controller
public class LoginController extends BaseController{
	@Autowired
	private UserService userService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private RoleService roleService;
	@RequestMapping("/login_toLogin")
	public ModelAndView toLogin(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("login/index");
		return mv;
	}
	/**
	 * 请求登录，验证用户
	 */
	@RequestMapping(value = "/login_login", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object login() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();//初始化pagedata中的map属性
		pd = this.getPageData();//获取jsp中传过来的参数，并以键值对的方式保存在map中。
		String KEYDATA[] = pd.getString("KEYDATA").split(",fh,");
		String errInfo = "";
		if (null != KEYDATA && KEYDATA.length == 2) {
			// shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();//得到当前正在执行的主题
			Session session = currentUser.getSession();//得到相对应的会话信息
				String USERNAME = KEYDATA[0];
				String PASSWORD = KEYDATA[1];
				pd.put("USERNAME", USERNAME);//给pagedat中的map添加值
					String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD).toString(); // 密码加密
					pd.put("PASSWORD", passwd);
					pd = userService.getUserByNameAndPwd(pd);
					if (pd != null) {
						User user = new User();
						//user_id,username,password,name,role_id,sex,mobile,create_date,user_order
						user.setCreateDate(pd.getString("CREATE_DATE"));
						user.setMobile(pd.getString("MOBILE"));
						user.setName(pd.getString("NAME"));
						user.setPassword(pd.getString("PASSWORD"));
						user.setRoleId(pd.getString("ROLE_ID"));
						user.setSex(pd.getString("SEX"));
						user.setUserId(pd.getString("USER_ID"));
						user.setUserName(pd.getString("USERNAME"));
						user.setUserOrder((Integer)pd.get("USER_ORDER"));
						user.setAddQX(pd.getString("ADD_QX"));
						user.setChaQX(pd.getString("CHA_QX"));
						user.setEditQX(pd.getString("EDIT_QX"));
						user.setDelQX(pd.getString("DEL_QX"));
						user.setRights(pd.getString("RIGHTS"));
						session.setAttribute(Const.SESSION_USER, user);

						 //shiro加入身份验证
						Subject subject = SecurityUtils.getSubject();
						UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, passwd);
						try {
							subject.login(token);
						} catch (AuthenticationException e) {
							errInfo = "身份验证失败！";
						}

					} else {
						errInfo = "usererror"; // 用户名或密码有误
					}
				}else {
						errInfo = "error"; // 缺少参数
					}
				if (Tools.isEmpty(errInfo)) {
					errInfo = "success"; // 验证成功
				}
				map.put("result", errInfo);
				return AppUtil.returnObject(new PageData(), map);
			}
	
	/**
	 * 访问系统首页
	 */
	@RequestMapping(value = "/main/{changeMenu}")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {

			// shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();

			User user = (User) session.getAttribute(Const.SESSION_USER);
			if (user != null) {

				String rights = user.getRights();
				// 避免每次拦截用户操作时查询数据库，以下将用户所属角色权限、用户权限限都存入session
				session.setAttribute(Const.SESSION_USER_RIGHTS, rights); // 将角色权限存入session
				String currentMenuListJson = "";
				if (null == session.getAttribute(Const.SESSION_menuList)) {
					if (Tools.notEmpty(rights)) {
						 List<Menu> currentMenuList = menuService.getCurrentMenuList("0");
						 session.setAttribute(Const.SESSION_menuList, currentMenuList);
						 currentMenuListJson = JsonUtils.objectToJson(currentMenuList);
						 currentMenuListJson = currentMenuListJson.replaceAll("childNodes", "ChildNodes");
					}
				} else {
					List<Menu> currentMenuList = (List<Menu>) session.getAttribute(Const.SESSION_menuList);
					currentMenuListJson = JsonUtils.objectToJson(currentMenuList);
					currentMenuListJson = currentMenuListJson.replaceAll("childNodes", "ChildNodes");
				}
				String UserJson = JsonUtils.objectToJson(user);
				mv.setViewName("home/index");
				mv.addObject("user", UserJson);
				mv.addObject("menuList", currentMenuListJson);
			} else {
				mv.setViewName("login/index");// session失效后跳转登录页面
			}

		} catch (Exception e) {
			mv.setViewName("login/index");
			logger.error(e.getMessage(), e);
		}
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 欢迎首页
	 */
	@RequestMapping("/home/adminDefaultDesktop")
	public ModelAndView toDefaultDesktop(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("home/adminDefaultDesktop");
		return mv;
	}
	
}
