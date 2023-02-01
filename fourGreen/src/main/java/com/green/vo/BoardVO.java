package com.green.vo;

import java.sql.Timestamp;

public class BoardVO {
	private int num; 
	private String nickName; 
	private String email;
	private String pass;
	private String title; 
	private String content; 
	private int readCount; 
	private Timestamp wirteDate;
	
	public BoardVO() {}
	

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
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
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Timestamp getWirteDate() {
		return wirteDate;
	}
	public void setWirteDate(Timestamp wirteDate) {
		this.wirteDate = wirteDate;
	}

	
	
	
}
