package com.kitri.project3.book;

import java.util.ArrayList;
import java.util.Map;

import com.kitri.project3.paging.PagingVO;

public interface BookService {
	void addBook(Book b);	// 도서 추가
	ArrayList<Book> getAllBook(PagingVO paging);	// 모든 도서 목록 조회
	int getTotalPaging();	// 모든 도서 목록 개수 구하기
	int getTitleCount(String select_word);	// 제목으로 검색 결과 목록 개수 구하기
	int getWriterCount(String select_word);	// 저자로 검색 결과 목록 개수 구하기
	Book getByNum(int book_num);	// 책번호를 조건으로 도서 조회
	void addRent(Rent r);	// 대출 테이블에 추가
	ArrayList<Rent> getMyRent(Map<String, Object> map);	// 내 대출 목록 조회
	int getMyRentCount(String id);	// 내 대출 목록 개수 구하기
	void modAmount(Rent r);	// 대출했을 때 book 테이블 수량 수정
	ArrayList<Book> getByTitle(Map<String, Object> map);	// 제목으로 검색 결과 목록 개수 구하기
	ArrayList<Book> getByWriter(Map<String, Object> map);	// 저자로 검색 결과 목록 개수 구하기
	void addCart(Cart c);	// 찜 목록에 추가
	ArrayList<Cart> getCart(Map<String, Object> map);	// 찜 목록 조회
	Cart getCheckCart(Cart c);	// 찜 중복 검사
	void delCart(Cart c);	// 찜 목록에서 삭제
	int getCartCount(String id);	// 찜 목록 개수 구하기
}
