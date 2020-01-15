package com.example.domain;

public class MenuVO {
	private String sid;
	private int mcount;
	private String mname;
	private String mimage;
	private int price;
	private String special;
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public int getMcount() {
		return mcount;
	}
	public void setMcount(int mcount) {
		this.mcount = mcount;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMimage() {
		return mimage;
	}
	public void setMimage(String mimage) {
		this.mimage = mimage;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSpecial() {
		return special;
	}
	public void setSpecial(String special) {
		this.special = special;
	}
	@Override
	public String toString() {
		return "MenuVO [sid=" + sid + ", mcount=" + mcount + ", mname=" + mname + ", mimage=" + mimage + ", price="
				+ price + ", special=" + special + "]";
	}
	
}
