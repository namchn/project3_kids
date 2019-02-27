package com.kitri.project3.poll;

public class pollCheck {
	private String id;
	private int poll_num;
	
	public pollCheck() {
		
	}
	public pollCheck(String id, int poll_num) {
		super();
		this.id = id;
		this.poll_num = poll_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPoll_num() {
		return poll_num;
	}
	public void setPoll_num(int poll_num) {
		this.poll_num = poll_num;
	}
}
