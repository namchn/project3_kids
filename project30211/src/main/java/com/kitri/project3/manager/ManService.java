package com.kitri.project3.manager;

import java.util.ArrayList;

import com.kitri.project3.book.Book;
import com.kitri.project3.book.Rent;
import com.kitri.project3.calendar.Calendar;
import com.kitri.project3.member.Member;
import com.kitri.project3.paging.PagingVO;
import com.kitri.project3.pay.Pay;

public interface ManService {
	//회원관리
	ArrayList<Member> getAllMember(PagingVO paging);
	void deleteMember(String id);
	int getTotalPaging();
	
	//일정관리
	ArrayList<Calendar> getCalAll(PagingVO paging);
	void deleteCalendar(int num);
	void editCal(Calendar calendar);
	Calendar getCal(int num);
	void uploadCal(Calendar calendar);
	
	//도서관리
	ArrayList<Rent> getAllRent(PagingVO paging);	// 전체 대출 목록
	ArrayList<Rent> getRentalList(PagingVO paging);	// 대출중인 목록
	ArrayList<Rent> getDelayList(PagingVO paging);	// 연체중인 목록
	ArrayList<Rent> getCompleteList(PagingVO paging);	// 반납완료 목록
	void modRdate(int rent_num);	
	void modAmount(Rent r);	
	Rent getCheckRent(int rent_num);
	void delRent(int rent_num);
	void delBook(int book_num);
	void delRentList(int book_num);
	void delCartList(int book_num);
	void modBook(Book b);
	void modBook2(Book b);
	
	//도서 통계 관리
	int getRentingCount();  // 대출 중 현재대출중인 개수 구하기
	ArrayList<Rent> getRentingList(); //내 대출 목록 개수 구하기
	int getRentCount();  // 총 대출 개수 구하기
	ArrayList<Rent> getRentList(); //   전체 대출 목록 조회
	int getDelayCount();//   대출 연체 책 권수  
	int getRentalCount();	// 대출중인 목록 개수
	int getCompleteCount();	// 반납완료 목록 개수
	
	//회원 통계관리
	int getParentStat();
	int getTeacherStat();
	int getVisitorStat();
	int getTotalMemStat();
	//결제 통계관리
	int getSCount();//이번달결제한인원	
	ArrayList<Member> getParentAll();//전체 학부모 목록
	
	void modBus(Bus bus);
	Bus getBus(int bus_num);

}
