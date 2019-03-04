package com.kitri.project3.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project3.pay.Pay;

@Controller
public class MemController {
	@Resource(name = "memService")
	private Service service;

	public void setService(Service service) {
		this.service = service;
	}

	@RequestMapping("/member/joinForm")
	public String joinForm() {
		return "redirect:/member/join";
	}

	@RequestMapping("/member/join")
	public String join(Member m, HttpServletRequest req, HttpServletResponse res) {
		System.out.println("/member/join 입니다");
		try {
	         req.setCharacterEncoding("UTF-8");
	      } catch (UnsupportedEncodingException e) {
	         e.printStackTrace();
	      }
		res.setCharacterEncoding("UTF-8");
		
		
		String mem_code = req.getParameter("mem_code");
		System.out.println(mem_code);
		switch(mem_code) {
	    case "3": 
	         m.setMng_group("");
	         m.setStu_group("");
	         break;
		case "2": 
			String stu_group = req.getParameter("selectStuGroupBox");
			m.setStu_group(stu_group);
			m.setMng_group("");
			break;
		case "1": 
			String mng_group = req.getParameter("selectMngGroupBox");
			m.setMng_group(mng_group);
			m.setStu_group("");
			break;
		}
		
		service.join(m);
		return "redirect:/";
	}

	@RequestMapping("/member/checkId")
	public ModelAndView checkId(@RequestParam(value = "id") String id) {
		ModelAndView mav = new ModelAndView("member/checkId");
		boolean flag = service.checkId(id);
		mav.addObject("flag", flag);
		return mav;
	}
	
	@RequestMapping("/member/checkPhone")
	public ModelAndView checkPhone(@RequestParam(value = "phone") int phone) {
		ModelAndView mav = new ModelAndView("member/checkPhone");
		String p = "0"+Integer.toString(phone);
		boolean flag = service.checkPhone(p);
		mav.addObject("flag", flag);
		return mav;
	}

	@RequestMapping("/member/checkPw")
	public ModelAndView checkPw(HttpServletRequest req, @RequestParam(value = "pw") String pw,
			@RequestParam(value = "id") String id) {
		ModelAndView mav = new ModelAndView("member/checkPw");
		// HttpSession session = req.getSession(false);
		// String id = (String) session.getAttribute("id");
		System.out.println("memcon의 checkPw입니다");
		System.out.println(id);
		System.out.println(pw);
		boolean flag = service.checkPw(id, pw);
		mav.addObject("flag", flag);
		return mav;
	}

	@RequestMapping("/member/loginForm")
	public String loginForm() {
		return "/member/login";
	}
	
	@RequestMapping("/member/login")
	public String login(HttpServletRequest req, HttpServletResponse res, Member m) throws IOException {
		System.out.println("memcon의 login입니다");
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");

		// 로그인 후처리를 위한 변수
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=UTF-8");

		HttpSession session = req.getSession();
		String result = "";
		boolean flag = service.login(m.getId(), m.getPw());
		if (flag) {
			Member x = service.getMyInfo(m.getId());
			session.setAttribute("id", m.getId());
			session.setAttribute("mem_code", x.getMem_code());
			session.setAttribute("mem_code", x.getMem_code());
		    session.setAttribute("stu_group", x.getStu_group());
		    session.setAttribute("mng_group", x.getMng_group());
		    System.out.println("memcon의 login입니다 : "+x.getMng_group());

			result = "redirect:/";

		} else {
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호를 확인해 주세요.');");
			out.println("location.href='/project3/';");
			out.println("</script>");
			out.close();
			result = "redirect:/";
		}
		return result;
	}
	
	@RequestMapping("/member/findId")
	public String findId(HttpServletRequest req, HttpServletResponse res, Member m) throws IOException {
		
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");

		// 로그인 후처리를 위한 변수
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=UTF-8");

		HttpSession session = req.getSession();
		Member m2  = service.findId(m);
		String id="";		
		if (m2!=null) {
			id = m2.getId();
			out.println("<script>");
			out.println("alert('회원님의 아이디는 "+id+" 입니다');");
			out.println("location.href='/project3/';");
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('입력하신 아이디가 존재하지 않습니다');");
			out.println("location.href='/project3/';");
			out.println("</script>");
			out.close();		
		}
		return "redirect:/";
	}
	
	
	@RequestMapping("/member/findPw")
	public String findPw(HttpServletRequest req, HttpServletResponse res, Member m) throws IOException {

		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");

		// 로그인 후처리를 위한 변수
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=UTF-8");

		HttpSession session = req.getSession();
	
		Member m2  = service.findPw(m);
		
		

		if (m2!=null) {
			String pw = m2.getPw();
			
			StringBuffer sb = new StringBuffer(pw);

			String result = sb.replace(pw.length()-5, pw.length()-3, "**" ).toString();
			out.println("<script>");
			out.println("alert('회원님의 비밀번호는"+result+" 입니다');");
			out.println("location.href='/project3/';");
			out.println("</script>");
			out.close();
		} else {
			out.println("<script>");
			out.println("alert('정보를 잘못 입럭하셨습니다');");
			out.println("location.href='/project3/';");
			out.println("</script>");
			out.close();		
		}
		return "redirect:/";
	}

