package com.kitri.project3.member;

import java.util.ArrayList;

import com.kitri.project3.pay.Pay;

public interface Dao {
	void insert(Member m);
	Member select(String id);
	Member selectPw(String id);
	void update(Member m);
	void delete(String id);
	Pay selectC(String id);	
	ArrayList<Member> selectStu(String mng_group);
	
	Member selectPhone(String phone);
	
	//로그인 시 아이디/비밀번호 찾기
	Member findId(Member m);
	Member findPw(Member m);	
}
