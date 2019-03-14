package com.kitri.project3.manager;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project3.boardBulletin.BoardBulletinService;
import com.kitri.project3.boardBulletin.BulletinBoard;
import com.kitri.project3.boardGallery.BoardGalleryService;
import com.kitri.project3.boardGallery.GalleryBoard;
import com.kitri.project3.boardNotice.BoardNoticeService;
import com.kitri.project3.boardNotice.NoticeBoard;
import com.kitri.project3.book.Book;
import com.kitri.project3.book.BookService;
import com.kitri.project3.book.Rent;
import com.kitri.project3.calendar.Calendar;
import com.kitri.project3.member.Member;
import com.kitri.project3.paging.PagingVO;
import com.kitri.project3.paging.PagingVO2;
import com.kitri.project3.pay.Pay;
import com.kitri.project3.pay.Service;

@Controller
public class ManController {
   @Resource(name = "manService")
   private ManService manService;
   @Resource(name = "boardGalleryService")
   private BoardGalleryService boardGalleryService;
   @Resource(name = "boardBulletinService")
   private BoardBulletinService boardBulletinService;
   @Resource(name = "boardNoticeService")
   private BoardNoticeService boardNoticeService;
   @Resource(name = "payService")
   private Service service;
   @Resource(name = "bookService")
   private BookService bookService;
   /*
    * @Resource(name="BoardReplyService") private ReplyService replyService;
    */
   private String path = "D:\\javadata\\web\\workspace\\web\\project30211\\src\\main\\webapp\\resources\\img\\";
   private String path2 = "D:\\javadata\\web\\workspace\\web\\project30211\\src\\main\\webapp\\resources\\img\\";
   private String path3 = "C:\\Users\\wnsrb\\Desktop\\eclipse\\project30211\\src\\main\\webapp\\resources\\img\\";
   @RequestMapping(value = "/manager/manager", method = RequestMethod.GET)
   public String manager() {
      return "/manager/manager";
   }

   // 회원 관리
   @RequestMapping(value = "/manager/memberManage")
   public ModelAndView memberManage(PagingVO paging) {
      System.out.println("manager의 memberManage입니다");
      ModelAndView mav = new ModelAndView("/manager/memberManage");
      ArrayList<Member> m = manService.getAllMember(paging);
      System.out.println("m.size: " + m.size());

      paging.setTotal(manService.getTotalPaging());
      System.out.println(paging);
      mav.addObject("m", m);
      mav.addObject("paging", paging);
      return mav;
   }

   @RequestMapping(value = "/manager/memberDelete")
   public String memberDelete(HttpServletRequest req, HttpServletResponse res) throws IOException {
      System.out.println("manager의 memberDelete입니다");
      req.setCharacterEncoding("UTF-8");
      res.setCharacterEncoding("UTF-8");
      String[] arr = req.getParameterValues("check_member");

      for (int i = 0; i < arr.length; i++) {
         manService.deleteMember(arr[i]);
      }
      return "redirect:/manager/memberManage";
   }

   // 일정 관리
   @RequestMapping("/manager/calendarManage") // 전체값 가져오기
   public ModelAndView calendarManage(HttpServletRequest req, PagingVO paging) {
      System.out.println("manager의 calendarManage입니다");
      ArrayList<Calendar> allc = manService.getCalAll(paging);
      paging.setTotal(manService.getTotalPaging());
      // System.out.println(allc.size());
      ModelAndView mav = new ModelAndView("/manager/calendarManage");
      mav.addObject("allc", allc);
      mav.addObject("paging", paging);
      return mav;
   }

   @RequestMapping(value = "/manager/calendarDelete")
   public String calendarDelete(HttpServletRequest req, HttpServletResponse res) throws IOException {
      System.out.println("manager의 calendarDelete입니다");

      String[] arr = req.getParameterValues("check_num");
      int[] nums = Arrays.stream(arr).mapToInt(Integer::parseInt).toArray();

      System.out.println("nums[0]: " + nums[0]);

      for (int i = 0; i < arr.length; i++) {
         manService.deleteCalendar(nums[i]);
      }
      return "redirect:/manager/calendarManage";
   }

