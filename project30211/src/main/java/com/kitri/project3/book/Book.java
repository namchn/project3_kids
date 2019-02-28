package com.kitri.project3.book;

import org.springframework.web.multipart.MultipartFile;

public class Book {
	private int book_num;
	private String book_title;
	private String book_writer;
	private String book_publisher;
	private int rest_amount;
	private String book_img;
	private MultipartFile file;
	
	public Book() {}
	
	public Book(int book_num, String book_title, String book_writer, String book_publisher, int rest_amount,
			String book_img, MultipartFile file) {
		super();
		this.book_num = book_num;
		this.book_title = book_title;
		this.book_writer = book_writer;
		this.book_publisher = book_publisher;
		this.rest_amount = rest_amount;
		this.book_img = book_img;
		this.file = file;
	}

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getBook_writer() {
		return book_writer;
	}

	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}

	public String getBook_publisher() {
		return book_publisher;
	}

	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}

	public int getRest_amount() {
		return rest_amount;
	}

	public void setRest_amount(int rest_amount) {
		this.rest_amount = rest_amount;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "Book [book_num=" + book_num + ", book_title=" + book_title + ", book_writer=" + book_writer
				+ ", book_publisher=" + book_publisher + ", rest_amount=" + rest_amount + ", book_img=" + book_img
				+ ", file=" + file + "]";
	}
}
