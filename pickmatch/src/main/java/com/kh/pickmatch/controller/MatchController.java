package com.kh.pickmatch.controller;


import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.model.service.MatchService;
import com.kh.pickmatch.model.vo.Match;

@Controller
public class MatchController {

@Autowired
private MatchService service;	

private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping("/match/enrollForm")
	public String showMatchEnrollForm() {
		return "match/matchEnroll";
	}
	
	/*@RequestMapping("/match/enrollEnd")
	public String enrollMatch(Date matchDate, String matchTime, String matchType, String playGround, int cost, String possibleLocal, String matchContent, double lat, double lng) {
		logger.debug("enrollMatch :// " + matchDate + " : " + matchTime + " : " + matchType + " : " + lat + " : " + lng);
		return "match/matchList";
	}*/
	
	@RequestMapping("/match/enrollEnd")
	public String enrollMatch(Match match) {
		logger.debug("enrollMatch :// " + match);
		return "match/matchList";
	}

	@RequestMapping("/match/matchList.do")
	public String matchList(HttpServletRequest request) {
			
		List<Match> list=service.matchList();
		List<Map> map1=service.tmatch();
		List<Map> map2=service.fmatch();
		request.setAttribute("ofMatch",map1);
		request.setAttribute("icMatch",map2);
		request.setAttribute("list",list);
		return "/match/matchList";
	}
	
	@RequestMapping("/match/matchContent")
	public ModelAndView matchContent(String matchDate,String id) {
		ModelAndView mv=new ModelAndView();
		if(id.equals("1")) {
			List<Map> list=service.matchContent(matchDate);
			mv.addObject("list",list);
			
		}else if(id.equals("2")) {
			List<Map> list=service.incomMatch(matchDate);
			mv.addObject("list",list);
		}
		mv.setViewName("/match/matchContent");
		
		return mv;
	}
	
}
