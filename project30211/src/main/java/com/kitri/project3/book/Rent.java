package com.kitri.project3.book;

import java.sql.Date;

public class Rent {
	private int rent_num;
	private int book_num;
	private int rent_amount;
	private String id;
	private Date s_date;
	private Date e_date;
	private Date r_date;
	private String book_title;
	
	public Rent(int rent_num, int book_num, int rent_amount, String id, Date s_date, Date e_date, Date r_date,
			String book_title) {
		this.rent_num = rent_num;
		this.book_num = book_num;
		this.rent_amount = rent_amount;
		this.id = id;
		this.s_date = s_date;
		this.e_date = e_date;
		this.r_date = r_date;
		this.book_title = book_title;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public Rent() {}

	public Rent(int rent_num, int book_num, int rent_amount, String id, Date s_date, Date e_date, Date r_date) {
		super();
		this.rent_num = rent_num;
		this.book_num = book_num;
		this.rent_amount = rent_amount;
		this.id = id;
		this.s_date = s_date;
		this.e_date = e_date;
		this.r_date = r_date;
	}

	public int getRent_num() {
		return rent_num;
	}

	public void setRent_num(int rent_num) {
		this.rent_num = rent_num;
	}

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public int getRent_amount() {
		return rent_amount;
	}

	public void setRent_amount(int rent_amount) {
		this.rent_amount = rent_amount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}

	public Date getE_date() {
		return e_date;
	}

	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	@Override
	public String toString() {
		return "Rent [rent_num=" + rent_num + ", book_num=" + book_num + ", rent_amount=" + rent_amount + ", id=" + id
				+ ", s_date=" + s_date + ", e_date=" + e_date + ", r_date=" + r_date + "]";
	}

}
