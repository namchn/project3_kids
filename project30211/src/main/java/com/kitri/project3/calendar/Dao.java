package com.kitri.project3.calendar;

import java.util.ArrayList;

public interface Dao {
	void insert(Calendar c);//  일정넣기
	ArrayList<Calendar> selectAll();
	Calendar select(int num);// 일정확인
	void update(Calendar c); //일정변경 
	void delete(int num);//일정삭제
	int makeNum();	
	ArrayList<Calendar> selectPageAll(PagingVO pv);
	int selectTotalPaging();
}


