package com.kitri.project3.calendar;


public class Calendar {

	int num;
	String id;
	String start_date;
	String end_date;
	String event;
	
	public Calendar() {
		super();
	}

	public Calendar(int num, String id, String start_date, String end_date, String event) {
		super();
		this.num = num;
		this.id = id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.event = event;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	@Override
	public String toString() {
		return "Calendar [num=" + num + ", id=" + id + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", event=" + event + "]";
	}
	
	
	
}
