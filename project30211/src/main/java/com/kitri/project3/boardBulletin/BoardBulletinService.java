package com.kitri.project3.boardBulletin;

import java.util.ArrayList;
import java.util.HashMap;

import com.kitri.project3.paging.PagingVO;


public interface BoardBulletinService {
	int getNum();
	void addBoard(BulletinBoard b);
	
	ArrayList<BulletinBoard> getAll(PagingVO paging);
	
	int getTotalPaging();	
	BulletinBoard getByNum(int num);
	
	ArrayList<BulletinBoard> getByTitle(HashMap<String, Object> map);   
	ArrayList<BulletinBoard> getById(HashMap<String, Object> map);
	   
	int getTotalPagingByTitle(String title);
	int getTotalPagingById(String id);
	   
	
	void editViewCount(int num);
	
	void editBoard(BulletinBoard b);
	void delBoard(int num);
	
	//메인홈 자유게시판
	ArrayList<BulletinBoard> getMainBulletin();

	
}

