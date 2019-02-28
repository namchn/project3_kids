package com.kitri.project3.boardReply;

import java.util.ArrayList;

public interface ReplyDao {
	int makeNum();
	void insert(Reply r);
	
	ArrayList<Reply> selectAll();
	Reply selectByNum(int num);
	
	ArrayList<Reply> selectByBulletinNum(int bulletin_num);
	ArrayList<Reply> selectByGalleryNum(int gallery_num);
	ArrayList<Reply> selectByNoticeNum(int notice_num);
	
	void update(Reply r);
	void delete(int num);
}
