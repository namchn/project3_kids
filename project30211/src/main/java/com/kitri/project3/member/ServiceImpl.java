package com.kitri.project3.member;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.project3.pay.Pay;

@Component("memService")//빈이름등록
public class ServiceImpl implements Service {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(Dao.class);
	}


	@Override
	public Member getMyInfo(String id) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.select(id);
	}

	@Override
	public void join(Member m) {
		System.out.println("serImpl의 join입니다");
		System.out.println("m.getStu_group"+m.getStu_group());
		System.out.println("getMng_group"+m.getMng_group());
		System.out.println("m.getAddress()"+m.getAddress());
		this.dao = sqlSession.getMapper(Dao.class);
		dao.insert(m);
	}

	@Override
	public void editMyInfo(Member m) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("memserImpl의 edit입니다");
		System.out.println(m);
		dao.update(m);
	}

	@Override
	public boolean checkId(String id) {
		this.dao = sqlSession.getMapper(Dao.class);
		Member m = dao.select(id);
		if (m == null) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean checkPhone(String phone) {
		this.dao = sqlSession.getMapper(Dao.class);
		Member m = dao.selectPhone(phone);
		if (m == null) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean checkPw(String id, String pw) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("serimpl의 checkPw입니다");
		System.out.println(id);
		//System.out.println(pw);
		//String pw_checked = dao.selectPw(id);
		Member m = dao.selectPw(id);
		System.out.println(m.getPw());
		System.out.println(pw);
		if (m.getPw().equals(pw)) {
			System.out.println("serimpl의 checkPw에서 비밀번호 동일합니다");
			return true;
		}
		else {
		System.out.println("serimpl의 checkPw에서 비밀번호 동일하지않습니다");
		return false;
		}
	}

	@Override
	public boolean login(String id, String pw) {
		System.out.println("serImpl의 login입니다");
		this.dao = sqlSession.getMapper(Dao.class);
		Member m = dao.select(id);
		if (m != null && m.getPw().equals(pw)) {
			return true;
		}
		return false;
	}

	@Override
	public void delMember(String id) {
		this.dao = sqlSession.getMapper(Dao.class);
		dao.delete(id);
	}

	@Override
	public Pay getC(String id) {	
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectC(id);
	}

	@Override
	public ArrayList<Member> getStu(String mng_group) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectStu(mng_group);
	}

	//로그인 시, 아이디/비밀번호 찾기
	@Override
	public Member findId(Member m) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.findId(m);
	}

	@Override
	public Member findPw(Member m) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.findPw(m);
	}


}
