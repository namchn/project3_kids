package com.kitri.project3.manager;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.project3.book.Book;
import com.kitri.project3.book.Rent;
import com.kitri.project3.calendar.Calendar;
import com.kitri.project3.member.Member;
import com.kitri.project3.paging.PagingVO;

@Component("manService") // 빈이름등록
public class ServiceImpl implements ManService {
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private Dao dao;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public ArrayList<Member> getAllMember(PagingVO paging) {
		this.dao = sqlSession.getMapper(Dao.class);
		ArrayList<Member> m = dao.selectAllMember(paging);
		return m;

	}

	@Override
	public void deleteMember(String id) {
		this.dao = sqlSession.getMapper(Dao.class);
		dao.deleteMember(id);
	}	
		
	@Override
	public int getTotalPaging() {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectTotalPaging();
	}

	// 일정관리
	@Override
	public ArrayList<Calendar> getCalAll(PagingVO paging) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("sim의 getCalAll입니다");
		ArrayList<Calendar> allc = dao.selectAll(paging);
		System.out.println(allc.size());
		return allc;
	}

	@Override
	public void deleteCalendar(int num) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("sim의  deleteCalendar입니다");
		dao.deleteCalendar(num);
	}

	@Override
	public void editCal(Calendar calendar) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("sim의  editCal입니다");
		dao.updateCal(calendar);
	}

	@Override
	public Calendar getCal(int num) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("sim의  getCal입니다");
		Calendar calendar = dao.selectCal(num);
		return calendar;
	}

	@Override
	public void uploadCal(Calendar calendar) {
		this.dao = sqlSession.getMapper(Dao.class);
		System.out.println("sim의  upload입니다");
		dao.insertCal(calendar);

	}

	@Override
	public ArrayList<Rent> getAllRent(PagingVO paging) {	// 전체 대출 목록
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectAllRent(paging);
	}
	
	
	@Override
	public ArrayList<Rent> getRentalList(PagingVO paging) {	// 대출중인 목록
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectRentalList(paging);
	}
	

	@Override
	public ArrayList<Rent> getDelayList(PagingVO paging) {	// 연체중인 목록
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectDelayList(paging);
	}

	@Override
	public ArrayList<Rent> getCompleteList(PagingVO paging) {	// 반납완료 목록
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectCompleteList(paging);
	}
		
		
		/*   @Override
	      public int getRentCount() {
	         this.dao = sqlSession.getMapper(Dao.class);
	         return dao.selectRentCount();
	      }*/
		//도서 통계 관리
	      @Override
	      public int getRentingCount() {
	         // TODO Auto-generated method stub
	         this.dao = sqlSession.getMapper(Dao.class);
	         return dao.selectRentingCount();
	      }

	      @Override
	      public ArrayList<Rent> getRentingList() {
	         // TODO Auto-generated method stub
	         this.dao = sqlSession.getMapper(Dao.class);
	         return dao.selectRentingList();
	      }

	      @Override
	      public int getRentCount() {
	         // TODO Auto-generated method stub
	         this.dao = sqlSession.getMapper(Dao.class);
	         return dao.selectRentCount();
	      }

	      @Override
	      public ArrayList<Rent> getRentList() {
	         // TODO Auto-generated method stub
	         this.dao = sqlSession.getMapper(Dao.class);
	         return dao.selectRentList();
	      }
	      
	      @Override
	      public int getDelayCount() {
	         this.dao = sqlSession.getMapper(Dao.class);
	         return dao.selectDelayCount();
	      }
	      
	  	@Override
		public int getRentalCount() {
			this.dao = sqlSession.getMapper(Dao.class);
			return dao.selectRentalCount();
		}

		@Override
		public int getCompleteCount() {
			this.dao = sqlSession.getMapper(Dao.class);
			return dao.selectCompleteCount();
		}

	      //도서 통계 관리 끝
       
		@Override
		public void modRdate(int rent_num) {
			this.dao = sqlSession.getMapper(Dao.class);
			dao.updateRdate(rent_num);
		}

		@Override
		public void modAmount(Rent r) {
			this.dao = sqlSession.getMapper(Dao.class);
			dao.updateAmount(r);
		}

		@Override
		public Rent getCheckRent(int rent_num) {
			this.dao = sqlSession.getMapper(Dao.class);
			return dao.selectCheckRent(rent_num);
		}

		@Override
		public int getParentStat() {
			System.out.println("serim의 getParentStat");
			this.dao = sqlSession.getMapper(Dao.class);
			return dao.selectParentStat();
		}

		@Override
		public int getTeacherStat() {
			System.out.println("serim의 getTeacherStat");
			this.dao = sqlSession.getMapper(Dao.class);
			return dao.selectTeacherStat();
		}

		@Override
		public int getTotalMemStat() {
			System.out.println("serim의 getTotalMemStat");
			this.dao = sqlSession.getMapper(Dao.class);
			return dao.selectTotalMemStat();
		}

		@Override
		public int getVisitorStat() {
			System.out.println("serim의 getVisitorStat(");
			this.dao = sqlSession.getMapper(Dao.class);
			return dao.selectVisitorStat();
		}

		@Override
		public int getSCount() {
			System.out.println("serim의 getSCount");
			this.dao = sqlSession.getMapper(Dao.class);
			return dao.selectSCount();
		}

		@Override
		public ArrayList<Member> getParentAll() {
			this.dao = sqlSession.getMapper(Dao.class);
			return dao.selectParentAll();
		}
		
		@Override
		   public void delRent(int rent_num) {
		      this.dao = sqlSession.getMapper(Dao.class);
		      dao.deleteRent(rent_num);
		   }

		   @Override
		   public void delBook(int book_num) {
		      this.dao = sqlSession.getMapper(Dao.class);
		      dao.deleteBook(book_num);
		   }

		   @Override
		   public void delRentList(int book_num) {
		      this.dao = sqlSession.getMapper(Dao.class);
		      dao.deleteRentList(book_num);
		   }

		   @Override
		   public void delCartList(int book_num) {
		      this.dao = sqlSession.getMapper(Dao.class);
		      dao.deleteCartList(book_num);
		   }

		@Override
		public void modBook(Book b) {
			this.dao = sqlSession.getMapper(Dao.class);
			dao.updateBook(b);
		}
		@Override
		public void modBook2(Book b) {
			this.dao = sqlSession.getMapper(Dao.class);
			dao.updateBook2(b);
		}

		@Override
		public void modBus(Bus bus) {
			this.dao = sqlSession.getMapper(Dao.class);
			dao.updateBus(bus);
		}

		@Override
		public Bus getBus(int bus_num) {
			this.dao = sqlSession.getMapper(Dao.class);
			return dao.selectBus(bus_num);
		}

}
