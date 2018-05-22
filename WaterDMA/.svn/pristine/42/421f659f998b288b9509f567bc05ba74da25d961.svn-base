package com.qysgps.waterdma.controller.permission;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qysgps.waterdma.controller.basecontroller.BaseController;
import com.qysgps.waterdma.entity.Button;
import com.qysgps.waterdma.entity.Menu;
import com.qysgps.waterdma.entity.User;
import com.qysgps.waterdma.entity.UserQueryJson;
import com.qysgps.waterdma.service.menu.MenuService;
import com.qysgps.waterdma.service.roleService.RoleService;
import com.qysgps.waterdma.service.user.UserService;
import com.qysgps.waterdma.util.Const;
import com.qysgps.waterdma.util.JsonUtils;
import com.qysgps.waterdma.util.PageData;
import com.qysgps.waterdma.util.RightsHelper;
import com.qysgps.waterdma.util.Tools;

@Controller
@RequestMapping("/system")
public class PermissionController extends BaseController{
	@Autowired
	private UserService userService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private RoleService roleService;
	
	/**
	 * 跳转到用户管理首页
	 * @return
	 */
	@RequestMapping("/user/index")
	public ModelAndView toUserIndex(){
		ModelAndView mv = this.getModelAndView();
		Session session = this.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		mv.addObject("user", user);
		mv.setViewName("system/user/index");
		return mv;
	}
	
	/**
	 * 得到用户列表信息
	 * @return
	 */
	@RequestMapping("/User/GetPageListJson")
	@ResponseBody
	public Object getUserPageListJson(){
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.get("queryJson")==null){
			pd.put("condition", null);
			pd.put("keyword", null);
		}else{
			String queryJson = pd.getString("queryJson");
			UserQueryJson userQueryJson = JsonUtils.jsonToPojo(queryJson, UserQueryJson.class);
			String keyword = userQueryJson.getKeyword();
			try {
				String NAME = new String(keyword.getBytes("ISO-8859-1"),"utf-8");
				pd.put("keyword", NAME);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pd.put("condition", userQueryJson.getCondition());
		}
	    String records = new String();
	    String total = new String();
	    pd.put("records", records);
	    pd.put("total", total);
	    List<PageData> list = userService.getUserPageListJson(pd);
	    Map<String, Object> map = new HashMap<>();
	    map.put("page", Integer.parseInt(pd.getString("page")));
	    map.put("rows", list);
	    map.put("records", (Integer)pd.get("records"));
	    map.put("total", (Integer)pd.get("total"));
	    map.put("costtime",Tools.date2Str(new Date()));
		return map;
	}
	
	/**
	 * 跳转到用户添加，修改界面
	 * @param action
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET,value="/User/Form")
	public String goUserForm(String ACTION){
		return "system/user/addUser";
	}
	
	/**
	 * 用户表的编辑，删除，添加
	 * @param action
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST,value="/User/Form")
	@ResponseBody
	public Object saveForm(String ACTION){
		Map<String,String> map = new HashMap<>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String msg = "";
		try {
			if("ADD".equals(ACTION)){
				pd.put("CREATE_DATE", Tools.date2Str(new Date()));
				pd.put("USER_ID", this.get32UUID());
				pd.put("USER_ORDER", ((Integer)userService.getMaxOrder().get("USER_ORDER")+1));
				String passwd = new SimpleHash("SHA-1", pd.getString("USERNAME"),pd.getString("PASSWORD")).toString();
				pd.put("PASSWORD", passwd);
				PageData pdRole = roleService.findRoleById(pd.getString("ROLE_ID"));
				pd.put("ADD_QX",pdRole.getString("ADD_QX"));
				pd.put("DEL_QX",pdRole.getString("DEL_QX"));
				pd.put("EDIT_QX",pdRole.getString("EDIT_QX"));
				pd.put("CHA_QX",pdRole.getString("CHA_QX"));
				pd.put("RIGHTS",pdRole.getString("RIGHTS"));
				userService.insertUser(pd);
			}else if("DEL".equals(ACTION)){
				userService.deleteUserById(pd);
			}else if("EDIT".equals(ACTION)){
				PageData pdRole = roleService.findRoleById(pd.getString("ROLE_ID"));
				pd.put("ADD_QX", pdRole.getString("ADD_QX"));
				pd.put("DEL_QX", pdRole.getString("DEL_QX"));
				pd.put("EDIT_QX", pdRole.getString("EDIT_QX"));
				pd.put("CHA_QX", pdRole.getString("CHA_QX"));
				pd.put("RIGHTS", pdRole.getString("RIGHTS"));
				userService.updateUserInfoById(pd);
			}else{
				msg = "error";
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
			msg = "error";
		}
		if("".equals(msg)){
			msg = "success";
		}
		map.put("result", msg);
		return map;
	}
	
	/**
	 * 跳转到用户授权页面
	 * @return
	 */
	@RequestMapping(value="/user/PermissionUser",method=RequestMethod.GET)
	public String goPermisson(){
		return "system/user/permissions";
	}
	
