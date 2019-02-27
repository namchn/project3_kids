package com.kitri.project3.dietBoard;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project3.dietBoard.Service;
import com.kitri.project3.paging.PagingVO2;

@Controller
public class dietBoardController {
	@Resource(name = "dietBoardService")
	private Service service;
	private String img_path = "D:\\javadata\\web\\workspace\\web\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";
	/*
	 * //식단 모든 리스트
	 * 
	 * @RequestMapping(value = "/boardDiet/dietListForm") public String
	 * dietListForm() { System.out.println("dietCon의 uploadDietForm 입니다."); return
	 * "boardDiet/dietList"; }
	 */

	@RequestMapping("/boardDiet/dietListForm")
	public ModelAndView dietListForm(PagingVO2 paging) {
		System.out.println("dietCon의 dietListForm 입니다.");
		ModelAndView mav = new ModelAndView("boardDiet/dietList");
		
		ArrayList<DietBoard> db = service.getDietList(paging);
		paging.setTotal(service.getTotalPaging());
		
		mav.addObject("db", db);
		mav.addObject("paging", paging);
		return mav;
	}
	
	// 식단상세조회폼
	@RequestMapping("/boardDiet/detailDiet")
	public ModelAndView detailDiet(@RequestParam("diet_num") int diet_num) {
		System.out.println("dietCon의 /boardDiet/detailDiet 입니다.");
		ModelAndView mav = new ModelAndView("boardDiet/editDiet");
		DietBoard db = service.getDietNum(diet_num);
		System.out.println(db.getTitle());
		mav.addObject("db", db);
		System.out.println(db);
		return mav;
	}

	// 식단 수정폼
	@RequestMapping("/boardDiet/editDiet")
	public String editDiet(@RequestParam("originalImg") String originalImg, @RequestParam("title") String title,
			 @RequestParam("content") String content,
			@RequestParam("diet_num") int diet_num) throws Exception {
		
			System.out.println("dietCon의 editDiet 입니다.(이미지변경없이게시글수정)");
	
			System.out.println("originalImg 실행");
			String path = img_path + originalImg;
			File f = new File(path);
			System.out.println("filenNAme: " + originalImg);

			DietBoard db = new DietBoard();
			db.setDiet_num(diet_num);
			db.setTitle(title);
			db.setContent(content);
			service.editDietExceptImg(db);
		
		return "redirect:/boardDiet/dietListForm";
	}
	
	@RequestMapping("/boardDiet/editDiet2")
	public String editDiet2(@RequestParam("title") String title,
			@RequestParam("mfile") MultipartFile mfile, @RequestParam("content") String content,
			@RequestParam("diet_num") int diet_num) throws Exception {
		
			System.out.println("dietCon의 editDiet 입니다.(이미지변경하여게시글수정)");

			String fileName = mfile.getOriginalFilename();
			String path = img_path + fileName;
			File f = new File(path);
			System.out.println("filenNAme: " + fileName);

			DietBoard db = new DietBoard();
			db.setDiet_num(diet_num);
			db.setTitle(title);
			db.setContent(content);
			db.setFiles(fileName);
			db.setMfile(mfile);

			System.out.println(db);
			service.editDiet(db);

			try {
				db.getMfile().transferTo(f);// 생성한 파일에 업도르된 파일을 복사
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		 
		return "redirect:/boardDiet/dietListForm";
	}

	// 식단 업로드폼
	@RequestMapping("/boardDiet/uploadDietForm")
	public String uploadDietForm() {
		System.out.println("dietCon의 uploadDietForm 입니다.");
		return "boardDiet/uploadDiet";
	}

	// 식단업로드
	@RequestMapping("/boardDiet/uploadDiet")
	public String uploadDiet(@RequestParam("title") String title, @RequestParam("mfile") MultipartFile mfile,
			@RequestParam("content") String content) {
		System.out.println("dietCon의 uploadDiet 입니다.");
		System.out.println(title);
		System.out.println(content);

		String fileName = mfile.getOriginalFilename();
		String path = img_path + fileName;
		File f = new File(path);
		System.out.println(fileName);

		DietBoard db = new DietBoard();
		db.setTitle(title);
		db.setContent(content);
		db.setFiles(fileName);
		db.setMfile(mfile);
		System.out.println(db.getMfile());

		service.uploadDiet(db);

		try {
			db.getMfile().transferTo(f);// 생성한 파일에 업도르된 파일을 복사
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		return "redirect:/boardDiet/dietListForm";
	}

	// 식단상세조회폼
	@RequestMapping("/boardDiet/dietNumForm")
	public ModelAndView dietNumListForm(@RequestParam("diet_num") int diet_num) {
		System.out.println("dietCon의 dietNumForm 입니다.");
		ModelAndView mav = new ModelAndView("boardDiet/editDiet");
		DietBoard db = service.getDietNum(diet_num);
		mav.addObject("db", db);
		System.out.println(db);
		return mav;
	}

	// 식단 삭제
	@RequestMapping(value = "/boardDiet/deleteDiet", method = RequestMethod.GET)
	public String deleteDiet(@RequestParam(value = "diet_num") int diet_num) {
		System.out.println("dietCon의 deleteDiet 입니다.");
		System.out.println(diet_num);
		service.deleteDiet(diet_num);
		return "redirect:/boardDiet/dietListForm";
	}

}