   @RequestMapping(value = "/manager/calendarEditForm")
   public ModelAndView calendarEditForm(HttpServletRequest req, HttpServletResponse res) throws IOException {
      req.setCharacterEncoding("UTF-8");
      res.setCharacterEncoding("UTF-8");
      System.out.println("manager의 calendarEditForm입니다");
      PrintWriter out = res.getWriter();
//      res.setContentType("text/html;charset=UTF-8");
      
      String[] arr = req.getParameterValues("check_num");
      //String result = "";
      /*System.out.println(arr.length);
      
      if(arr.length==0 || arr.length>1) {
         out.println("<script>");
         out.println("alert('일정 수정 시, 하나의 일정만 선택해주십시오.');");
         out.println("location.href='/project3/';");
         out.println("</script>");
         out.close();
         //result = "redirect:/";
      }*/

      int[] nums = Arrays.stream(arr).mapToInt(Integer::parseInt).toArray();
      System.out.println("nums[0]: " + nums[0]);
      Calendar calendar = manService.getCal(nums[0]);
      
      // System.out.println(calendar.getNum());
      // System.out.println(calendar.getStart_date());
      ModelAndView mav = new ModelAndView("/manager/calendarEdit");
      String start = calendar.getStart_date().substring(0, 10);
      String end = calendar.getEnd_date().substring(0, 10);
      mav.addObject("calendar", calendar);
      mav.addObject("start", start);
      mav.addObject("end", end);
      
      return mav;
   }

   @RequestMapping(value = "/manager/calendarEdit")
   public String calendarEdit(Calendar calendar) throws IOException {
      System.out.println("manager의 calendarEdit입니다");
      manService.editCal(calendar);
      return "redirect:/manager/calendarManage";
   }

   @RequestMapping("/manager/calendarUploadForm")
   public String calendarUploadForm() {
      System.out.println("manager의 calendarUploadForm입니다");

      return "/manager/calendarUpload";
   }


   @RequestMapping("/manager/calendarUpload")
   public String calendarUpload(Calendar calendar) {
      System.out.println("manager의 calendarUpload입니다");
      manService.uploadCal(calendar);
      return "redirect:/manager/calendarManage";
   }

   @RequestMapping("/manager/boardManage")
   public String boardManage() {
      return "/manager/boardManage";
   }

   @RequestMapping("/manager/boardGalleryManage")
   public ModelAndView boardGalleryManage(PagingVO2 paging) {
      ModelAndView mav = new ModelAndView("/manager/boardGalleryManage");
      System.out.println("mancon의 boardManage입니다");

      ArrayList<GalleryBoard> g_list = boardGalleryService.getAll(paging);
      System.out.println("g_list size:" + g_list.size());
      paging.setTotal(boardGalleryService.getTotalPaging());
      mav.addObject("g_list", g_list);
      mav.addObject("paging", paging);

      return mav;
   }

   @RequestMapping("/manager/boardBulletinManage")
   public ModelAndView boardBulletinManage(PagingVO paging) {
      ModelAndView mav = new ModelAndView("manager/boardBulletinManage");
      System.out.println("mancon의 boardBulletinManage입니다");

      ArrayList<BulletinBoard> b_list = boardBulletinService.getAll(paging);
      System.out.println("b_list size:" + b_list.size());
      paging.setTotal(boardBulletinService.getTotalPaging());
      mav.addObject("b_list", b_list);
      mav.addObject("paging", paging);

      return mav;
   }

   @RequestMapping("/manager/boardNoticeManage")
   public ModelAndView boardNoticeManage(PagingVO paging) {
      ModelAndView mav = new ModelAndView("/manager/boardNoticeManage");
      System.out.println("mancon의 boardNoticeManage입니다");

      ArrayList<NoticeBoard> n_list = boardNoticeService.getAll(paging);
      System.out.println("n_list size:" + n_list.size());
      paging.setTotal(boardNoticeService.getTotalPaging());
      mav.addObject("n_list", n_list);
      mav.addObject("paging", paging);

      return mav;
   }

