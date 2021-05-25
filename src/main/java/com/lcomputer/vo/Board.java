package com.lcomputer.vo;

public class Board {
	
	private int a_idx;
	private int u_idx;
	private String a_title;
	private int a_count;
	private String a_content;
	private int rownum;
	private String a_date;
	private int a_group;
	private int a_order;
	private int a_depth;
	private Pagination pagination;
	private User user;
	
	
	
	public int getA_group() {
		return a_group;
	}
	public void setA_group(int a_group) {
		this.a_group = a_group;
	}
	public int getA_order() {
		return a_order;
	}
	public void setA_order(int a_order) {
		this.a_order = a_order;
	}
	public int getA_depth() {
		return a_depth;
	}
	public void setA_depth(int a_depth) {
		this.a_depth = a_depth;
	}
	public String getA_date() {
		return a_date;
	}
	public void setA_date(String a_date) {
		this.a_date = a_date;
	}
	public int getA_idx() {
		return a_idx;
	}
	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	public String getA_title() {
		return a_title;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public int getA_count() {
		return a_count;
	}
	public void setA_count(int a_count) {
		this.a_count = a_count;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

}
