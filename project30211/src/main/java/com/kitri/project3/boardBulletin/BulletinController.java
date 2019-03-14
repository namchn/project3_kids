package com.kitri.project3.boardBulletin;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project3.boardReply.Reply;
import com.kitri.project3.boardReply.ReplyService;
import com.kitri.project3.paging.PagingVO;

@Controller
public class BulletinController {
   @Resource(name = "boardBulletinService")
   private BoardBulletinService service;
   @Resource(name = "boardReplyService")
   private ReplyService replyService;

    @RequestMapping("/boardBulletin/bulletinList")
      public ModelAndView bulletinList(PagingVO paging, @RequestParam(value = "sort") String sort) {   
         System.out.println(sort);
         ModelAndView mav = new ModelAndView("");
         if(sort.equals("1")) {
            mav = new ModelAndView("/manager/boardManage");
         }else if(sort.equals("2")) {
            mav = new ModelAndView("/boardBulletin/bulletinList");
         }
         
         ArrayList<BulletinBoard> list = service.getAll(paging);
         paging.setTotal(service.getTotalPaging());


         mav.addObject("sort", sort);

         mav.addObject("list", list);
         mav.addObject("paging", paging);

         return mav;
      }


   // 자유 게시판 상세 글조회
   @RequestMapping("/boardBulletin/bulletinView")
   public ModelAndView bulletinView(@RequestParam(value = "bulletin_num") int num,
         @RequestParam(value = "sort") String sort) {
      System.out.println("컨트롤러까지 이동했습니당");
      ModelAndView mav = new ModelAndView("/boardBulletin/bulletinView");
      service.editViewCount(num);
      // System.out.println("여기까지는 왔는가");
      BulletinBoard bb = service.getByNum(num);
      // System.out.println("여기까지는 왔는가");
      mav.addObject("bb", bb);
      mav.addObject("sort", sort);

      ArrayList<Reply> replyList = replyService.getByBulletinNum(num);
      mav.addObject("replyList", replyList);

      return mav;
   }

   // 자유 게시판 작성 페이지 이동
   @RequestMapping("/boardBulletin/bulletinWriteForm")
   public ModelAndView bulletinWriteForm(@RequestParam("sort") String sort) {
      System.out.println("sort : " + sort);
      ModelAndView mav = new ModelAndView("/boardBulletin/bulletinWriteForm");
      mav.addObject("sort", sort);
      return mav;
   }

   // 자유 게시판 작성
   @RequestMapping("/boardBulletin/bulletinWrite")
   public ModelAndView bulletinWrite(BulletinBoard bb, @RequestParam("sort") String sort) {
      System.out.println("/boardBulletin/bulletinWrite sort : " + sort);

      ModelAndView mav = new ModelAndView("");
      if (sort.equals("1")) {
         mav = new ModelAndView("redirect:/manager/boardManage");
      } else if (sort.equals("2")) {
         mav = new ModelAndView("redirect:/boardBulletin/bulletinList");
      }
      mav.addObject("sort", sort);
      
      int num = service.getNum();
      bb.setBulletin_num(num);
      System.out.println(bb);
      service.addBoard(bb);
      return mav;
   }

   // 자유 게시판 수정 페이지 이동
   @RequestMapping("/boardBulletin/bulletinEditForm")
   public ModelAndView bulletinEditForm(@RequestParam(value = "bulletin_num") int num, @RequestParam(value = "sort") String sort) {
      //System.out.println("/boardBulletin/bulletinEditForm입니다 sort: "+sort);
      ModelAndView mav = new ModelAndView("/boardBulletin/bulletinEditForm");
      BulletinBoard bb = service.getByNum(num);
      mav.addObject("bb", bb);
      mav.addObject("sort", sort);
      System.out.println(sort);
      return mav;
   }

   // 자유 게시판 수정
   @RequestMapping("/boardBulletin/bulletinEdit")
   public ModelAndView bulletinEdit(BulletinBoard bb, @RequestParam("sort") String sort) {
      System.out.println("/boardBulletin/bulletinEdit입니다");
      System.out.println("/boardBulletin/bulletinEdit의 sort "+sort);
      ModelAndView mav = new ModelAndView();
      if (sort.equals("1")) {
         mav = new ModelAndView("redirect:/manager/boardManage");
      } else {
         mav = new ModelAndView("redirect:/boardBulletin/bulletinList");
      }
      mav.addObject("sort", sort);
      
      service.editBoard(bb);

      return mav;
   }

