package com.kitri.project3.msg;

import java.util.ArrayList;

import com.kitri.project3.member.Member;

public interface msgDao {
	Message selectMessage(int message_num);
	ArrayList<Message> selectMessageList(PagingVO pvo);
	void insertMessage(Message m);
	String idSelect(String id);
	void deleteMessage(int message_num);
	void updateRead(int message_num);
	ArrayList<Message> newMessage(String id);
	int selectTotalPaging(String id);
	ArrayList<Member> selectGrp(String id);
	ArrayList<Message> selectMyMessage(PagingVO pvo);
	int selectTotalMyPaging(String id);
}
