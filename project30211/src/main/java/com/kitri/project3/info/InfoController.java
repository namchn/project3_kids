package com.kitri.project3.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InfoController {
	@RequestMapping("/info/map")
	public String map() {
		return "/info/map";
	}
	
	@RequestMapping(value = "/introduce/introduce", method = RequestMethod.GET)
	public String introduce() {
		return "/introduce/introduce";
	}
	
	@RequestMapping(value = "/introduce/applicants", method = RequestMethod.GET)
	public String applicants() {
		return "/introduce/applicants";
	}
}
