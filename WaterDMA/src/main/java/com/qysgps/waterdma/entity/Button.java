package com.qysgps.waterdma.entity;

import java.util.List;

public class Button {
	private List<Menu> add;
	private List<Menu> del;
	private List<Menu> edit;
	private List<Menu> cha;
	public List<Menu> getAdd() {
		return add;
	}
	public void setAdd(List<Menu> add) {
		this.add = add;
	}
	public List<Menu> getDel() {
		return del;
	}
	public void setDel(List<Menu> del) {
		this.del = del;
	}
	public List<Menu> getEdit() {
		return edit;
	}
	public void setEdit(List<Menu> edit) {
		this.edit = edit;
	}
	public List<Menu> getCha() {
		return cha;
	}
	public void setCha(List<Menu> cha) {
		this.cha = cha;
	}
	
	
}