	@RequestMapping("/member/myInfo")
	public ModelAndView myInfo(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		Member m = service.getMyInfo(id);
		System.out.println(m.getDetailAddress());
		System.out.println(m.getAddress());
		System.out.println(m.getExtraAddress());
		System.out.println(m.getPostcode());
		ModelAndView mav = new ModelAndView("/member/myInfo");
		mav.addObject("m", m);
		return mav;
	}

	/*
	 * @RequestMapping(value = "/member/myInfoEdit") public String editForm() {
	 * System.out.println("memcon의 myInfoEdit입니다"); return "/member/myInfoEdit"; }
	 */

	@RequestMapping("/member/myInfoEdit")
	public ModelAndView edit2(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		System.out.println("memcon의 myInfoEdit입니다");
		String id = (String) session.getAttribute("id");
		Member m = service.getMyInfo(id);
		System.out.println(m.getAddress());
		ModelAndView mav = new ModelAndView("/member/myInfoEdit");
		mav.addObject("m", m);
		return mav;
	}

	@RequestMapping(value = "/member/edit")
	public String edit(Member m, HttpServletRequest req, HttpServletResponse res) {
		System.out.println("memcon의 edit입니다");
		System.out.println(m.getId());
		
		switch(m.getMem_code()) {
		case "2": 
			String stu_group = req.getParameter("selectStuGroupBox");
			m.setStu_group(stu_group);
			m.setMng_group("");
			break;
		case "1": 
			String mng_group = req.getParameter("selectMngGroupBox");
			m.setMng_group(mng_group);
			m.setStu_group("");
			break;
		case "0":
			m.setStu_group("");
			m.setStu_name("");
			m.setMng_group("");
			break;	
		case "3":
			m.setStu_group("");
			m.setStu_name("");
			m.setMng_group("");
			break;			
		}
		
		switch(m.getMem_code()) {

		case "0":
			m.setStu_group("");
			m.setStu_name("");
			m.setMng_group("");
			break;
			
		case "1":
			m.setStu_group("");
			m.setStu_name("");
			break;
			
		case "2":
			m.setMng_group("");
			break;
			
		case "3":
			m.setStu_group("");
			m.setStu_name("");
			m.setMng_group("");
			break;		

		}
		service.editMyInfo(m);
		return "redirect:/";
	}

	@RequestMapping(value = "/member/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.removeAttribute("id");
		session.removeAttribute("mem_code");
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/member/outForm")
	public String outForm() {
		return "/member/out";
	}

	@RequestMapping(value = "/member/out")
	public String out(HttpServletRequest req) {
		System.out.println("memcon의 out입니다");
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		service.delMember(id);
		session.removeAttribute("id");
		session.invalidate();
		return "redirect:/";
		// return "/member/outForm";
	}

	// 내 결제 정보 조회
	@RequestMapping("/member/myInfoPayForm")
	public String myInfoPay() {
		return "redirect:/member/myInfoPay";
	}

	// 내 결제 정보 조회
	@RequestMapping("/member/myInfoPay")
	public ModelAndView myInfoPay(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		Member m = service.getMyInfo(id);
		Pay p = service.getC(id);
		ModelAndView mav = new ModelAndView("/pay/pay");
		mav.addObject("m", m);
		mav.addObject("p", p);
		return mav;
	}

	// 담임 반 원생 조회
	@RequestMapping("/member/mystu")
	public ModelAndView myStu(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		Member m = new Member();
		m = service.getMyInfo(id);
		ArrayList<Member> list = service.getStu(m.getMng_group());
		ModelAndView mav = new ModelAndView("/member/myStu");
		mav.addObject("list", list);
		return mav;
	}

}
