package com.example.domain;

import java.util.Date;

public class StoreVO {
	private String sid;
	private String sname;
	private String location;
	private String phone;
	private String simage;
	private boolean reservation;
	private String weather;
	private String yearS;
	private String lvs;
	private String priceS;
	private String OpeningT;
	private String RestT;
	private String website;
	private String Ftype;
	private String RestD;
	private Date UpdateD;
	private String info;
	private String area;

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSimage() {
		return simage;
	}

	public void setSimage(String simage) {
		this.simage = simage;
	}

	public boolean isReservation() {
		return reservation;
	}

	public void setReservation(boolean reservation) {
		this.reservation = reservation;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public String getYearS() {
		return yearS;
	}

	public void setYearS(String yearS) {
		this.yearS = yearS;
	}

	public String getLvs() {
		return lvs;
	}

	public void setLvs(String lvs) {
		this.lvs = lvs;
	}

	public String getPriceS() {
		return priceS;
	}

	public void setPriceS(String priceS) {
		this.priceS = priceS;
	}

	public String getOpeningT() {
		return OpeningT;
	}

	public void setOpeningT(String openingT) {
		OpeningT = openingT;
	}

	public String getRestT() {
		return RestT;
	}

	public void setRestT(String restT) {
		RestT = restT;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getFtype() {
		return Ftype;
	}

	public void setFtype(String ftype) {
		Ftype = ftype;
	}

	public String getRestD() {
		return RestD;
	}

	public void setRestD(String restD) {
		RestD = restD;
	}

	public Date getUpdateD() {
		return UpdateD;
	}

	public void setUpdateD(Date updateD) {
		UpdateD = updateD;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	@Override
	public String toString() {
		return "StoreVO [sid=" + sid + ", sname=" + sname + ", location=" + location + ", phone=" + phone + ", simage="
				+ simage + " reservation=" + reservation + ", weather=" + weather + ", yearS=" + yearS + ", lvs=" + lvs
				+ ", priceS=" + priceS + ", OpeningT=" + OpeningT + ", RestT=" + RestT + ", website=" + website
				+ ", Ftype=" + Ftype + ", RestD=" + RestD + ", UpdateD=" + UpdateD + ", info=" + info + "]";
	}
}
