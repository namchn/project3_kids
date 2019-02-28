package com.kitri.project3.boardBulletin;

import java.sql.Date;

public class BulletinBoard {
	private int bulletin_num;
	private String id;
	private String stu_group;
	private String mng_group;
	private String title;
	private String content;
	private Date time;
	private int viewcount;
	private int secret;
	
	
	public BulletinBoard() {}
	public BulletinBoard(int bulletin_num, String id, String stu_group, String mng_group, String title, String content,
			Date time, int viewcount, int secret) {
		this.bulletin_num = bulletin_num;
		this.id = id;
		this.stu_group = stu_group;
		this.mng_group = mng_group;
		this.title = title;
		this.content = content;
		this.time = time;
		this.viewcount = viewcount;
		this.secret = secret;
	}
	
	public int getBulletin_num() {
		return bulletin_num;
	}
	public void setBulletin_num(int bulletin_num) {
		this.bulletin_num = bulletin_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStu_group() {
		return stu_group;
	}
	public void setStu_group(String stu_group) {
		this.stu_group = stu_group;
	}
	public String getMng_group() {
		return mng_group;
	}
	public void setMng_group(String mng_group) {
		this.mng_group = mng_group;
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	
	@Override
	public String toString() {
		return "BulletinBoard [bulletin_num=" + bulletin_num + ", id=" + id + ", stu_group=" + stu_group
				+ ", mng_group=" + mng_group + ", title=" + title + ", content=" + content + ", time=" + time
				+ ", viewcount=" + viewcount + ", secret=" + secret + "]";
	}
	
	
	
	

}
