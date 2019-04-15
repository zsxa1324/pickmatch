package com.kh.pickmatch.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.pickmatch.model.service.AdminService;

@Controller
public class AdminController {

@Autowired
private AdminService service;

private Logger logger=LoggerFactory.getLogger(AdminController.class);

@RequestMapping("/admin/adminPage")
public ModelAndView adminPage() {
	ModelAndView mv=new ModelAndView();
	
	mv.setViewName("admin/adminPage");
	return mv;
			
	
}
@RequestMapping("/admin/memberList.do")
public ModelAndView memberList() {
	ModelAndView mv=new ModelAndView();
	List<Map> list=service.memberList();
	
	mv.addObject("list",list);
	mv.setViewName("admin/memberList");
	return mv;
}

	
}
