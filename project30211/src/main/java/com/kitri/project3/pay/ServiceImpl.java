package com.kitri.project3.pay;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.project3.member.Member;
import com.kitri.project3.pay.Dao;

@Component("payService")//빈이름등록
public class ServiceImpl implements Service {

	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(Dao.class);
	}
	
	// 결제 정보 추가
	@Override
	public void add(Pay p) {
		this.dao = sqlSession.getMapper(Dao.class);
		dao.insert(p);
	}

	// 내 결제 정보 조회 
	@Override
	public Pay get(String id) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.select(id);
	}

	// 로그인한 id 정보 조회
	@Override
	public Member getM(String id) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectM(id);
	}

	// 내 결제여부 조회
	@Override
	public Pay getC(String id) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectC(id);
	}

	// 담임 반 원생 결제 정보 조회
	@Override
	public ArrayList<Pay> getS(String mng_group) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectS(mng_group);
	}

	// 담임 반 원생 목록 조회
	@Override
	public ArrayList<Member> getStudent(String mng_group) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectStudent(mng_group);
	}

	@Override
	public ArrayList<Pay> getSAll() {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectSAll();
	}
}
