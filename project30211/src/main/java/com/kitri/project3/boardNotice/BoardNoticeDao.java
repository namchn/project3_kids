package com.kitri.project3.boardNotice;

import java.util.ArrayList;
import java.util.HashMap;

import com.kitri.project3.paging.PagingVO;

public interface BoardNoticeDao {
	int makeNum();
	void insert(NoticeBoard b);
	
	ArrayList<NoticeBoard> selectAll(PagingVO p);
	int selectTotalPaging();
	
	NoticeBoard selectByNum(int num);
	ArrayList<NoticeBoard> selectByTitle(HashMap<String, Object> hashMap);
	ArrayList<NoticeBoard> selectById(HashMap<String, Object> hashMap);
	
	int selectTotalPagingByTitle(String title);
	   int selectTotalPagingById(String id);
	   
	void updateViewCount(int num);
	
	void update(NoticeBoard b);
	void delete(int num);
	
	//메인용 공지사항
	ArrayList<NoticeBoard> selectMainNotice();
}
