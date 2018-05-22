package com.qysgps.waterdma.util;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.qysgps.waterdma.entity.Menu;
import com.qysgps.waterdma.entity.User;

/**
 * 权限处理
 * @author:fh
 */
public class Jurisdiction {
	
	/**
	 * 访问权限及初始化按钮权限(控制按钮的显示)
	 * @param menuUrl 菜单路径
	 * @return
	 */
	public static boolean hasJurisdiction(String menuUrl){
		// 判断是否拥有当前点击菜单的权限（内部过滤,防止通过url进入跳过菜单权限）
		/**
		 * 根据点击的菜单的xxx.do去菜单中的URL去匹配，当匹配到了此菜单，判断是否有此菜单的权限，没有的话跳转到404页面 根据按钮权限，授权按钮(当前点的菜单和角色中各按钮的权限匹对)
		 */
		// shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		List<Menu> listMenu = (List<Menu>) session.getAttribute(Const.SESSION_menuList);
		if(listMenu!=null){
		for (Menu menu : listMenu) {
			List<Menu> subMenu = menu.getChildNodes();
			for (Menu menu2 : subMenu) {
				if(menuUrl.equals(menu2.getUrl())){
					User user = (User) session.getAttribute(Const.SESSION_USER);
					String menuId2 = menu2.getId();
					user.setAdd(RightsHelper.testRights(user.getAddQX(), menuId2)?"1":"0");
					user.setDel(RightsHelper.testRights(user.getDelQX(), menuId2)?"1":"0");
					user.setEdit(RightsHelper.testRights(user.getEditQX(), menuId2)?"1":"0");
					user.setCha(RightsHelper.testRights(user.getChaQX(), menuId2)?"1":"0");
					session.removeAttribute(Const.SESSION_USER);
					session.setAttribute(Const.SESSION_USER, user);
			}
			}
		}
		return true;
		}else{
		return false;	
		}
		
	}

}
