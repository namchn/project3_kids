package com.kitri.project3.calendar;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;



@Component("calService")
public class ServiceImpl implements Service {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private Dao dao;

	@Override
	public Calendar getCal(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		return dao.select(num);
	}

	@Override
	public void insertCal(Calendar c) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(c);
	}

	@Override
	public void editCal(Calendar c) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		dao.update(c);
	}

	@Override
	public void delCal(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		dao.delete(num);
	}

	@Override
	public int getNum() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		return dao.makeNum();
	}

	@Override
	public ArrayList<Calendar> getCalAll() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll();
	}

	@Override
	public ArrayList<Calendar> PageAll(PagingVO paging) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectPageAll(paging);
	}

	@Override
	public int getTotalPaging() {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectTotalPaging();
	}

}
