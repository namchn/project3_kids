package com.kitri.project3.boardNotice;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.project3.paging.PagingVO;

@Component("boardNoticeService")
public class BoardNoticeServiceImpl implements BoardNoticeService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private BoardNoticeDao dao;
	
	@Override
	public int getNum() {
		dao = sqlSession.getMapper(BoardNoticeDao.class);
		return dao.makeNum();
	}

	@Override
	public void addBoard(NoticeBoard b) {
		dao = sqlSession.getMapper(BoardNoticeDao.class);
		dao.insert(b);
	}

	@Override
	public ArrayList<NoticeBoard> getAll(PagingVO p) {
		dao = sqlSession.getMapper(BoardNoticeDao.class);
		return dao.selectAll(p);
	}
	
	@Override
	public int getTotalPaging() {
		dao = sqlSession.getMapper(BoardNoticeDao.class);
		return dao.selectTotalPaging();
	}

	@Override
	public NoticeBoard getByNum(int num) {
		dao = sqlSession.getMapper(BoardNoticeDao.class);
		return dao.selectByNum(num);
	}
	
	 @Override
	   public ArrayList<NoticeBoard> getByTitle(HashMap<String, Object> hashMap) {
		 dao = sqlSession.getMapper(BoardNoticeDao.class);
	      
	      System.out.println("getByTitle serviceImpl 출력함니당");
	      return dao.selectByTitle(hashMap);
	   }
	   
	   @Override
	   public ArrayList<NoticeBoard> getById(HashMap<String, Object> hashMap) {
		   dao = sqlSession.getMapper(BoardNoticeDao.class);
	      System.out.println("getById serviceImpl 출력함니당");
	      return dao.selectById(hashMap);
	   }
	   
	   @Override
	   public int getTotalPagingByTitle(String title) {
		   dao = sqlSession.getMapper(BoardNoticeDao.class);
	      return dao.selectTotalPagingByTitle(title);
	   }
	   
	   @Override
	   public int getTotalPagingById(String id) {
		   dao = sqlSession.getMapper(BoardNoticeDao.class);
	      return dao.selectTotalPagingById(id);
	   }
	   

	
	@Override
	public void editBoard(NoticeBoard b) {
		dao = sqlSession.getMapper(BoardNoticeDao.class);
		dao.update(b);
	}

	@Override
	public void delBoard(int num) {
		dao = sqlSession.getMapper(BoardNoticeDao.class);
		dao.delete(num);
	}

	@Override
	public void editViewCount(int num) {
		dao = sqlSession.getMapper(BoardNoticeDao.class);
		dao.updateViewCount(num);
	}
	
	//메인용 공지사항
	@Override
	public ArrayList<NoticeBoard> getMainNotice() {
		dao = sqlSession.getMapper(BoardNoticeDao.class);
		return dao.selectMainNotice();
	}




}
