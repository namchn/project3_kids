package com.kitri.project3.boardGallery;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.project3.paging.PagingVO2;

@Component("boardGalleryService")
public class BoardGalleryServiceImpl implements BoardGalleryService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private BoardGalleryDao dao;
	
	@Override
	public int getNum() {
		dao = sqlSession.getMapper(BoardGalleryDao.class);
		return dao.makeNum();
	}

	@Override
	public void addBoard(GalleryBoard b) {
		dao = sqlSession.getMapper(BoardGalleryDao.class);
		dao.insert(b);
	}

	@Override
	public ArrayList<GalleryBoard> getAll(PagingVO2 p) {
		dao = sqlSession.getMapper(BoardGalleryDao.class);
		return dao.selectAll(p);
	}
	
	@Override
	public int getTotalPaging() {
		dao = sqlSession.getMapper(BoardGalleryDao.class);
		return dao.selectTotalPaging();
	}

	@Override
	public GalleryBoard getByNum(int num) {
		dao = sqlSession.getMapper(BoardGalleryDao.class);
		return dao.selectByNum(num);
	}
	
	   @Override
	   public ArrayList<GalleryBoard> getByTitle(HashMap<String, Object> hashMap) {
		   dao = sqlSession.getMapper(BoardGalleryDao.class);
	      return dao.selectByTitle(hashMap);
	   }
	   
	   @Override
	   public ArrayList<GalleryBoard> getById(HashMap<String, Object> hashMap) {
		   dao = sqlSession.getMapper(BoardGalleryDao.class);
	      return dao.selectById(hashMap);
	   }

	@Override
	public void editBoard(GalleryBoard b) {
		dao = sqlSession.getMapper(BoardGalleryDao.class);
		dao.update(b);
	}

	@Override
	public void delBoard(int num) {
		dao = sqlSession.getMapper(BoardGalleryDao.class);
		dao.delete(num);
	}

	@Override
	public void editViewCount(int num) {
		dao = sqlSession.getMapper(BoardGalleryDao.class);
		dao.updateViewCount(num);
	}
	  @Override
	   public int getTotalPagingByTitle(HashMap<String, String> hashMap) {
		  dao = sqlSession.getMapper(BoardGalleryDao.class);
	      return dao.selectTotalPagingByTitle(hashMap);
	   }

	   @Override
	   public int getTotalPagingById(HashMap<String, String> hashMap) {
		   dao = sqlSession.getMapper(BoardGalleryDao.class);
	      return dao.selectTotalPagingById(hashMap);
	   }

	   @Override
	   public ArrayList<GalleryBoard> getByGallery(HashMap<String, Object> hashMap) {
		   dao = sqlSession.getMapper(BoardGalleryDao.class);
	      return dao.selectByGallery(hashMap);
	   }

	   @Override
	   public int getTotalPagingByGallery(String mng_group) {
		   dao = sqlSession.getMapper(BoardGalleryDao.class);
	      return dao.selectTotalPagingByGallery(mng_group);
	   }



}