   @RequestMapping(value = "/manager/boardDelete1")
   public String galleryDelete(HttpServletRequest req, HttpServletResponse res) throws IOException {
      System.out.println("manager의 boardDelete1입니다");
      String[] arr1 = req.getParameterValues("check_gallery_num");

      if (arr1.length > 0) {
         int[] nums = Arrays.stream(arr1).mapToInt(Integer::parseInt).toArray();
         System.out.println("nums[0]: " + nums[0]);
         for (int i = 0; i < arr1.length; i++) {
            boardGalleryService.delBoard(nums[i]);
         }

      } else {
         System.out.println("다시 선택하세요");
      }

      return "redirect:/manager/boardGalleryManage";
   }

   @RequestMapping(value = "/manager/boardDelete2")
   public String galleryDelete2(HttpServletRequest req, HttpServletResponse res) throws IOException {
      System.out.println("manager의 boardDelete2입니다");

      String[] arr2 = req.getParameterValues("check_bulletin_num");

      if (arr2.length > 0) {
         int[] nums = Arrays.stream(arr2).mapToInt(Integer::parseInt).toArray();
         System.out.println("nums[0]: " + nums[0]);
         for (int i = 0; i < arr2.length; i++) {
            boardBulletinService.delBoard(nums[i]);
         }
      } else {
         System.out.println("다시 선택하세요");
      }

      return "redirect:/manager/boardBulletinManage";
   }

   @RequestMapping(value = "/manager/boardDelete3")
   public String galleryDelete3(HttpServletRequest req, HttpServletResponse res) throws IOException {
      System.out.println("manager의 boardDelete3입니다");

      String[] arr3 = req.getParameterValues("check_notice_num");

      if (arr3.length > 0) {
         int[] nums = Arrays.stream(arr3).mapToInt(Integer::parseInt).toArray();
         System.out.println("nums[0]: " + nums[0]);
         for (int i = 0; i < arr3.length; i++) {
            boardNoticeService.delBoard(nums[i]);
         }
      } else {
         System.out.println("다시 선택하세요");
      }

      return "redirect:/manager/boardNoticeManage";
   }

   // 모든 대출 목록 조회
   @RequestMapping("/manager/rentpage")
   public ModelAndView rent_page(PagingVO paging) {
      SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
      Date currentTime = new Date();
      String mTime = mSimpleDateFormat.format(currentTime);
      ArrayList<Rent> list = manService.getAllRent(paging);
      paging.setTotal(manService.getRentCount());
      ModelAndView mav = new ModelAndView("/manager/rent_page");
      mav.addObject("list", list);
      mav.addObject("mTime", mTime);
      mav.addObject("paging", paging);
      return mav;
   }

   // 대출중인 목록 조회
   @RequestMapping("/manager/rentalList")
   public ModelAndView rent(PagingVO paging) {
	   SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	   Date currentTime = new Date();
	   String mTime = mSimpleDateFormat.format(currentTime);
	   ArrayList<Rent> list = manService.getRentalList(paging);
	   paging.setTotal(manService.getRentalCount());
	   ModelAndView mav = new ModelAndView("/manager/rentalList");
	   mav.addObject("list", list);
	   mav.addObject("mTime", mTime);
	   mav.addObject("paging", paging);
	   return mav;
   }
   
   // 연체중인 목록 조회
   @RequestMapping("/manager/delayList")
   public ModelAndView delay(PagingVO paging) {
	   SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	   Date currentTime = new Date();
	   String mTime = mSimpleDateFormat.format(currentTime);
	   ArrayList<Rent> list = manService.getDelayList(paging);
	   paging.setTotal(manService.getDelayCount());
	   ModelAndView mav = new ModelAndView("/manager/delayList");
	   mav.addObject("list", list);
	   mav.addObject("mTime", mTime);
	   mav.addObject("paging", paging);
	   return mav;
   }
   
   // 반납완료 목록 조회
   @RequestMapping("/manager/completeList")
   public ModelAndView complete(PagingVO paging) {
	   SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	   Date currentTime = new Date();
	   String mTime = mSimpleDateFormat.format(currentTime);
	   ArrayList<Rent> list = manService.getCompleteList(paging);
	   paging.setTotal(manService.getCompleteCount());
	   ModelAndView mav = new ModelAndView("/manager/completeList");
	   mav.addObject("list", list);
	   mav.addObject("mTime", mTime);
	   mav.addObject("paging", paging);
	   return mav;
   }
   
