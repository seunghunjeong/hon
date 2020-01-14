package com.example.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class UserVO {
	private String permit;
	private String uid;
	private String upw;
	private String nick;
	private String location;
	private String gender;
	private String phone;
	private String email;
	private int upoint;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date regdate;
	private String image;
	private String birthday;

	public String getPermit() {
		return permit;
	}

	public void setPermit(String permit) {
		this.permit = permit;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
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

	public int getUpoint() {
		return upoint;
	}

	public void setUpoint(int upoint) {
		this.upoint = upoint;
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
		return "UserVO [permit=" + permit + ", uid=" + uid + ", upw=" + upw + ", nick=" + nick + ", location="
				+ location + ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", upoint=" + upoint
				+ ", regdate=" + regdate + ", image=" + image + ", birthday=" + birthday + "]";
	}
}