	/**
	 * 获取用户的菜单权限列表
	 * @param rights
	 * @return
	 */
	@RequestMapping(value="/User/getMenu",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object getMenuList(){
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = userService.getUserById(pd);
		List<Menu> menuList = menuService.getMenuList("0", pd.getString("RIGHTS"));
		String menuListListJson = JsonUtils.objectToJson(menuList);
		String menuListListJson2 = menuListListJson.replaceAll("childNodes", "ChildNodes");
		return menuListListJson2;
	}
	
	/**
	 * 获取用户的按钮权限
	 * @param rights
	 * @return
	 */
	@RequestMapping(value="/user/getButtonMenu",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object getButtonMenu(){
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = userService.getUserById(pd);
		Button buttonQX = menuService.getButtonQX(pd);
		String buttonQXListJson = JsonUtils.objectToJson(buttonQX);
		String buttonQXListJson2 = buttonQXListJson.replaceAll("childNodes", "ChildNodes");
		System.out.println(buttonQXListJson2);
		return buttonQXListJson2;
	}
	
	/**
	 * 用户授权页面保存
	 * @return
	 */
	@RequestMapping(value="/user/PermissionUser",method=RequestMethod.POST)
	@ResponseBody
	public Object savePermisson(){
		Map<String, Object> map = new HashMap<>();
		String msg = "";
		PageData pd = new PageData();
		pd = this.getPageData();
		String ModuleTree = pd.getString("ModuleTree");
		String Rights = setQxValue(ModuleTree);
		pd.put("RIGHTS",Rights);
		String AddPermissions = pd.getString("AddPermissions");
		String ADD_QX = setQxValue(AddPermissions);
		pd.put("ADD_QX",ADD_QX);
		String DeletePermissions = pd.getString("DeletePermissions");
		String DEL_QX = setQxValue(DeletePermissions);
		pd.put("DEL_QX",DEL_QX);
		String EditPermissions = pd.getString("EditPermissions");
		String EDIT_QX = setQxValue(EditPermissions);
		pd.put("EDIT_QX",EDIT_QX);
		String CheckPermissions = pd.getString("CheckPermissions");
		String CHA_QX = setQxValue(CheckPermissions);
		pd.put("CHA_QX",CHA_QX);
		try {
			userService.updateUserQXById(pd);
		} catch (Exception e) {
			msg = "error";
			e.printStackTrace();
		}
		if(msg.equals("")||msg == null){
			msg = "success";
		}
		map.put("result", msg);
		return map;
	}
	
	/**
	 * 得到角色集合
	 * @return
	 */
	@RequestMapping("/role/GetTreeJson")
	@ResponseBody
	public Object getRoleList(){
		List<PageData> roleList = roleService.findRoleList();
		return roleList;
	}
	
	/**
	 * 跳转到角色管理首页
	 */
	@RequestMapping("/role/index")
	public String goRole(){
		return "system/role/index";
	}
	
	/**
	 * 得到角色列表信息
	 */
	@RequestMapping("/role/GetPageListJson")
	@ResponseBody
	public Object getRolePageListJson(){
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.get("queryJson")==null || "".equals(pd.get("queryJson"))){
			pd.put("condition", null);
			pd.put("keyword", null);
		}else{
			String queryJson = pd.getString("queryJson");
			UserQueryJson userQueryJson = JsonUtils.jsonToPojo(queryJson, UserQueryJson.class);
			String keyword = userQueryJson.getKeyword();
			try {
				String NAME = new String(keyword.getBytes("ISO-8859-1"),"utf-8");
				pd.put("keyword", NAME);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pd.put("condition", userQueryJson.getCondition());
		}
	    String records = new String();
	    String total = new String();
	    pd.put("records", records);
	    pd.put("total", total);
	    List<PageData> rolePageListJson = roleService.getRolePageListJson(pd);
	    Map<String, Object> map = new HashMap<>();
	    map.put("page", Integer.parseInt(pd.getString("page")));
	    map.put("rows", rolePageListJson);
	    map.put("records", (Integer)pd.get("records"));
	    map.put("total", (Integer)pd.get("total"));
	    map.put("costtime",Tools.date2Str(new Date()));
		return map;
	}
	
	/**
	 * 跳转到角色添加，修改界面
	 * @param action
	 * @return
	 */
	@RequestMapping(value="/role/Form",method=RequestMethod.GET)
	public String goRoleForm(){
		return "system/role/form";
	}
	
	/**
	 * 角色表的修改，删除，添加
	 * @param action
	 * @return
	 */
	@RequestMapping(value="/role/Form",method=RequestMethod.POST)
	@ResponseBody
	public Object saveRoleForm(String ACTION){
		Map<String,String> map = new HashMap<>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String msg = "";
		try {
			if("ADD".equals(ACTION)){
				pd.put("RIGHTS","");
				pd.put("ADD_QX","");
				pd.put("DEL_QX","");
				pd.put("EDIT_QX","");
				pd.put("CHA_QX","");
				pd.put("ROLE_ID",this.get32UUID());
				roleService.insertRole(pd);
			}else if("DEL".equals(ACTION)){
				roleService.delteRoleById(pd);
			}else if("EDIT".equals(ACTION)){
				roleService.updateRoleById(pd);
			}else{
				msg = "error";
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
			msg = "error";
		}
		if("".equals(msg)){
			msg = "success";
		}
		map.put("result", msg);
		return map;
	}
	
	/**
	 * 转向角色表的授权页面
	 * @return
	 */
	@RequestMapping(value="/role/PermissionRole",method=RequestMethod.GET)
	public String goRolePermission(){
		return "system/role/permissions";
	}
	
	/**
	 * 角色表的授权页面的菜单值 
	 * @param role_id
	 * @return
	 */
	@RequestMapping(value = "/role/getMenu",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object getRoleMenuJson(String ROLE_ID){
		PageData pd = roleService.findRoleById(ROLE_ID);
		List<Menu> menuList = menuService.getMenuList("0", pd.getString("RIGHTS"));
		String menuListListJson = JsonUtils.objectToJson(menuList);
		String menuListListJson2 = menuListListJson.replaceAll("childNodes", "ChildNodes");
		return menuListListJson2;
	}
	
	/**
	 * 角色表的授权页面的按钮值 
	 * @param role_id
	 * @return
	 */
	@RequestMapping(value="/role/getButtonMenu",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object getRoleButtonJson(String ROLE_ID){
		PageData pdRole = roleService.findRoleById(ROLE_ID);
		Button buttonQX = menuService.getButtonQX(pdRole);
		String buttonQXListJson = JsonUtils.objectToJson(buttonQX);
		String buttonQXListJson2 = buttonQXListJson.replaceAll("childNodes", "ChildNodes");
		return buttonQXListJson2;
	}
	
	/**
	 * 角色表的授权页面的保存
	 * @return
	 */
	@RequestMapping(value="/role/PermissionRole",method=RequestMethod.POST)
	@ResponseBody
	public Object saveRolePermission(){
		Map<String, Object> map = new HashMap<>();
		String msg = "";
		PageData pd = new PageData();
		pd = this.getPageData();
		String ModuleTree = pd.getString("ModuleTree");
		String Rights = setQxValue(ModuleTree);
		pd.put("RIGHTS",Rights);
		String AddPermissions = pd.getString("AddPermissions");
		String ADD_QX = setQxValue(AddPermissions);
		pd.put("ADD_QX",ADD_QX);
		String DeletePermissions = pd.getString("DeletePermissions");
		String DEL_QX = setQxValue(DeletePermissions);
		pd.put("DEL_QX",DEL_QX);
		String EditPermissions = pd.getString("EditPermissions");
		String EDIT_QX = setQxValue(EditPermissions);
		pd.put("EDIT_QX",EDIT_QX);
		String CheckPermissions = pd.getString("CheckPermissions");
		String CHA_QX = setQxValue(CheckPermissions);
		pd.put("CHA_QX",CHA_QX);
		try {
			roleService.updateRoleRightById(pd);
			userService.updateUserQXByRoleId(pd);
		} catch (Exception e) {
			msg = "error";
			e.printStackTrace();
		}
		if(msg.equals("")||msg == null){
			msg = "success";
		}
		map.put("result", msg);
		return map;
		
	}
	
	/**
	 * 字符串转换为权限值
	 * @param QX_VALUE
	 * @return
	 */
	public String setQxValue(String QX_VALUE){
		if(QX_VALUE != null && !"".equals(QX_VALUE)){
		String[] qxList = Tools.str2StrArray(QX_VALUE);
		String qxValue1 = RightsHelper.sumRights(qxList)+"";
		return qxValue1;
		}else{
			return "";
		}
		
	}
}
