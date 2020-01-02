package com.example.domain;

import java.util.Date;

public class CEOVO {
	private String permit;
	private String cid;
	private String cpw;
	private String location;
	private String gender;
	private String phone;
	private String email;
	private Date regdate;
	private String image;
	private String birthday;
	public String getPermit() {
		return permit;
	}
	public void setPermit(String permit) {
		this.permit = permit;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCpw() {
		return cpw;
	}
	public void setCpw(String cpw) {
		this.cpw = cpw;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	@Override
	public String toString() {
		return "UserVO [permit=" + permit + ", cid=" + cid + ", cpw=" + cpw + ", location=" + location + ", gender="
				+ gender + ", phone=" + phone + ", email=" + email + ", regdate=" + regdate + ", image=" + image
				+ ", birthday=" + birthday + "]";
	}
}
