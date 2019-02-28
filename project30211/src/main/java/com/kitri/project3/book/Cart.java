package com.kitri.project3.book;

public class Cart {
	private int cart_num;
	private String id;
	private int book_num;
	private String book_title;
	private String book_writer;
	private String book_publisher;
	private int rest_amount;
	
	public Cart() {}
	
	
	public Cart(String id, int book_num) {
		super();
		this.id = id;
		this.book_num = book_num;
	}


	public Cart(int cart_num, String id, int book_num, String book_title, String book_writer, String book_publisher,
			int rest_amount) {
		super();
		this.cart_num = cart_num;
		this.id = id;
		this.book_num = book_num;
		this.book_title = book_title;
		this.book_writer = book_writer;
		this.book_publisher = book_publisher;
		this.rest_amount = rest_amount;
	}

	public int getCart_num() {
		return cart_num;
	}

	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "Cart [cart_num=" + cart_num + ", id=" + id + ", book_num=" + book_num + ", book_title=" + book_title
				+ ", book_writer=" + book_writer + ", book_publisher=" + book_publisher + ", rest_amount=" + rest_amount
				+ "]";
	}
}
