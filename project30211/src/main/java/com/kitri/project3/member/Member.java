package com.kitri.project3.member;

public class Member {
	private String mem_code;
	private String id;
	private String pw;
	private String name;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private String phone;
	private String stu_name;
	private String stu_group;
	private String mng_group;
	private String postcode;
	
	public String getMem_code() {
		return mem_code;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public Member(String mem_code, String id, String pw, String name, String address, String detailAddress,
			String extraAddress, String phone, String stu_name, String stu_group, String mng_group, String postcode) {
		super();
		this.mem_code = mem_code;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.detailAddress = detailAddress;
		this.extraAddress = extraAddress;
		this.phone = phone;
		this.stu_name = stu_name;
		this.stu_group = stu_group;
		this.mng_group = mng_group;
		this.postcode = postcode;
	}
	public Member() {
		super();
	}
	@Override
	public String toString() {
		return "Member [mem_code=" + mem_code + ", id=" + id + ", pw=" + pw + ", name=" + name + ", address=" + address
				+ ", detailAddress=" + detailAddress + ", extraAddress=" + extraAddress + ", phone=" + phone
				+ ", stu_name=" + stu_name + ", stu_group=" + stu_group + ", mng_group=" + mng_group + ", postcode="
				+ postcode + "]";
	}
	
	


}
