package com.kitri.project3.dietBoard;

import org.springframework.web.multipart.MultipartFile;

public class DietBoard {

	private int diet_num;
	private String title;
	private String content;
	private String time;
	private String files;
	
	private MultipartFile mfile;

	public int getDiet_num() {
		return diet_num;
	}

	public void setDiet_num(int diet_num) {
		this.diet_num = diet_num;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	public MultipartFile getMfile() {
		return mfile;
	}

	public void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}

	public DietBoard(int diet_num, String title, String content, String time, String files, MultipartFile mfile) {
		super();
		this.diet_num = diet_num;
		this.title = title;
		this.content = content;
		this.time = time;
		this.files = files;
		this.mfile = mfile;
	}

	public DietBoard() {
		super();
	}

	@Override
	public String toString() {
		return "DietBoard [diet_num=" + diet_num + ", title=" + title + ", content=" + content + ", time=" + time
				+ ", files=" + files + ", mfile=" + mfile + "]";
	}
	
	

	
}
