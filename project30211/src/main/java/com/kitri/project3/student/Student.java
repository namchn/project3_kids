package com.kitri.project3.student;

public class Student {
	
	private String stu_id;
	private String stu_name;
	private String stu_group;
	private String stu_birthday;
	private String stu_gender;
	private String member_id;
	private String member_phone;
	private String join_date;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress	;
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_group() {
		return stu_group;
	}
	public void setStu_group(String stu_group) {
		this.stu_group = stu_group;
	}
	public String getStu_birthday() {
		return stu_birthday;
	}
	public void setStu_birthday(String stu_birthday) {
		this.stu_birthday = stu_birthday;
	}
	public String getStu_gender() {
		return stu_gender;
	}
	public void setStu_gender(String stu_gender) {
		this.stu_gender = stu_gender;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	public Student(String stu_id, String stu_name, String stu_group, String stu_birthday, String stu_gender,
			String member_id, String member_phone, String join_date, String postcode, String address,
			String detailAddress, String extraAddress) {
		super();
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_group = stu_group;
		this.stu_birthday = stu_birthday;
		this.stu_gender = stu_gender;
		this.member_id = member_id;
		this.member_phone = member_phone;
		this.join_date = join_date;
		this.postcode = postcode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.extraAddress = extraAddress;
	}
	public Student() {
		super();
	}
	@Override
	public String toString() {
		return "Student [stu_id=" + stu_id + ", stu_name=" + stu_name + ", stu_group=" + stu_group + ", stu_birthday="
				+ stu_birthday + ", stu_gender=" + stu_gender + ", member_id=" + member_id + ", member_phone="
				+ member_phone + ", join_date=" + join_date + ", postcode=" + postcode + ", address=" + address
				+ ", detailAddress=" + detailAddress + ", extraAddress=" + extraAddress + "]";
	}
	
	



	
	


}
