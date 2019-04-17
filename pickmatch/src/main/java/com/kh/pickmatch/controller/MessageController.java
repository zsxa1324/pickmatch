package com.kh.pickmatch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.common.ModalPageBarFactory;
import com.kh.pickmatch.model.service.MessageService;
import com.kh.pickmatch.model.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService service;

	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/alarm/view")
	public ModelAndView viewAlarm(@RequestParam(value="cPage", required=false, defaultValue="1")int cPage, String memberId, HttpSession session) {
		int numPerPage = 10;
		session.setAttribute("messageTotalcount", 0);
		logger.debug("MessageController :: memberId :::" + memberId);
		List<Message> list = service.selectMessageList(memberId, cPage, numPerPage);
		int messageTotalcount = service.selectMessageTotalcount(memberId);
		int readMessage = service.updateMessageRead(memberId);
		
		logger.debug("readMessage ::::::" +readMessage);
		logger.debug("MessageController :: selectMessageList :::" + list);
		ModelAndView mv = new ModelAndView();
		mv.addObject("alarmList", list);
		mv.addObject("alarmPageBar", ModalPageBarFactory.getPageBar(messageTotalcount, cPage, numPerPage, "/pickmatch/alarm/view"));
		mv.setViewName("common/alarm");
		
		return mv;
	}
	
	@RequestMapping("/alarm/messageTotalcount")
	@ResponseBody
	public Map<String, Object> selectMessageTotalcount(String memberId) {
		
		int messageTotalcount = service.selectMessageTotalcountNotRead(memberId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("messageTotalcount", messageTotalcount);
		return map;
	}
}
