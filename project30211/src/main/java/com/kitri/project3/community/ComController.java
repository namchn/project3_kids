package com.kitri.project3.community;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ComController {
	@RequestMapping("/community/bus")
	public String bus() {
		return "/community/bus";
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
