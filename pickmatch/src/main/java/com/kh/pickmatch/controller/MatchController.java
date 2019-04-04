package com.kh.pickmatch.controller;

import java.sql.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatchController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping("/match/view")
	public String showMatch() {
		return "match/matchList";
	}
	
	@RequestMapping("/match/enrollForm")
	public String showMatchEnrollForm() {
		return "match/matchEnroll";
	}
	
	@RequestMapping("/match/enrollEnd")
	public String enrollMatch(Date matchDate, String matchType, String playGround, int cost, String email, String possibleLocal, String matchContent) {
		logger.debug("enrollMatch :// " + matchDate + " : " + matchType);
		return "match/matchList";
	}
}
