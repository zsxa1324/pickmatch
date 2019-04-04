package com.kh.pickmatch.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.model.service.MemberService;
import com.kh.pickmatch.model.vo.Member;

@Controller
public class MemberController {
	
	private Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bcEncoder;
	

//	@RequestMapping("member/memberEnroll.do")
//	public String memberEnroll() {
//		
//		return "member/memberEnroll";
//	}
//	
//	@RequestMapping("/member/memberEnrollEnd.do")
//	public String memberEnrollEnd(Member m, Model model) {
//		
//		String rawPw = m.getPassword();
//		String enPw = bcEncoder.encode(rawPw);
//		m.setPassword(enPw);
//		
//		int result = service.insertMember(m);
//		
//		String msg="";
//		String loc="/";
//		
//		if(result > 0) {
//			msg = "ȸ�����ԿϷ�";
//			logger.debug("����");
//		} else {
//			msg = "ȸ�����Խ���";
//			logger.debug("����");
//		}
//		
//		model.addAttribute("msg", msg);
//		model.addAttribute("loc", loc);
//		return "common/msg";
//	}
	
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin(Member m, Model model, HttpSession session) {
		
		logger.debug("" + m);
		logger.debug("" + session);
		Member result = service.selectOne(m);
		String msg = "";
		String loc = "/";
		
		try {
			
//			throw new RuntimeException("�Ϻη� �߻�");
			
		} catch (Exception e) {
			logger.error("로그인 에러 : " + e.getStackTrace());
		}
		
		
		if(result != null) {
			if(bcEncoder.matches(m.getPassword(), result.getPassword())) {
				session.setAttribute("loggedMember", result);
				msg = "로그인 성공";
				
//				model.addAttribute("loggedMember", result);
			}
			else msg = "패스워드가 일치하지 않습니다.";
		} else {
			msg = "아이디가 존재하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/logOut.do")
	public String logOut(SessionStatus session, HttpSession session1) {
		
		if(!session.isComplete()) {
//			session.setComplete();
			session1.invalidate();
		}
		
		return "redirect:/";
	}
	
//	@RequestMapping("/member/update.do")
//	public String myPage(HttpSession session, Model model) {
//		
//		Member m = (Member)session.getAttribute("loggedMember");
//		
//		Member result = service.selectOne(m);
//		
//		model.addAttribute("m", result);
//		
//		return "member/myPage";
//	}
	
//	@RequestMapping("/member/update.do")
//	public ModelAndView update(Member m) {
//
//		Member re = service.selectOne(m);
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("member/updateForm");
//		mv.addObject("m", re);
//		
//		return mv;
//	}
//	
//	@RequestMapping("/member.updateEnd.do")
//	public ModelAndView updateEnd(Member m) {
//		
//		int result = service.update(m);
//		String msg = "";
//		String loc="/member/update.do?memberId=" + m.getMemberId();
//		
//		if(result > 0) {
//			msg="�����Ϸ�";
//		} else {
//			msg="��������";
//		}
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("common/msg");
//		mv.addObject("msg", msg);
//		mv.addObject("loc", loc);
//		
//		return mv;
//	}
//	
//	@RequestMapping("/member.deleteEnd.do")
//	public ModelAndView delete(Member m, HttpSession session) {
//		
//		int result = service.delete(m);
//		
//		String msg = "";
//		String loc = "";
//		
//		if(result > 0) {
//			msg = "�����Ϸ�";
//			session.invalidate();
//		} else {
//			msg = "��������";
//			loc = "/member/update.do?memberId=" + m.getMemberId();
//		}
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("common/msg");
//		mv.addObject("msg", msg);
//		mv.addObject("loc", loc);
//		
//		return mv;
//	}
	
//	@RequestMapping("member/checkId.do")
//	public void checkId(String memberId, HttpServletResponse response) throws IOException {
//		
//		Member m = new Member();
//		m.setMemberId(memberId);
//		
//		Member result = service.selectOne(m);
//		
//		boolean isOk = result != null?false:true;
//		
//		response.getWriter().println(isOk);
//		
//	}
	
//	@RequestMapping("member/checkId.do")
//	public ModelAndView checkId(String memberId) throws UnsupportedEncodingException {
//		
//		ModelAndView mv = new ModelAndView();
//		
//		Member m = new Member();
//		m.setMemberId(memberId);
//		
//		Member result = service.selectOne(m);
//		
//		boolean isOk = result != null?false:true;
//		
//		mv.addObject("isOk", isOk);
//		mv.addObject("msg", URLEncoder.encode("�ȳ��ϼ���", "UTF-8"));
//		mv.addObject("su", 19);
//		mv.setViewName("jsonView");
//
//		return mv;
//	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
