package com.qysgps.waterdma.service.roleService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qysgps.waterdma.dao.RoleDao;
import com.qysgps.waterdma.util.PageData;

@Service
public class RoleService {
	@Autowired
	private RoleDao roleDao;
	public PageData findRoleById(String roleId){
		return roleDao.findRoleById(roleId);
	}
	public List<PageData> findRoleList(){
		return roleDao.findRoleList();
	}
	public void updateRoleById(PageData pd){
		roleDao.updateRoleById(pd);
	}
	public List<PageData> getRolePageListJson(PageData pd){
		return roleDao.getRolePageListJson(pd);
	}
	public void insertRole(PageData pd){
		roleDao.insertRole(pd);
	}
	public void delteRoleById(PageData pd){
		roleDao.delteRoleById(pd);
	}
	public void updateRoleRightById(PageData pd){
		roleDao.updateRoleRightById(pd);
	}
}
