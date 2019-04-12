package com.kh.pickmatch.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.model.service.MatchService;
import com.kh.pickmatch.model.service.TeamService;
import com.kh.pickmatch.model.vo.AwaySaInfo;
import com.kh.pickmatch.model.vo.HomeSaInfo;
import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.MatchPEmblem;
import com.kh.pickmatch.model.vo.Member;
import com.kh.pickmatch.model.vo.MemberByTeam;

@Controller
public class MatchController {

@Autowired
private MatchService service;
@Autowired
private TeamService teamService;

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
	public ModelAndView enrollMatch(Match match, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Member m = (Member) session.getAttribute("loggedMember");
		logger.debug("loggedMember : " + m);
		String teamHome = teamService.selectTeamOne(m.getMemberId());
		match.setTeamHome(teamHome);
		String msg = "";
		String loc = "/match/matchList.do";
		
		int result = service.insertMatch(match);
		if (result > 0) {
			msg = "매치가 등록되었습니다";
		} else {
			msg = "매치 등록이 실패하였습니다";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
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
	
	@RequestMapping("/match/matchRequest.do")
	public ModelAndView matchRequest(int matchNo,String id,String memo) {
		ModelAndView mv=new ModelAndView();
		MemberByTeam mbt=service.memberByTeam(id);
		String teamName = mbt.getTeamName();
		Map<String,Object> map=new HashMap();
		map.put("matchNo",matchNo);
		map.put("teamName",teamName);
		map.put("memo",memo);
		int result=service.matchRequest(map);
		System.out.println(result);
		
		String msg="";
		if(result>0) {
			msg="매치신청이 완료되었습니다.";
		}
		mv.setViewName("common/msg");
		mv.addObject("msg",msg);
		return mv;
	
	}
	
	@RequestMapping("/match/matchInfo")
	public ModelAndView matchInfo(int matchNo) {
		ModelAndView mv=new ModelAndView();
		MatchPEmblem m=new MatchPEmblem();
		m.setMatchNo(matchNo);
		MatchPEmblem matchResult=service.matchInfo(m);
		Map<String,Object> map=new HashMap();
		String teamName = matchResult.getTeamHome();
		List<Map> list=service.memberInfo(teamName);
		List<Map> matchResponse=service.matchResponse(matchNo);
		System.out.println("하하하"+matchResponse);
		
		mv.setViewName("/match/MatchTeamInfo");
		mv.addObject("match",matchResult);
		mv.addObject("member",list);
		mv.addObject("matchResponse",matchResponse);
		return mv;
	}
	@RequestMapping("/match/matchOk.do")
	public ModelAndView matchOk(int matchNo,String awayTeam) {
		ModelAndView mv=new ModelAndView();
		Map<String,Object> map=new HashMap();
		map.put("matchNo",matchNo);
		map.put("awayTeam",awayTeam);
		
		int result=service.matchOk(map);
		String msg="";
		
		if(result>0) {
			msg="매치가 수락되었습니다.";
		}
		mv.setViewName("common/msg");
		mv.addObject("msg",msg);
		return mv;
	}
	@RequestMapping("/match/matchSa.do")
	public ModelAndView matchSa(int matchNo,String matchHome,String matchAway) {
		ModelAndView mv=new ModelAndView();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("matchNo",matchNo);
		map.put("matchHome",matchHome);
		map.put("matchAway",matchAway);
		HomeSaInfo m=service.matchSa(map);
		AwaySaInfo sm=service.matchSaa(map);
		mv.addObject("m",m);
		mv.addObject("sm",sm);
		mv.setViewName("match/matchSaInfo");
		
		return mv;
	}
}