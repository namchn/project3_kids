package com.kitri.project3.boardReply;

import java.sql.Date;

public class Reply {
	private String board_code;
	private int num;
	private int reply_num;
	private String id;
	private Date time;
	private String content;
	
	public Reply() {}
	public Reply(String board_code, int num, int reply_num, String id, Date time, String content) {
		this.board_code = board_code;
		this.num = num;
		this.reply_num = reply_num;
		this.id = id;
		this.time = time;
		this.content = content;
	}
	
	public String getBoard_code() {
		return board_code;
	}
	public void setBoard_code(String board_code) {
		this.board_code = board_code;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "Reply [board_code=" + board_code + ", num=" + num + ", reply_num=" + reply_num + ", id=" + id
				+ ", time=" + time + ", content=" + content + "]";
	}
	
}
