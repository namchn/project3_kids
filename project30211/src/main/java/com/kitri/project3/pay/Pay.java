package com.kitri.project3.pay;

public class Pay {
	private String id;
	private String name;
	private String stu_name;
	private String time;
    private String phone;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Pay(String id, String name, String stu_name, String time, String phone) {
		this.id = id;
		this.name = name;
		this.stu_name = stu_name;
		this.time = time;
		this.phone = phone;
	}
	public Pay() {
	}
	@Override
	public String toString() {
		return "Pay [id=" + id + ", name=" + name + ", stu_name=" + stu_name + ", time=" + time + ", phone=" + phone
				+ "]";
	}
}
