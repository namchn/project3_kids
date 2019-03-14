package com.kitri.project3.book;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project3.paging.PagingVO;


@Controller
public class BookController {
   @Resource(name = "bookService")
   private BookService bookService;
   private String path = "D:\\data\\workspace\\web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";

   @RequestMapping("/book/add_book")   
   public String add_book(Book b) {
      return "/book/add_book";
   }
   
   // 도서 이미지 파일 업로드
   public String makeFile(MultipartFile f) {   
      File f1 = null;
      try {
         String fname1= f.getOriginalFilename();
         f1 = new File(path + fname1);
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
   
   // 도서 추가
   @RequestMapping("/book/insert_book")   
   public String insert_book(Book b) {
      String s = "";
      if(b.getFile() != null) {
         s = makeFile(b.getFile());
         if(s.equals("")) {
            b.setBook_img("");
         } else {
            b.setBook_img("../resources/img/" + s);
         } 
      } else {
         b.setBook_img("");
      }
      bookService.addBook(b);
      return "redirect:/book/booklistForm";
   }
   
   // 도서 목록 출력
   @RequestMapping("/book/booklistForm")   
   public ModelAndView booklistForm(HttpServletRequest req, PagingVO paging, HttpServletResponse res) {
      try {
         req.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      res.setCharacterEncoding("UTF-8");
      ArrayList<Book> list = null;
      Map<String, Object> map = new HashMap<String, Object>(); 

      String search_word = "%"+req.getParameter("search_word")+"%";   
      ModelAndView mav = new ModelAndView("/book/book_list");
      
      if(req.getParameter("opt")==null){   
         list = bookService.getAllBook(paging);
         paging.setTotal(bookService.getTotalPaging());
      }
      else if(req.getParameter("opt").equals("1")) {
         String opt = req.getParameter("opt");
         map.put("paging", paging); 
         map.put("search_word", search_word);
         list = bookService.getByTitle(map);
         paging.setTotal(bookService.getTitleCount(search_word));
         mav.addObject("opt", opt);
         mav.addObject("search_word", search_word);
      }
      else if(req.getParameter("opt").equals("2")) {
         String opt = req.getParameter("opt");
         map.put("paging", paging);
         map.put("search_word", search_word);
         list = bookService.getByWriter(map);
         paging.setTotal(bookService.getWriterCount(search_word));
         mav.addObject("opt", opt);
         mav.addObject("search_word", search_word);
      }
      // 전체 도서 목록 출력
      mav.addObject("list", list);
      mav.addObject("paging", paging);
      return mav;
   }
   
   // 제목, 저자로 검색
   @RequestMapping("/book/booklist")
   public ModelAndView bl(HttpServletRequest req, PagingVO paging, HttpServletResponse res) {
      try {
         req.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      res.setCharacterEncoding("UTF-8");
      Map<String, Object> map = new HashMap<String, Object>(); 
      String opt = req.getParameter("selectBox");
      ArrayList<Book> list = new ArrayList<Book>();
      ModelAndView mav = new ModelAndView("book/book_list");
      if(opt.equals("1")) {
         String search_word = "%"+req.getParameter("search_word")+"%";
         System.out.println(search_word);
         map.put("paging", paging);
         map.put("search_word",search_word);
         list = bookService.getByTitle(map);
         paging.setTotal(bookService.getTitleCount(search_word));
         mav.addObject("opt", opt);
         mav.addObject("search_word",search_word);
      } else if(opt.equals("2")) {
         String search_word = "%"+req.getParameter("search_word")+"%";
         map.put("paging", paging);
         map.put("search_word", search_word);
         list = bookService.getByWriter(map);
         paging.setTotal(bookService.getWriterCount(search_word));
         mav.addObject("opt", opt);
         mav.addObject("search_word", search_word);
      }
      mav.addObject("list", list);
      mav.addObject("paging",paging);
      return mav;
   }

   // 도서 상세정보 출력
   @RequestMapping("/book/book_rent")   
   public ModelAndView rent(HttpServletRequest req, @RequestParam(value="book_num") int book_num) {
      System.out.println("cont 들어옴");
      HttpSession session = req.getSession(false);
      String id = (String) session.getAttribute("id");
      boolean chk = false;
      Cart c = new Cart();
      c.setId(id);
      c.setBook_num(book_num);
      c = bookService.getCheckCart(c);
      System.out.println("c = " + c);
      System.out.println("chk = " + chk);
      if(c == null) {   // 찜을 안했으면
         chk = false;   // false
      } else {   // 찜을 했으면
         chk = true;   // true
      }
      System.out.println("chk2 = " + chk);
      Book b = bookService.getByNum(book_num);
      
      SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
      Date currentTime = new Date();   // 현재 날짜
      String mTime = mSimpleDateFormat.format(currentTime);   // 현재 날짜
      ModelAndView mav = new ModelAndView("/book/book_rent");
      mav.addObject("chk", chk);
      mav.addObject("b", b);
      mav.addObject("mTime", mTime);
      return mav;
   }
   
   // 도서 대출
   @RequestMapping("/book/rent_book")   
   public String add_rent(Rent r, HttpServletRequest req, @RequestParam(value="book_num") int book_num) {
      HttpSession s = req.getSession();
      String id = s.getAttribute("id").toString();
      r.setId(id);
      r.setBook_num(book_num);
      
      int count = r.getRent_amount();
      for(int i = 0; i < count; i++) {
    	  bookService.addRent(r);
          bookService.modAmount(r);
      }
      
      return "redirect:/book/myrent";
   }
   
   // 내 도서 대출 목록 출력
   @RequestMapping("/book/myrent")   
   public ModelAndView myrent(HttpServletRequest req, PagingVO paging) {
      HttpSession session = req.getSession(false);
      String id = (String) session.getAttribute("id");
      SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
      Date currentTime = new Date();
      String mTime = mSimpleDateFormat.format(currentTime);
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("paging", paging); 
      map.put("id", id);
      ArrayList<Rent> mylist = bookService.getMyRent(map);
      paging.setTotal(bookService.getMyRentCount(id));
      ModelAndView mav = new ModelAndView("/book/my_rent");
      mav.addObject("mylist", mylist);
      mav.addObject("mTime", mTime);
      mav.addObject("paging", paging);
      return mav;
   }
   
   // 찜 목록에 추가
   @RequestMapping("/book/mybook")   
   public String mybook(Cart c, HttpServletRequest req, @RequestParam(value="book_num") int book_num) {
      HttpSession session = req.getSession(false);
      String id = (String) session.getAttribute("id");
      c.setId(id);
      c.setBook_num(book_num);
      bookService.addCart(c);
      return "/book/book_rent";
   }
   
   // 찜 취소
   @RequestMapping("/book/mybookdel")   
   public String mybookdel(Cart c, HttpServletRequest req, @RequestParam(value="book_num") int book_num) {
      HttpSession session = req.getSession(false);
      String id = (String) session.getAttribute("id");
      c.setId(id);
      c.setBook_num(book_num);
      bookService.delCart(c);
      return "/book/book_rent";
   }
   
   // 찜 목록에서 삭제
   @RequestMapping("/book/my_cart")
   public String rent(HttpServletRequest req, @RequestParam("checked_cart")String[] num) {
      HttpSession s = req.getSession();
      String id = s.getAttribute("id").toString();
      Cart c = new Cart();
      c.setId(id);
      for(int i = 0; i < num.length; i++){
         c.setBook_num(Integer.parseInt(num[i]));
         bookService.delCart(c);
      }
      
      return "redirect:/book/myCart";
   }
   
   // 찜 목록 출력
   @RequestMapping("/book/myCart")   
   public ModelAndView myCart(HttpServletRequest req, PagingVO paging) {
      HttpSession session = req.getSession(false);
      String id = (String) session.getAttribute("id");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("paging", paging); 
      map.put("id", id);
      ArrayList<Cart> myCart = bookService.getCart(map);
      paging.setTotal(bookService.getCartCount(id));
      ModelAndView mav = new ModelAndView("/book/my_book");
      mav.addObject("myCart", myCart);
      mav.addObject("paging", paging);
      return mav;
   }
   
   // 일주일 후 반납일 구하기
   @RequestMapping("/book/rentdate")
   public ModelAndView rentDate(@RequestParam(value="startDate") String startDate, @RequestParam(value="book_num") int book_num) throws ParseException {
      System.out.println(book_num);
      System.out.println(startDate);
      SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
      Date date = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
      Date enddate = new Date();
      enddate.setDate((date.getDate() + 7));
      String endDate = mSimpleDateFormat.format(enddate);
      System.out.println(endDate);
      ModelAndView mav = new ModelAndView("/book/rentDate");
      mav.addObject("endDate", endDate);

      return mav;
   }
}