   // 자유 게시판 삭제
   @RequestMapping("/boardBulletin/bulletinDelete")
   public ModelAndView bulletinDelete(@RequestParam(value = "bulletin_num") int num, @RequestParam("sort") String sort) {
      ModelAndView mav = new ModelAndView();
      if (sort.equals("1")) {
         mav = new ModelAndView("redirect:/manager/boardManage");
      } else {
         mav = new ModelAndView("redirect:/boardBulletin/bulletinList");
      }
      mav.addObject("sort", sort);
      
      service.delBoard(num);
      return mav;
   }

   // 자유 게시판 검색
   @RequestMapping("/boardBulletin/bulletinSearchResult")
   public ModelAndView bulletinSearchResult(PagingVO paging, @RequestParam(value = "search_type") int search_type,
         @RequestParam(value = "search_word") String search_word) {

//         ModelAndView mav = new ModelAndView("/boardBulletin/bulletinSearchResult");
      ModelAndView mav = new ModelAndView("/boardBulletin/bulletinList");
      ArrayList<BulletinBoard> list = null;

      System.out.println("1단계 진입");

      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("paging", paging);
      map.put("search_word", "%" + search_word + "%");

      System.out.println("2단계 진입");

      System.out.println(map.get("search_word"));

      switch (search_type) {
      case 1:
         paging.setTotal(service.getTotalPagingByTitle("%" + search_word + "%"));
         System.out.println("3단계 진입");
         System.out.println(map.get("paging"));

         list = service.getByTitle(map);
         mav.addObject("search_type", search_type);
         mav.addObject("search_word", search_word);
         System.out.println("4단계 진입");
         break;
      case 2:
         paging.setTotal(service.getTotalPagingById("%" + search_word + "%"));
         System.out.println(map.get("paging"));
         list = service.getById(map);
         mav.addObject("search_type", search_type);
         mav.addObject("search_word", search_word);
         break;
      }

      mav.addObject("list", list);
      mav.addObject("paging", paging);
      return mav;
   }

      //자유 게시판 댓글 작성 및 조회
      @RequestMapping("/boardBulletin/bulletinReplyList")
      public ModelAndView bulletinReplyWrite(@RequestParam(value="bulletin_num") int bulletin_num, @RequestParam(value="id") String id, @RequestParam(value="content") String content) {
         Reply r = new Reply();
         r.setBoard_code("bulletin");
         r.setNum(bulletin_num);
         int reply_num = replyService.getNum();
         r.setReply_num(reply_num);
         r.setId(id);
         r.setContent(content);
         replyService.addReply(r);
         
         ModelAndView mav = new ModelAndView("/boardBulletin/bulletinReplyList");
         ArrayList<Reply> list = replyService.getByBulletinNum(bulletin_num);
         mav.addObject("list", list);   
         
         return mav;
      }  
      
      //자유 게시판 댓글 수정 및 조회
      @RequestMapping("/boardBulletin/bulletinReplyEdit")
      public ModelAndView bulletinReplyEdit(@RequestParam(value="bulletin_num") int bulletin_num, @RequestParam(value="reply_num") int reply_num, @RequestParam(value="content") String content) {
         Reply r = new Reply();
         r.setNum(bulletin_num);
         r.setReply_num(reply_num);
         r.setContent(content);
         replyService.editReply(r);
         
         ModelAndView mav = new ModelAndView("/boardBulletin/bulletinReplyList");
         ArrayList<Reply> list = replyService.getByBulletinNum(bulletin_num);
         mav.addObject("list", list);   
         
         return mav;
      }
  
      
      //자유 게시판 댓글 삭제 및 조회
      @RequestMapping("/boardBulletin/bulletinReplyDelete")
      public ModelAndView bulletinReplyDelete(@RequestParam(value="bulletin_num") int bulletin_num, @RequestParam(value="reply_num") int reply_num) {
         replyService.delReply(reply_num);   
         
         ModelAndView mav = new ModelAndView("/boardBulletin/bulletinReplyList");
         ArrayList<Reply> list = replyService.getByBulletinNum(bulletin_num);
         mav.addObject("list", list);   
         
         return mav;
      }

}