   // 반납하기
   @RequestMapping("/manager/rent")
   public String rent(HttpServletRequest req) {
      if (req.getParameter("checked_book") != null) {
         String[] arr = req.getParameterValues("checked_book");
         int[] nums = Arrays.stream(arr).mapToInt(Integer::parseInt).toArray();

         for (int i = 0; i < nums.length; i++) {
            manService.modRdate(nums[i]);
            Rent r = manService.getCheckRent(nums[i]);
            manService.modAmount(r);
         }
      }
      return "redirect:/manager/rentpage";

   }
   
   // 삭제하기
   @RequestMapping("/manager/delBook")
   public String del(HttpServletRequest req) {
	   if(req.getParameter("checked_book") != null) {
		   String[] arr = req.getParameterValues("checked_book");
		   int[] nums = Arrays.stream(arr).mapToInt(Integer::parseInt).toArray();
		   
		   for(int i = 0; i < nums.length; i++) {
			   manService.delBook(nums[i]);
			   manService.delCartList(nums[i]);
			   manService.delRentList(nums[i]);
		   }
	   }
	   
	   return "redirect:/book/booklistForm";
   }
   
   @RequestMapping("/manager/delRent")
   public String delRent(HttpServletRequest req) {
	   if(req.getParameter("checked_book") != null) {
		   String[] arr = req.getParameterValues("checked_book");
		   int[] nums = Arrays.stream(arr).mapToInt(Integer::parseInt).toArray();
		   
		   for(int i = 0; i < nums.length; i++) {
			   manService.delRent(nums[i]);
		   }
	   }
	   
	   return "redirect:/manager/rentpage";
   }
   
   // 수정하기
   @RequestMapping("/manager/editBook")
   public ModelAndView modBook(HttpServletRequest req, Book b) {
	   String[] arr = req.getParameterValues("checked_book");
	   int[] nums = Arrays.stream(arr).mapToInt(Integer::parseInt).toArray();
	   System.out.println("nums[0]: " + nums[0]);
	   int num = b.getBook_num();
	   b = bookService.getByNum(num);
	   System.out.println(b);
	   ModelAndView mav = new ModelAndView("/manager/edit_book");
	   mav.addObject("b", b);
	   
	   return mav;
   }
   
   @RequestMapping("/manager/edit_book")
   public String editBook(Book b) {
	   String files_path = "";
		
			files_path = makeFile2(b.getFile());
			
				b.setBook_img("../resources/img/" + files_path);
			
		
		System.out.println(b);
	   manService.modBook(b);
	   return "redirect:/book/booklistForm";
   }
   @RequestMapping("/manager/edit_book2")
   public String editBook2(Book b) {
	   System.out.println(b);
	   manService.modBook2(b);
	   int i = 203;
	  Book b2 = bookService.getByNum(i);
	  System.out.println(b2);
	   return "redirect:/book/booklistForm";
   }
   public String makeFile2(MultipartFile f) {   
	      File f1 = null;
	      try {
	         String fname1= f.getOriginalFilename();
	         f1 = new File(path3 + fname1);
	         f.transferTo(f1);
	      } catch (IllegalStateException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      } catch (Exception e) {
	         return "";
	      }
	      return f1.getName();
	   }
   
   // 메인 갤러리 작성 페이지 이동
   @RequestMapping("/manager/mgWriteForm")
   public String mainGalleryWriteForm() {
      return "manager/mgWriteForm";
   }

   // 메인 갤러리 게시판 작성
   @RequestMapping("/manager/mgWrite")
   public String mainGallery(HttpServletRequest req, GalleryBoard gb) {

   
      String files_path = "";

      if (gb.getFile1() != null) {
         files_path = makeFile(gb.getFile1(), 1);

         gb.setImg1(path + files_path);

      }
      if (gb.getFile2() != null) {
         files_path = makeFile(gb.getFile2(), 2);

         gb.setImg2(path + files_path);

      }
      if (gb.getFile3() != null) {
         files_path = makeFile(gb.getFile3(), 3);

         gb.setImg3(path + files_path);

      }
      if (gb.getFile4() != null) {
         files_path = makeFile(gb.getFile4(), 4);

         gb.setImg4(path + files_path);

      }

      return "redirect:/manager/manager";

   }

