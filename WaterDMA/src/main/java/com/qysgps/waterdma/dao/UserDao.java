package com.qysgps.waterdma.dao;

import java.util.List;

import com.qysgps.waterdma.entity.User;
import com.qysgps.waterdma.util.PageData;

public interface UserDao {
	public PageData getUserByNameAndPwd(PageData pd);
	public List<PageData> getUserPageListJson(PageData pd);
	public PageData getUserByName(String USERNAM);
	public void deleteUserById(PageData pd);
	public void insertUser(PageData pd);
	public PageData getMaxOrder();
	public PageData getUserById(PageData pd);
	public void updateUserQXByRoleId(PageData pd);
	public void updateUserInfoById(PageData pd);
	public void updateUserQXById(PageData pd);
}
