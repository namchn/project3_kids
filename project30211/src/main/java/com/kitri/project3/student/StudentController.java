package com.kitri.project3.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project3.paging.PagingVO;

@Controller
public class StudentController {
	@Resource(name = "studentService")
	private StudentService studentService;

	@RequestMapping("/student/studentJoinForm")
	public String joinForm() {
		System.out.println("/student/studentJoinForm 입니다");
		return "/student/studentJoin";
	}

	@RequestMapping("/student/studentJoin")
	public String join(Student s, HttpServletRequest req, HttpServletResponse res) {
		System.out.println("/student/studentJoin 입니다");
		s.setMember_id("");
		s.setJoin_date("");
		s.setStu_id("");
		String year = req.getParameter("selectYearBox");
		String month = req.getParameter("selectMonthBox");
		if (month.length() < 2) {
			month = "0" + month;
		}
		String day = req.getParameter("selectDayBox");
		if (day.length() < 2) {
			day = "0" + day;
		}

		String birthday = year + month + day;
		s.setStu_birthday(birthday);
		//System.out.println(s);
		studentService.studentJoin(s);
		return "/manager/manager";
	}

	// 원아 관리
	@RequestMapping(value = "/student/studentManage")
	public ModelAndView studentManage(PagingVO paging) {
		System.out.println("student의 studentManage입니다");
		ModelAndView mav = new ModelAndView("/student/studentManage");
		ArrayList<Student> s = studentService.getAllStudent(paging);
		//System.out.println("s.size: " + s.size());

		paging.setTotal(studentService.getTotalPaging());
		System.out.println(paging);
		mav.addObject("s", s);
		mav.addObject("paging", paging);
		return mav;
	}

	@RequestMapping(value = "/student/studentDelete")
	public String memberDelete(HttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println("/student/studentDelete입니다");
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");

		String[] arr = req.getParameterValues("check_stu_id");

		int[] nums = Arrays.stream(arr).mapToInt(Integer::parseInt).toArray();
		//System.out.println("nums[0]: " + nums[0]);

		for (int i = 0; i < arr.length; i++) {
			studentService.deleteStudent(nums[i]);
		}
		return "redirect:/student/studentManage";
	}

	@RequestMapping(value = "/student/studentEditForm")
	   public ModelAndView studentEditForm(HttpServletRequest req, HttpServletResponse res) throws IOException {
	      req.setCharacterEncoding("UTF-8");
	      res.setCharacterEncoding("UTF-8");
	      System.out.println("student의 studentEditForm입니다");
	      PrintWriter out = res.getWriter();
	      
	      String[] arr = req.getParameterValues("check_stu_id");
	      
	      int[] nums = Arrays.stream(arr).mapToInt(Integer::parseInt).toArray();
	      //System.out.println("nums[0]: " + nums[0]);
	      Student s = studentService.getStudentInfo(nums[0]);
	      String year = s.getStu_birthday().substring(0, 4);
	      //System.out.println(year);
	      String month = s.getStu_birthday().substring(4, 6);
	      //System.out.println(month.substring(0, 1));
	      
	      if(month.substring(0, 1).equals("0")) {
	    	 month = s.getStu_birthday().substring(5, 6);
	    	 //System.out.println(month);
	      }
	     
	      String day = s.getStu_birthday().substring(6,8);
	      //System.out.println(day.substring(0, 1));
	      
	      if(day.substring(0, 1).equals("0")) {
	    	 day = s.getStu_birthday().substring(7, 8);
	    	 //System.out.println(day);
	      }
	      ModelAndView mav = new ModelAndView("/student/studentEdit");
	      mav.addObject("s", s);
	      mav.addObject("year", year);
	      mav.addObject("month", month);
	      mav.addObject("day", day);
	      return mav;
	   }

	@RequestMapping(value = "/student/studentEdit")
	public String studentEdit(Student student, HttpServletRequest req, HttpServletResponse res) throws IOException {
		System.out.println("/student/studenEdit입니다");
		
		student.setMember_id("");
		student.setJoin_date("");

		String year = req.getParameter("selectYearBox");
		String month = req.getParameter("selectMonthBox");
		if (month.length() < 2) {
			month = "0" + month;
		}
		String day = req.getParameter("selectDayBox");
		if (day.length() < 2) {
			day = "0" + day;
		}

		String birthday = year + month + day;
		student.setStu_birthday(birthday);
		//System.out.println(s);
		studentService.editStudent(student);
		return "redirect:/student/studentManage";
	}

	/*
	 * @RequestMapping("/student/studentEditForm") public ModelAndView
	 * studentEditForm() { System.out.println("/student/studentEditForm 입니다");
	 * return "/student/studentEdit"; }
	 * 
	 * @RequestMapping("/member/myInfoEdit") public ModelAndView
	 * edit2(HttpServletRequest req) { HttpSession session = req.getSession(false);
	 * System.out.println("memcon의 myInfoEdit입니다"); String id = (String)
	 * session.getAttribute("id"); Member m = service.getMyInfo(id);
	 * System.out.println(m.getAddress()); ModelAndView mav = new
	 * ModelAndView("/member/myInfoEdit"); mav.addObject("m", m); return mav; }
	 * 
	 * @RequestMapping("/student/studentEdit") public String studentEdit(Student s,
	 * HttpServletRequest req, HttpServletResponse res) {
	 * System.out.println("/student/studentEdit 입니다"); s.setMember_id("");
	 * s.setJoin_date(""); s.setStu_id(""); String year =
	 * req.getParameter("selectYearBox"); String month =
	 * req.getParameter("selectMonthBox"); if(month.length()<2) { month = "0"+month;
	 * } String day = req.getParameter("selectDayBox"); if(day.length()<2) { day =
	 * "0"+day; }
	 * 
	 * String birthday = year+month+day; s.setStu_birthday(birthday);
	 * System.out.println(s); studentService.studentJoin(s); return
	 * "/manager/manager"; }
	 */

}
