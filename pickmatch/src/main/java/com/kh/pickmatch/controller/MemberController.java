package com.kh.pickmatch.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.model.service.MemberService;
import com.kh.pickmatch.model.vo.EmailAuthkey;
import com.kh.pickmatch.model.vo.Member;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bcEncoder;
	
	@Autowired 
	private JavaMailSenderImpl mailSender;

	
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
	public ModelAndView memberEnroll(String memberId, String password, String memberName, String nickname, String phone, String email, String birth, String gender, String position, String location, MultipartFile profile, HttpServletRequest re)
	{
		ModelAndView mv = new ModelAndView();
		Member m = new Member(memberId, bcEncoder.encode(password), memberName, nickname, phone, email, birth, gender, position, location, null, "", "", "", 0);
		/*String rawPw = m.getPassword();
		String enPw = bcEncoder.encode(rawPw);
		m.setPassword(enPw);
		logger.info("memberEnroll : "+ m);*/
		logger.info(m.getMemberId());
		logger.info(m.getPassword());
		logger.info(memberName);
		logger.info(nickname);
		logger.info(phone);
		logger.info(email);
		logger.info(birth);
		logger.info(gender);
		logger.info(position);
		logger.info(profile+"");
		
		String saveDir = re.getSession().getServletContext().getRealPath("/resources/upload/member-profile");

		File dir = new File(saveDir);
		if(!dir.exists())
		{
			dir.mkdirs();
		}
		
		if(!profile.isEmpty())
		{
			String oriFileName = profile.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.indexOf("."));
			String renamedFile = m.getMemberId()+ext;
			m.setProfile(renamedFile);
			try {
				profile.transferTo(new File(saveDir + "/" + renamedFile));
			}catch(IOException e)
			{
				e.printStackTrace();
			}
		}
		
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
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/member/checkMail.do")
	@ResponseBody
	public boolean checkMail(String email)
	{
		Member m = service.checkMail(email);
		if(m != null)
		{
			return false;
		}
		return true;
	}
	
	@RequestMapping("/member/sendMail.do")
	@ResponseBody
	public boolean sendMail(String memberId, String email) throws Exception
	{
		boolean flag = service.sendMail(memberId, email);
		return flag;
	}
	
	@RequestMapping("/member/checkAuthkey.do")
	@ResponseBody
	public boolean checkAuthkey(String memberId, String authkey)
	{
		boolean flag = false;
		EmailAuthkey ea = new EmailAuthkey();
		ea.setMemberId(memberId);
		String ak = service.selectAuthkey(ea);
		if(ak.equals(authkey)) 
		{
			flag = true;
		}
		return flag;
	}


}
