package com.kitri.project3.poll;

public class Poll {
	private int poll_num;
	private String poll_subject;
	private int voter;
	private String start_date;
	private String end_date;
	
	public Poll() {
	}
	
	public Poll(int poll_num, String poll_subject, int voter, String start_date, String end_date) {
		this.poll_num = poll_num;
		this.poll_subject = poll_subject;
		this.voter = voter;
		this.start_date = start_date;
		this.end_date = end_date;
	}

	public int getPoll_num() {
		return poll_num;
	}
	public void setPoll_num(int poll_num) {
		this.poll_num = poll_num;
	}
	public String getPoll_subject() {
		return poll_subject;
	}
	public void setPoll_subject(String poll_subject) {
		this.poll_subject = poll_subject;
	}
	public int getVoter() {
		return voter;
	}
	public void setVoter(int voter) {
		this.voter = voter;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
}
