package com.green.vo;

public class MemberVO {
	private String id;
	private String password;
	private String nickname;
	private long point;
	private String phone;
	private String address;
	private int grade;
	private String type;
	
	
	public MemberVO() {
		
	}

	public MemberVO(String id, String password, String nickname, long point, String phone, String address, int grade,
			String type) {
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.point = point;
		this.phone = phone;
		this.address = address;
		this.grade = grade;
		this.type = type;
	}

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public long getPoint() {
		return point;
	}


	public void setPoint(long point) {
		this.point = point;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}
	
	
}
