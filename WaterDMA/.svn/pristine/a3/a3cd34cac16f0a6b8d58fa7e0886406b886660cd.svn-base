package com.qysgps.waterdma.dao;

import java.util.List;

import com.qysgps.waterdma.entity.Menu;
import com.qysgps.waterdma.util.PageData;

public interface MenuDao {
	public List<Menu> listAllParentMenu();
	public List<Menu> listSubMenuByParentId(String roleId);
	public PageData findMaxId(PageData pd);
	public void insertMenu(Menu menu);
	public PageData getMenuById(PageData pd);
	public List<Menu> getMenuByParentId(String parentId);
	public void updateMenuById(PageData pd);
	public void addMenu(Menu menu);
}
