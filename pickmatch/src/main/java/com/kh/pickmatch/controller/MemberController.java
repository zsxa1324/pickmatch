package com.kh.pickmatch.controller;

import java.io.UnsupportedEncodingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.model.vo.Member;
import com.kh.pickmatch.service.MemberService;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
/*	@Autowired
	private BCryptPasswordEncoder bcEncoder;*/
	
	@RequestMapping("/member/checkId.do")
	public ModelAndView checkId(String userId) throws UnsupportedEncodingException
	{
		ModelAndView mv = new ModelAndView();
		Member m = new Member();
		return mv;
	}

}
