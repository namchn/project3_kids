package com.kitri.project3.boardNotice;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeBoard {
	private int notice_num;
	private String id;
	private String title;
	private String content;
	private Date time;
	private int viewcount;
	private String files;
	
	private MultipartFile notice_files;
	
	public NoticeBoard() {}
	public NoticeBoard(int notice_num, String id, String title, String content, Date time, int viewcount, String files) {
		this.notice_num = notice_num;
		this.id = id;
		this.title = title;
		this.content = content;
		this.time = time;
		this.viewcount = viewcount;
		this.files = files;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getFiles() {
		return files;
	}
	public void setFiles(String files) {
		this.files = files;
	}
	public MultipartFile getNotice_files() {
		return notice_files;
	}
	public void setNotice_files(MultipartFile notice_files) {
		this.notice_files = notice_files;
	}
	
	@Override
	public String toString() {
		return "NoticeBoard [notice_num=" + notice_num + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", time=" + time + ", viewcount=" + viewcount + ", files=" + files + "]";
	}

}
