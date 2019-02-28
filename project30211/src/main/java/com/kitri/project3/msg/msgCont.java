package com.kitri.project3.msg;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project3.member.Member;

@Controller
public class msgCont {
@Resource(name="msgService")
private msgService service;
	@RequestMapping(value="/msg/msg")
	public ModelAndView msg(HttpServletRequest r, PagingVO pvo) {
		HttpSession s = r.getSession();
		String id = s.getAttribute("id").toString();
		pvo.setReceiver(id);
		ArrayList<Message> list = service.msgList(pvo);
		ArrayList<Member> mlist = service.getGrp(id);
		pvo.setTotal(service.getMsgCnt(id));
		ModelAndView mav = new ModelAndView("/message/msgbox");
		mav.addObject("mlist", mlist);
		mav.addObject("list", list);
		mav.addObject("paging", pvo);
		return mav;
	}
	@RequestMapping(value="/msg/my")
	public ModelAndView my(HttpServletRequest r, PagingVO pvo) {
		HttpSession s = r.getSession();
		String id = s.getAttribute("id").toString();
		pvo.setSender(id);
		ArrayList<Message> list = service.getMyMessage(pvo);
		pvo.setTotal(service.getTotalMyPaging(id));
		ModelAndView mav = new ModelAndView("/message/my");
		mav.addObject("list", list);
		mav.addObject("paging", pvo);
		return mav;
		
	}
	@RequestMapping(value="/msg/send")
	public ModelAndView sendmsg(Message m, HttpServletRequest r, PagingVO pvo) {
		String sender = r.getParameter("sender");
		m.setSender(sender);
		service.sendMsg(m);
		HttpSession s = r.getSession();
		String id = s.getAttribute("id").toString();
		pvo.setReceiver(id);
		ArrayList<Message> list = service.msgList(pvo);
		pvo.setTotal(service.getMsgCnt(id));
		ModelAndView mav = new ModelAndView("redirect:msg");
		mav.addObject("list", list);
		mav.addObject("paging", pvo);
		return mav;
	}
	@RequestMapping(value="/msg/read")
	public String read(HttpServletRequest r) {
		int num = Integer.parseInt(r.getParameter("num"));
		service.Read(num);
		return "/message/msgbox";
	}
	@RequestMapping(value="/msg/delete")
	public String del(HttpServletRequest r, @RequestParam("check")String[] num) {
		for(int i=0; i<num.length; i++) {
			service.delMsg(Integer.parseInt(num[i]));
		}
		return "redirect:msg";
	}
//	@RequestMapping(value="/msg/msgcheck")
//	public ModelAndView msgcheck(HttpServletRequest r){
//		HttpSession s = r.getSession();
//		String id = s.getAttribute("id").toString();
//		System.out.println(id);
//		int cnt = service.MsgCheck(id);
//		ModelAndView mav = new ModelAndView("/common/header");
//		mav.addObject("cnt",cnt);
//		return mav;
//	}
	@RequestMapping(value="/msg/msgcheck")
	@ResponseBody
	public String msgcheck(HttpServletRequest r){
		HttpSession s = r.getSession();
		String id = s.getAttribute("id").toString();
		ArrayList<Message> list = service.MsgCheck(id);
		String cnt = Integer.toString(list.size());
		return cnt;
	}
	
	
}
