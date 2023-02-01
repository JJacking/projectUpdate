package com.green.vo;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ProductVO {
	private int num;
	private String title;
	private String productPic;
	private int strPrice;
	private String memberId;
	private String content;
	private Timestamp regdate;
	private int bidCount;
	private int readCount;
	private Timestamp writeDate;
	private String category;
	private int endSale;
	
	
	public ProductVO() {
		
	}
	
	public ProductVO(int num, String title, String productPic, int strPrice, String memberId, String content,
			Timestamp regdate, int bidCount, int readCount, Timestamp writeDate, String category, int endSale) {
		this.num = num;
		this.title = title;
		this.productPic = productPic;
		this.strPrice = strPrice;
		this.memberId = memberId;
		this.content = content;
		this.regdate = regdate;
		this.bidCount = bidCount;
		this.readCount = readCount;
		this.writeDate = writeDate;
		this.category = category;
		this.endSale = endSale;
	}
	
	public int getEndSale() {
		return endSale;
	}

	public void setEndSale(int endSale) {
		this.endSale = endSale;
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
	public String getProductPic() {
		return productPic;
	}
	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}
	public int getStrPrice() {
		return strPrice;
	}
	public void setStrPrice(int strPrice) {
		this.strPrice = strPrice;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		String date = regdate.replace("T", " ");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date d = null;
		
		try {
			d = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Timestamp t = new Timestamp(d.getTime());
		this.regdate = t;
	}
	public int getBidCount() {
		return bidCount;
	}
	public void setBidCount(int bidCount) {
		this.bidCount = bidCount;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	
}
