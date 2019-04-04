package com.kh.pickmatch.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.pickmatch.model.service.MemberService;
import com.kh.pickmatch.model.vo.Member;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bcEncoder;
	
/*	@RequestMapping("/member/checkId.do")
	public ModelAndView checkId(String userId) throws UnsupportedEncodingException
	{
		ModelAndView mv = new ModelAndView();
		Member m = new Member();
		mv.setViewName("member/");
		return mv;
	}*/

	@RequestMapping("/member/login.do")
	public String login(Member m, Model model, HttpSession session)
	{
		logger.debug(""+m);
		logger.debug(""+session);
		Member result = service.selectOne(m);
		String msg="";
		String loc="/";
		if(result != null)
		{
			if(bcEncoder.matches(m.getPassword(), result.getPassword()))
			{
				session.setAttribute("loggedMember", result);
				return "redirect:/";
			}
			else
			{
				msg = "패스워드가 일치하지 않습니다.";
			}
		}
		else
		{
			msg = "존재하지 않는 아이디입니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll(Member m, Model model)
	{
		String rawPw = m.getPassword();
		String enPw = bcEncoder.encode(rawPw);
		m.setPassword(enPw);
		
		String msg = "";
		String loc = "/";
		
		int result = service.insertMember(m);
		if(result == 0)
		{
			msg = "회원가입에 실패하였습니다.";			
		}
		else
		{
			msg = m.getMemberId()+"님 회원가입되었습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
}
