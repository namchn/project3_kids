package com.kitri.project3.boardNotice;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project3.boardReply.Reply;
import com.kitri.project3.boardReply.ReplyService;
import com.kitri.project3.paging.PagingVO;

@Controller
public class NoticeBoardController {
	@Resource(name="boardNoticeService")
	private BoardNoticeService service;
	@Resource(name="boardReplyService")
	private ReplyService replyService;
	
	private String path = "D:\\data\\workspace\\web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\project3_notice_board_files\\";
	
	//공지사항 게시판 글목록(페이징처리)
	@RequestMapping("/boardNotice/noticeList")
	public ModelAndView noticeList(PagingVO paging, @RequestParam(value="sort") String sort) {
		
		ModelAndView mav = new ModelAndView("");
		if(sort.equals("1")) {
			mav = new ModelAndView("redirect:/manager/boardManage");
		} else if(sort.equals("2")) {
			mav = new ModelAndView("/boardNotice/noticeList"); 
		} 
		ArrayList<NoticeBoard> list = service.getAll(paging);
		paging.setTotal(service.getTotalPaging());
		
		mav.addObject("sort", sort);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		
		return mav;
	}	
	//공지사항 게시판 상세 글조회
	@RequestMapping("/boardNotice/noticeView")
	public ModelAndView noticeView(@RequestParam(value="notice_num") int num, @RequestParam(value="sort") String sort) {
		ModelAndView mav = new ModelAndView("/boardNotice/noticeView");
		service.editViewCount(num);
		NoticeBoard nb = service.getByNum(num);
	    ArrayList<Reply> replyList = replyService.getByNoticeNum(num);
	    mav.addObject("replyList", replyList);
		mav.addObject("nb", nb);
		mav.addObject("sort", sort);
		return mav;
	}
	
	//공지사항 게시판 작성 페이지 이동
	@RequestMapping("/boardNotice/noticeWriteForm")
	public ModelAndView noticeWriteForm(@RequestParam("sort")String sort) {
		ModelAndView mav = new ModelAndView("/boardNotice/noticeWriteForm");
		mav.addObject("sort", sort);
		return mav;
	}
	
	//공지사항 게시판 글작성
	@RequestMapping("/boardNotice/noticeWrite")
	public ModelAndView noticeWrite(NoticeBoard nb, @RequestParam("sort") String sort) {
		
		ModelAndView mav = new ModelAndView("");
		if(sort.equals("1")) {
			mav = new ModelAndView("redirect:/manager/boardManage");
		}else if(sort.equals("2")) {
			mav = new ModelAndView("redirect:/boardNotice/noticeList");
		}
		mav.addObject("sort", sort);
		
		
		int num = service.getNum();
		nb.setNotice_num(num);
		String files_path = "";
		if(nb.getNotice_files() != null) {
			files_path = makeFile(nb.getNotice_files(), num, 1);
			if(files_path.equals("")) {
				nb.setFiles("");
			} else {
				nb.setFiles("/project3_notice_board_files/" + files_path);
			}
		} else {
			nb.setFiles("");
		}		

		service.addBoard(nb);
		return mav;
	}
		
	// 파일 저장 및 파일 이름 반환
	public String makeFile(MultipartFile f, int num, int idx) {
		File file = null;
		try {
			String fname = f.getOriginalFilename(); // 파일이름
			int idx1 = fname.lastIndexOf(".");      // project5.war //8
			String str1 = fname.substring(idx1);    // .war
			file = new File(path+num+"_"+idx+str1); // D:\\data\\workspace\\web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\project3_notice_board_files\\1_1.war
			System.out.println(file);
			f.transferTo(file); //파일저장
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			return "";
		}
		return file.getName();
	}
	
	//다운로드 뷰페이지
	@RequestMapping("/download/down")
	public ModelAndView download(@RequestParam(value="name") String name) throws Exception {
		//private String base_path = "C:/data/"; //경로
		String base_path = "D:/data/workspace/web/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/webapps/";
		File downloadFile = new File(base_path + name);
		//param1: 뷰페이지경로, param2:뷰페이지에서 부를 데이터 이름, param3:뷰페이지로 전달할 값
		return new ModelAndView("download", "downloadFile", downloadFile);
	}
	
	//공지사항 게시판 수정 페이지 이동
	@RequestMapping("/boardNotice/noticeEditForm")
	public ModelAndView noticeEditForm(@RequestParam(value="notice_num") int num, @RequestParam(value="sort") String sort) {		
		ModelAndView mav = new ModelAndView("/boardNotice/noticeEditForm");
		NoticeBoard nb = service.getByNum(num);
		mav.addObject("nb", nb);
		mav.addObject("sort", sort);
		System.out.println(nb.getFiles());//경로(데이터베이스용)
		System.out.println(nb.getNotice_files()); //멀티파트파일
		return mav;
	}		
	
