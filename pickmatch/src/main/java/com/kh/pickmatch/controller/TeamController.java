package com.kh.pickmatch.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.common.PageBarFactory;
import com.kh.pickmatch.model.dao.TeamDaoImpl;
import com.kh.pickmatch.model.service.TeamService;
import com.kh.pickmatch.model.vo.Member;
import com.kh.pickmatch.model.vo.MemberByTeam;
import com.kh.pickmatch.model.vo.MemberRequest;
import com.kh.pickmatch.model.vo.Mercenary;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.Team;
import com.kh.pickmatch.model.vo.TeamBoard;
import com.kh.pickmatch.model.vo.TeamNotice;
import com.kh.pickmatch.model.vo.TeamOperationAccount;

@Controller
public class TeamController {

	private Logger logger = LoggerFactory.getLogger(TeamController.class);
	
	
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
		List<Map<String, Object>> listMHistory = service.selectMoneyHistoryList(teamName);
		
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
	
	
	
	
	
	
	
	
	//도원
	
	//내팀정보!!
	@RequestMapping("/team.do")
	public ModelAndView teaminfo(String teamName) {
		
		ModelAndView mv = new ModelAndView();
		List<Team> list = service.TeamView(teamName);
		int memberCount = service.memberCount(teamName);
		List<MemberByTeam> result = service.TeamMember(teamName);
		//logger.debug("멤버바이팀"+result);
		
		
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
		
		
		 MemberRequest mbr = service.memberRequestCk(memberId, teamName);
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
		
		int result = service.teamNo(memberId, teamName);
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
		
		int result = service.teamJoin(memberId, teamName, position);
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
		int result = service.teamNo(memberId, teamName);
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
	
	//지우면안됨!
	@RequestMapping("/teammercenary.do")
	public String teammercenary() {
		return "team/teammercenary";
	}
	
	//팀 게시판 리스트보기
	@RequestMapping("/freeboard.do")
	public ModelAndView freeboard(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		int numPerPage = 10;
		ModelAndView mv = new ModelAndView();
		List<TeamBoard> list = service.selectList(cPage, numPerPage);
		int totalList = service.selectCount();
		
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
	public ModelAndView selectOne(@RequestParam(value="boardNo",defaultValue="1") int boardNo) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("teamboard", service.selectTeamBoard(boardNo));
		mv.addObject("attachmentList", service.selectAttachment(boardNo));
		mv.setViewName("team/teamboardView");
		return mv;
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
			y.setTeamName(teamName);
			session.setAttribute("loggedMember", y);
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
		Team team = service.TeamSearch(search);
		List<Team> result = new ArrayList<>();
		result.add(team);
		
		String msg="";
		String loc="";
		
		m.addAttribute("msg", msg);
		m.addAttribute("loc", loc);
		if(team==null) {
			msg="검색결과가 없습니다!";
			loc="/teamranking.do";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
		}
		else {
			mv.addObject("list", result);
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
		Mercenary temp = service.MercenarySearch(search);
		List<Mercenary> top3 = service.mercenaryranking(1, 10);
		List<Mercenary> result = new ArrayList<>();
		result.add(temp);
		String msg="";
		String loc="";
		
		m.addAttribute("msg", msg);
		
		//logger.debug("리졀트"+result);
		
		if(temp==null) {
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
	

	
	
}
