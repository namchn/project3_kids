package com.kitri.project3.book;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.project3.paging.PagingVO;

@Component("bookService")//빈이름등록
public class ServiceImpl implements BookService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(Dao.class);
	}
	
	// 도서 추가
	@Override
	public void addBook(Book b) {	
		this.dao = sqlSession.getMapper(Dao.class);
		dao.insertBook(b);
	}

	// 모든 도서 목록 조회
	@Override
	public ArrayList<Book> getAllBook(PagingVO paging) {	
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectAllBook(paging);
	}
	
	// 책번호를 조건으로 도서 조회
	@Override
	public Book getByNum(int book_num) {	
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectByNum(book_num);
	}

	// 대출 테이블에 추가
	@Override
	public void addRent(Rent r) {	
		this.dao = sqlSession.getMapper(Dao.class);
		dao.insertRent(r);
	}

	// 내 대출 목록 조회
	@Override
	public ArrayList<Rent> getMyRent(Map<String, Object> map) {	
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectMyRent(map);
	}
	
	// 내 대출 목록 개수 구하기
	@Override
	public int getMyRentCount(String id) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectMyRentCount(id);
	}

	// 대출했을 때 book 테이블 수량 수정
	@Override
	public void modAmount(Rent r) {	
		this.dao = sqlSession.getMapper(Dao.class);
		dao.updateAmount(r);
	}

	// 모든 도서 목록 개수 구하기
	@Override
	public int getTotalPaging() {	
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectTotalPaging();
	}

	// 제목으로 검색 결과 목록 개수 구하기
	@Override
	public ArrayList<Book> getByTitle(Map<String, Object> map) {	
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectByTitle(map);
	}

	// 저자로 검색 결과 목록 개수 구하기
	@Override
	public ArrayList<Book> getByWriter(Map<String, Object> map) {	
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectByWriter(map);
	}

	// 제목으로 검색 결과 목록 개수 구하기
	@Override
	public int getTitleCount(String select_word) {	
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectTitleCount(select_word);
	}

	// 저자로 검색 결과 목록 개수 구하기
	@Override
	public int getWriterCount(String select_word) {	
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectWriterCount(select_word);
	}

	// 찜 목록에 추가
	@Override
	public void addCart(Cart c) {	
		this.dao = sqlSession.getMapper(Dao.class);
		dao.insertCart(c);
	}

	// 찜 목록 조회
	@Override
	public ArrayList<Cart> getCart(Map<String, Object> map) {	
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectCart(map);
	}

	// 찜 중복 검사
	@Override
	public Cart getCheckCart(Cart c) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectCheckCart(c);
	}

	// 찜 목록에서 삭제
	@Override
	public void delCart(Cart c) {
		this.dao = sqlSession.getMapper(Dao.class);
		dao.deleteCart(c);
	}

	@Override
	public int getCartCount(String id) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectCartCount(id);
	}
}
