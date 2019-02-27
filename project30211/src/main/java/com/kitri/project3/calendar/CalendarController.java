package com.kitri.project3.calendar;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CalendarController {
   @Resource(name = "calService")
   private Service service;

   public void setService(Service service) {//setService
      this.service = service;
   }
   
   @RequestMapping("/fullcalendar/calJsonAll") //json  가져오기
   public ModelAndView calgetAll(HttpServletRequest req) {
      //HttpSession session = req.getSession(false);
      //String id = (String) session.getAttribute("id");
      //int num=13;
      ArrayList<Calendar> allc = service.getCalAll();
      /*for(int i=0; i<allc.size();i++) {
         System.out.println(allc.get(i).toString());
         }*/
      ModelAndView mav = new ModelAndView("/fullcalendar/calJsonAll");
      mav.addObject("allc", allc);
      return mav;
      
   }
   
   
   @RequestMapping("/fullcalendar/fullcalendar")
   public ModelAndView fullcalget(HttpServletRequest req, @RequestParam(value = "num") int num) {//
         //HttpSession session = req.getSession(false);
         //String id = (String) session.getAttribute("id");
         //int num=13;
         Calendar c = service.getCal(num);
         ModelAndView mav = new ModelAndView("/fullcalendar/fullcalendar");
         mav.addObject("c", c);
         return mav;
      }
   
   
   
   
   @RequestMapping("/fullcalendar/fullcalendarAll")//전체값 가져오기
   public ModelAndView fullcalgetAll(HttpServletRequest req, PagingVO paging) {
         //HttpSession session = req.getSession(false);
         //String id = (String) session.getAttribute("id");
         //int num=13;
         ArrayList<Calendar> allc = service.getCalAll();
         ModelAndView mav = new ModelAndView("/fullcalendar/fullcalendar");
         mav.addObject("allc", allc);
         
         
          ArrayList<Calendar> list = service.PageAll(paging);
           paging.setTotal(service.getTotalPaging());
           mav.addObject("list", list);
           mav.addObject("paging", paging);
           System.out.println("확인중무엇"+paging.getPageCnt());
         return mav;
      }
   
   
   
   
   
   
   
   
   @RequestMapping("/fullcalendar/fullcalendarJoin") //값 넣기
   public ModelAndView fullcaljoin(HttpServletRequest req) {//
      ////
   /*   String jstr = req.getParameter("event");
      JSONParser jparser = new JSONParser();
      JSONObject jobj = (JSONObject) jparser.parse(jstr);
      System.out.println(jobj);
      String calnum;*/
      ///
         Calendar c =new Calendar();
         String id =req.getParameter("id");
         String start_date =req.getParameter("start_date");
         String end_date =req.getParameter("end_date");
         String event =req.getParameter("event");
         System.out.println(start_date);
         System.out.println(id);
         int num = service.getNum();//번호생성
         c.setEvent(event);
         c.setId(id);
         c.setStart_date(start_date);
         c.setEnd_date(end_date);
         c.setNum(num);  //번호 주입
         service.insertCal(c);//달력입력
         //System.out.println(c.toString());
         Calendar getc= service.getCal(num);
         
         ModelAndView mav = new ModelAndView("/fullcalendar/calJson");
         mav.addObject("allc", getc);
         return mav;
      }
   
   
   @RequestMapping("/fullcalendar/fullcalendarEdit") //값 수정
   public ModelAndView fullcaledit(HttpServletRequest req) {//
         Calendar c =new Calendar();
         String id =req.getParameter("id");
         String start_date =req.getParameter("start_date");
         String end_date =req.getParameter("end_date");
         String event =req.getParameter("event");
         int num =Integer.parseInt(req.getParameter("num"));
         System.out.println(start_date);
         System.out.println(num);
         c.setEvent(event);
         c.setId(id);
         c.setStart_date(start_date);
         c.setEnd_date(end_date);
         c.setNum(num);  //번호 주입
         service.editCal(c);
         ModelAndView mav = new ModelAndView("/fullcalendar/fullcalendar");
         mav.addObject("c", c);
         return mav;
      }
   
   
   @RequestMapping("/fullcalendar/fullcalendardelete") //값 삭제
   public ModelAndView fullcaldel(@RequestParam(value = "num") int num) {//
         System.out.println("숫자:"+num);
         service.delCal(num);
         ModelAndView mav = new ModelAndView("/fullcalendar/fullcalendar");
         //mav.addObject("c", c);
         return mav;
      }

      //캘린더 게시판 글목록(페이징처리)
      @RequestMapping("/fullcalendar/bulletinList")
      public ModelAndView bulletinList(PagingVO paging) {   //index0 pageStartNum1 listCnt5
         
         ModelAndView mav = new ModelAndView("/fullcalendar/fullcalendar");
         ArrayList<Calendar> list = service.PageAll(paging);
         paging.setTotal(service.getTotalPaging());
         
         
         //System.out.println("확인중"+paging.getPageCnt());
         
         mav.addObject("list", list);
         mav.addObject("paging", paging);

         return mav;
      }
      
}