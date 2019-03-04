package com.kitri.project3.boardGallery;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project3.boardReply.Reply;
import com.kitri.project3.boardReply.ReplyService;
import com.kitri.project3.paging.PagingVO2;



@Controller
public class GalleryController {
	@Resource(name="boardGalleryService")
	private BoardGalleryService service;
	@Resource(name="boardReplyService")
	private ReplyService replyService;
	private String path = "D:\\data\\workspace\\web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\project3_gallery_board_files\\";
	
	
	//갤러리 게시판 글목록(페이징처리)
    @RequestMapping("/boardGallery/galleryList")
    public ModelAndView galleryList(PagingVO2 paging, @RequestParam(value="mng_group") String mng_group, @RequestParam("sort") String sort) {
       ModelAndView mav = new ModelAndView("");

       if(sort.equals("1")) {
          mav = new ModelAndView("/manager/boardManage");
       }else if(sort.equals("2")) {
          mav = new ModelAndView("/boardGallery/galleryList");
       }
       HashMap<String, Object> map = new HashMap<String, Object>();
       map.put("paging", paging);
       map.put("mng_group", mng_group);         
       ArrayList<GalleryBoard> list = service.getByGallery(map);
       paging.setTotal(service.getTotalPagingByGallery(mng_group));
       
       mav.addObject("sort", sort);
       mav.addObject("list", list);
       mav.addObject("paging", paging);
       mav.addObject("mng_group", mng_group);

       return mav;
    }
	
	
	//갤러리 게시판 상세 글조회
	@RequestMapping("/boardGallery/galleryView")
	public ModelAndView galleryView(@RequestParam(value="gallery_num") int num, @RequestParam(value="sort") String sort) {
		System.out.println("boardGallery/galleryView입니다");
		 System.out.println("/boardGallery/galleryView : "+sort);
		//System.out.println(num);
		ModelAndView mav = new ModelAndView("/boardGallery/galleryView");
		service.editViewCount(num);
		GalleryBoard gb = service.getByNum(num);
		ArrayList<Reply> replyList = replyService.getByGalleryNum(num);

		mav.addObject("gb", gb);
		mav.addObject("sort", sort);
		mav.addObject("replyList", replyList);

		//System.out.println(gb);
		return mav;
	}
	
	
	//갤러리 게시판 작성 페이지 이동
	@RequestMapping("/boardGallery/galleryWriteForm")
	public ModelAndView galleryWriteForm(@RequestParam("sort")String sort) {
		System.out.println("/boardGallery/galleryWriteForm : "+sort);
		ModelAndView mav = new ModelAndView("boardGallery/galleryWriteForm");
		mav.addObject("sort", sort);
		return mav;
	}
	
	
	//갤러리 게시판 작성
	@RequestMapping("/boardGallery/galleryWrite")
	public ModelAndView galleryWrite(GalleryBoard gb, @RequestParam("sort")String sort) {	
		
		//String add = "";
		System.out.println("/boardGallery/galleryWritesort : "+sort);
		ModelAndView mav = new ModelAndView("");
		if(sort.equals("1")) {
			 mav = new ModelAndView("redirect:/manager/boardGalleryManage");
		}else{
			mav = new ModelAndView("redirect:/boardGallery/galleryList");
			System.out.println("2-2단계 진입");
		}
		
		mav.addObject("mng_group", gb.getMng_group());
		mav.addObject("sort", sort);
		
		int num = service.getNum();
		gb.setGallery_num(num);
		String files_path = "";
		System.out.println("3단계 진입");
		if(gb.getFile1() != null) {
			files_path = makeFile(gb.getFile1(), num, 1);
			if(files_path.equals("")) {
				gb.setImg1("");
			} else {
				gb.setImg1("/project3_gallery_board_files/" + files_path);
			}
		} else {
			gb.setImg1("");
		}	
		if(gb.getFile2() != null) {
			files_path = makeFile(gb.getFile2(), num, 2);
			if(files_path.equals("")) {
				gb.setImg2("");
			} else {
				gb.setImg2("/project3_gallery_board_files/" + files_path);
			}
		} else {
			gb.setImg2("");
		}		
		if(gb.getFile3() != null) {
			files_path = makeFile(gb.getFile3(), num, 3);
			if(files_path.equals("")) {
				gb.setImg3("");
			} else {
				gb.setImg3("/project3_gallery_board_files/" + files_path);
			}
		} else {
			gb.setImg3("");
		}		
		if(gb.getFile4() != null) {
			files_path = makeFile(gb.getFile4(), num, 4);
			if(files_path.equals("")) {
				gb.setImg4("");
			} else {
				gb.setImg4("/project3_gallery_board_files/" + files_path);
			}
		} else {
			gb.setImg4("");
		}		
		if(gb.getFile5() != null) {
			files_path = makeFile(gb.getFile5(), num, 5);
			if(files_path.equals("")) {
				gb.setImg5("");
			} else {
				gb.setImg5("/project3_gallery_board_files/" + files_path);
			}
		} else {
			gb.setImg5("");
		}	
		if(gb.getFile6() != null) {
			files_path = makeFile(gb.getFile6(), num, 6);
			if(files_path.equals("")) {
				gb.setImg6("");
			} else {
				gb.setImg6("/project3_gallery_board_files/" + files_path);
			}
		} else {
			gb.setImg6("");
		}
		if(gb.getFile7() != null) {
			files_path = makeFile(gb.getFile7(), num, 7);
			if(files_path.equals("")) {
				gb.setImg7("");
			} else {
				gb.setImg7("/project3_gallery_board_files/" + files_path);
			}
		} else {
			gb.setImg7("");
		}
		if(gb.getFile8() != null) {
			files_path = makeFile(gb.getFile8(), num, 8);
			if(files_path.equals("")) {
				gb.setImg8("");
			} else {
				gb.setImg8("/project3_gallery_board_files/" + files_path);
			}
		} else {
			gb.setImg8("");
		}
		if(gb.getFile9() != null) {
			files_path = makeFile(gb.getFile9(), num, 9);
			if(files_path.equals("")) {
				gb.setImg9("");
			} else {
				gb.setImg9("/project3_gallery_board_files/" + files_path);
			}
		} else {
			gb.setImg9("");
		}
		if(gb.getFile10() != null) {
			files_path = makeFile(gb.getFile10(), num, 10);
			if(files_path.equals("")) {
				gb.setImg10("");
			} else {
				gb.setImg10("/project3_gallery_board_files/" + files_path);
			}
		} else {
			gb.setImg10("");
		}

//		HttpSession hs = request.getSession();
//		Member m = (Member)hs.getAttribute("MEMBER");	
//		b.setId(m.getId());
		System.out.println("4단계 진입");
		System.out.println(gb);
		service.addBoard(gb);
		System.out.println("5단계 진입");
		//return "redirect:/boardGallery/galleryList";
		return mav;
	}
	
	
	// 파일 저장 및 파일 이름 반환
	public String makeFile(MultipartFile f, int num, int idx) {
		File file = null;
		try {
			String fname = f.getOriginalFilename();
			int idx1 = fname.lastIndexOf(".");
			String str1 = fname.substring(idx1);
			file = new File(path+num+"_"+idx+str1);
			System.out.println(file);
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
	
//	//다운로드 뷰페이지
//	@RequestMapping("/download/down")
//	public ModelAndView download(@RequestParam(value="name") String name) throws Exception {
//		//private String base_path = "C:/data/"; //경로
//		String base_path = "D:/data/workspace/web/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/webapps/";
//		File downloadFile = new File(base_path + name);
//		//param1: 뷰페이지경로, param2:뷰페이지에서 부를 데이터 이름, param3:뷰페이지로 전달할 값
//		return new ModelAndView("download", "downloadFile", downloadFile);
//	}
	
	
	//갤러리 게시판 수정 페이지 이동
	@RequestMapping("/boardGallery/galleryEditForm")
	public ModelAndView galleryEditForm(@RequestParam(value="gallery_num") int num, @RequestParam(value="sort") String sort) {		
		ModelAndView mav = new ModelAndView("/boardGallery/galleryEditForm");
		GalleryBoard gb = service.getByNum(num);
		mav.addObject("gb", gb);	
		mav.addObject("sort", sort);
		System.out.println("/boardGallery/galleryEditForm sort : "+ sort);
		return mav;
	}	
	
	
	//갤러리 게시판 수정
	@RequestMapping("/boardGallery/galleryEdit")
	public ModelAndView galleryEdit(GalleryBoard gb, @RequestParam("sort")String sort) {
		System.out.println("sort : "+sort);
		ModelAndView mav = new ModelAndView("");		
		if(sort.equals("1")) {
			mav = new ModelAndView("redirect:/manager/boardGalleryManage");
		}else{
			mav = new ModelAndView("redirect:/boardGallery/galleryList");
		}
		 mav.addObject("mng_group", gb.getMng_group());
		 mav.addObject("sort", sort);

		String files_path = "";
		int num = gb.getGallery_num();
		if(gb.getFile1() != null) {
	         files_path = makeFile(gb.getFile1(), num, 1);
	         if(files_path.equals("")) {
	            if(gb.getImg1()!=null) {
	               
	            }else {
	               gb.setImg1("");               
	            }
	         } else {
	            gb.setImg1("/project3_gallery_board_files/" + files_path);
	         }
	      } else {
	         gb.setImg1("");
	         System.out.println("gb.getFile1()이 널입니당");
	      }
	      
	      if(gb.getFile2() != null) {
	         files_path = makeFile(gb.getFile2(), num, 2);
	         if(files_path.equals("")) {
	            if(gb.getImg2()!=null) {
	               
	            }else {
	               gb.setImg2("");               
	            }
	         } else {
	            gb.setImg2("/project3_gallery_board_files/" + files_path);
	         }
	      } else {
	         gb.setImg2("");
	      }
	      
	      if(gb.getFile3() != null) {
	         files_path = makeFile(gb.getFile3(), num, 3);
	         if(files_path.equals("")) {
	            if(gb.getImg3()!=null) { //파일이 바뀌지 않았을때

	            }else {//파일삭제-아무것도등록하지않았을때
	               gb.setImg3("");               
	            }
	         } else { //바뀐 파일을 등록했을때
	            gb.setImg3("/project3_gallery_board_files/" + files_path);
	         }
	      } else {
	         gb.setImg3("");
	      }   
	      
	      if(gb.getFile4() != null) {
	         files_path = makeFile(gb.getFile4(), num, 4);
	         if(files_path.equals("")) {
	            if(gb.getImg4()!=null) { //파일이 바뀌지 않았을때

	            }else {//파일삭제-아무것도등록하지않았을때
	               gb.setImg4("");               
	            }
	         } else {
	            gb.setImg4("/project3_gallery_board_files/" + files_path);
	         }
	      } else {
	         gb.setImg4("");
	      }      
	      if(gb.getFile5() != null) {
	         files_path = makeFile(gb.getFile5(), num, 5);
	         if(files_path.equals("")) {
	            if(gb.getImg5()!=null) { //파일이 바뀌지 않았을때

	            }else {//파일삭제-아무것도등록하지않았을때
	               gb.setImg5("");               
	            }
	         } else {
	            gb.setImg5("/project3_gallery_board_files/" + files_path);
	         }
	      } else {
	         gb.setImg5("");
	      }   
	      if(gb.getFile6() != null) {
	         files_path = makeFile(gb.getFile6(), num, 6);
	         if(files_path.equals("")) {
	            if(gb.getImg6()!=null) { //파일이 바뀌지 않았을때

	            }else {//파일삭제-아무것도등록하지않았을때
	               gb.setImg6("");               
	            }
	         } else {
	            gb.setImg6("/project3_gallery_board_files/" + files_path);
	         }
	      } else {
	         gb.setImg6("");
	      }
	      if(gb.getFile7() != null) {
	         files_path = makeFile(gb.getFile7(), num, 7);
	         if(files_path.equals("")) {
	            if(gb.getImg7()!=null) { //파일이 바뀌지 않았을때

	            }else {//파일삭제-아무것도등록하지않았을때
	               gb.setImg7("");               
	            }
	         } else {
	            gb.setImg7("/project3_gallery_board_files/" + files_path);
	         }
	      } else {
	         gb.setImg7("");
	      }
	      if(gb.getFile8() != null) {
	         files_path = makeFile(gb.getFile8(), num, 8);
	         if(files_path.equals("")) {
	            if(gb.getImg8()!=null) { //파일이 바뀌지 않았을때

	            }else {//파일삭제-아무것도등록하지않았을때
	               gb.setImg8("");               
	            }
	         } else {
	            gb.setImg8("/project3_gallery_board_files/" + files_path);
	         }
	      } else {
	         gb.setImg8("");
	      }
	      if(gb.getFile9() != null) {
	         files_path = makeFile(gb.getFile9(), num, 9);
	         if(files_path.equals("")) {
	            if(gb.getImg9()!=null) { //파일이 바뀌지 않았을때

	            }else {//파일삭제-아무것도등록하지않았을때
	               gb.setImg9("");               
	            }
	         } else {
	            gb.setImg9("/project3_gallery_board_files/" + files_path);
	         }
	      } else {
	         gb.setImg9("");
	      }
	      if(gb.getFile10() != null) {
	         files_path = makeFile(gb.getFile10(), num, 10);
	         if(files_path.equals("")) {
	            if(gb.getImg10()!=null) { //파일이 바뀌지 않았을때

	            }else {//파일삭제-아무것도등록하지않았을때
	               gb.setImg10("");               
	            }
	         } else {
	            gb.setImg10("/project3_gallery_board_files/" + files_path);
	         }
	      } else {
	         gb.setImg10("");
	      }

		System.out.println("/boardGallery/galleryEdit sort : "+ sort);
		System.out.println("gb출력함니당"+gb);
		service.editBoard(gb);
		
		return mav;
	}

	
	//갤러리 게시판 글 삭제
	@RequestMapping("/boardGallery/galleryDelete")
	public ModelAndView galleryDelete(@RequestParam(value="mng_group") String mng_group, @RequestParam(value="gallery_num") int num, @RequestParam(value="sort") String sort) {
		
		ModelAndView mav = new ModelAndView("");

		if(sort.equals("1")) {
			mav = new ModelAndView("redirect:/manager/boardGalleryManage");
		}else{
			mav = new ModelAndView("redirect:/boardGallery/galleryList");
		}
		mav.addObject("mng_group", mng_group);
		mav.addObject("sort", sort);
		service.delBoard(num);
		return mav;
	}
	
	 //갤러리 게시판 검색
	@RequestMapping("/boardGallery/gallerySearchResult")
	public ModelAndView gallerySearchResult(PagingVO2 paging, @RequestParam(value="mng_group") String mng_group, @RequestParam(value="search_type") int search_type, @RequestParam(value="search_word") String search_word) {
		ModelAndView mav = new ModelAndView("/boardGallery/galleryList");
		ArrayList<GalleryBoard> list = null;
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("paging", paging);
	      map.put("search_word", "%"+search_word+"%");
	      map.put("mng_group", mng_group);
	      
	      HashMap<String, String> map1 = new HashMap<String, String>();
	      map1.put("mng_group", mng_group);
	      map1.put("search_word", "%"+search_word+"%");
	      
	      switch(search_type) {
	         case 1 : 
	            paging.setTotal(service.getTotalPagingByTitle(map1));
	            System.out.println(service.getTotalPagingByTitle(map1));
	            list = service.getByTitle(map);
	            mav.addObject("search_type", search_type);
	            mav.addObject("search_word", search_word);
	            break;
	         case 2 : 
	            paging.setTotal(service.getTotalPagingById(map1));
	            list = service.getById(map);
	            mav.addObject("search_type", search_type);
	            mav.addObject("search_word", search_word);
	            break;
	      }
	         
	      mav.addObject("list", list);
	      mav.addObject("paging", paging);
	      return mav;
	   }

	
	
	   //갤러리 게시판 댓글 작성 및 조회
	   @RequestMapping("/boardGallery/galleryReplyList")
	   public ModelAndView galleryReplyWrite(@RequestParam(value="gallery_num") int gallery_num, @RequestParam(value="id") String id, @RequestParam(value="content") String content) {
	      Reply r = new Reply();
	      r.setBoard_code("gallery");
	      r.setNum(gallery_num);
	      int reply_num = replyService.getNum();
	      r.setReply_num(reply_num);
	      r.setId(id);
	      r.setContent(content);
	      replyService.addReply(r);
	      
	      ModelAndView mav = new ModelAndView("/boardGallery/galleryReplyList");
	      ArrayList<Reply> list = replyService.getByGalleryNum(gallery_num);
	      mav.addObject("list", list);
	      
	      return mav;
	   }
	   
	   //갤러리 게시판 댓글 수정 및 조회
	   @RequestMapping("/boardGallery/galleryReplyEdit")
	   public ModelAndView galleryReplyEdit(@RequestParam(value="gallery_num") int gallery_num, @RequestParam(value="reply_num") int reply_num, @RequestParam(value="content") String content) {
	      System.out.println("reply_num"+reply_num);
	      System.out.println("content"+content);
		   
		   
		   
		   
		   Reply r = new Reply();
	      r.setNum(gallery_num);
	      r.setReply_num(reply_num);
	      r.setContent(content);
	      replyService.editReply(r);
	      
	      ModelAndView mav = new ModelAndView("/boardGallery/galleryReplyList");
	      ArrayList<Reply> list = replyService.getByGalleryNum(gallery_num);
	      mav.addObject("list", list);
	      
	      return mav;
	   }
	   
	   //갤러리 게시판 댓글 삭제 및 조회
	   @RequestMapping("/boardGallery/galleryReplyDelete")
	   public ModelAndView galleryReplyDelete(@RequestParam(value="gallery_num") int gallery_num, @RequestParam(value="reply_num") int reply_num) {
	      replyService.delReply(reply_num);
	      
	      ModelAndView mav = new ModelAndView("/boardGallery/galleryReplyList");
	      ArrayList<Reply> list = replyService.getByGalleryNum(gallery_num);
	      mav.addObject("list", list);
	      
	      return mav;
	   }

	
	
}
