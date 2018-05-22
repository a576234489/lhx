package com.qysgps.waterdma.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qysgps.waterdma.dao.UserDao;
import com.qysgps.waterdma.entity.User;
import com.qysgps.waterdma.util.PageData;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	/**
	 * 更具用户名和密码获取用户
	 * @param pd
	 * @return
	 */
	public PageData getUserByNameAndPwd(PageData pd){
		return userDao.getUserByNameAndPwd(pd);
	}
	
	/**
	 * 获取用户列表
	 * @param pd
	 * @return
	 */
	public List<PageData> getUserPageListJson(PageData pd){
		return userDao.getUserPageListJson(pd);
	}
	/**
	 * 更具用户名获取用户
	 */
	public PageData getUserByName(String userName){
		return userDao.getUserByName(userName);
	}
	public void deleteUserById(PageData pd){
		userDao.deleteUserById(pd);
	}
	public void insertUser(PageData pd){
		userDao.insertUser(pd);
	}
	public PageData getMaxOrder(){
		return userDao.getMaxOrder();
	}
	public void updateUserInfoById(PageData pd){
		userDao.updateUserInfoById(pd);
	}
	public void updateUserQXById(PageData pd){
		userDao.updateUserQXById(pd);
	}
	
	public PageData getUserById(PageData pd){
		return userDao.getUserById(pd);
	}
	public void updateUserQXByRoleId(PageData pd){
		userDao.updateUserQXByRoleId(pd);
	}
}
