package com.green.vo;

import java.sql.Timestamp;

public class CustomerVO {
	private int buyNum;
	private int num;
	private String memberId;
	private String bidMoney;
	private Timestamp bidTime;	
	
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBidMoney() {
		return bidMoney;
	}
	public void setBidMoney(String bidMoney) {
		this.bidMoney = bidMoney;
	}
	public Timestamp getBidTime() {
		return bidTime;
	}
	public void setBidTime(Timestamp date) {
		this.bidTime = date;
	}
	
}
