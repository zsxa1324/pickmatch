package com.kh.pickmatch.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.common.PageBarFactory;
import com.kh.pickmatch.model.service.TeamService;
import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.Member;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.TeamBoard;
import com.kh.pickmatch.model.vo.TeamOperationAccount;

@Controller
public class TeamController {

	@Autowired
	TeamService service;
	
	@RequestMapping("/team/teamOperationInfo")
	public ModelAndView teamOperationInfo(HttpSession session, String selectDate) {
		
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "";
		String teamName = "";
		Member m = null;
		
		if(session.getAttribute("loggedMember") == null) {
			msg = "로그인 후 이용가능합니다.";
			loc = "/";
			
			mv.setViewName("common/msg");
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			return mv;
			
		} else {
			m = (Member)session.getAttribute("loggedMember");
			teamName = service.selectTeamOne(m.getMemberId());
			if(teamName == null) {
				msg = "소속된 팀이 없습니다.";
				loc = "/";
				
				mv.setViewName("common/msg");
				mv.addObject("msg", msg);
				mv.addObject("loc", loc);
				return mv;
				
			}
		}
		
		Calendar cal = Calendar.getInstance();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date date = new Date();
		String currentDate = "";
		String lastDate = "";
		
		if(selectDate == null) currentDate = sdf.format(date);
		else currentDate = selectDate;
		
		currentDate += "-01";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("currentDate", currentDate);
		map.put("teamName", teamName);
		
		List<Map<String, String>> listTMember = service.selectTMemberList(map);
		List<Map<String, Object>> listMHistory = service.selectMoneyHistoryList(map);
		
		TeamOperationAccount account = service.selectAccountOne(teamName);
		
		mv.setViewName("team/teamOperationInfo");
		mv.addObject("currentDate", currentDate);
		mv.addObject("memberId", m.getMemberId());
		mv.addObject("teamName", teamName);
		mv.addObject("listTMember", listTMember);
		mv.addObject("listMHistory", listMHistory);
		mv.addObject("account", account);
		
		return mv;
		
	}
	
	@RequestMapping("/team/teamaccountRevise")
	public String teamAccountRevise(TeamOperationAccount toAccount, Model model) {
		
		int result = service.updateTeamAccount(toAccount);
		String msg = "";
		String loc = "/team/teamOperationInfo";
		
		if(result > 0) msg = "계좌정보가 수정완료 되었습니다!";
		else msg = "계좌 수정중에 오류가 발생하였습니다!";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("/team/teamaccountEnroll")
	public String teamAccountEnroll(TeamOperationAccount toAccount, Model model) {
		
		int result = service.insertTeamAccount(toAccount);
		String msg = "";
		String loc = "/team/teamOperationInfo";
		
		if(result > 0) msg = "계좌가 등록 되었습니다!";
		else msg = "계좌 등록중에 오류가 발생하였습니다!";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("/team/MoneyHistoryEndroll")
	public String moneyHistoryEndroll(MoneyHistory mHistory, Model model) {
		
		
		int result = service.insertMHistory(mHistory);
		
		String msg = "";
		String loc = "/team/teamOperationInfo";

		if(result > 0) msg = "내역서가 작성되었습니다.";
		else msg = "내역서 작성중 오류발생!";
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	@RequestMapping("/team/teamMatchList")
	public ModelAndView teamMatch(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, HttpSession session, String teamName) {
		
		ModelAndView mv = new ModelAndView();
		
		int numPerPage = 3;
		int totalCount = service.selectMatchCount(teamName);
		
		List<Match> list = service.selectMatchList(teamName, cPage, numPerPage);
		
		mv.addObject("list", list);
		mv.addObject("totalCount", totalCount);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/team/teamMatchList"));
		mv.setViewName("team/teamMatchList");
		
		return mv;
	}
	
	@RequestMapping("/team/teamMatchDetail")
	public String teamMatchDetail(String status, Model model) {
		
		return "team/matchDetail";
	}
	
	@RequestMapping("/team/teamMatchEnroll")
	public String teamMatchEnroll(/*Model medel, Match m*/) {
		
		return "team/matchEnroll";
	}
	
	@RequestMapping("/team/teamMatchEnrollAjax")
	public String teamMatchEnrollAjax() {
		
		
		
		return "";
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/team.do")
	public ModelAndView teaminfo(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "";
		Member m = null;
		String teamName = "";
		String memberId = "";
		
		if(session.getAttribute("loggedMember") == null) {
			msg = "로그인 후 이용가능합니다.";
			loc = "/";
			
			mv.setViewName("common/msg");
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			return mv;
		} else {
			m = (Member)session.getAttribute("loggedMember");
			memberId = m.getMemberId();
			teamName = service.selectTeamOne(memberId);
			if(teamName == null) {
				msg = "소속된 팀이 없습니다.";
				loc = "/";
				
				mv.setViewName("common/msg");
				mv.addObject("msg", msg);
				mv.addObject("loc", loc);
				return mv;
				
			}
		}
		
		mv.addObject("teamName", teamName);
		mv.setViewName("team/teaminfo");
		return mv;
		
	}
	
	@RequestMapping("/teammercenary.do")
	public String teammercenaryinfo() {
		return "team/teammercenary";
		
	}
	
	@RequestMapping("/teamcreate.do")
	public String teamcreate (){
		return "team/teamcreate";
		
	}
	
	@RequestMapping("/teamnotice.do")
	public String teamnotice() {
		return "team/teamnotice";
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
		mv.setViewName("team/freeboard");
		return mv;
	}
		
		
	
	
	@RequestMapping("/teamranking.do")
	public String teamranking(){
		return "team/teamranking";
	}
	
	@RequestMapping("/mercenaryranking.do")
	public String mercenaryranking() {
		return "team/mercenaryranking";
	}
	
	@RequestMapping("/team/freeboardWrite")
	public String freeboardWrite() {
		return "team/freeboardWrite";
	}
	
	@RequestMapping("/team/teamnoticeWrite")
	public String teamnoticeWrite(){
		return "team/teamnoticeWrite";
	}
	
	@RequestMapping("/freeboardView.do")
	public String freeboardView() {
		return "team/teamboardView";
	}
	
	@RequestMapping("/team/teamView.do")
	public ModelAndView selectOne(@RequestParam(value="boardNo",defaultValue="1") int boardNo) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("teamboard", service.selectTeamBoard(boardNo));
		mv.addObject("attachmentList", service.selectAttachment(boardNo));
		mv.setViewName("team/teamboardView");
		return mv;
	}
	
}
