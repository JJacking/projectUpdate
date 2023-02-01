package com.green.vo;

import java.sql.Timestamp;

public class CommentVO {
	private int cno;
	private int num;
	private String userId;
	private String nickName;
	private String reContent;
	private Timestamp reWirteDate;
	
	public CommentVO() {}
	
	public CommentVO(int cno, int num, String nickName, String userId, String reContent, Timestamp reWirteDate) {
		this.cno = cno;
		this.num = num;
		this.nickName = nickName;
		this.userId = userId;
		this.reContent = reContent;
		this.reWirteDate = reWirteDate;
	}

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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	
}
