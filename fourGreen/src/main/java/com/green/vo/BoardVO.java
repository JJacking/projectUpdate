package com.green.vo;

import java.sql.Timestamp;

public class BoardVO {
	private int num; 
	private String id;
	private String nickName;
	private String title; 
	private String content; 
	private int readCount; 
	private Timestamp wirteDate;
	
	public BoardVO() {}
	
	public BoardVO(int num, String id, String nickName, String title, String content, int readCount, Timestamp wirteDate) {
		this.num = num;
		this.id = id;
		this.nickName = nickName;
		this.title = title;
		this.content = content;
		this.readCount = readCount;
		this.wirteDate = wirteDate;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	
}
