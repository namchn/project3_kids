package com.kitri.project3.student;

import java.util.ArrayList;

import com.kitri.project3.paging.PagingVO;


public interface StudentDao {

	void insert(Student s);
	/*void insert(Student m);
	Student select(String id);
	Student selectPw(String id);
	void update(Student m);
	void delete(String id);
	Pay selectC(String id);	
	ArrayList<Student> selectStu(String mng_group);
	
	Student selectPhone(String phone);
	
	//로그인 시 아이디/비밀번호 찾기
	Student findId(Student m);
	Student findPw(Student m);	*/

	ArrayList<Student> selectAllStudent(PagingVO paging);
	int selectTotalPaging();
	void deleteStudent(int stu_id);

	Student selectStudentInfo(int stu_id);

	void updateStudent(Student student);
}
