package com.kitri.project3.boardBulletin;

import java.util.ArrayList;
import java.util.HashMap;

import com.kitri.project3.paging.PagingVO;


public interface BoardBulletinDao {
	int makeNum();
	void insert(BulletinBoard b);
	
	ArrayList<BulletinBoard> selectAll(PagingVO p);
	int selectTotalPaging();
	
	BulletinBoard selectByNum(int num);
	ArrayList<BulletinBoard> selectByTitle(HashMap<String, Object> hashMap);   
	ArrayList<BulletinBoard> selectById(HashMap<String, Object> hashMap);
	   
	int selectTotalPagingByTitle(String title);
	int selectTotalPagingById(String id);
	   
	
	void updateViewCount(int num);
	
	void update(BulletinBoard b);
	void delete(int num);
	
	//메인용 자유게시판
	ArrayList<BulletinBoard> selectMainBulletin();
	
}
