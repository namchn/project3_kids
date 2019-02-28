package com.kitri.project3.msg;

import java.util.ArrayList;

import com.kitri.project3.member.Member;

public interface msgService {
	Message readMsg(int message_num);
	ArrayList<Message> msgList(PagingVO pvo);
	void sendMsg(Message m);
	boolean idCheck(String id);
	void delMsg(int message_num);
	void Read(int message_num);
	ArrayList<Message> MsgCheck(String id);
	int getMsgCnt(String id);
	ArrayList<Member> getGrp(String id);
	ArrayList<Message> getMyMessage(PagingVO pvo);
	int getTotalMyPaging(String id);
}

