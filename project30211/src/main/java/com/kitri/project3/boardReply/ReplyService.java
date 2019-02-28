package com.kitri.project3.boardReply;

import java.util.ArrayList;

public interface ReplyService {
	int getNum();
	void addReply(Reply r);
	
	ArrayList<Reply> getAll();
	Reply getByNum(int num);
	
	ArrayList<Reply> getByBulletinNum(int bulletin_num);
	ArrayList<Reply> getByGalleryNum(int gallery_num);
	ArrayList<Reply> getByNoticeNum(int notice_num);
	
	void editReply(Reply r);
	void delReply(int num);
}
