package com.kitri.project3.boardNotice;

import java.util.ArrayList;
import java.util.HashMap;

import com.kitri.project3.boardBulletin.BulletinBoard;
import com.kitri.project3.paging.PagingVO;

public interface BoardNoticeService {
	int getNum();
	void addBoard(NoticeBoard b);
	
	ArrayList<NoticeBoard> getAll(PagingVO paging);
	int getTotalPaging();
	
	NoticeBoard getByNum(int num);
	
	 ArrayList<NoticeBoard> getByTitle(HashMap<String, Object> hashMap);
	   ArrayList<NoticeBoard> getById(HashMap<String, Object> hashMap);
	   
	   int getTotalPagingByTitle(String title);
	   int getTotalPagingById(String id);
	
	void editViewCount(int num);
	
	void editBoard(NoticeBoard b);
	void delBoard(int num);
	
	//메인용 공지사항
	ArrayList<NoticeBoard> getMainNotice();

}
