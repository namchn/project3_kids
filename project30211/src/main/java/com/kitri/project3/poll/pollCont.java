package com.kitri.project3.poll;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class pollCont {
@Resource(name = "pollService")
   private pollService service;

   @RequestMapping("/poll/list")
   public ModelAndView poll(PagingVO pvo) {
      ArrayList<Poll> list = service.getAllPoll(pvo);
      pvo.setTotal(service.getTotalPaging());
      ModelAndView mav = new ModelAndView("/poll/list");
      mav.addObject("list", list);
      mav.addObject("paging",pvo);
      return mav;
   }
   @RequestMapping("/poll/view")
   public ModelAndView pollView(Poll p, HttpServletRequest r) {
      int poll_num = Integer.parseInt(r.getParameter("pollnum"));
      HttpSession s = r.getSession();
      String id = s.getAttribute("id").toString();
      pollCheck pch = new pollCheck();
      pch.setId(id);
      pch.setPoll_num(poll_num);
      p.setPoll_num(poll_num);
      pch = service.checkPoll(pch);
      p = service.getPoll(p.getPoll_num());
      ArrayList<Poll_Can> pc = service.getPollCan(p.getPoll_num());
      ModelAndView mav = new ModelAndView("/poll/view");
      mav.addObject("p", p);
      mav.addObject("pc", pc);
      mav.addObject("pch", pch);
      return mav;
   }
   @RequestMapping("/poll/writeform")
   public String pollwriteform(Poll p) {
      return "/poll/write";
   }
   @RequestMapping("/poll/write")
   public ModelAndView pollwrite(Poll p, Poll_Can pc, HttpServletRequest r, PagingVO pvo) {
      service.makePoll(p);   
      String[] pca = pc.getPoll_candidate().split(",");
      for(int i=0; i<pca.length; i++) {
         pc.setPoll_candidate(pca[i]);
         service.makePollCan(pc);
      }
      ArrayList<Poll> list = service.getAllPoll(pvo);   
      int num = list.get(0).getPoll_num();
      p = service.getPoll(num);
      int poll_num = p.getPoll_num();
      ModelAndView mav = new ModelAndView("redirect:/poll/view");
      mav.addObject("pollnum", poll_num);
      return mav;
   }

   @RequestMapping("/poll/update")
   public ModelAndView pollupdate(int poll_num, int poll_candidate_num, HttpServletRequest r) {
      
      HttpSession s = r.getSession();
      String id = s.getAttribute("id").toString();
      pollCheck pcheck = new pollCheck(id, poll_num);
      pollCheck pcheck2 = service.checkPoll(pcheck);
      ModelAndView mav = new ModelAndView("poll/update");
      Poll p = service.getPoll(poll_num);
      Poll_Can pc = service.getvote(poll_candidate_num);
      int vote = pc.getVote_num();
      if(pcheck2 != null) { //중복투표
      mav.addObject("p",p);
      mav.addObject("pc",vote);
      mav.addObject("pcheck", pcheck2.getId());
      }
      else if(pcheck2 == null) { //첫투표
         service.increasePollVoter(poll_num);
         service.increasePollCanVote(poll_candidate_num);
         p = service.getPoll(poll_num);
         pc = service.getvote(poll_candidate_num);
         vote = pc.getVote_num();
         service.makeCheck(pcheck);
         String check = "no";
         mav.addObject("p",p);
         mav.addObject("pc",vote);
         mav.addObject("pcheck", check);
      }
      return mav;
   }
   @RequestMapping("/poll/delete")
   public String polldel(@RequestParam(value="poll_num")int poll_num) {
      service.delete(poll_num);
      return "redirect:/poll/list";
   }
}