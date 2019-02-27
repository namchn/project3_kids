package com.kitri.project3.boardBulletin;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.project3.boardNotice.BoardNoticeDao;
import com.kitri.project3.boardNotice.NoticeBoard;
import com.kitri.project3.paging.PagingVO;

@Component("boardBulletinService")
public class BoardBulletinServiceImpl implements BoardBulletinService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private BoardBulletinDao dao;


	@Override
	public int getNum() {
		System.out.println("getNum서비스임플입니당");
		dao = sqlSession.getMapper(BoardBulletinDao.class);
		return dao.makeNum();
	}

	@Override
	public void addBoard(BulletinBoard b) {
		System.out.println("addBoard서비스임플입니당");
		dao = sqlSession.getMapper(BoardBulletinDao.class);
		dao.insert(b);	
	}
	
	@Override
	public ArrayList<BulletinBoard> getAll(PagingVO p) {
		dao = sqlSession.getMapper(BoardBulletinDao.class);
		return dao.selectAll(p);
	}



	@Override
	public int getTotalPaging() {
		dao = sqlSession.getMapper(BoardBulletinDao.class);
		return dao.selectTotalPaging();
	}
	
	@Override
	public BulletinBoard getByNum(int num) {
		System.out.println("getByNum서비스임플입니당");
		dao = sqlSession.getMapper(BoardBulletinDao.class);
		return dao.selectByNum(num);
	}
	
	@Override
  public ArrayList<BulletinBoard> getByTitle(HashMap<String, Object> hashMap) {
		dao = sqlSession.getMapper(BoardBulletinDao.class);
	      return dao.selectByTitle(hashMap);
	   }
	   
	   @Override
	   public ArrayList<BulletinBoard> getById(HashMap<String, Object> hashMap) {
		   dao = sqlSession.getMapper(BoardBulletinDao.class);
	      return dao.selectById(hashMap);
	   }
	   
	   @Override
	   public int getTotalPagingByTitle(String title) {
		   dao = sqlSession.getMapper(BoardBulletinDao.class);
	      return dao.selectTotalPagingByTitle(title);
	   }
	   
	   @Override
	   public int getTotalPagingById(String id) {
		   dao = sqlSession.getMapper(BoardBulletinDao.class);
	      return dao.selectTotalPagingById(id);
	   }


	@Override
	public void editBoard(BulletinBoard b) {
		dao = sqlSession.getMapper(BoardBulletinDao.class);
		dao.update(b);
	}

	@Override
	public void delBoard(int num) {
		dao = sqlSession.getMapper(BoardBulletinDao.class);
		dao.delete(num);		
	}

	@Override
	public void editViewCount(int num) {
		System.out.println("editViewCount서비스임플입니당");
		dao = sqlSession.getMapper(BoardBulletinDao.class);
		dao.updateViewCount(num);
		
	}

	//메인용 자유게시판
	@Override
	public ArrayList<BulletinBoard> getMainBulletin() {
		dao = sqlSession.getMapper(BoardBulletinDao.class);
		return dao.selectMainBulletin();
	}



	
	
}
