package com.kitri.project3.pay;

import java.util.ArrayList;

import com.kitri.project3.member.Member;

public interface Dao {
	void insert(Pay p);	// 결제 정보 추가
	Pay select(String id);	// 내 결제 정보 조회 
	Member selectM(String id);	// 로그인한 id 정보 조회
	Pay selectC(String id);	// 내 결제여부 조회
	ArrayList<Pay> selectS(String mng_group);	// 담임 반 원생 결제 정보 조회
	ArrayList<Member> selectStudent(String mng_group);	// 담임 반 원생 목록 조회
	ArrayList<Pay> selectSAll();//완납한 모든 원생 결제 정보 조회
}
