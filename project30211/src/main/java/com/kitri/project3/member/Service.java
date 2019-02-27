package com.kitri.project3.member;

import java.util.ArrayList;

import com.kitri.project3.pay.Pay;

public interface Service {
	Member getMyInfo(String id);
	void join(Member m);
	void editMyInfo(Member m);
	boolean checkId(String id);
	boolean login(String id, String pw);
	void delMember(String id);
	boolean checkPw(String id, String pw);
	boolean checkPhone(String phone);
	
	Pay getC(String id);	
	ArrayList<Member> getStu(String mng_group);
	
	//로그인 시, 아이디/비밀번호 찾기
	Member findPw(Member m);
	Member findId(Member m);

}
