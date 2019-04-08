package com.kh.pickmatch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.common.PageBarFactory;
import com.kh.pickmatch.model.service.CommunityService;
import com.kh.pickmatch.model.vo.FreeBoard;

@Controller
public class CommunityController {

	@Autowired
	CommunityService service;
	
	@RequestMapping("/community/freeboard.do")
	public ModelAndView freeboard(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		int numPerPage = 10;
		ModelAndView mv = new ModelAndView();
		List<FreeBoard> list = service.selectFreeBoardList(cPage, numPerPage);
		int totalList = service.selectFreeBoardCount();
	
		mv.addObject("list", list);
		mv.addObject("totalList", totalList);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalList, cPage, numPerPage, "/pickmatch/community/freeboard.do"));
		mv.setViewName("community/co-freeboard");
		return mv;
	}
	
	@RequestMapping("/community/freeboardView.do")
	public ModelAndView freeboardView(@RequestParam(value="boardNo", defaultValue="1") int boardNo) {
		ModelAndView mv = new ModelAndView();
	    mv.addObject("freeboard", service.selectOneFreeBoard(boardNo));
	    mv.addObject("attachmentList", service.selectAttachment(boardNo));
	    mv.setViewName("community/co-freeboardView");
	    return mv;
	}
}
