package com.kitri.project3.community;

import java.io.File;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project3.manager.Bus;
import com.kitri.project3.manager.ManService;

@Controller
public class ComController {
	  @Resource(name = "manService")
	   private ManService manService;
	 
	  
	@RequestMapping("/community/bus")
	public ModelAndView bus() {
		Bus bus1 = manService.getBus(1);
		Bus bus2 = manService.getBus(2);
		Bus bus3 = manService.getBus(3);
		Bus bus4 = manService.getBus(4);
		Bus bus5 = manService.getBus(5);
		Bus bus6 = manService.getBus(6);
		ModelAndView mav = new ModelAndView("/community/bus");
		mav.addObject("bus1", bus1);
		mav.addObject("bus2", bus2);
		mav.addObject("bus3", bus3);
		mav.addObject("bus4", bus4);
		mav.addObject("bus5", bus5);
		mav.addObject("bus6", bus6);
		return mav;
	}
	
	@RequestMapping("/community/application")
	public String application() {
		return "/community/application";
	}
	
	private String base_path = "C:/data/";
	
	/*// 자료실 목록 출력
	@RequestMapping("/download/list")
	public ModelAndView fileList() {
		File dir = new File(base_path);
		String[] list = dir.list();	// 디렉토리의 파일 리스트를 배열에 저장
		
		return new ModelAndView("/community/application", "list", list);	
	}*/
	
	// 다운로드 진행
	@RequestMapping("/download/ComDown")
	public ModelAndView download(@RequestParam(value="name") String name) throws Exception {	// name: 다운로드하려고 선택한 파일의 이름
		File downloadFile = new File(base_path + name);
		// param1: 뷰페이지 경로, param2: 뷰페이지에서 부를 데이터 이름, param3: 뷰페이지로 전달할 데이터 객체
		return new ModelAndView("download", "downloadFile", downloadFile);
	}
}
