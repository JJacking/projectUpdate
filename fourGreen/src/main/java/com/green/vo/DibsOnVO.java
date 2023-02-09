package com.green.vo;

public class DibsOnVO {
	private int idx;
	private String id;
	private int num;
	private String title;
	
	public DibsOnVO() {}	
	
	public DibsOnVO(int idx, String id, int num, String title) {
		this.idx = idx;
		this.id = id;
		this.num = num;
		this.title = title;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
}
