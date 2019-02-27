package com.kitri.project3;


import java.util.ArrayList;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project3.boardNotice.NoticeBoard;
import com.kitri.project3.calendar.Calendar;
import com.kitri.project3.dietBoard.DietBoard;
import com.kitri.project3.paging.PagingVO;
import com.kitri.project3.dietBoard.Service;
import com.kitri.project3.poll.Poll;
import com.kitri.project3.poll.pollService;
import com.kitri.project3.boardBulletin.BoardBulletinService;
import com.kitri.project3.boardBulletin.BulletinBoard;
import com.kitri.project3.boardNotice.BoardNoticeService;


/*@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		
		return "home";
	}
*/
@Controller
public class HomeController {
	
	@Resource(name = "dietBoardService")
	private Service dietBoardService;
	@Resource(name = "boardNoticeService")
	private BoardNoticeService boardNoticeService;
	@Resource(name = "boardBulletinService")
	private BoardBulletinService boardBulletinService;
	@Resource(name = "pollService")
	private pollService pollService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {	
		System.out.println("home입니다");
		ModelAndView mav = new ModelAndView("home");
		DietBoard db = dietBoardService.getRecentDiet();		
		ArrayList<NoticeBoard> n_list = boardNoticeService.getMainNotice();		
		ArrayList<BulletinBoard> b_list = boardBulletinService.getMainBulletin();
		ArrayList<Poll> poll = pollService.getMainPoll();
		//ArrayList<Calendar> calendar = pollService.getMainPoll();
		mav.addObject("db", db );
		mav.addObject("n_list", n_list );
		mav.addObject("b_list", b_list);
		mav.addObject("poll", poll);
		return mav;
	}

}
