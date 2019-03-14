package com.kitri.project3.student;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.project3.manager.Dao;
import com.kitri.project3.paging.PagingVO;
import com.kitri.project3.pay.Pay;

@Component("studentService")//빈이름등록
public class StudentServiceImpl implements StudentService {
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private StudentDao studentDao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.studentDao = sqlSession.getMapper(StudentDao.class);
	}

	@Override
	public void studentJoin(Student s) {
		this.studentDao = sqlSession.getMapper(StudentDao.class);
		studentDao.insert(s);
	}

	@Override
	public ArrayList<Student> getAllStudent(PagingVO paging) {
		this.studentDao = sqlSession.getMapper(StudentDao.class);
		System.out.println("studentServiceImpl의 getAllStudent");
		return studentDao.selectAllStudent(paging);
	}
	
	@Override
	public int getTotalPaging() {
		this.studentDao = sqlSession.getMapper(StudentDao.class);
		return studentDao.selectTotalPaging();
	}

	@Override
	public void deleteStudent(int stu_id) {
		this.studentDao = sqlSession.getMapper(StudentDao.class);
		studentDao.deleteStudent(stu_id);
	}

	@Override
	public Student getStudentInfo(int stu_id) {
		this.studentDao = sqlSession.getMapper(StudentDao.class);
		return studentDao.selectStudentInfo(stu_id);
	}

	@Override
	public void editStudent(Student student) {
		this.studentDao = sqlSession.getMapper(StudentDao.class);
		studentDao.updateStudent(student);
		
	}

/*
	@Override
	public Student getMyInfo(String id) {
		this.dao = sqlSession.getMapper(StudentDao.class);
		return dao.select(id);
	}

	@Override
	public void join(Student m) {
		System.out.println("serImpl의 join입니다");
		System.out.println("m.getStu_group"+m.getStu_group());
		System.out.println("getMng_group"+m.getMng_group());
		System.out.println("m.getAddress()"+m.getAddress());
		this.dao = sqlSession.getMapper(StudentDao.class);
		dao.insert(m);
	}

	@Override
	public void editMyInfo(Student m) {
		this.dao = sqlSession.getMapper(StudentDao.class);
		System.out.println("memserImpl의 edit입니다");
		System.out.println(m);
		dao.update(m);
	}

	@Override
	public boolean checkId(String id) {
		this.dao = sqlSession.getMapper(StudentDao.class);
		Student m = dao.select(id);
		if (m == null) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean checkPhone(String phone) {
		this.dao = sqlSession.getMapper(StudentDao.class);
		Student m = dao.selectPhone(phone);
		if (m == null) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean checkPw(String id, String pw) {
		this.dao = sqlSession.getMapper(StudentDao.class);
		System.out.println("serimpl의 checkPw입니다");
		System.out.println(id);
		//System.out.println(pw);
		//String pw_checked = dao.selectPw(id);
		Student m = dao.selectPw(id);
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
		this.dao = sqlSession.getMapper(StudentDao.class);
		Student m = dao.select(id);
		if (m != null && m.getPw().equals(pw)) {
			return true;
		}
		return false;
	}

	@Override
	public void delMember(String id) {
		this.dao = sqlSession.getMapper(StudentDao.class);
		dao.delete(id);
	}

	@Override
	public Pay getC(String id) {	
		this.dao = sqlSession.getMapper(StudentDao.class);
		return dao.selectC(id);
	}

	@Override
	public ArrayList<Student> getStu(String mng_group) {
		this.dao = sqlSession.getMapper(StudentDao.class);
		return dao.selectStu(mng_group);
	}

	//로그인 시, 아이디/비밀번호 찾기
	@Override
	public Student findId(Student m) {
		this.dao = sqlSession.getMapper(StudentDao.class);
		return dao.findId(m);
	}

	@Override
	public Student findPw(Student m) {
		this.dao = sqlSession.getMapper(StudentDao.class);
		return dao.findPw(m);
	}*/


}
