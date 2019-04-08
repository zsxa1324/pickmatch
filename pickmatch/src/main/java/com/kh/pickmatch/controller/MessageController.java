package com.kh.pickmatch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {

	@RequestMapping("/alarm/view")
	String viewAlarm() {
		
		return "common/alarm";
	}
}
