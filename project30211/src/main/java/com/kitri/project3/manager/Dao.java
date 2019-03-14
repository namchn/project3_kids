package com.kitri.project3.manager;

import java.util.ArrayList;

import com.kitri.project3.book.Book;
import com.kitri.project3.book.Rent;
import com.kitri.project3.calendar.Calendar;
import com.kitri.project3.member.Member;
import com.kitri.project3.paging.PagingVO;

public interface Dao {
	//회원 관리
	ArrayList<Member> selectAllMember(PagingVO paging);
	void deleteMember(String id);
	int selectTotalPaging();
	
	//일정 관리
	ArrayList<Calendar> selectAll(PagingVO paging);
	void deleteCalendar(int num);
	Calendar selectCal(int num);
	void updateCal(Calendar calendar);
	void editCal(Calendar calendar);
	void insertCal(Calendar calendar);	
	
	//도서관리
	ArrayList<Rent> selectAllRent(PagingVO paging);	// 전체 대출 목록
	//int selectRentCount();	
	ArrayList<Rent> selectRentalList(PagingVO paging);	// 대출중인 목록
	ArrayList<Rent> selectDelayList(PagingVO paging);	// 연체중인 목록
	ArrayList<Rent> selectCompleteList(PagingVO paging);	// 반납완료 목록
	void updateRdate(int rent_num);	
	void updateAmount(Rent r);	
	Rent selectCheckRent(int rent_num);
	void deleteRent(int rent_num);
	void deleteBook(int book_num);
	void deleteRentList(int book_num);
	void deleteCartList(int book_num);
	void updateBook(Book b);
	void updateBook2(Book b);
	

	//도서 통계 관리
	int selectRentingCount();  // 대출 중 현재반납되지않은 책 개수 구하기
	ArrayList<Rent> selectRentingList(); //현재반납되지 대출 목록  구하기
	int selectRentCount();  // 총 대출 개수 구하기
	ArrayList<Rent> selectRentList(); //   전체 대출 목록 조회
	int selectDelayCount();	// 연체중인 목록 개수
	int selectRentalCount();	// 대출중인 목록 개수
	int selectCompleteCount();	// 반납완료 목록 개수
	
	//회원 통계 관리
	int selectParentStat();
	int selectTeacherStat();
	int selectVisitorStat();
	int selectTotalMemStat();
	//결제 통계 관리
	int selectSCount();
	ArrayList<Member> selectParentAll();//전체 학부모 목록
	
	void updateBus(Bus bus);
	Bus selectBus(int bus_num);
}
