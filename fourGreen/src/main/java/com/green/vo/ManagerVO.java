package com.green.vo;

import java.sql.Timestamp;

public class ManagerVO {
	private int mgNum; 
	private String mgName; 
	private String title; 
	private String content; 
	private int readCount; 
	private Timestamp wirteDate;
	
	public ManagerVO() {}

	public int getMgNum() {
		return mgNum;
	}

	public void setMgNum(int mgNum) {
		this.mgNum = mgNum;
	}

	public String getMgName() {
		return mgName;
	}

	public void setMgName(String mgName) {
		this.mgName = mgName;
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
