package com.green.vo;

import java.sql.Timestamp;

public class CustomerBoardVO {
	private int num;
    private String name;
    private String title;
    private String content;
    private Timestamp wirteDate;
    
    public CustomerBoardVO() {}
    
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getWirteDate() {
		return wirteDate;
	}
	public void setWirteDate(Timestamp wirteDate) {
		this.wirteDate = wirteDate;
	}
    
    
}