   // 파일 저장 및 파일 이름 반환
   public String makeFile(MultipartFile f, int num) {
      File file = null;
      try {
         file = new File(path + num + ".jpg");
         f.transferTo(file);
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } catch (Exception e) {
         return "";
      }
      return file.getName();
   }

   // 회원 통계 조회
   @RequestMapping("manager/memberStat")
   public ModelAndView memberStat(PagingVO paging) {
      System.out.println("manager/memberStat 입니다");
      int parentCount = manService.getParentStat();
      int teacherCount = manService.getTeacherStat();
      int visitorCount = manService.getVisitorStat();
      int totalMemCount = manService.getTotalMemStat();

      double parentCountD = manService.getParentStat();
      double teacherCountD = manService.getTeacherStat();
      double visitorCountD = manService.getVisitorStat();
      double totalMemCountD = manService.getTotalMemStat();

      double teacherPortion = teacherCountD / totalMemCountD * 100;
      double parentPortion = parentCountD / totalMemCountD * 100;
      double visitorPortion = visitorCountD / totalMemCountD * 100;

      ModelAndView mav = new ModelAndView("/manager/memberStat");
      mav.addObject("parentCount", parentCount);
      mav.addObject("teacherCount", teacherCount);
      mav.addObject("visitorCount", visitorCount);
      mav.addObject("totalMemCount", totalMemCount);

      mav.addObject("teacherPortion", teacherPortion);
      mav.addObject("parentPortion", parentPortion);
      mav.addObject("visitorPortion", visitorPortion);

      return mav;
   }

   // 결제 통계 조회
   @RequestMapping("manager/payStat")
   public ModelAndView payStat() {
      System.out.println("manager/payStat 입니다");
      // 결제(달별 예상액, 총수금액, 미수액))
      int parentCount = manService.getParentStat();// 전체 원생 카운트
      int paidPay = manService.getSCount(); // 완납한 원생 카운트
      int unpaidPay = parentCount - paidPay;// 미납한 원생 카운트
      int totalExpectPay = parentCount * 30;// 이번달 총 예상 학원비
      int totalPaidPay = paidPay * 30; // 이번달 완납한 학원비
      int unpaidTotalPay = totalExpectPay - totalPaidPay;// 이번달 미수금

      double parentCountD = manService.getParentStat();// 전체 원생 카운트
      double paidPayD = manService.getSCount(); // 완납한 원생 카운트
      double unpaidPayD = parentCount - paidPay;// 미납한 원생 카운트
      // 보낼거
      double paidParentPortion = paidPayD / parentCountD * 100;// 완납한 원생 비율
      double unpaidParentPortion = unpaidPayD / parentCountD * 100;// 미납한 원생 비율

      double totalExpectPayD = parentCount * 30;// 이번달 총 예상 학원비
      double totalPaidPayD = paidPay * 30; // 이번달 완납한 학원비
      double unpaidTotalPayD = totalExpectPay - totalPaidPay;// 이번달 미수금
      // 보낼거
      double totalPaidPortion = totalPaidPayD / totalExpectPayD * 100;// 완납한 학원비 비율
      double totalunpaidPortion = unpaidTotalPayD / totalExpectPayD * 100;// 미수금 비율

      ArrayList<Pay> paidParentList = service.getSAll(); // 완납한 원생 목록
      ArrayList<Member> parentAllList = manService.getParentAll(); // 총 원생 목록

      String[] str = new String[parentAllList.size()];
      for (int i = 0; i < parentAllList.size(); i++) {
         for (int j = 0; j < paidParentList.size(); j++) {
            if (parentAllList.get(i).getId().equals(paidParentList.get(j).getId())) {
               str[i] = "완납";
               break;
            } else {
               str[i] = "미납";
            }
         }
      }
      // 학부모 id불러오기 위한 hashmap
      LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
      for (int i = 0; i < str.length; i++) {
         map.put(parentAllList.get(i).getId(), str[i]);
      }

      ModelAndView mav = new ModelAndView("/manager/payStat");
      mav.addObject("parentCount", parentCount);// 총 원생 수
      mav.addObject("totalExpecPay", totalExpectPay);// 이번달 총 예상 학원비
      mav.addObject("paidPay", paidPay);// 완납한 원생 카운트
      mav.addObject("unpaidPay", unpaidPay);// 미납한 원생 카운트
      mav.addObject("totalPaidPay", totalPaidPay);// 이번달 실완납한 학원비
      mav.addObject("unpaidTotalPay", unpaidTotalPay);// 이번달 미수금

      mav.addObject("paidParentPortion", paidParentPortion);// 완납한 원생 비율
      mav.addObject("unpaidParentPortion", unpaidParentPortion);// 완납한 원생 비율
      mav.addObject("totalPaidPortion", totalPaidPortion);// 완납한 학원비 비율
      mav.addObject("totalunpaidPortion", totalunpaidPortion);// 미수금 비율

      mav.addObject("parentAllList", parentAllList); // 총 원생 목록
      mav.addObject("paidParentList", paidParentList); // 완납한 총 원생 목록

      mav.addObject("map", map);

      return mav;
   }
   
