package com.lcomputer.vo;

public class Comment {
	
	private int b_idx;
	private String b_title;
	private String b_content;
	private String b_redate;
	private int rownum;
	private int a_idx;
	private int u_idx;
	private User user;
	private Pagination pagination;
	private int b_group;
	private int b_order;
	private int b_depth;
	private Board board;
	
	
	
	public Board getBoard() {
		return board;
	}
	public void setBoard(Board board) {
		this.board = board;
	}
	public int getB_group() {
		return b_group;
	}
	public void setB_group(int b_group) {
		this.b_group = b_group;
	}
	public int getB_order() {
		return b_order;
	}
	public void setB_order(int b_order) {
		this.b_order = b_order;
	}
	public int getB_depth() {
		return b_depth;
	}
	public void setB_depth(int b_depth) {
		this.b_depth = b_depth;
	}
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_redate() {
		return b_redate;
	}
	public void setB_redate(String b_redate) {
		this.b_redate = b_redate;
	}
	
	public int getA_idx() {
		return a_idx;
	}
	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

}
