package com.kitri.project3.msg;

public class Message {
	private int message_num;
	private String sender;
	private String receiver;
	private String content;
	private String time;
	private int read;
	
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	public int getMessage_num() {
		return message_num;
	}
	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
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
	public Message(int message_num, String sender, String receiver, String content, String time) {
		this.message_num = message_num;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.time = time;
	}
	public Message() {}
	
	
}
