package com.green.vo;

import java.sql.Timestamp;

public class CommentVO {
	private int cno;
	private int num;
	private String userName;
	private String userPass;
	private String reContent;
	private Timestamp reWirteDate;
	
	public CommentVO() {}
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public Timestamp getReWirteDate() {
		return reWirteDate;
	}
	public void setReWirteDate(Timestamp reWirteDate) {
		this.reWirteDate = reWirteDate;
	}
	
	
}
