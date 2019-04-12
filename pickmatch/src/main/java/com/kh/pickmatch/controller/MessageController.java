package com.kh.pickmatch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.model.service.MessageService;
import com.kh.pickmatch.model.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService service;

	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/alarm/view")
	ModelAndView viewAlarm(String memberId, HttpSession session) {
		session.setAttribute("messageTotalcount", 0);
		logger.debug("MessageController :: memberId :::" + memberId);
		List<Message> list = service.selectMessageList(memberId);
		int messageTotalcount = service.selectMessageTotalcount(memberId);
		logger.debug("MessageController :: selectMessageList :::" + list);
		logger.debug("MessageController :: selectMessageTotalcount :::" + messageTotalcount);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("messageTotalcount", messageTotalcount);
		mv.setViewName("common/alarm");
		return mv;
	}
	
	
}
