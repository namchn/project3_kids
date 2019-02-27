package com.kitri.project3.book;

import java.util.ArrayList;
import java.util.Map;

import com.kitri.project3.paging.PagingVO;

public interface Dao {
	void insertBook(Book b);	// 도서 추가
	ArrayList<Book> selectAllBook(PagingVO paging);	// 모든 도서 목록 조회
	int selectTotalPaging();	// 모든 도서 목록 개수 구하기
	int selectTitleCount(String select_word);	// 제목으로 검색 결과 목록 개수 구하기
	int selectWriterCount(String select_word);	// 저자로 검색 결과 목록 개수 구하기
	Book selectByNum(int book_num);	// 책번호를 조건으로 도서 조회
	void insertRent(Rent r);	// 대출 테이블에 추가
	ArrayList<Rent> selectMyRent(Map<String, Object> map);	// 내 대출 목록 조회
	int selectMyRentCount(String id);	// 내 대출 목록 개수 구하기
	void updateAmount(Rent r);	// 대출했을 때 book 테이블 수량 수정
	ArrayList<Book> selectByTitle(Map<String, Object> map);	// 제목으로 검색 결과 목록 개수 구하기
	ArrayList<Book> selectByWriter(Map<String, Object> map);	// 저자로 검색 결과 목록 개수 구하기
	void insertCart(Cart c);	// 찜 목록에 추가
	ArrayList<Cart> selectCart(Map<String, Object> map);	// 찜 목록 조회
	Cart selectCheckCart(Cart c);	// 찜 중복 검사
	void deleteCart(Cart c);	// 찜 목록에서 삭제
	int selectCartCount(String id);	// 찜 목록 개수 구하기
}
