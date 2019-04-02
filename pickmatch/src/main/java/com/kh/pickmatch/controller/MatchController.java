package com.kh.pickmatch.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.pickmatch.model.service.MatchService;
import com.kh.pickmatch.model.vo.Match;

@Controller
public class MatchController {

@Autowired
private MatchService service;	
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
	
}
