package com.kh.pickmatch.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.common.PageBarFactory;
import com.kh.pickmatch.model.service.MemberService;
import com.kh.pickmatch.model.service.TeamService;
import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.MatchGoalResult;
import com.kh.pickmatch.model.vo.Member;
import com.kh.pickmatch.model.vo.MemberByTeam;
import com.kh.pickmatch.model.vo.MemberRequest;
import com.kh.pickmatch.model.vo.Mercenary;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.Score;
import com.kh.pickmatch.model.vo.Team;
import com.kh.pickmatch.model.vo.TeamBoard;
import com.kh.pickmatch.model.vo.TeamBoardAttachment;
import com.kh.pickmatch.model.vo.TeamBoardComment;
import com.kh.pickmatch.model.vo.TeamNotice;
import com.kh.pickmatch.model.vo.TeamOperationAccount;

@Controller
public class TeamController {

	private Logger logger = LoggerFactory.getLogger(TeamController.class);
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	TeamService service;
	
	@RequestMapping("/team/teamOperationInfo")
	public ModelAndView teamOperationInfo(HttpSession session, String selectDate) {
		
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "";
		String teamName = "";
		Member m = null;
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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date date = new Date();
		String currentDate = "";
		
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
		mv.addObject("memberId", memberId);
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
	public ModelAndView teamMatch(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, HttpSession session) {
		
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
		
		String authority = service.selectTeamAuthorityOne(memberId);
		
		mv.addObject("teamName", teamName);
		
		int numPerPage = 3;
		int totalCount = service.selectMatchCount(teamName);
		
		List<Match> list = service.selectMatchList(teamName, cPage, numPerPage);
		
		String[] homeEmblemArr = new String[list.size()];
		String[] awayEmblemArr = new String[list.size()];
		
		for(int i = 0; i < list.size(); i++) {
			homeEmblemArr[i] = service.selectTeamEmblemOne(list.get(i).getTeamHome());
			if(list.get(i).getTeamAway() != null) awayEmblemArr[i] = service.selectTeamEmblemOne(list.get(i).getTeamAway());
		}
		
		mv.addObject("list", list);
		mv.addObject("homeEmblemArr", homeEmblemArr);
		mv.addObject("awayEmblemArr", awayEmblemArr);
		mv.addObject("authority", authority);		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/pickmatch/team/teamMatchList"));
		mv.setViewName("team/teamMatchList");
		
		return mv;
	}
	
	@RequestMapping("/team/teamMatchEnroll")
	public ModelAndView teamMatchEnroll(int matchNo, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		String msg = "";
		String loc = "";
		Member memeber = null;
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
			memeber = (Member)session.getAttribute("loggedMember");
			memberId = memeber.getMemberId();
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
		
		
		Match m = service.selectOneMatch(matchNo);
		String teamHome = m.getTeamHome();
		String teamAway= m.getTeamAway();
		
		Team homeTeam = service.selectOneHomeTeam(teamHome);
		Team awayTeam = service.selectOneAwayTeam(teamAway);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String currentDate = "";
		
		currentDate = sdf.format(date);
		
		Map<String, String> homeMap = new HashMap<String, String>();
		homeMap.put("currentDate", currentDate);
		homeMap.put("teamName", teamHome);
		
		Map<String, String> awayMap = new HashMap<String, String>();
		awayMap.put("currentDate", currentDate);
		awayMap.put("teamName", teamAway);
		
		
		List<Map<String, String>> homeList = service.selectTMemberList(homeMap);
		List<Map<String, String>> awayList = service.selectTMemberList(awayMap);
		
		List<Map<String, String>> homemercenaryList = service.selectMercenaryList(homeMap);
		List<Map<String, String>> awaymercenaryList = service.selectMercenaryList(awayMap);
		
		String homeEmblemArr = service.selectTeamEmblemOne(m.getTeamHome());
		String awayEmblemArr = "";
		if(m.getTeamAway() != null) awayEmblemArr = service.selectTeamEmblemOne(m.getTeamAway());
		else awayEmblemArr = null;
		
		mv.addObject("m", m);
		mv.addObject("homeEmblemArr", homeEmblemArr);
		mv.addObject("awayEmblemArr", awayEmblemArr);
		mv.addObject("matchNo", matchNo);
		mv.addObject("teamName", teamName);
		mv.addObject("homeTeam", homeTeam);
		mv.addObject("awayTeam", awayTeam);
		mv.addObject("homeList", homeList);
		mv.addObject("awayList", awayList);
		mv.addObject("homemercenaryList", homemercenaryList);
		mv.addObject("awaymercenaryList", awaymercenaryList);
		mv.setViewName("team/matchEnroll");
		
		return mv;
	}
	
	@RequestMapping("/team/teamMatchEnrollEnd")
	public ModelAndView matchEnrollEnd(int matchNo, int homescore, int awayscore, String homeTeam, String awayTeam, String textarea, String homeMinarr, String awayMinarr, String homeNamearr, String awayNamearr) {

		ModelAndView mv = new ModelAndView();
		System.out.println("홈분 : " + homeMinarr);
		System.out.println("어웨이 분 : " + awayMinarr);
		System.out.println("홈 사람 : " + homeNamearr);
		System.out.println("어웨이 사람 : " + awayNamearr);
		
		String[] hma = homeMinarr.split(",");
		String[] ama = awayMinarr.split(",");
		String[] hna = homeNamearr.split(",");
		String[] ana = awayNamearr.split(",");
		
		MatchGoalResult mgr = null;
		if(hna[0].trim() != "") {
			for(int i = 0; i < hna.length; i++) {
				mgr = new MatchGoalResult(0, homeTeam, matchNo, hna[i], Integer.parseInt(hma[i]));
				service.insertMatchGoalResult(mgr);
			}
		}
		if(ana[0].trim() != "") {
			for(int i = 0; i < ana.length; i++) {
				mgr = new MatchGoalResult(0, awayTeam, matchNo, ana[i], Integer.parseInt(ama[i]));
				service.insertMatchGoalResult(mgr);
			}
		}
		
		Score homeS = null;
		Score awayS = null;
		Team homeT = service.selectOneHomeTeam(homeTeam);
		Team awayT = service.selectOneAwayTeam(awayTeam);
		Map<String, Object> homeMap = new HashMap<String, Object>();
		Map<String, Object> awayMap = new HashMap<String, Object>();
		
		if(homescore > awayscore) {
			homeS = new Score(homeTeam, 1, 1, 0, 0);
			awayS = new Score(awayTeam, 1, 0, 0, 1);
			
			homeMap.put("teamName", homeTeam);
			homeMap.put("teamRating", 20);
			awayMap.put("teamName", awayTeam);
			awayMap.put("teamRating", -20);
			
			service.updateTeamRating(homeMap);
			service.updateTeamRating(awayMap);
			
			service.updateScore(homeS);
			service.updateScore(awayS);
		} else if(homescore < awayscore) {
			homeS = new Score(homeTeam, 1, 0, 0, 1);
			awayS = new Score(awayTeam, 1, 1, 0, 0);
			
			homeMap.put("teamName", homeTeam);
			homeMap.put("teamRating", -20);
			awayMap.put("teamName", awayTeam);
			awayMap.put("teamRating", 20);
			
			service.updateScore(homeS);
			service.updateScore(awayS);
		} else {
			homeS = new Score(homeTeam, 1, 0, 1, 0);
			awayS = new Score(awayTeam, 1, 0, 1, 0);
			
			homeMap.put("teamName", homeTeam);
			homeMap.put("teamRating", 5);
			awayMap.put("teamName", awayTeam);
			awayMap.put("teamRating", 5);
			
			service.updateScore(homeS);
			service.updateScore(awayS);
		}
		
		Map<String, Integer> matchScoreMap = new HashMap<String, Integer>();
		matchScoreMap.put("matchNo", matchNo);
		matchScoreMap.put("homeScore", homescore);
		matchScoreMap.put("awayScore", awayscore);
		
		service.updateMatchScore(matchScoreMap);
		
		Map<String, Object> matchResultDetailMap = new HashMap<String, Object>();
		
		matchResultDetailMap.put("matchNo", matchNo);
		matchResultDetailMap.put("matchContent", textarea);
		
		service.insertMatchResultDetail(matchResultDetailMap);
		logger.debug("matchEnrollEnd:::::AfterinsertMatchResultDetail");
		mv.setViewName("team/teamMatchList");
		logger.debug("matchEnrollEnd:::::After::::mv.setViewName");
		return mv;
	}
	
	@RequestMapping("/team/teamMatchDetail")
	public ModelAndView matchDetail(int matchNo) {
		
		ModelAndView mv = new ModelAndView();
		
		Match match = service.selectOneMatch(matchNo);
		List<Map<String, Object>> goalList = service.selectMatchGoalResultList(matchNo);
		String matchContent = service.selectMatchResultDetail(matchNo);
		
		String homeEmblemArr = service.selectTeamEmblemOne(match.getTeamHome());
		String awayEmblemArr = "";
		if(match.getTeamAway() != null) awayEmblemArr = service.selectTeamEmblemOne(match.getTeamAway());
		else awayEmblemArr = null;
		mv.addObject("match", match);
		mv.addObject("homeEmblemArr", homeEmblemArr);
		mv.addObject("awayEmblemArr", awayEmblemArr);
		mv.addObject("goalList", goalList);
		mv.addObject("matchContent", matchContent);
		mv.setViewName("team/matchDetail");
		
		return mv;
	}
	
	@RequestMapping("/team/teamInfoRevise")
	public String teamInfoRevise(String teamName, Team team, Model m) {
		
		String msg = "";
		String loc = "team/teaminfo?teamName=" + teamName;
		System.out.println(team);
		int result = service.updateTeamInfo(team);
		
		if(result != 0) {
			msg = "팀 정보가 수정되었습니다.";
		} else {
			msg = "업데이트중 오류발생!";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/team/memberRequestList")
	@ResponseBody
	public Map<String,Object> memberRequestList(String memberId, String teamName) {
		
		int mercenaryResult = service.selectMercenaryCount(memberId, teamName);
		MemberRequest mbr = service.memberRequestCk(memberId, teamName, "용병");
		Map<String,Object> map = new HashMap<String, Object>();
		int num = 0;
		
		if(mercenaryResult > 0) num = 1;
		else if(mbr == null) num = 2;
		else if(mbr != null) num = 3;
		 
		map.put("num", num);
		 
		return map;
	}
	
	//용병가입 신청
	@RequestMapping("/team/mercenaryApply")
	@ResponseBody
	public Map<String, Object> mercenaryApply(String memberId, String teamName) {
		
		String msg = "";
		boolean flag;
		
		int result = service.teamJoin(memberId, teamName, "용병");
		if(result>0) {
			msg="용병 가입을 신청하였습니다!";
			flag=true;
		}
		else {
			flag=false;
			msg="용병 가입을 실패하였습니다!";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", msg);
		map.put("flag", flag);
		return map;
	}
		
	//용병가입 취소
	@RequestMapping("/mercenaryCancel")
	@ResponseBody
	public Map<String, Object> mercenaryCancel(String memberId, String teamName){
		
		String msg = "";
		boolean flag;
		int result = service.teamNo(memberId, teamName, "용병");
		if(result>0) {
			msg="용병 가입신청을 취소하였습니다!";
			flag=true;
		}
		else {
			flag=false;
			msg="용병 가입신청취로를 실패하였습니다!";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", msg);
		map.put("flag", flag);
		return map;
		
	}
	
	@RequestMapping("/team/teamMercenaryManagement")
	public ModelAndView mercenaryManagement(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		String msg = "";
		String loc = "";
		String teamName = "";
		Member m = null;
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
		
		List<Map<String, Object>> mrList = service.selectMemberReuestList(teamName);
		List<Map<String, Object>> mList = service.selectMercenaryManagementList(teamName);
		
		
		mv.addObject("mrList", mrList);
		mv.addObject("mList", mList);
		mv.setViewName("team/mercenaryList");
		
		return mv;
	}
	
	//용병 가입 거절
	@RequestMapping("/team/teamMercenaryNo")
	public String teamMercenaryNo(String memberId, String teamName, Model m) {
		
		String msg = "";
		String loc="/team/teamMercenaryManagement?teamName="+teamName; //이동할 매핑값 써야됨
		
		int result = service.teamNo(memberId, teamName, "용병");
		if(result>0) {
			msg="가입을 거절하였습니다!";
		}
		else {
			msg="거절에 실패하였습니다!";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
			
		
		return "common/msg";
	}
	
	//팀가입 승인
	@RequestMapping("/team/teamMercenaryYes")
	public String teamMercenaryYes(String memberId, String teamName, Model m) {
		
		String msg = "";
		String loc = "/team/teamMercenaryManagement?teamName=" + teamName; //이동할 매핑값 써야됨
		
		int result = service.insertMercenary(memberId, teamName);
		if(result > 0) {
			msg = "승인 완료!";
		}
		else {
			msg = "승인 실패!";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/team/teamMercenarydelete")
	public String teamMercenarydelete(String memberId, String teamName, Model m) {
		
		String msg = "";
		String loc = "/team/teamMercenaryManagement?teamName=" + teamName; //이동할 매핑값 써야됨
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("teamName", teamName);
		
		int result = service.deleteTeamMercenary(map);
		
		if(result > 0) {
			msg = "추방 완료!";
		}
		else {
			msg = "추방 실패!";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/team/teamMercenarySelfdelete")
	public String teamMercenarySelfdelete(String memberId, String teamName, Model m) {
		
		String msg = "";
		String loc = "/teammercenary.do?memberId=" + memberId; //이동할 매핑값 써야됨
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("teamName", teamName);
		
		int result = service.deleteTeamMercenary(map);
		
		if(result > 0) {
			msg = "탈퇴 완료!";
		}
		else {
			msg = "탈퇴 실패!";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/teammercenary.do")
	public ModelAndView teammercenary(String memberId) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> mercenaryList = service.selectMyTeamMercenaryList(memberId);
		
		mv.addObject("mercenaryList", mercenaryList);
		mv.setViewName("team/teammercenary");
		
		return mv;
	}
	
	
	
	
	
	
	//도원
	
	
	
	
	
	
	
	
	//내팀정보!!
	@RequestMapping("/team.do")
	public ModelAndView teaminfo(String teamName) {
		
		ModelAndView mv = new ModelAndView();
		List<Team> list = service.TeamView(teamName);
		int memberCount = service.memberCount(teamName);
		List<MemberByTeam> result = service.TeamMember(teamName);
		logger.debug("멤버바이팀"+result);
		
		
		List<MemberRequest> memberrequest = service.MemberRequest(teamName);
		
		mv.addObject("memberrequest", memberrequest);
		mv.addObject("memberCount", memberCount);
		mv.addObject("list", list);
		mv.addObject("teamName", teamName);
		mv.addObject("result", result);
		mv.setViewName("team/teaminfo");
		return mv;
		
	}
	
	//팀가입 승인
	@RequestMapping("/teamOk.do")
	public String teamOk(String memberId, String teamName, Model m) {
		
		String msg = "";
		String loc="/team.do?teamName="+teamName; //이동할 매핑값 써야됨
		
		int result = service.teamOk(memberId, teamName);
		if(result>0) {
			msg="가입이 완료되었습니다!";
		}
		else {
			msg="가입에 실패하였습니다!";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
			
		
		return "common/msg";
	}
	
	
	//팀가입신청시 멤버테이블에있는지 확인
	@RequestMapping("/memberrequestck.do")
	@ResponseBody
	public Map<String,Object> memberRequestCk(String memberId, String teamName) {
		
		
		 MemberRequest mbr = service.memberRequestCk(memberId, teamName, "팀");
		 Map<String,Object> map = new HashMap<String, Object>();
		 boolean flag;
		 
		 if(mbr == null) {
			 flag = false;
			
		 }else {
			 flag = true;
		 }
		 
		 map.put("flag", flag);
		 
		 return map;
	}
	
	//팀가입 거절
	@RequestMapping("/teamNo.do")
	public String teamNo(String memberId, String teamName, Model m) {
		
		String msg = "";
		String loc="/team.do?teamName="+teamName; //이동할 매핑값 써야됨
		
		int result = service.teamNo(memberId, teamName, "팀");
		if(result>0) {
			msg="가입을 거절하였습니다!";
		}
		else {
			msg="거절에 실패하였습니다!";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
			
		
		return "common/msg";
	}
	
	//팀가입 신청
	@RequestMapping("/teamJoin.do")
	@ResponseBody
	public Map<String, Object> teamJoin(String memberId, String teamName, String position) {
		
		logger.debug("멤버아이디!!!!"+memberId);
		logger.debug("멤버아이디!!!!"+teamName);
		String msg = "";
		boolean flag;
		String loc="/team.do?teamName="+teamName; //이동할 매핑값 써야됨
		
		int result = service.teamJoin(memberId, teamName, "팀");
		if(result>0) {
			msg="팀 가입을 신청하였습니다!";
			flag=true;
		}
		else {
			flag=false;
			msg="팀 가입을 실패하였습니다!";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", msg);
		map.put("flag", flag);
		return map;
		
	}
	
	@RequestMapping("teamCancel.do")
	@ResponseBody
	public Map<String, Object> teamCancel(String memberId, String teamName){
		
		
		String msg = "";
		boolean flag;
		String loc="/team.do?teamName="+teamName; //이동할 매핑값 써야됨
		int result = service.teamNo(memberId, teamName, "팀");
		if(result>0) {
			msg="팀 가입신청을 취소하였습니다!";
			flag=true;
		}
		else {
			flag=false;
			msg="팀 가입신청취로를 실패하였습니다!";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", msg);
		map.put("flag", flag);
		return map;
		
		
	}
	
	//팀 게시판 리스트보기
	@RequestMapping("/freeboard.do")
	public ModelAndView freeboard(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage, HttpSession session) {
		int numPerPage = 10;
		ModelAndView mv = new ModelAndView();
		int totalList = service.selectCount();
		Member member = (Member)session.getAttribute("loggedMember");
		String teamName = member.getTeamName();
		
		List<TeamBoard> list = service.selectList(cPage, numPerPage, teamName);
		System.out.println(list);
		
		mv.addObject("list", list);
		mv.addObject("totalList", totalList);
		System.out.println(totalList);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalList, cPage, numPerPage, "/pickmatch/freeboard.do"));
		mv.setViewName("team/freeboard");
		return mv;
	}
		
		
	
	

	

	
	//팀 게시판 글쓰기
	@RequestMapping("/Team/freeboardWrite")
	public String freeboardWrite() {
		return "team/freeboardWrite";
	}
	
	//팀게시판 글쓰기 다중파일업로드
	@RequestMapping("/board/freeboardWrite.do")
	public ModelAndView insertFreeboard(String teamName, TeamBoard fb, MultipartFile[] upFile, HttpServletRequest re) {
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "";
		String saveDir = re.getSession().getServletContext().getRealPath("/resources/upload/team-freeboard");
		File dir = new File(saveDir);
		if(!dir.exists())
		{
			dir.mkdirs();
		}
		List<TeamBoardAttachment> list = new ArrayList<>();
		for(MultipartFile f : upFile)
		{
			if(!f.isEmpty())
			{
				String oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.indexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				int rndNum = (int)(Math.random()*1000);
				String renamedFile = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + ext;
				try
				{
					f.transferTo(new File(saveDir + "/" + renamedFile));
				}catch(IOException e)
				{
					e.printStackTrace();
				}
				TeamBoardAttachment a = new TeamBoardAttachment();
				a.setOriginalFileName(oriFileName);
				a.setRenamedFileName(renamedFile);
				list.add(a);
			}
		}
		logger.debug("컨트롤러fb!!!"+teamName);
		fb.setTeamName(teamName);
		int result = service.insertFreeBoard(fb,list);
		if(result>0)
		{
			msg = "게시글이 등록되었습니다.";
			loc =  "/freeboard.do";
		}
		else
		{
			msg = "게시글 등록이 실패했습니다. 다시 등록해주세요.";
			loc = "/freeboard.do";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	//팀게시판 파일다운
	@RequestMapping("/team/teamboard.do")
	public void fileDown(String oName, String rName, HttpServletRequest request, HttpServletResponse response)
	{
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/team-freeboard");
		try
		{
			FileInputStream fis = new FileInputStream(new File(saveDir+"/"+rName));
			bis = new BufferedInputStream(fis);
			sos = response.getOutputStream();
			String resFilename = "";
			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 || request.getHeader("user-agent").indexOf("Trident") != -1;
			if(isMSIE)
			{
				resFilename = URLEncoder.encode(oName, "UTF-8");
				resFilename = resFilename.replaceAll("\\+", "%20");
			}
			else
			{
				resFilename = new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			
			response.setContentType("application/octet-stream;charset=UTF-8");
			response.addHeader("Content-Disposition", "attachment;filename=\""+resFilename+"\"");
			
			int read = 0;
			while((read = bis.read()) != -1)
			{
				sos.write(read);
			}
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		finally 
		{
			try 
			{
				bis.close();
				sos.close();
			}
			catch(IOException e)
			{
				e.printStackTrace();
			}
		}
	}
	
	
	//팀게시판 수정창 이동
	@RequestMapping("/team/updateteamboard")
	public ModelAndView updateTeamBoard(int boardNo) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("teamboard", service.selectTeamBoard(boardNo));
		mv.addObject("attachmentList", service.selectAttachment(boardNo));
		mv.setViewName("team/updateTeamBoard");
		return mv;
	}
	//팀게시판 수정
	@RequestMapping("/team/whiteTeamBoard.do")
	public String updateTeamBoard(String boardTitle,  String boardContent,int boardNo, Model m) {
		
		int result = service.updateTeamBoard(boardTitle, boardContent, boardNo);
		String msg="";
		String loc="/freeboard.do";
		
		if(result>0) {
			msg="수정되었습니다";
		}
		else {
			msg="실패하였습니다";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";
		
	}
	
	
	//팀게시판 글삭제
	@RequestMapping("/deleteTeamBoard.do")
	public String deleteTeamBoard(@RequestParam(value="boardNo",defaultValue="1") int boardNo, Model m) {
		
		
		String msg = "";
		String loc = "/freeboard.do";
		int result = service.deleteTeamBoard(boardNo);
		
		if(result>0) {
			msg="삭제되었습니다";
		}
		else {
			msg="실패하였습니다";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";
		
	}
	
	
	
	//팀 공지사항 글쓰기 지우면안됨!!
	@RequestMapping("/Team/teamnoticeWrite")
	public String teamnoticeWrite(){
		return "team/teamnoticeWrite";
	}
	
	@RequestMapping("/freeboardView.do")
	public String freeboardView() {
		return "team/teamboardView";
	}
	
	//팀 게시판 상세보기
	@RequestMapping("/team/teamView.do")
	public ModelAndView selectOne(int boardNo) {
		
		ModelAndView mv = new ModelAndView();
		List<TeamBoardComment> tbclist = service.tbcView(boardNo);
		mv.addObject("teamboard", service.selectTeamBoard(boardNo));
		mv.addObject("attachmentList", service.selectAttachment(boardNo));
		mv.addObject("tbclist", tbclist);
		mv.setViewName("team/teamboardView");
		return mv;
	}
	
	//팀게시판 댓글작성
	@RequestMapping("/team/insertTeamBoardComment.do")
	public String insertTeamBoardComment(int boardNoRef, String memberId, int commentNoRef,String commentContent, Model m) {
		

		String msg = "";
		String loc="/team/teamView.do?boardNo="+boardNoRef; //이동할 매핑값 써야됨
		
		int result = service.insertTeamBoardComment(boardNoRef, memberId, commentNoRef, commentContent);
		

		if(result > 0) {
			msg = "코멘트 작성이 완료되었습니다.";
		}
		else {
			msg = "코멘트 작성을 실패하였습니다";
		}
		
		//msg loc 쓸려면 model같은거 필요함! 그리고 이렇게 넣어줘야함
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";
		
		
		
		
	}
	
	//팀게시판 댓글삭제
	@RequestMapping("/deletecomment.do")
	public String deleteComment(int commentNo,int boardNo, Model m) {
		
		String msg = "";
		String loc="/team/teamView.do?boardNo="+boardNo; //이동할 매핑값 써야됨
		int result = service.deleteComment(commentNo);
		
		if(result > 0) {
			msg = "코멘트가 삭제되었습니다";
		}
		else {
			msg = "코멘트 삭제에 실패하였습니다";
		}
		
		//msg loc 쓸려면 model같은거 필요함! 그리고 이렇게 넣어줘야함
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";
		
	}
	
	//팀 공지사항 보기
	@RequestMapping("/teamnotice.do")
	public ModelAndView teamnotice(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage,HttpSession session) {
		int numPerPage = 10;
		Member member = (Member)session.getAttribute("loggedMember");
		String teamName = member.getTeamName();
		ModelAndView mv = new ModelAndView();
		List<TeamNotice> list = service.selectListN(cPage, numPerPage, teamName);
		
		int totalList = service.selectCountN(teamName);
		
		System.out.println(list);
		
		mv.addObject("list", list);
		mv.addObject("totalList", totalList);
		System.out.println(totalList);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalList, cPage, numPerPage, "/pickmatch/teamnotice.do"));
		mv.setViewName("team/teamnotice");
		return mv;
	}
	
	//팀 공지사항 상세보기
	@RequestMapping("/team/noticeView.do")
	public ModelAndView selectOneN(@RequestParam(value="noticeNo",defaultValue="1") int noticeNo) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("teamnotice", service.selectNoticeView(noticeNo));
		mv.setViewName("team/teamnoticeView");
		return mv;
	}
	
	//팀 공지사항 글쓰기
	@RequestMapping("/team/teamnotice")
	public String InsertNotice(TeamNotice teamnotice, Model m) {
		
		
		String msg = "";
		String loc="/teamnotice.do"; //이동할 매핑값 써야됨
		int result = service.InsertNotice(teamnotice); 
		
		if(result > 0) {
			msg = "작성이 완료되었습니다.";
		}
		else {
			msg = "작성을 실패하였습니다";
		}
		
		//msg loc 쓸려면 model같은거 필요함! 그리고 이렇게 넣어줘야함
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";
		
	}
	
	//팀 공지사항 글 삭제
	@RequestMapping("/deleteNotice.do")
	public String deleteNotice(@RequestParam(value="noticeNo",defaultValue="1") int noticeNo, Model m) {
		
		
		String msg = "";
		String loc = "/teamnotice.do";
		int result = service.deleteNocice(noticeNo);
		
		if(result>0) {
			msg="삭제되었습니다";
		}
		else {
			msg="실패하였습니다";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/team/updateNotice")
	public String updateNotice(int noticeNo, Model m) {
		
		TeamNotice teamnotice = service.selectOne(noticeNo);
		m.addAttribute("teamNotice", teamnotice);
		return "team/updateNotice";
		
	}
		
	//팀 공지사항 수정
	@RequestMapping("/team/whiteNotice")
	public String whiteNotice(String noticeTitle,  String noticeContent,int noticeNo, Model m) {
		
		int result = service.updateNotice(noticeTitle, noticeContent, noticeNo);
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="수정되었습니다";
		}
		else {
			msg="실패하였습니다";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";
		
	}
	
	//팀생성
	@RequestMapping("/teamcreate.do")
	public String teamcreate (){
		return "team/teamcreate";
		
	}
		
	@RequestMapping("/team/teamCreate.do")
	public String insertTeam(String teamName, String teamLocation, String teamField, String teamType,MultipartFile teamEmblem,
			String teamColor, String teamContent,String memberId, Model m,HttpServletRequest re, HttpSession session) {
		
		Team team = new Team(teamName,0, teamLocation, teamField, teamType,teamColor, teamContent,null, "",null);
		String saveDir = re.getSession().getServletContext().getRealPath("/resources/upload/team-logo");
		File dir = new File(saveDir);
		
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		/*logger.debug("멤버아이디"+memberId);
		logger.debug("팀::::::::"+team);*/
		//단일 파일 입출력
		if(!teamEmblem.isEmpty()) {
			String oriFileName = teamEmblem.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.indexOf("."));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HHmmssSSS");
			int rndNum = (int)(Math.random()*1000);
			String reNamedFile = sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+ext;
			
			try {
				teamEmblem.transferTo(new File(saveDir + "/" + reNamedFile));//파일입출력은 체크드익셉션이기 때문에 try
				team.setTeamEmblem(reNamedFile);
			
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		
		int result = service.InsertTeam(team,memberId);
		String msg="";
		String loc="/";
		if(result > 0) {
			msg="팀 생성 완료!";
			Member y = (Member)session.getAttribute("loggedMember");
			Member changemember = memberservice.selectOne(y);
			session.setAttribute("loggedMember", changemember);
			
		}else{
			msg="팀 생성 실패!";  
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	//팀생성시 팀명중복검사
	@RequestMapping("/team/checkteamname.do")
	public ModelAndView checkteamName(String teamname) throws UnsupportedEncodingException{
		ModelAndView mv = new ModelAndView();
		Team t = new Team();
		t.setTeamName(teamname);
		Team result = service.selectTeamCheck(teamname);
		boolean isOk = result!=null?false:true;
		mv.addObject("isOk", isOk);
		mv.setViewName("jsonView");
		return mv;
	}
	
	//팀랭킹
	@RequestMapping("/teamranking.do")
	public ModelAndView teamrangking(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		
		int numPerPage = 10;
		ModelAndView mv = new ModelAndView();
		List<Team> list = service.selectTeamRanking(cPage, numPerPage);
		int totalList = service.selectCountT();

		
		mv.addObject("list", list);
		mv.addObject("totalList", totalList);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalList, cPage, numPerPage, "/pickmatch/teamranking.do"));
		mv.setViewName("team/teamranking");
		return mv;
	}
	
	//팀랭킹 검색
	@RequestMapping("/team/search.do")
	public ModelAndView TeamSearch(String search, Model m) {
		
		ModelAndView mv = new ModelAndView();
		List<Team> list = service.TeamSearch(search);
		logger.debug("서치"+search);
		logger.debug("리스트"+list);
		
		
		String msg="";
		String loc="";
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		if(list.size()==0) {
			logger.debug("어디임"+msg);
			msg="검색결과가 없습니다!";
			loc="/teamranking.do";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		}
		else {
			mv.addObject("list", list);
			mv.setViewName("team/teamranking");
		}
		return mv;
		
		
	}
	

	
	//용병랭킹
	@RequestMapping("/mercenaryranking.do")
	public ModelAndView mercenaryranking(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		int numPerPage = 10;
		ModelAndView mv = new ModelAndView();
		List<Mercenary> list = service.mercenaryranking(cPage, numPerPage);
		List<Mercenary> top3 = service.mercenaryranking(1, numPerPage);
		
		int totalList = service.selectCountM();

		
		mv.addObject("list", list);
		mv.addObject("top3", top3);
		mv.addObject("totalList", totalList);
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalList, cPage, numPerPage, "/pickmatch/mercenaryranking.do"));
		mv.setViewName("team/mercenaryranking");
		return mv;
	}
	
	//용병랭킹검색
	@RequestMapping("/mercenary/search.do")
	public ModelAndView MercenarySearch(String search, Model m) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Mercenary> top3 = service.mercenaryranking(1, 10);
		List<Mercenary> result =  service.MercenarySearch(search);
		
		String msg="";
		String loc="";
		
		m.addAttribute("msg", msg);
		
		//logger.debug("리졀트"+result);
		
		if(result==null) {
			msg="검색결과가 없습니다!";
			loc="/mercenaryranking.do";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
		}
		else {
			
			mv.addObject("list", result);
			mv.addObject("top3", top3);
			mv.setViewName("team/mercenaryranking");
			
		}
		return mv;
	}
	
	//팀원, 매니저 추방
	@RequestMapping("/team/team_bye.do")
	public String teambye(String memberId,String teamName, Model m) {
		logger.debug("아이디들어오니??"+memberId);
		String msg="";
		String loc="/team.do?teamName="+teamName;
		
		int result = service.teambye(memberId);
		if(result>0) {
			msg="추방이 완료되었습니다";
		}
		else {
			msg="추방에 실패하였습니다";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";

	}

	//매니저를 팀원으로
	@RequestMapping("/team/team_leveldown.do")
	public String leveldown(String memberId, String teamName, Model m) {
		logger.debug("아이디들어오니??"+memberId);
		String msg="";
		String loc="/team.do?teamName="+teamName;
		int result = service.leveldown(memberId);
		if(result>0) {
			msg="등급이 변경되었습니다";
		}
		else {
			msg="등급변경에 실패하였습니다";
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		
		return "common/msg";

	}
	
	//팀원을 매니저로
		@RequestMapping("/team/team_levelup.do")
		public String levelup(String memberId, String teamName, Model m) {
			logger.debug("아이디들어오니??"+memberId);
			String msg="";
			String loc="/team.do?teamName="+teamName;
			int result = service.levelup(memberId);
			if(result>0) {
				msg="등급이 변경되었습니다";
			}
			else {
				msg="등급변경에 실패하였습니다";
			}
			
			m.addAttribute("msg", msg);
			m.addAttribute("loc", loc);
			
			return "common/msg";

		}

		//팀장위임
		@RequestMapping("/team/team_leader.do")
		public String teamleader(String memberId, String teamName, Model m, HttpSession session) {
			logger.debug("아이디들어오니??"+memberId);
			String msg="";
			String loc="/team.do?teamName="+teamName;
			int result = service.teamleader(memberId, teamName);
			if(result>0) {
				msg="팀장위임에 성공하였습니다";
				Member member =(Member)session.getAttribute("loggedMember");
				
				String authority = service.authority(member.getMemberId());
				member.setAuthority(authority);
				session.setAttribute("loggedMember", member);
				logger.debug("멤버는 뭐니????"+member);
				logger.debug("멤버등급뭐니"+authority);
			}
			else {
				msg="팀장위임에 실패하였습니다";
			}
			
			m.addAttribute("msg", msg);
			m.addAttribute("loc", loc);
			
			return "common/msg";

		}
		
		//팀탈퇴
		@RequestMapping("/team/teamleave.do")
		public String teamleave(String memberId, Model m, HttpSession session) {
			logger.debug("아이디들어오니??"+memberId);
			String msg="";
			int result = service.teamleave(memberId);
			if(result>0) {
				msg="팀을 탈퇴하였습니다";
				Member member =(Member)session.getAttribute("loggedMember");
				Member memberResult = memberservice.selectOne(member);
				session.setAttribute("loggedMember", memberResult);
				
			}
			else {
				msg="팀탈퇴에 실패하였습니다";
			}
			
			m.addAttribute("msg", msg);
			
			return "common/msg";

		}
		
		//팀해체
		@RequestMapping("/team/teambreakup")
		public String teambreakup(String teamName, Model m, HttpSession session) {
			String msg="";
			int result = service.teambreakup(teamName);
			if(result>0) {
				msg="팀을 해체하였습니다";
				Member member =(Member)session.getAttribute("loggedMember");
				Member memberResult = memberservice.selectOne(member);
				session.setAttribute("loggedMember", memberResult);
				
			}
			else {
				msg="팀해체에 실패하였습니다";
			}
			
			m.addAttribute("msg", msg);
			
			return "common/msg";
		}
	
}
