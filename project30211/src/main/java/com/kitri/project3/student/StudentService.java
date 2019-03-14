package com.kitri.project3.student;

import java.util.ArrayList;

import com.kitri.project3.paging.PagingVO;

public interface StudentService {

	void studentJoin(Student s);
/*	Student getMyInfo(String id);
	void join(Student m);
	void editMyInfo(Student m);
	boolean checkId(String id);
	boolean login(String id, String pw);
	void delMember(String id);
	boolean checkPw(String id, String pw);
	boolean checkPhone(String phone);
	
	Pay getC(String id);	
	ArrayList<Student> getStu(String mng_group);
	
	//로그인 시, 아이디/비밀번호 찾기
	Student findPw(Student m);
	Student findId(Student m);*/

	ArrayList<Student> getAllStudent(PagingVO paging);
	int getTotalPaging();
	void deleteStudent(int stu_id);

	Student getStudentInfo(int stu_id);
	void editStudent(Student student);
}
