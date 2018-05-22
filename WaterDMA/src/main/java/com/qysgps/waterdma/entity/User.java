package com.qysgps.waterdma.entity;

/**
 * 类名称：User.java 类描述：
 * @author FH 作者单位： 联系方式： 创建时间：2014年6月28日
 * @version 1.0
 */
public class User {
	private String userId; // 用户id
	private String userName; // 用户名
	private String password; // 密码
	private String name; // 姓名
	private String roleId; // 权限
	private String sex; // 角色id
	public String getAdd() {
		return add;
	}
	public void setAdd(String add) {
		this.add = add;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getEdit() {
		return edit;
	}
	public void setEdit(String edit) {
		this.edit = edit;
	}
	public String getCha() {
		return cha;
	}
	public void setCha(String cha) {
		this.cha = cha;
	}
	private String mobile; // 最后登录时间
	private String createDate;
	private int userOrder;
	private String addQX;
	private String delQX;
	private String editQX;
	private String chaQX;
	private String rights;
	private String add;
	private String del;
	private String edit;
	private String cha;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getUserOrder() {
		return userOrder;
	}
	public void setUserOrder(int userOrder) {
		this.userOrder = userOrder;
	}
	public String getAddQX() {
		return addQX;
	}
	public void setAddQX(String addQX) {
		this.addQX = addQX;
	}
	public String getDelQX() {
		return delQX;
	}
	public void setDelQX(String delQX) {
		this.delQX = delQX;
	}
	public String getEditQX() {
		return editQX;
	}
	public void setEditQX(String editQX) {
		this.editQX = editQX;
	}
	public String getChaQX() {
		return chaQX;
	}
	public void setChaQX(String chaQX) {
		this.chaQX = chaQX;
	}
	public String getRights() {
		return rights;
	}
	public void setRights(String rights) {
		this.rights = rights;
	}

}