   // 도서 통계 조회
   @RequestMapping("manager/bookStat")
   public ModelAndView bookStat(PagingVO paging) {
      System.out.println("manager/bookStat 입니다");
      ModelAndView mav = new ModelAndView("/manager/bookStat");
      
      int bookCount = bookService.getTotalPaging();// 전체 책권수
      int getRentCount = manService.getRentCount();// 전체 책권수
      int bookRentCount = manService.getRentingCount();// 대여중인 책권수
      int bookDelayCount = manService.getDelayCount();// 지연중인 책권수
      // int bookDelayCount = bookService.bookDelayCount();//지연중인 책권수
      // Arraylist<book> list = bookService.getRentList;//전체 책목록
      ArrayList<Rent> RentList = manService.getRentList();
      ArrayList<Rent> RentingList = manService.getRentingList();
      
      SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
      Date currentTime = new Date();
      String mTime = mSimpleDateFormat.format(currentTime);
      ArrayList<Rent> list = manService.getAllRent(paging);

      mav.addObject("list", list);
      mav.addObject("mTime", mTime);

      mav.addObject("bookCount", bookCount);
      mav.addObject("getRentCount", getRentCount);
      mav.addObject("bookRentCount", bookRentCount);
      mav.addObject("bookDelayCount", bookDelayCount);
      mav.addObject("RentList", RentList);
      mav.addObject("RentingList", RentingList);

      return mav;
   }
   // 원서 작성 페이지 이동
      @RequestMapping("/manager/appWriteForm")
      public String applicationWriteForm() {
         return "manager/appWriteForm";
      }
      
      // 원서 작성
      @RequestMapping("/manager/appWrite")
      public String application(HttpServletRequest req, GalleryBoard gb) {

         String files_path = "";
         
         if (gb.getFile1() != null) {
            files_path = makeApplication(gb.getFile1(), "form");
            
            gb.setImg1(path2 + files_path);
            
         }
         if (gb.getFile2() != null) {
            files_path = makeApplication(gb.getFile2(), "form2");
            
            gb.setImg2(path2 + files_path);
            
         }
         
         return "/manager/manager";   
      }
      
      // 원서 파일 저장 및 파일 이름 반환
      public String makeApplication(MultipartFile f, String form) {
         File file = null;
         try {
            file = new File(path2 + form + ".hwp");
            f.transferTo(file);
         } catch (IllegalStateException e) {
            e.printStackTrace();
         } catch (IOException e) {
            e.printStackTrace();
         } catch (Exception e) {
            return "";
         }
         return file.getName();
      }
      @RequestMapping("/manager/abcd")
      public ModelAndView abcd(Bus bus) {
    	  manService.modBus(bus);
    	  
    	  bus = manService.getBus(bus.getBus_num());
    	
    	  ModelAndView mav = new ModelAndView("manager/busline");
    	  mav.addObject("bus", bus);
    	  return mav;
      }
      // 버스 경로 수정
      @RequestMapping("/manager/edit_bus")
      public ModelAndView editBus() {
    	  ArrayList<Bus> list = new ArrayList<Bus>();
    	  for(int i=1; i<7; i++) {
    		  list.add(manService.getBus(i));
    	  }
    	  
    	  ModelAndView mav = new ModelAndView("/manager/edit_bus");
    	  mav.addObject("list", list);
    	  return mav;
      }
}