	//공지사항 게시판 수정
	@RequestMapping("/boardNotice/noticeEdit")
	public ModelAndView noticeEdit(NoticeBoard nb, @RequestParam("sort")String sort) {
		
		ModelAndView mav = new ModelAndView("");
		if(sort.equals("1")) {
			mav = new ModelAndView("redirect:/manager/boardManage");
		}else if(sort.equals("2")) {
			mav = new ModelAndView("redirect:/boardNotice/noticeList");
		}
		mav.addObject("sort", sort);

		
		String files_path = "";
		if(nb.getNotice_files() != null) {
			//files_path = makeFile(nb.getNotice_files(), num, 1);
			files_path = makeFile(nb.getNotice_files(), nb.getNotice_num(), 1);
			if(files_path.equals("")) {
				//nb.setFiles("");
			} else {
				nb.setFiles("/project3_notice_board_files/" + files_path);
			}
		} else {
			nb.setFiles("");
		}
		service.editBoard(nb);
		
		return mav;
	}
	
	//공지사항 게시판 삭제
	@RequestMapping("/boardNotice/noticeDelete")
	public ModelAndView noticeDelete(@RequestParam(value="notice_num") int num, @RequestParam(value="sort") String sort) {
		
		ModelAndView mav = new ModelAndView("");
		if(sort.equals("1")) {
			mav = new ModelAndView("redirect:/manager/boardManage");
		}else if(sort.equals("2")) {
			mav = new ModelAndView("redirect:/boardNotice/noticeList");
		}
		mav.addObject("sort", sort);
		
		
		
		service.delBoard(num);
		System.out.println("3단계진입");
		return mav;
	}
	
	
	  //공지사항 게시판 검색
	   @RequestMapping("/boardNotice/noticeSearchResult")
	   public ModelAndView noticeSearchResult(PagingVO paging, @RequestParam(value="search_type") int search_type, @RequestParam(value="search_word") String search_word) {
	      ModelAndView mav = new ModelAndView("/boardNotice/noticeList");
	      ArrayList<NoticeBoard> list = null;
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("paging", paging);
	      map.put("search_word", "%"+search_word+"%");
	      switch(search_type) {
	         case 1 : 
	            paging.setTotal(service.getTotalPagingByTitle("%"+search_word+"%"));
	            list = service.getByTitle(map);
	            mav.addObject("search_type", search_type);
	            mav.addObject("search_word", search_word);
	            break;
	         case 2 : 
	            paging.setTotal(service.getTotalPagingById("%"+search_word+"%"));
	            list = service.getById(map);
	            mav.addObject("search_type", search_type);
	            mav.addObject("search_word", search_word);
	            break;
	      }
	         
	      mav.addObject("list", list);
	      mav.addObject("paging", paging);
	      return mav;
	   }
	
	//공지사항 게시판 댓글 작성 및 조회
	@RequestMapping("/boardNotice/noticeReplyList")
	public ModelAndView noticeReplyWrite(@RequestParam(value="notice_num") int notice_num, @RequestParam(value="id") String id, @RequestParam(value="content") String content) {
		Reply r = new Reply();
		r.setBoard_code("notice");
		r.setNum(notice_num);
		int reply_num = replyService.getNum();
		r.setReply_num(reply_num);
		r.setId(id);
		r.setContent(content);
		replyService.addReply(r);
		
		ModelAndView mav = new ModelAndView("/boardNotice/noticeReplyList");
		ArrayList<Reply> list = replyService.getByNoticeNum(notice_num);
		mav.addObject("list", list);		
		return mav;
	}	
	
	//공지사항 게시판 댓글 수정 및 조회
	@RequestMapping("/boardNotice/noticeReplyEdit")
	public ModelAndView noticeReplyEdit(@RequestParam(value="notice_num") int notice_num, @RequestParam(value="reply_num") int reply_num, @RequestParam(value="content") String content) {
		Reply r = new Reply();
		r.setReply_num(reply_num);
		r.setContent(content);

		replyService.editReply(r);
		
		ModelAndView mav = new ModelAndView("/boardNotice/noticeReplyList");
		ArrayList<Reply> list = replyService.getByNoticeNum(notice_num);
		mav.addObject("list", list);		
		return mav;
	}	
	
	//공지사항 게시판 댓글 삭제 및 조회
	@RequestMapping("/boardNotice/noticeReplyDelete")
	public ModelAndView noticeReplyDelete(@RequestParam(value="notice_num") int notice_num, @RequestParam(value="reply_num") int reply_num) {
		replyService.delReply(reply_num);	
		ModelAndView mav = new ModelAndView("/boardNotice/noticeReplyList");
		ArrayList<Reply> list = replyService.getByNoticeNum(notice_num);
		mav.addObject("list", list);	
		
		return mav;
	}	

}











