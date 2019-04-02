package com.kh.pickmatch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatchController {


	@RequestMapping("/match/view")
	public String showMatch() {
		return "match/matchList";
	}
	
	@RequestMapping("/match/enrollForm")
	public String showMatchEnrollForm() {
		return "match/matchEnroll";
	}
}
