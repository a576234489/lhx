package com.qysgps.waterdma.service.menu;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qysgps.waterdma.dao.MenuDao;
import com.qysgps.waterdma.entity.Button;
import com.qysgps.waterdma.entity.Menu;
import com.qysgps.waterdma.entity.Menu2;
import com.qysgps.waterdma.entity.Role;
import com.qysgps.waterdma.util.Const;
import com.qysgps.waterdma.util.JsonUtils;
import com.qysgps.waterdma.util.PageData;
import com.qysgps.waterdma.util.RightsHelper;

@Service
public class MenuService {
	@Autowired
	private MenuDao menuDao;
	
	public List<Menu> listAllParentMenu(){
		return menuDao.listAllParentMenu();
	}
	public List<Menu> listSubMenuByParentId(String roleId){
		return menuDao.listSubMenuByParentId(roleId);
	}
//	public List<Menu> listAllMenu() {
//		List<Menu> rl = this.listAllParentMenu();
//		for (Menu menu : rl) {
//			List<Menu> subList = this.listSubMenuByParentId(menu.getMenuId());
//			menu.setSubMenu(subList);
//		}
//		return rl;
//	}
	public PageData findMaxId(PageData pd){
		return menuDao.findMaxId(pd);
	}
	public void saveMenu(Menu menu){
		 menuDao.insertMenu(menu);
	}
	public PageData getMenuById(PageData pd){
		return menuDao.getMenuById(pd);
	}
	public List<Menu> getMenuByParentId(String PARENT_ID){
		return menuDao.getMenuByParentId(PARENT_ID);
	}
	/**
	 * 获取当前菜单集合以及保存全部菜单
	 * @param parentId
	 * @return
	 */
	public List<Menu> getCurrentMenuList(String parentId){
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		String roleRights = (String) session.getAttribute(Const.SESSION_USER_RIGHTS);
		List<Menu> menuList = getMenuList(parentId, roleRights);
		if(session.getAttribute(Const.SESSION_allmenuList)==null){
		session.setAttribute(Const.SESSION_allmenuList, menuList);
		}
		List<Menu> listCurrentMenu = new ArrayList<Menu>();
		for (Menu menu : menuList) {
			if(menu.isHasMenu()){
				List<Menu> childNodes = menu.getChildNodes();
				List<Menu> listSubMenu = new ArrayList<Menu>();
				for (Menu menu2 : childNodes) {
					if(menu2.isHasMenu()){
						listSubMenu.add(menu2);
					}
					menu.setChildNodes(listSubMenu);
				}
				listCurrentMenu.add(menu);
			}
		}
		return listCurrentMenu;
	}
	
	/**
	 * 获取全部菜单集合
	 * @param parentId
	 * @return
	 */
	public List<Menu> getAllMenuList(String parentId){
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		List<Menu> menuList = null;
		if(session.getAttribute(Const.SESSION_allmenuList)==null){
			menuList = getMenuList(parentId, "");
		}else{
			menuList = (List<Menu>) session.getAttribute(Const.SESSION_allmenuList);
		}
		return menuList;
	}
	
	/**
	 * 获取菜单以及按钮权限信息公用方法
	 * @param parentId
	 * @param roleRights
	 * @return
	 */
	public List<Menu> getMenuList(String parentId,String roleRights){
		List<Menu> list = getMenuByParentId(parentId);
		List<Menu> listMenu = new ArrayList<>();
		for (Menu menu : list) {
			if(!menu.getIsLeaf()){
				menu.setValue(menu.getId());
				menu.setShowcheck(true);
				menu.setIsexpand(true);
				menu.setComplete(true);
				menu.setHasChildren(true);
				menu.setHasMenu(RightsHelper.testRights(roleRights, menu.getId()));
				menu.setChildNodes(getMenuList(menu.getId(),roleRights));
				listMenu.add(menu);
			}else{
				menu.setValue(menu.getId());
				menu.setShowcheck(true);
				menu.setIsexpand(true);
				menu.setComplete(true);
				menu.setHasChildren(false);
				menu.setHasMenu(RightsHelper.testRights(roleRights, menu.getId()));
				menu.setChildNodes(getMenuList(menu.getId(),roleRights));
				listMenu.add(menu);
			}
			
		}
		return listMenu;
		
	}
	
	/**
	 * 获取用户权限按钮信息
	 * @param parentId
	 * @param roleRights
	 * @return
	 */
	public Button getButtonQX(PageData pd){
		Button btn = new Button();
		String add_QX = pd.getString("ADD_QX");
		String cha_QX = pd.getString("CHA_QX");
		String del_QX = pd.getString("DEL_QX");
		String edit_QX = pd.getString("EDIT_QX");
		List<Menu> addList = getMenuList("0", add_QX);
		List<Menu> chaList = getMenuList("0", cha_QX);
		List<Menu> delList = getMenuList("0", del_QX);	
		List<Menu> editList = getMenuList("0", edit_QX);
		btn.setAdd(addList);
		btn.setEdit(editList);
		btn.setCha(chaList);
		btn.setDel(delList);
		return btn;
	}
//	public String chageResult(List<Menu> menuList){
//		String currentMenuList = JsonUtils.objectToJson(menuList);
//		String currentMenuListJson = currentMenuList.replaceAll("menuId", "id").replaceAll("menuName", "text").replaceAll("parentId", "parentnodes").replaceAll("menuIcon", "img").replaceAll("subMenu", "ChildNodes");
//		return currentMenuListJson;
//	}
	public void updateMenuById(PageData pd){
		menuDao.updateMenuById(pd);
	}
	public void addMenu(Menu menu){
		menuDao.addMenu(menu);
	}
}
