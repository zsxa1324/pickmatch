package com.kh.pickmatch.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.common.PageBarFactory;
import com.kh.pickmatch.model.vo.TeamBoard;
import com.kh.pickmatch.service.TeamBoardService;

@Controller
public class TeamController {
	
	
	@Autowired
	private TeamBoardService service;

	
	@RequestMapping("/team.do")
	public String teaminfo() {
		return "Team/teaminfo";
		
	}
	
	@RequestMapping("/teammercenary.do")
	public String teammercenaryinfo() {
		return "Team/teammercenary";
		
	}
	
	@RequestMapping("/teamcreate.do")
	public String teamcreate (){
		return "Team/teamcreate";
		
	}
	
	@RequestMapping("/teamnotice.do")
	public String teamnotice() {
		return "Team/teamnotice";
	}
	
	@RequestMapping("/freeboard.do")
	public ModelAndView teamranking(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		int numPerPage = 10;
		ModelAndView mv = new ModelAndView();
		List<TeamBoard> list = service.selectList(cPage, numPerPage);
		int totalList = service.selectCount();
		
		System.out.println(list);
		
		mv.addObject("list", list);
		mv.addObject("totalList", totalList);
		System.out.println(totalList);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalList, cPage, numPerPage, "/pickmatch/Team/freeboard"));
		mv.setViewName("Team/freeboard");
		return mv;
	}
		
		
	
	
	@RequestMapping("/teamranking.do")
	public String teamranking(){
		return "Team/teamranking";
	}
	
	@RequestMapping("/mercenaryranking.do")
	public String mercenaryranking() {
		return "Team/mercenaryranking";
	}
	
	@RequestMapping("/Team/freeboardWrite")
	public String freeboardWrite() {
		return "Team/freeboardWrite";
	}
	
	@RequestMapping("/Team/teamnoticeWrite")
	public String teamnoticeWrite(){
		return "Team/teamnoticeWrite";
	}
	
	@RequestMapping("/freeboardView.do")
	public String freeboardView() {
		return "Team/teamboardView";
	}
	
	@RequestMapping("/team/teamView.do")
	public ModelAndView selectOne(@RequestParam(value="boardNo",defaultValue="1") int boardNo) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("teamboard", service.selectTeamBoard(boardNo));
		mv.addObject("attachmentList", service.selectAttachment(boardNo));
		mv.setViewName("Team/teamboardView");
		return mv;
	}
}
