package com.green.vo;

import java.util.Date;

public class ChargeVO {
	private int idx;
	private String id;
	private long point;
	private Date regdate;
	private int result;
	
	public ChargeVO() {

	}
	
	public ChargeVO(int idx, String id, long point, Date regdate, int result) {
		this.idx = idx;
		this.id = id;
		this.point = point;
		this.regdate = regdate;
		this.result = result;
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

	public long getPoint() {
		return point;
	}

	public void setPoint(long point) {
		this.point = point;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}
	
}
