package com.example.domain;

public class ReplyVO {
	private String rid;
	private String uid;
	private String sid;
	private String retext;
	private String image;
	private String score;
	private String regidate;
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getRetext() {
		return retext;
	}
	public void setRetext(String retext) {
		this.retext = retext;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	@Override
	public String toString() {
		return "ReplyVO [rid=" + rid + ", uid=" + uid + ", sid=" + sid + ", retext=" + retext + ", image=" + image
				+ ", score=" + score + ", regidate=" + regidate + "]";
	}
}
