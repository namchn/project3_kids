package com.kitri.project3.pay;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project3.member.Member;

@Controller
public class PayController {
	@Resource(name = "payService")
	private Service service;

	public void setService(Service service) {
		this.service = service;
	}

	@RequestMapping("/pay/payForm")
	public String pay() {
		return "redirect:/member/myInfoPayForm";
	}

	// 결제 정보 추가, 내 결제 여부 조회, 내 결제 정보 조회
	@RequestMapping(value = "/pay/okdk", method = RequestMethod.POST)
	public ModelAndView okdk(HttpServletRequest req, HttpServletResponse res, Pay p1) {
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		res.setCharacterEncoding("UTF-8");
		service.add(p1);
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		Pay p = service.getC(id);
		Member m = service.getM(id);

		ModelAndView mav = new ModelAndView("/pay/payresult");
		if (m.getMng_group() != null) {
			ArrayList<Pay> list = service.getS(m.getMng_group());
			mav.addObject("s", list);
		}
		mav.addObject("p", p);
		mav.addObject("m", m);
		return mav;
	}

	// 담임 반 원생 결제 정보 조회
	   @RequestMapping("/pay/complete")
	   public ModelAndView payresult(HttpServletRequest req) {
	      HttpSession session = req.getSession(false);
	      String id = (String) session.getAttribute("id");
	      Pay p = service.getC(id);
	      Member m = service.getM(id);
	      ArrayList<Pay> list = service.getS(m.getMng_group()); // 완납한 원생 목록
	      ArrayList<Member> mlist = service.getStudent(m.getMng_group()); // 담임 반 원생 목록

	      String[] str = new String[mlist.size()];
	      for (int i = 0; i < mlist.size(); i++) {
	         for (int j = 0; j < list.size(); j++) {
	            if (mlist.get(i).getId().equals(list.get(j).getId())) {
	               str[i] = list.get(j).getTime();
	               break;
	            } else {
	               str[i] = "미납";
	            }
	         }
	      }

	      LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
	      for (int i = 0; i < str.length; i++) {
	         map.put(mlist.get(i).getId(), str[i]);
	      }

	      System.out.println(map);

	      ModelAndView mav = new ModelAndView("/pay/payresult");
	      mav.addObject("mlist", mlist); // 담임 반 원생 목록
	      mav.addObject("p", p);
	      mav.addObject("m", m);
	      mav.addObject("list", list); // 완납한 원생 목록
	      mav.addObject("map", map);
	      return mav;
	   }

	// 내 결제 여부 조회, 내 결제 정보 조회
	@RequestMapping("/pay/complete2")
	public ModelAndView payresult2(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		Pay p = service.getC(id);
		Member m = service.getM(id);
		ModelAndView mav = new ModelAndView("/pay/payresult");
		mav.addObject("p", p);
		mav.addObject("m", m);
		return mav;
	}
}
