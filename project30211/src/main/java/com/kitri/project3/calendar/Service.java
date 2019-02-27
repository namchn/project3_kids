package com.kitri.project3.calendar;

import java.util.ArrayList;

public interface Service {
	Calendar getCal(int num);	//일정정보불러오기
	ArrayList<Calendar> getCalAll();	//일정정보불러오기
	void insertCal(Calendar c);			//일정삽입하기
	void editCal(Calendar c);	//일정변경
	void delCal(int num);		//일정지우기
	int getNum();
	ArrayList<Calendar> PageAll(PagingVO paging);
	int getTotalPaging();
}
