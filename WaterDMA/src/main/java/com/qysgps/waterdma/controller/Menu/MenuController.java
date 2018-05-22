package com.qysgps.waterdma.controller.Menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.qysgps.waterdma.controller.basecontroller.BaseController;
import com.qysgps.waterdma.entity.Menu;
import com.qysgps.waterdma.service.menu.MenuService;
import com.qysgps.waterdma.util.Const;
import com.qysgps.waterdma.util.JsonUtils;
import com.qysgps.waterdma.util.PageData;
@Controller
@RequestMapping(value = "/menu")
public class MenuController extends BaseController{
	
	@Autowired
	private MenuService menuService;
	
	/**
	 * 跳转到菜单页面
	 * @return
	 */
	
	@RequestMapping
	public ModelAndView list(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("menu/index");
		return mv;
	}
	
	/**
	 * 菜单管理页面数据信息
	 * @return
	 */
	@RequestMapping(value = "/treeJson", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object menuTreeJson(){
		Session session = this.getSession();
		String allMenuListJson;
		if(session.getAttribute(Const.SESSION_allmenuList)==null){
		 List<Menu> allMenuList = menuService.getAllMenuList("0");
		 allMenuListJson = JsonUtils.objectToJson(allMenuList);
		 allMenuListJson = allMenuListJson.replaceAll("childNodes", "ChildNodes");
		}else{
		 List<Menu> allMenuList = (List<Menu> ) session.getAttribute(Const.SESSION_allmenuList);
		 allMenuListJson = JsonUtils.objectToJson(allMenuList);
		 allMenuListJson = allMenuListJson.replaceAll("childNodes", "ChildNodes");
		}
		return allMenuListJson;
	}
	
	/**
	 * 首页菜单页面数据信息
	 * @return
	 */
	@RequestMapping(value = "/index/treeJson", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object indexMenuTreeJson(){
		Session session = this.getSession();
		String currentMenuListJson;
//		if(session.getAttribute(Const.SESSION_menuList)==null){
		 List<Menu> menuList = menuService.getCurrentMenuList("0");
		 currentMenuListJson = JsonUtils.objectToJson(menuList);
		 currentMenuListJson = currentMenuListJson.replaceAll("childNodes", "ChildNodes");
//		}else{
//		 List<Menu> menuList = (List<Menu> ) session.getAttribute(Const.SESSION_menuList);
//		 currentMenuListJson = JsonUtils.objectToJson(menuList);
//		 currentMenuListJson = currentMenuListJson.replaceAll("childNodes", "ChildNodes");
//		}
		return currentMenuListJson;
	}
	
	/**
	 * 新增菜单页面数据信息
	 * @return
	 */
	@RequestMapping(value = "/addMenu", produces = "application/json;charset=UTF-8")
	public ModelAndView toAddMenu(){
		ModelAndView mv = this.getModelAndView();
		Session session = this.getSession();
		String allMenuListJson;
		if(session.getAttribute(Const.SESSION_allmenuList)==null){
			  List<Menu> allMenuList = menuService.getAllMenuList("0");
			  allMenuListJson = JsonUtils.objectToJson(allMenuList);
			  allMenuListJson = allMenuListJson.replaceAll("childNodes", "ChildNodes");
		}else{
			 List<Menu> allMenuList = (List<Menu>)session.getAttribute(Const.SESSION_allmenuList);
			 allMenuListJson = JsonUtils.objectToJson(allMenuList);
			 allMenuListJson = allMenuListJson.replaceAll("childNodes", "ChildNodes");
		}
		mv.addObject("menuList", allMenuListJson);
		mv.setViewName("menu/addMenu");
		return mv;
	}
	
	/**
	 * 新增菜单保存
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Object save(Menu menu){
		Map<String, String> map = new HashMap<>();
		try {
			PageData pd = new PageData();
			if(!"0".equals(menu.getParentnodes())){
			List<Menu> list = menuService.getMenuByParentId(menu.getParentnodes());//更具menuId查询出子菜单
			if(list.size()==0){
				pd.put("isLeaf", "0");
				pd.put("menuId", menu.getParentnodes());
				menuService.updateMenuById(pd);
			}
			}
			menu.setIsLeaf(true);
			String menuId = (Integer.parseInt(menuService.findMaxId(pd).get("MID").toString())+1)+"";
			menu.setId(menuId);
			menuService.addMenu(menu);
			Session session = this.getSession();
			session.removeAttribute(Const.SESSION_allmenuList);
			List<Menu> allMenuList = menuService.getAllMenuList("0");
			session.setAttribute(Const.SESSION_allmenuList, allMenuList);
			map.put("msg", "sucess");
		} catch (NumberFormatException e) {
			e.printStackTrace();
			map.put("msg", "error");
		}
		return map;
	}
	
	/**
	 * 跳转菜单图标页面
	 * @return
	 */
	@RequestMapping("/icon")
	public ModelAndView toAddIcon(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("/menu/icon");
		return mv;
	}
	

}
