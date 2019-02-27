package com.kitri.project3.dietBoard;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.project3.paging.PagingVO2;

@Component("dietBoardService")//빈이름등록
public class ServiceImpl implements Service {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public ArrayList<DietBoard> getDietList(PagingVO2 paging) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("dietserviceImpl의 getDietList 입니다.");
		return dao.selectAll(paging);
	}

	@Override
	public void uploadDiet(DietBoard db) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("dietserviceImpl의 uploadDiet 입니다.");
		System.out.println(db);
		dao.insert(db);
		
	}

	@Override
	public void editDiet(DietBoard db) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("dietserviceImpl의 editDiet 입니다.");
		System.out.println(db);
		dao.update(db);
	}

	@Override
	public void deleteDiet(int diet_num) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("dietserviceImpl의 deleteDiet 입니다.");
		dao.delete(diet_num);
	}

	@Override
	public DietBoard getDietNum(int diet_num) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("dietserviceImpl의 getDietNum 입니다.");
		return dao.selectDietNum(diet_num);
	}

	@Override
	public void editDietExceptImg(DietBoard db) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("dietserviceImpl의 editDietExceptImg 입니다.");
		dao.updateExceptImg(db);
		
	}
	
	@Override
	  public int getTotalPaging() {
	     dao = sqlSession.getMapper(Dao.class);
	     return dao.selectTotalPaging();
	 }

	@Override
	public DietBoard getRecentDiet() {
		dao = sqlSession.getMapper(Dao.class);
		System.out.println("dietserviceImpl의  getRecentDiet 입니다.");
		return dao.selectRecent();
	}
	 
}
